package com.fashionwardrobe.dao;

import java.util.List;

import com.fashionwardrobe.model.UserRole;
import com.fashionwardrobe.model.Supplier;
import com.fashionwardrobe.model.BillingAddress;
import com.fashionwardrobe.model.ShippingAddress;
import com.fashionwardrobe.model.UserDetails;

public interface UserDao 
{
	public void saveOrUpdateUser(UserDetails userDetails);
	public List<UserDetails> listuserDetails();
	public String stringUser();
	public UserDetails getUserDetailsByName(String username);
	public void UpdateUser(int userId);
	public void saveOrUpdateShipping(ShippingAddress shippingAddress);
	public void saveOrUpdateBilling(BillingAddress billingAddress);
	public void saveOrUpdateUserRole(UserRole userRole);
	public void saveOrUpdateSupplier(Supplier supplier);
	public ShippingAddress getShippingById(int userId);
	public BillingAddress getBillingById(int userId);
}
