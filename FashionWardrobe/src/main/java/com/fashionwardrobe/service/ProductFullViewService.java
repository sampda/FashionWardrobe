package com.fashionwardrobe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fashionwardrobe.daoimpl.ProductFullViewDaoImpl;
import com.fashionwardrobe.model.ProductView;

@Service
public class ProductFullViewService 
{
    @Autowired
    private ProductFullViewDaoImpl productFullViewDaoImpl;
    
    @Transactional
    public List<ProductView> listProductView()
	{
	return productFullViewDaoImpl.listProductView();
	}
	
	@Transactional
	public String stringProductView() 
	{
		return productFullViewDaoImpl.stringProductView();
	}

	@Transactional
	public ProductView getProductViewById(int product_id)
	{
		return productFullViewDaoImpl.getProductViewById(product_id);
	}
	
	@Transactional
	public String stringProductViewEnabled()
	{
		return productFullViewDaoImpl.stringProductViewEnabled();
	}
}
