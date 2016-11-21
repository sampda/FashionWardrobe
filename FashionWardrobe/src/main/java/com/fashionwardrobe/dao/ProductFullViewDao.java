package com.fashionwardrobe.dao;

import java.util.List;

import com.fashionwardrobe.model.ProductView;

public interface ProductFullViewDao 
{
   public List<ProductView> listProductView();
   public String stringProductView();
   public ProductView getProductViewById(int productId);
   public String stringProductViewEnabled();
}
