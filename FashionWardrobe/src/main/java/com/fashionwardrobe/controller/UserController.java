package com.fashionwardrobe.controller;

import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fashionwardrobe.model.BillingAddress;
import com.fashionwardrobe.model.ShippingAddress;
import com.fashionwardrobe.model.User;
import com.fashionwardrobe.model.UserDetails;
import com.fashionwardrobe.service.Categoryservice;
import com.fashionwardrobe.service.UserService;

@Controller
public class UserController 
{
	@Autowired
	private UserService userService;
	
	@Autowired
	private Categoryservice categoryService;
	
	@RequestMapping("/register")
	public String users(Model model)
	{
		
		UserDetails userDetails = new UserDetails();
		ShippingAddress shippingAddress = new ShippingAddress();
		BillingAddress billingAddress = new BillingAddress();
		userDetails.setShippingAddress(shippingAddress);
		userDetails.setBillingAddress(billingAddress);
		model.addAttribute("userDetails", userDetails);
		
		return "redirect:/reg";
	}
		
	@RequestMapping("/add/userDetails")
	public String addUser(@ModelAttribute("userDetails") UserDetails userDetails)
	{
		this.userService.saveOrUpdate(userDetails);
		return "redirect:/";
		
	}
	
	@RequestMapping("/login")
	public String login(Model model, Principal principal)
	{
		model.addAttribute("listCategory",this.categoryService.listCategory());
				return "login";
	}
	
	@RequestMapping("/regsuccesspage")
	public String regSuccess()
	{
		
				return "regsuccesspage";
	}
	
	@RequestMapping("/perform_logout")
	public String logout(HttpServletRequest request, HttpServletResponse response)
	{
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication!=null)
		{
			new SecurityContextLogoutHandler().logout(request, response, authentication);
			
		}
		
		return "redirect:/";
		
		
	}
	
	@RequestMapping("/enableuser-{userId}")
	public String enableUser(@PathVariable("userId") int userId)
	{
		userService.UpdateUser(userId);
		return "redirect:/usermanage";
	}
	
	@RequestMapping("/usermanage")
	public String userdisable(Model model) 
	{
		model.addAttribute("user", new User());
		model.addAttribute("listUser",userService.listuserDetails());
		model.addAttribute("stringUser",userService.stringUser());
	
		return "user";
	}
	

	
}
