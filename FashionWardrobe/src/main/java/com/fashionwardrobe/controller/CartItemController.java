package com.fashionwardrobe.controller;

import java.util.Date;
import java.util.List;
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
	

  @SuppressWarnings("unchecked")
  @RequestMapping("/orderReceipt")
  public String receipt(Model model, HttpSession session)
  {
	  List<CartItem> k = (List<CartItem>) session.getAttribute("cartList");
	 
	  Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
	  if(k==null || session.getAttribute("checkoutbuyNow") == "buyNow")
	  {
		  List<CartItem> l = (List<CartItem>) session.getAttribute("buyNowList");
		  String m=gson.toJson(l);
		  model.addAttribute("orderPlaced",m);
		  return "orderReceipt";
	  }
	  String j=gson.toJson(k);
	 model.addAttribute("orderPlaced",j);
	 
	  return "orderReceipt";
	  
  }
  
  @SuppressWarnings("unchecked")
  @RequestMapping("/updateCartFlag")
  public String updateCartItemFlag(HttpSession session)
  {
	  	 
	  List<CartItem> k = (List<CartItem>) session.getAttribute("cartList");
	  if(k==null || session.getAttribute("checkoutbuyNow") == "buyNow")
	  {
		  cartItemService.UpdateCartItemFlag((Integer) session.getAttribute("cartItemId"));  
	  }
	  else
	  {
	    for(CartItem l : k)
        {
		  cartItemService.UpdateCartItemFlag(l.getCartItemId());
        }
	  }
	  return "redirect:/orderReceipt";
  }
  
  @RequestMapping(value="/deleteCartItem-{cartItemId}", method=RequestMethod.GET)
	public String deleteCartItem(@PathVariable("cartItemId") int cartItemId,HttpSession session)
	{
	   int productId = (Integer) session.getAttribute("productId"+cartItemId);
	   productService.updateProductPlus(productId,cartItemService.cartItemList(cartItemId).getProductQuantity());
	   cartItemService.deleteCartItem(cartItemId);
	   return "redirect:/";
		
	}
  
  @RequestMapping("/buyNow-{productId}")
  public String addToBuyNow(@ModelAttribute ("cartItem") CartItem cartItem,@PathVariable("productId") int productId,@RequestParam("userId") int userId,Model model,HttpSession session)
  {
	  if(productService.getProductById(productId).getProductQauntity() <= 0)
	  {
		  return "redirect:/";
	  }
	  Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
	  String user=authentication.getName();
	  userId= userService.getUserDetailsByName(user).getUserId();
	  cartItem.setUserId(userId);
	  cartItem.setCartId(userId);
	  cartItem.setFlag(false);
	  cartItem.setProductId(productId);
	
	  cartItem.setProductName(productService.getProductById(productId).getProductName());
	  cartItem.setProductPrice(productService.getProductById(productId).getProductPrice());
	  cartItem.setAmount(productService.getProductById(productId).getProductPrice());
	  Date systemdate=new Date();
	  cartItem.setOrderDate(systemdate);
	  cartItem.setProductDiscount(productService.getProductById(productId).getProductDiscount());
	  cartItem.setProductQuantity(1);
	  cartItemService.addCartItem(cartItem);
      
      productService.updateProductMinus(productId,1);
      
      session.setAttribute("cartItemId", cartItem.getCartItemId());
      session.setAttribute("productId"+cartItem.getCartItemId(), cartItem.getProductId());
  	
      
	  return "redirect:/buyNowList-"+cartItem.getCartItemId();
	  
  }
  
 
 @RequestMapping("/buyNowList-{cartItemId}")
  public String buyNowList(Model model,@PathVariable("cartItemId") int cartItemId,HttpSession session)
  {
	session.setAttribute("checkoutbuyNow", "buyNow");
    CartItem p = cartItemService.cartItemList(cartItemId);
    Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
//    Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
//	  String user=authentication.getName();
//	  int userId= userService.getUserDetailsByName(user).getUserId();
    List<CartItem> a = cartItemService.cartItemListJson(cartItemId);
	  session.setAttribute("buyNowList", a);
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
  
  @RequestMapping("/addCart-{productId}-{productQuantity}")
  public String addToCart(@ModelAttribute ("cartItem") CartItem cartItem,@PathVariable("productId") int productId,@PathVariable("productQuantity") int productQuantity,Model model,HttpSession session)
  {
	  if(productQuantity > productService.getProductById(productId).getProductQauntity() || productService.getProductById(productId).getProductQauntity()<=0 || productQuantity>3)
		{
			if(productQuantity>3)
			{
				session.setAttribute("Error","Max Amount Of products is 3.");
				return "redirect:/viewfullproduct-"+productId;
			}
			else
			{
			session.setAttribute("Error", "Not Enough Stock To Supply.");
			return "redirect:/viewfullproduct-"+productId;
			}
		}
			
	  Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
	  String user=authentication.getName();
	  int userId= userService.getUserDetailsByName(user).getUserId();
	  cartItem.setUserId(userId);
	  cartItem.setCartId(userId);
	  cartItem.setFlag(false);
	  cartItem.setProductId(productId);
	
	  cartItem.setProductName(productService.getProductById(productId).getProductName());
	  cartItem.setProductPrice(productService.getProductById(productId).getProductPrice());
	  cartItem.setAmount(productService.getProductById(productId).getProductPrice());
	  Date systemdate=new Date();
	  cartItem.setOrderDate(systemdate);
	  cartItem.setProductDiscount(productService.getProductById(productId).getProductDiscount());
	  if(cartItem.getProductQuantity()== 0)
		{
		cartItem.setProductQuantity(1);
		}
		else
		{
			cartItem.setProductQuantity(productQuantity);
		}
		
	  cartItemService.addCartItem(cartItem);
      
      productService.updateProductMinus(productId,cartItem.getProductQuantity());
      
      session.setAttribute("cartItemId", cartItem.getCartItemId());
      session.setAttribute("productId"+cartItem.getCartItemId(), cartItem.getProductId());
  	
      return "redirect:/cartList";
	  
  }
  
  @RequestMapping("/cartList")
  public String cartList(Model model,HttpSession session)
  {
	  session.setAttribute("checkoutbuyNow", "cartList");
	  Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
	  String user=authentication.getName();
	  int userId= userService.getUserDetailsByName(user).getUserId();
      List<CartItem> p = cartItemService.cartList(userId);
      session.setAttribute("cartList", p);
      for(CartItem k : p)
      {
    	  session.setAttribute("productId"+k.getCartItemId(),k.getProductId());
      }
      Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
      String j=gson.toJson(p);
      model.addAttribute("cartList",j);
      return "cartList";
  }
  
  @RequestMapping("/orderList")
  public String orderList(Model model,HttpSession session)
  {
	  Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
	  String user=authentication.getName();
	  int userId= userService.getUserDetailsByName(user).getUserId();
      List<CartItem> p = cartItemService.orderedList(userId);
      for(CartItem k : p)
      {
    	  session.setAttribute("productId"+k.getCartItemId(),k.getProductId());
      }
      Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
      String j=gson.toJson(p);
      model.addAttribute("orderedList",j);
      return "orderedList";
  }
  
}
