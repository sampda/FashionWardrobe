package com.fashionwardrobe.daoimpl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.fashionwardrobe.dao.UserDao;
import com.fashionwardrobe.model.BillingAddress;
import com.fashionwardrobe.model.Cart;
import com.fashionwardrobe.model.ShippingAddress;
import com.fashionwardrobe.model.Supplier;
import com.fashionwardrobe.model.User;
import com.fashionwardrobe.model.UserDetails;
import com.fashionwardrobe.model.UserRole;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired
	private SessionFactory sessionFactory;
	public void saveOrUpdateUser(UserDetails userDetails) {
		
		Session session = this.sessionFactory.getCurrentSession();
		User user = new User();
		user.setUsername(userDetails.getUsername());
		user.setPassword(userDetails.getPassword());
		user.setEnabled(true);
		user.setUserId(userDetails.getUserId());
		
		session.saveOrUpdate(user);
				
		Cart cart = new Cart();
		cart.setCartId(user.getUserId());
		cart.setUserId(user.getUserId());
		session.saveOrUpdate(cart);
		
		userDetails.setUserId(user.getUserId());
		userDetails.setCartId(cart.getCartId());

		session.saveOrUpdate(userDetails);
		session.flush();
		
	}
	
	public void saveOrUpdateUserRole(UserRole userRole) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(userRole);	
	}
	
	public void saveOrUpdateSupplier(Supplier supplier) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(supplier);		
	}
	
	@SuppressWarnings("unchecked")
	public List<UserDetails> listuserDetails() 
	{
       List<UserDetails> userDetailsList = sessionFactory.getCurrentSession().createQuery("from UserDetails").getResultList();
		
		return userDetailsList;
	}
	
	
	public void saveOrUpdateShipping(ShippingAddress shippingAddress) 
	{
		sessionFactory.getCurrentSession().saveOrUpdate(shippingAddress);	
	}
	
	public void saveOrUpdateBilling(BillingAddress billingAddress) {
		sessionFactory.getCurrentSession().saveOrUpdate(billingAddress);
		
	}

	@SuppressWarnings("unchecked")
	public String stringUser() 
	{
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
		List<User> userList = sessionFactory.getCurrentSession().createQuery("from User").getResultList();
		String userjson= gson.toJson(userList);
		return userjson;
	}

	public void UpdateUser(int userId) 
	{
		sessionFactory.getCurrentSession().createQuery("update User set enabled =case when enabled=true then false when enabled=false then true end where userId="+userId ).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public UserDetails getUserDetailsByName(String username) 
	{
		String sql = "from UserDetails where username='" +username+"'";
		List<UserDetails> list = sessionFactory.getCurrentSession().createQuery(sql).getResultList();
		
			return list.get(0);
		
	}

	@SuppressWarnings("unchecked")
	public ShippingAddress getShippingById(int userId) 
	{
		String sql = "from ShippingAddress where userDetails_userId=" +userId;
		List<ShippingAddress> list = sessionFactory.getCurrentSession().createQuery(sql).getResultList();
		if(list!=null && !list.isEmpty())
		{
			return list.get(0);
		}
	    return null;
	}

	@SuppressWarnings("unchecked")
	public BillingAddress getBillingById(int userId) 
	{
		String sql = "from BillingAddress where userDetails_userId=" +userId;
		List<BillingAddress> list = sessionFactory.getCurrentSession().createQuery(sql).getResultList();
		if(list!=null && !list.isEmpty())
		{
			return list.get(0);
		}
	    return null;
	}
	
	

}

