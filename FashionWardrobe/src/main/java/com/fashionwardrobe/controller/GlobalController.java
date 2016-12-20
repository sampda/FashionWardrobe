package com.fashionwardrobe.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.fashionwardrobe.service.CartItemService;
import com.fashionwardrobe.service.Categoryservice;
import com.fashionwardrobe.service.ProductService;
import com.fashionwardrobe.service.SubcategoryService;
import com.fashionwardrobe.service.UserService;

@ControllerAdvice
public class GlobalController 
{
	
	@Autowired 
	private UserService userService;
	
	@Autowired
	private CartItemService cartItemService;
	
	@Autowired
	private Categoryservice categoryService;
	
	@Autowired
	private SubcategoryService subcategoryService;
	
	@Autowired
	private ProductService productService;
	
	@ModelAttribute
	public void global(Model model,HttpSession session)
	{
		
		model.addAttribute("listCategory",categoryService.listCategory());
		model.addAttribute("listsubCategory",subcategoryService.listsubCategory());
		
	    try
	    {
	     	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		    String user = authentication.getName();
		    int userId = userService.getUserDetailsByName(user).getUserId();
		
		    session.setAttribute("cartListNo",this.cartItemService.cartList(userId).size());
		}
		catch(Exception e)
		{
			session.setAttribute("cartListNo",0);
		}
	}

//     @ExceptionHandler(Exception.class)
//     public String exception(Exception e)
//     {
//       	 return "redirect:/404";
//     }

}
