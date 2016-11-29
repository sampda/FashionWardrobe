package com.fashionwardrobe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fashionwardrobe.model.WishList;
import com.fashionwardrobe.service.ProductService;
import com.fashionwardrobe.service.UserService;
import com.fashionwardrobe.service.WishListService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class WishListController 
{
	@Autowired
	  private UserService userService;
	  
	  @Autowired
	  private ProductService productService;
	  
	  @Autowired
	  private WishListService  wishListService;
		
	@RequestMapping("/wishList-{productId}")
	  public String addTowishList(@ModelAttribute ("wishList") WishList wishList,@PathVariable("productId") int productId,Model model,HttpSession session)
	  {
		 
		  Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
		  String user=authentication.getName();
		  int userId= userService.getUserDetailsByName(user).getUserId();
		  
		  wishList.setUserId(userId);
		  wishList.setCartId(userId);
		  wishList.setFlag(false);
		  wishList.setProductId(productId);
		
		  wishList.setProductName(productService.getProductById(productId).getProductName());
		  wishList.setProductPrice(productService.getProductById(productId).getProductPrice());
		  wishList.setProductDiscount(productService.getProductById(productId).getProductDiscount());
		  
		  wishList.setProductQuantity(1);
		  
		  wishListService.addWishList(wishList);
		  
		  session.setAttribute("wishListId", wishList.getWishListId());
		  
	      return "redirect:/wishList";
		  
	  }
	  
	
	@RequestMapping("/wishList")
	  public String wishList(HttpSession session,Model model)
	  {
		Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
		String user=authentication.getName();
		int userId= userService.getUserDetailsByName(user).getUserId();
		List<WishList> p = wishListService.wishList(userId);
	     
	      for(WishList k : p)
	      {
	    	  session.setAttribute("productId"+k.getWishListId(),k.getProductId());
	      }
	    Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
	    String j=gson.toJson(p);
	    model.addAttribute("wishList",j);
	    return "wishList";
	  }
	
  @RequestMapping(value="/deleteWishList-{wishListId}", method=RequestMethod.GET)
	public String deleteWishList(@PathVariable("wishListId") int wishListId)
	{
	  
	  wishListService.deleteWishList(wishListId);
	  return "redirect:/";
		
	}
}
