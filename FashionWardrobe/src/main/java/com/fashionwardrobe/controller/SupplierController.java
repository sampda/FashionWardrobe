package com.fashionwardrobe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fashionwardrobe.model.Supplier;
import com.fashionwardrobe.service.SupplierService;


@Controller
public class SupplierController 
{
	@Autowired
	private SupplierService supplierservice;
	
	
	@RequestMapping("/supplier")
	public String suppliers(Model model) 
	{
		model.addAttribute("supplier", new Supplier());
		model.addAttribute("supplierjson",this.supplierservice.stringSupplier());
		model.addAttribute("listSupplier",this.supplierservice.listSupplier());
		return "supplier";
	}
	
	@RequestMapping(value="/add/supplier", method=RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier)
	
	{
		this.supplierservice.addSupplier(supplier);
		return "redirect:/supplier";
	}
	
	@RequestMapping(value= "/editSupplier-{supplierId}" , method = RequestMethod.GET)
	public String editSupplier(@PathVariable("supplierId") int supplierId, Model model)
	{
		model.addAttribute("supplierjson",this.supplierservice.stringSupplier());
		model.addAttribute("supplier",supplierservice.getById(supplierId));
		return "supplier";
	}
	
	@RequestMapping(value="/deleteSupplier-{supplierId}", method=RequestMethod.GET)
	public String delete(@PathVariable("supplierId") int supplierId,HttpServletRequest request )
	{
		try
		{
			supplierservice.deleteSupplier(supplierId);
       	}
      	catch(DataIntegrityViolationException e)
       	{
		HttpSession session= request.getSession();
		session.setAttribute("Error", "Supplier Cannot Be Deleted!!Constraint Violation");
    	}
		
		return "redirect:/supplier";
		
	}
	

}
