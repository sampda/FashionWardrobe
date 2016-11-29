package com.fashionwardrobe.dao;

import java.util.List;
import com.fashionwardrobe.model.WishList;

public interface WishListDao 
{
	public void createWishList(WishList wishList); 
	public List<WishList> wishList(int userId);	
	public void deleteWishList(int wishListId);
	
}
