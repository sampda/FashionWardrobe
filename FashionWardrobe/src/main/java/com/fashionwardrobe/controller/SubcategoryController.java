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
import com.fashionwardrobe.model.Subcategory;
import com.fashionwardrobe.service.SubcategoryService;
import com.fashionwardrobe.service.Categoryservice;

@Controller
public class SubcategoryController 
{

	@Autowired
	private SubcategoryService subcategoryService;
	
	@Autowired
	private Categoryservice categoryService;
	
	@RequestMapping("/subCategory")
	public String subCategory(Model model) 
	{
		
		model.addAttribute("subcategory", new Subcategory());
		model.addAttribute("subCategoryjson",this.subcategoryService.stringsubCategory());
		model.addAttribute("categoriesjson",this.categoryService.stringCategory());
		model.addAttribute("listsubCategory",this.subcategoryService.listsubCategory());
		model.addAttribute("listCategory",this.categoryService.listCategory());
		return "subCategory";
	}
	
	@RequestMapping(value="/addsubCategory", method=RequestMethod.POST)
	public String addsubCategory(@Validated @ModelAttribute("subcategory") Subcategory subcategory,BindingResult result, Model model)
	{
		if(result.hasErrors())
		{
		
		
		model.addAttribute("categoriesjson",this.categoryService.stringCategory());
		model.addAttribute("subCategoryjson",this.subcategoryService.stringsubCategory());
		model.addAttribute("listCategory",this.categoryService.listCategory());
			
			return "subCategory";
		}
		else{
		Category category = categoryService.getIdByName(subcategory.getCategory().getCategoryName());
		categoryService.addCategory(category);
		subcategory.setCategory(category);
		subcategory.setCategoryId(category.getCategoryId());
		this.subcategoryService.addsubCategory(subcategory);
		return "redirect:/subCategory";
		}
	}
	
	@RequestMapping(value= "/editSubCategory-{subCategoryId}" , method = RequestMethod.GET)
	public String editSubCategory(@PathVariable("subCategoryId") int subCategoryId, Model model)
	{
		model.addAttribute("listCategory",this.categoryService.listCategory());
		model.addAttribute("subcategory",subcategoryService.getSubCatById(subCategoryId));
		model.addAttribute("subCategoryjson",this.subcategoryService.stringsubCategory());
		return "subCategory";
	}
	
	@RequestMapping(value="/deleteSubCategory-{subCategoryId}", method=RequestMethod.GET)
	public String deleteSubCategory(@PathVariable("subCategoryId") int subCategoryId,HttpServletRequest request )
	{
		try
		{
		subcategoryService.deleteSubCategory(subCategoryId);
	     }
	    catch(DataIntegrityViolationException e)
	    {
		   HttpSession session= request.getSession();
		   session.setAttribute("Error", "<div class=\"alert\"><span class=\"closebtn\" onclick=\"this.parentElement.style.display='none';\">&times;</span>Subcategory Cannot Be Deleted!!Constraint Violation</div>");
	    }
		return "redirect:/subCategory";
		
	}
	
	
	
}
