package com.fashionwardrobe.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fashionwardrobe.model.Category;
import com.fashionwardrobe.model.Product;
import com.fashionwardrobe.model.ProductView;
import com.fashionwardrobe.model.Subcategory;
import com.fashionwardrobe.model.Supplier;
import com.fashionwardrobe.service.Categoryservice;
import com.fashionwardrobe.service.ProductFullViewService;
import com.fashionwardrobe.service.ProductService;
import com.fashionwardrobe.service.SubcategoryService;
import com.fashionwardrobe.service.SupplierService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class ProductController 
{
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductFullViewService productFullViewService;
	
	@Autowired
	private Categoryservice categoryService;
	
	@Autowired
	private SupplierService supplierService;
	
	@Autowired
	private SubcategoryService subcategoryService;
	
	@RequestMapping("/product")
	public String product(Model model) 
	{
		
		model.addAttribute("product", new Product());
		model.addAttribute("listproduct",this.productService.listproduct());
		model.addAttribute("stringProduct",this.productService.stringProduct());
		model.addAttribute("listSupplier",this.supplierService.listSupplier());
		model.addAttribute("listsubCategory",this.subcategoryService.listsubCategory());
		model.addAttribute("listCategory",this.categoryService.listCategory());
		
		return "product";
	}
	
	@RequestMapping(value="/add/product", method=RequestMethod.POST)
	public String addproduct(@Validated @ModelAttribute("product") Product product, BindingResult result, HttpSession session, Model model)
	{
		if(result.hasErrors())
		{
			
			model.addAttribute("listproduct",this.productService.listproduct());
			model.addAttribute("stringProduct",this.productService.stringProduct());
			model.addAttribute("listSupplier",this.supplierService.listSupplier());
			model.addAttribute("listsubCategory",this.subcategoryService.listsubCategory());
			model.addAttribute("listCategory",this.categoryService.listCategory());
			return "redirect:/"+session.getAttribute("page");
		}
		
		Category category = categoryService.getIdByName(product.getCategory().getCategoryName());
		categoryService.addCategory(category);
		product.setCategory(category);
		product.setCategoryId(category.getCategoryId());
		
		
		Subcategory subcategory = subcategoryService.getsubCatIdByName(product.getSubcategory().getSubCategoryName());
		subcategoryService.addsubCategory(subcategory);
		product.setSubcategory(subcategory);
		product.setSubCategoryId(subcategory.getSubCategoryId());
		
		Supplier supplier = supplierService.getsupIdByName(product.getSupplier().getCompanyName());
		supplierService.addSupplier(supplier);
		product.setSupplier(supplier);
		product.setSupplierId(supplier.getSupplierId());
		
		Date systemdate=new Date();
		product.setDate(systemdate);
		
		productService.addproduct(product);
		
		
		
		String path="F:\\FashionWardrobe\\src\\main\\webapp\\resources\\images\\product";
		path=path+String.valueOf(product.getProductId())+".jpg";
		try
		{
		File f= new File(path);
		MultipartFile m = product.getProductImage();
		byte[] b=m.getBytes();
		FileOutputStream fos= new FileOutputStream(f);
		BufferedOutputStream bos= new BufferedOutputStream(fos);
		bos.write(b);
		bos.close();
		}
		catch(Exception e)
		{
			System.out.println("ERROR e");
		}
		
		return "redirect:/"+session.getAttribute("page");
	}
	
	
	
	@RequestMapping(value= "/editProduct-{productId}" , method = RequestMethod.GET)
	public String editProduct(@PathVariable("productId") int productId, Model model)
	{
		model.addAttribute("listSupplier",this.supplierService.listSupplier());
		model.addAttribute("listsubCategory",this.subcategoryService.listsubCategory());
		model.addAttribute("listCategory",this.categoryService.listCategory());
		model.addAttribute("product",productService.getProductById(productId));
		model.addAttribute("stringProduct",this.productService.stringProduct());
		return "product";
	}
	
	@RequestMapping(value="/deleteProduct-{productId}", method=RequestMethod.GET)
	public String deleteProduct(@PathVariable("productId") int productId )
	{
		
		productService.deleteProduct(productId);
		File file = new File("F:\\FashionWardrobe\\src\\main\\webapp\\resources\\images\\product"+productId+".jpg");
		file.delete();
		return "redirect:/product";
		
	}
	
	@RequestMapping("/viewproduct-{productId}")
	public ModelAndView productView(@ModelAttribute("product") Product product,@PathVariable("productId") int productId)
	{
		Product p = productService.getProductById(productId);
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String j=gson.toJson(p);
		ModelAndView model=new ModelAndView("viewproduct");
		model.addObject("product", j);
		return model;
		
	}
	
	@RequestMapping("/viewfullproduct-{productId}")
	public ModelAndView productFullView(@ModelAttribute("productView") ProductView productView,@PathVariable("productId") int productId)
	{
		ProductView p = productFullViewService.getProductViewById(productId);
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		String j=gson.toJson(p);
		ModelAndView model=new ModelAndView("viewproduct");
		model.addObject("productFullView", j);
		return model;
		
	}

	@RequestMapping("/enableproduct-{productId}")
	public String enableUser(@PathVariable("productId") int productId)
	{
		productService.UpdateProduct(productId);
		return "redirect:/product";
	}
	
	@RequestMapping("/productdisplay")
	public String getproductpage(Model model)
	{
		model.addAttribute("stringFullProductEnabled",this.productFullViewService.stringProductViewEnabled());
		model.addAttribute("stringProductEnabled",this.productService.stringProductEnabled());
		model.addAttribute("listCategory",this.categoryService.listCategory());
		return "productDisplay";
		
	}
}
