package com.fashionwardrobe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fashionwardrobe.daoimpl.UserDaoImpl;
import com.fashionwardrobe.model.BillingAddress;
import com.fashionwardrobe.model.ShippingAddress;
import com.fashionwardrobe.model.Supplier;
import com.fashionwardrobe.model.User;
import com.fashionwardrobe.model.UserDetails;
import com.fashionwardrobe.model.UserRole;

@Service
public class UserService 
{
	@Autowired
	public UserDaoImpl userDAOImplementation;
	@Transactional
	public void saveOrUpdate(UserDetails userDetails)
	{
		userDAOImplementation.saveOrUpdateUser(userDetails);
		
	}
	
	@Transactional
	public List<UserDetails> listuserDetails() 
	{
		return userDAOImplementation.listuserDetails();
	}
	
	@Transactional
	public void saveOrUpdateShipping(ShippingAddress shippingAddress)
	{
		userDAOImplementation.saveOrUpdateShipping(shippingAddress);
	}
	
	@Transactional
	public void saveOrUpdateBilling(BillingAddress billingAddress)
	{
		userDAOImplementation.saveOrUpdateBilling(billingAddress);
	}
	
	@Transactional
	public void saveOrUpdateUserRole(UserRole userRole)
	{
		userDAOImplementation.saveOrUpdateUserRole(userRole);;
	}
	
	
	@Transactional
	public void saveOrUpdateSupplier(Supplier supplier)
	{
		userDAOImplementation.saveOrUpdateSupplier(supplier);;
	}
	
	@Transactional
	public String stringUser()
	{
		return userDAOImplementation.stringUser();
	}
	
	@Transactional
	public void UpdateUser(int user_id) 
	{
	   userDAOImplementation.UpdateUser(user_id);
	}
	
	@Transactional
	public UserDetails getUserDetailsByName(String username) 
	{
		return userDAOImplementation.getUserDetailsByName(username);
	}
	
	@Transactional
	public ShippingAddress getShippingById(int userId)
	{
		return userDAOImplementation.getShippingById(userId);
	}
	
	@Transactional
	public BillingAddress getBillingById(int userId)
	{
		return userDAOImplementation.getBillingById(userId);
	}
	
	@Transactional
	public void UpdateUserDetails(UserDetails userDetails)
	{
		userDAOImplementation.UpdateUserDetails(userDetails);
	}
	
	@Transactional
	public void UpdateUserDetails(User user)
	{
		userDAOImplementation.UpdateUserDetails(user);
	}
	
	@Transactional
	public void UpdateUserDetails(ShippingAddress shippingAddress)
	{
		userDAOImplementation.UpdateUserDetails(shippingAddress);
	}
	
	@Transactional
	public void UpdateUserDetails(BillingAddress billingAddress)
	{
		userDAOImplementation.UpdateUserDetails(billingAddress);
	}
	
	@Transactional
	public Supplier getSupplierById(int userId)
	{
		return userDAOImplementation.getSupplierById(userId);
	}
	
}



