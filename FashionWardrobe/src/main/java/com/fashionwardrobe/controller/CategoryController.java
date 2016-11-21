package com.fashionwardrobe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.fashionwardrobe.model.Category;
import com.fashionwardrobe.service.Categoryservice;

@Controller
public class CategoryController {
	
	@Autowired
	private Categoryservice categoryService;
	
//	@Autowired
//	private SubcategoryService subcategoryService;
	
	@RequestMapping("/categories")
	public String categories(Model model) 
	{
		model.addAttribute("category", new Category());
		model.addAttribute("categoriesjson",this.categoryService.stringCategory());
		model.addAttribute("listCategory",this.categoryService.listCategory());
		//model.addAttribute("listsubCategory",this.subcategoryService.listsubCategory());
		return "categories";
	}
	
	@RequestMapping(value="/categories", method=RequestMethod.POST)
	public String addCategory(@Validated @ModelAttribute("category") Category category,BindingResult result,Model model)
	{
		if(result.hasErrors())
		{
			model.addAttribute("categoriesjson",this.categoryService.stringCategory());
			return "categories";
		}
		categoryService.addCategory(category);
		return "redirect:/categories";
	}
	
	
	@RequestMapping(value= "/editCategory-{categoryId}" , method = RequestMethod.GET)
	public String editCategory(@PathVariable("categoryId") int categoryId, Model model)
	{
		
		model.addAttribute("category",categoryService.getById(categoryId));
		model.addAttribute("categoriesjson",this.categoryService.stringCategory());
		return "categories";
	}
	
	@RequestMapping(value="/delete-{categoryId}", method=RequestMethod.GET)
	public String delete(@PathVariable("categoryId") int categoryId, HttpServletRequest request)
	{
		try
		{
		categoryService.deleteCategory(categoryId);
		}
		catch(DataIntegrityViolationException e)
		{
			HttpSession session= request.getSession();
			session.setAttribute("Error", "Category Cannot Be Deleted!!Constraint Violation");
		}
		return "redirect:/categories";
		
	}
	
	

}