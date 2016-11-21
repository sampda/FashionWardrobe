package com.fashionwardrobe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.fashionwardrobe.model.BillingAddress;
import com.fashionwardrobe.model.Product;
import com.fashionwardrobe.model.ShippingAddress;
import com.fashionwardrobe.model.Supplier;
import com.fashionwardrobe.model.UserDetails;
import com.fashionwardrobe.service.ProductService;
import com.fashionwardrobe.service.SupplierService;
import com.fashionwardrobe.service.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class PanelController
{
	@Autowired
	private UserService userService;
	
	@Autowired
	private SupplierService supplierService;
	
	@Autowired
	private ProductService productService;

	@RequestMapping("/userpanel-{username}")
	public ModelAndView UserView(@ModelAttribute("userDetails") UserDetails userDetails,@PathVariable("username") String username)
	{
		try
		{
			Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
			  String user=authentication.getName();
			
			if(user.equals(username))
			{
				UserDetails u = userService.getUserDetailsByName(username);
				ShippingAddress sa = userService.getShippingById(u.getUserId());
				BillingAddress ba = userService.getBillingById(u.getUserId());
				
				
				Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
				String ud=gson.toJson(u);
				String sd=gson.toJson(sa);
				String bd=gson.toJson(ba);
				
				ModelAndView model=new ModelAndView("profile");
				model.addObject("stringuserDetails", ud);
				model.addObject("stringshippingDetails", sd);
				model.addObject("stringbillingDetails", bd);
				
				return model;
			}
			else
			{
				throw new Exception();
			}
		
		}
		catch(Exception ex)
		{
			ModelAndView model = new ModelAndView("403");
			return model;
		}
		
	}
	
	@RequestMapping("/supplierPanel-{username}")
	public ModelAndView SupplierView(@ModelAttribute("userDetails") UserDetails userDetails,@PathVariable("username") String username)
	{
		try
		{
			Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
			  String user=authentication.getName();
			
			if(user.equals(username))
			{
				UserDetails u = userService.getUserDetailsByName(username);
				
				Supplier sup = supplierService.getById(u.getUserId());
				
				List<Product> pro = productService.getProductBySupId(u.getSupplier().getSupplierId());
				
				Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
				String ud=gson.toJson(u);
				String prod=gson.toJson(pro);
				String supd=gson.toJson(sup);
				
				ModelAndView model=new ModelAndView("supplierPanel");
				model.addObject("stringuserDetails", ud);
				model.addObject("stringproductDetails", prod);
				model.addObject("stringsupplierDetails", supd);
				return model;
			}
			else
			{
				throw new Exception();
			}
			

		
		}
		catch(Exception ex)
		{
			ModelAndView model = new ModelAndView("403");
			return model;
		}
		
	}
}
