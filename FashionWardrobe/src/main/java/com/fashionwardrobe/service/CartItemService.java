package com.fashionwardrobe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fashionwardrobe.daoimpl.CartItemDaoImpl;
import com.fashionwardrobe.model.CartItem;

@Service
public class CartItemService 
{
	@Autowired
	   private CartItemDaoImpl cartItemDaoImpl;
	   
		@Transactional
		public void addCartItem(CartItem cartItem)
		{
			cartItemDaoImpl.createCartItem(cartItem);;
		}
		
		@Transactional
		public CartItem cartItemList(int cartItemId)
		{
			return cartItemDaoImpl.cartItemList(cartItemId);
             
		}
		
		@Transactional
		public void deleteCartItem(int cartItem_id)
		{
			cartItemDaoImpl.deleteCartItem(cartItem_id);
		}
		
		@Transactional
		public void UpdateCartItemFlag(int cartItemId) 
		{
			cartItemDaoImpl.UpdateCartItemFlag(cartItemId);
		}
		
		@Transactional
		public List<CartItem> cartList(int userId) 
		{
			return cartItemDaoImpl.cartList(userId);
		}
		
		@Transactional
		public List<CartItem> orderedList(int userId)
		{
			return cartItemDaoImpl.orderedList(userId);
		}
		
		@Transactional
		public List<CartItem> cartItemListJson(int cartItemId)
		{
			return cartItemDaoImpl.cartItemListJson(cartItemId);
		}
}
