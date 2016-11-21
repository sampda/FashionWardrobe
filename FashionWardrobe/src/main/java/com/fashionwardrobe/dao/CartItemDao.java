package com.fashionwardrobe.dao;

import com.fashionwardrobe.model.CartItem;

public interface CartItemDao
{
	public void createCartItem(CartItem cartItem);  
	public CartItem cartItemList(int cartItemId);
	public void deleteCartItem(int cartItemId);
	public void UpdateCartItemFlag(int cartItemId); 
}
