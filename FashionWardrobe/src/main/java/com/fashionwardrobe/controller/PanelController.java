package com.fashionwardrobe.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.fashionwardrobe.model.BillingAddress;
import com.fashionwardrobe.model.Product;
import com.fashionwardrobe.model.ShippingAddress;
import com.fashionwardrobe.model.Supplier;
import com.fashionwardrobe.model.User;
import com.fashionwardrobe.model.UserDetails;
import com.fashionwardrobe.service.Categoryservice;
import com.fashionwardrobe.service.ProductService;
import com.fashionwardrobe.service.SubcategoryService;
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
	
	@Autowired
	private Categoryservice categoryService;
	
	@Autowired
	private SubcategoryService subCategoryService;

	@RequestMapping("/userpanel")
	public ModelAndView UserView(@ModelAttribute("userDetails") UserDetails userDetails)
	{
		try
		{
			Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
			  String user=authentication.getName();
			
			
				UserDetails u = userService.getUserDetailsByName(user);
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
		catch(Exception ex)
		{
			ModelAndView model = new ModelAndView("403");
			return model;
		}
		
	}
	
	@RequestMapping("/userEdit")
	public String editUserDetails(Model model)
	{
		Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
		String user=authentication.getName();
		
		model.addAttribute("userDetails",userService.getUserDetailsByName(user));
		
		return "userEdit";
		
	}
	
	@RequestMapping("/updateUserDetails")
	public String updateUserDetails(@ModelAttribute("userDetails") UserDetails userDetails)
	{
		Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
		String user =authentication.getName();
		UserDetails userDetailsValue = userService.getUserDetailsByName(user); 
		
		userDetails.setBillingAddress(userDetailsValue.getBillingAddress());
		userDetails.setShippingAddress(userDetailsValue.getShippingAddress());
		userDetails.setSupplier(userDetailsValue.getSupplier());
		userDetails.setUserRole(userDetailsValue.getUserRole());
	
		User userValue = new User();
		userValue.setEnabled(true);
		userValue.setPassword(userDetails.getPassword());
		userValue.setUsername(userDetails.getUsername());
		userValue.setUserId(userDetails.getUserId());
		
		userService.UpdateUserDetails(userDetails);
		userService.UpdateUserDetails(userValue);
		
		return "redirect:/userpanel";
	}
	
	@RequestMapping("/editShipping")
	public String editShipping(Model model)
	{
		Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
		String user=authentication.getName();
		int userId= userService.getUserDetailsByName(user).getUserId();
		
		model.addAttribute("shippingAddress",userService.getShippingById(userId));
		
		return "shippingDetailsEdit";
	}
	
	@RequestMapping("/updateShipping")
	public String updateShipping(@ModelAttribute("shippingAddress") ShippingAddress shippingAddress)
	{
		Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
		String user=authentication.getName();
		int userId= userService.getUserDetailsByName(user).getUserId();
		
		UserDetails userDetails = new UserDetails();
		userDetails.setUserId(userId);
		
		shippingAddress.setUserDetails(userDetails);
		userService.saveOrUpdateShipping(shippingAddress);
		
		return "redirect:/userpanel";
	}
	
	@RequestMapping("/editBilling")
	public String editBilling(Model model)
	{
		Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
		String user=authentication.getName();
		int userId= userService.getUserDetailsByName(user).getUserId();
		
		model.addAttribute("billingAddress",userService.getBillingById(userId));
		
	   return "billingDetailsEdit";
	}
	
	@RequestMapping("/updateBilling")
	public String updateBilling(@ModelAttribute("billingAddress") BillingAddress billingAddress)
	{
		Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
		String user=authentication.getName();
		int userId= userService.getUserDetailsByName(user).getUserId();
		
		UserDetails userDetails = new UserDetails();
		userDetails.setUserId(userId);
		
		billingAddress.setUserDetails(userDetails);
		userService.saveOrUpdateBilling(billingAddress);
		
		return "redirect:/userpanel";
	}
	
	
	@RequestMapping("/supplierPanel")
	public ModelAndView SupplierView(@ModelAttribute("userDetails") UserDetails userDetails)
	{
		try
		{
			Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
			  String user=authentication.getName();
			
				UserDetails u = userService.getUserDetailsByName(user);
				
				Supplier sup = supplierService.getById(u.getUserId());
				
				List<Product> pro = productService.getProductBySupId(u.getSupplier().getSupplierId());
				
				Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
				String ud=gson.toJson(u);
				String prod=gson.toJson(pro);
				String supd=gson.toJson(sup);
				
				ModelAndView model=new ModelAndView("supplierPanel");
				model.addObject("stringuserDetails", ud);
				model.addObject("product",new Product());
				model.addObject("listsubCategory",this.subCategoryService.listsubCategory());
				model.addObject("listCategory",this.categoryService.listCategory());
				model.addObject("stringproductDetails", prod);
				model.addObject("stringsupplierDetails", supd);
				return model;
		
			

		
		}
		catch(Exception ex)
		{
			ModelAndView model = new ModelAndView("403");
			return model;
		}
		
	}
	
	@RequestMapping("/supplierEdit")
	public String editSupplierDetails(Model model)
	{
		Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
		String user=authentication.getName();
		
		model.addAttribute("userDetails",userService.getUserDetailsByName(user));
		
		return "supplierEdit";
		
	}
	
	
	@RequestMapping("/updateSupplierDetails")
	public String updateSupplierDetails(@ModelAttribute("userDetails") UserDetails userDetails)
	{
		Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
		String user =authentication.getName();
		UserDetails userDetailsValue = userService.getUserDetailsByName(user); 
		
		userDetails.setBillingAddress(userDetailsValue.getBillingAddress());
		userDetails.setShippingAddress(userDetailsValue.getShippingAddress());
		userDetails.setSupplier(userDetailsValue.getSupplier());
		userDetails.setUserRole(userDetailsValue.getUserRole());
	
		User userValue = new User();
		userValue.setEnabled(true);
		userValue.setPassword(userDetails.getPassword());
		userValue.setUsername(userDetails.getUsername());
		userValue.setUserId(userDetails.getUserId());
		
		userService.UpdateUserDetails(userDetails);
		userService.UpdateUserDetails(userValue);
		
		return "redirect:/supplierPanel";
	}
	
	
	@RequestMapping("/editSupplier")
	public String editSupplier(Model model)
	{
		Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
		String user=authentication.getName();
		int userId= userService.getUserDetailsByName(user).getUserId();
		
		model.addAttribute("supplier",userService.getSupplierById(userId));
		
	   return "supplierDetailsEdit";
	}
	
	@RequestMapping("/updateSupplier")
	public String updateSupplier(@ModelAttribute("supplier") Supplier supplier)
	{
		Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
		String user=authentication.getName();
		int userId= userService.getUserDetailsByName(user).getUserId();
		
		UserDetails userDetails = new UserDetails();
		userDetails.setUserId(userId);
		
		supplier.setUserDetails(userDetails);
		userService.saveOrUpdateSupplier(supplier);
		
		return "redirect:/supplierPanel";
	}
	
}
