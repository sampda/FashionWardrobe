package com.fashionwardrobe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fashionwardrobe.daoimpl.WishListDaoImpl;
import com.fashionwardrobe.model.WishList;


@Service
public class WishListService 
{
	@Autowired
	private WishListDaoImpl wishListDaoImpl;
	   
		@Transactional
		public void addWishList(WishList wishList)
		{
			wishListDaoImpl.createWishList(wishList);
		}
		
		@Transactional
		public List<WishList> wishList(int userId)
		{
			return wishListDaoImpl.wishList(userId);
		}
		
		@Transactional
		public void deleteWishList(int wishListId)
		{
			wishListDaoImpl.deleteWishList(wishListId);
		}
}
