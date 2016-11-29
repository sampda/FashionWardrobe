package com.fashionwardrobe.daoimpl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.fashionwardrobe.dao.CartItemDao;
import com.fashionwardrobe.model.CartItem;


@Repository
public class CartItemDaoImpl implements CartItemDao
{
	@Autowired
	private SessionFactory sessionFactory;
	
	public void createCartItem(CartItem cartItem) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(cartItem);
		
	}

	@SuppressWarnings("unchecked")
	public CartItem cartItemList(int cartItemId)
	{
		
		String sql = "from CartItem where cartItemId="+cartItemId;
		List<CartItem> list = sessionFactory.getCurrentSession().createQuery(sql).getResultList();
		if(list!=null && !list.isEmpty())
		{
			return list.get(0);
		}
	    return null;
	}


	public void deleteCartItem(int cartItemId) 
	{
		CartItem cartItemToDelete=new CartItem();
		cartItemToDelete.setCartItemId(cartItemId);
		sessionFactory.getCurrentSession().delete(cartItemToDelete);	
	}

	public void UpdateCartItemFlag(int cartItemId) 
	{
			sessionFactory.getCurrentSession().createQuery("update CartItem set flag=true, orderDate = sysdate where cartItemId="+cartItemId ).executeUpdate();
		
	}

	@SuppressWarnings("unchecked")
	public List<CartItem> cartList(int userId) 
	{
		String sql = "from CartItem where userId="+userId +" and flag = false";
		List<CartItem> list = sessionFactory.getCurrentSession().createQuery(sql).getResultList();
		return list;
		
	}

	@SuppressWarnings("unchecked")
	public List<CartItem> orderedList(int userId) 
	{
		String sql = "from CartItem where userId="+userId +" and flag = true";
		List<CartItem> list = sessionFactory.getCurrentSession().createQuery(sql).getResultList();
		return list;
	}

	

}
