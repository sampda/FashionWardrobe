package com.fashionwardrobe.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.fashionwardrobe.model.CartItem;
import com.fashionwardrobe.service.CartItemService;
import com.fashionwardrobe.service.ProductService;
import com.fashionwardrobe.service.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class CartItemController 
{
  @Autowired
  private CartItemService cartItemService;
  
  @Autowired
  private UserService userService;
  
  @Autowired
  private ProductService productService;
	
  @RequestMapping("/deleteCartItem")
	public String deleteCartItem(HttpSession session)
	{
	   int productId = (Integer) session.getAttribute("productId");
	   productService.updateProductPlus(productId);
	   cartItemService.deleteCartItem((Integer)session.getAttribute("cartItemId"));
	   return "redirect:/";
		
	}
  
  @RequestMapping("/updateCartFlag")
  public String updateCartItemFlag(HttpSession session)
  {
	  cartItemService.UpdateCartItemFlag((Integer) session.getAttribute("cartItemId"));
	return "redirect:/";
  }
  
  @RequestMapping(value="/deleteCartItem-{cartItemId}", method=RequestMethod.GET)
	public String deleteCartItem(@PathVariable("cartItemId") int cartItemId,HttpSession session)
	{
	   int productId = (Integer) session.getAttribute("productId");
	   productService.updateProductPlus(productId);
	   cartItemService.deleteCartItem(cartItemId);
	   return "redirect:/";
		
	}
  
  @RequestMapping("/buyNow-{productId}")
  public String addToBuyNow(@ModelAttribute ("cartItem") CartItem cartItem,@PathVariable("productId") int productId,@RequestParam("userId") int userId,Model model,HttpSession session)
  {
	 
	  Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
	  String user=authentication.getName();
	  userId= userService.getUserDetailsByName(user).getUserId();
	  cartItem.setUserId(userId);
	  cartItem.setCartId(userId);
	  cartItem.setFlag(false);
	  cartItem.setProductId(productId);
	  session.setAttribute("productId", productId);
	  productId=(Integer) session.getAttribute("productId");
	  cartItem.setProductName(productService.getProductById(productId).getProductName());
	  cartItem.setProductPrice(productService.getProductById(productId).getProductPrice());
	  cartItem.setAmount(productService.getProductById(productId).getProductPrice());
	  Date systemdate=new Date();
	  cartItem.setOrderDate(systemdate);
	  cartItem.setProductDiscount(productService.getProductById(productId).getProductDiscount());
	  cartItem.setProductQuantity(1);
	  cartItemService.addCartItem(cartItem);
      
      productService.updateProductMinus(productId);
      
      session.setAttribute("cartItemId", cartItem.getCartItemId());
   
      
	  return "redirect:/buyNowList-"+cartItem.getCartItemId();
	  
  }
  
  @RequestMapping("/buyNowList-{cartItemId}")
  public String cartListBuyNow(Model model,@PathVariable("cartItemId") int cartItemId)
  {
	
    CartItem p = cartItemService.cartItemList(cartItemId);
    Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
    String j=gson.toJson(p);
    model.addAttribute("cartItemList",j);
    return "buyNow";
  }
  
  @RequestMapping("/checkout")
  public String getCartCheckOut(HttpSession session)
  {
	  Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
	  String user=authentication.getName();
	  int userId= userService.getUserDetailsByName(user).getUserId();
	  session.setAttribute("userDetails_userId", userId);
	  return "redirect:/cart";
  }
}
