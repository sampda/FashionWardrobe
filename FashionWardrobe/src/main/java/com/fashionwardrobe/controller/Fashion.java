package com.fashionwardrobe.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fashionwardrobe.model.Category;
import com.fashionwardrobe.service.Categoryservice;
import com.fashionwardrobe.service.ProductFullViewService;
import com.fashionwardrobe.service.ProductService;
import com.fashionwardrobe.service.SubcategoryService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@Controller
public class Fashion 
{
 
	@Autowired
	private Categoryservice categoryService;
	
    @Autowired
    private ProductService productService;
    
	@Autowired
	private ProductFullViewService productFullViewService;
	
	@Autowired
	private SubcategoryService subcategoryService;
	
	@RequestMapping(value={"/", "/home"})
	public String getHome(Model model)
	{
		model.addAttribute("category",new Category());
		model.addAttribute("listCategory",this.categoryService.listCategory());
		model.addAttribute("listsubCategory",this.subcategoryService.listsubCategory());
//		model.addAttribute("stringProduct",this.productService.stringProduct());
		model.addAttribute("stringProductEnabled",this.productService.stringProductEnabled());
		model.addAttribute("stringFullProductEnabled",this.productFullViewService.stringProductViewEnabled());
		return "home";
	}
	
	@RequestMapping("/admin")
	public String getAdmin()
	{
		
		return "admin";
	}
	
	@RequestMapping("/403")
	public String get403()
	{
		
		return "403";
	}
	
	@RequestMapping("/contactUs")
	public String getContact()
	{
		
		return "contactUs";
	}
	
	@RequestMapping(value = "/getTags", method = RequestMethod.GET)
	public @ResponseBody String getTags(@RequestParam String categoryName) {
		
		return simulateSearchResult(categoryName);

	}

	private String simulateSearchResult(String categoryName) {

		List<Category> result = new ArrayList<Category>();
		List<Category> data = categoryService.listCategory();
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String j = null;
		// iterate a list and filter by tagName
		for(Category tag : data) {
			
			if (tag.getCategoryName().contains(categoryName)) {
				
				result.add(tag);
				j=gson.toJson(result);
				
			}
		}
		
		return j;
	}
}
