package com.fashionwardrobe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fashionwardrobe.model.ProductSpecification;
import com.fashionwardrobe.service.ProductSpecificationService;

@Controller
public class ProductSpecificationController 
{
	@Autowired
      private ProductSpecificationService productSpecificationService;
	
	@RequestMapping(value="/productspec-{productId}", method = RequestMethod.GET)
	public String productspec(Model model,@PathVariable("productId") int productId)
	{
		
		model.addAttribute("productSpecification", new ProductSpecification());
		return "productSpec";
		
	}
	
	@RequestMapping(value="/addprodspec-{productId}", method = RequestMethod.POST)
	public String addproductspec(@PathVariable("productId") int productId,@ModelAttribute("productSpecification") ProductSpecification productSpecification, HttpSession session)
	{
		productSpecification.setProductId(productId);
		productSpecificationService.addProductSpecification(productSpecification);
		return "redirect:/"+session.getAttribute("page");
		
	}
	
	@RequestMapping(value= "/editProdSpec-{productId}" , method = RequestMethod.GET)
	public String editCategory(@PathVariable("productId") int productId, Model model,HttpServletRequest request)
	{
		try
		{
			model.addAttribute("productSpecification",productSpecificationService.getById(productId));
			
	     }
	    catch(Exception e)
	    {
		   HttpSession session= request.getSession();
		   session.setAttribute("Error", "<div class=\"alert\"><span class=\"closebtn\" onclick=\"this.parentElement.style.display='none';\">&times;</span>Product Cannot Be Edited!! Try Adding Specification</div>");
		   return "redirect:/"+session.getAttribute("page");
	    }
		
		return "productSpec";
	}
	
}
