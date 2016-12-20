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
import com.fashionwardrobe.model.Subcategory;
import com.fashionwardrobe.service.ProductFullViewService;
import com.fashionwardrobe.service.ProductService;
import com.fashionwardrobe.service.SubcategoryService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@Controller
public class Fashion 
{
 
	
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

		model.addAttribute("stringProductEnabled",this.productService.stringProductEnabled());
		model.addAttribute("stringFullProductEnabled",this.productFullViewService.stringProductViewEnabled());
		return "home";
	}
	
	@RequestMapping("/admin")
	public String getAdmin(Model model)
	{
		
		return "admin";
	}
	
	@RequestMapping("/403")
	public String get403(Model model)
	{
		
		return "403";
	}
	
	@RequestMapping("/404")
	public String get404(Model model)
	{
		return "404";
	}
	
	
	@RequestMapping("/contactUs")
	public String getContact(Model model)
	{
		
		return "contactUs";
	}
	
	@RequestMapping("/aboutUs")
	public String getAbout()
	{
		
		return "aboutUs";
	}
	
	@RequestMapping("/supplierRequest")
	public String getrequest(Model model)
	{
		model.addAttribute("supplierRequest", productService.supplierRequest());
		return "supplierRequest";
	}

	@RequestMapping("/t&c")
	public String gettc()
	{
		return "t&c";
	}
	
	@RequestMapping(value = "/getTags", method = RequestMethod.GET)
	public @ResponseBody String getTags(@RequestParam String subCategoryName) {
		
		return simulateSearchResult(subCategoryName);

	}

	private String simulateSearchResult(String subCategoryName) {

		List<Subcategory> result = new ArrayList<Subcategory>();
  	    List<Subcategory> data = subcategoryService.listsubCategory();
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String j = null;
		// iterate a list and filter by tagName
		for(Subcategory tag : data) {
			
			if (tag.getSubCategoryName().contains(subCategoryName)) {
				
				result.add(tag);
				j=gson.toJson(result);
				
			}
		}
		
		return j;
	}
}
