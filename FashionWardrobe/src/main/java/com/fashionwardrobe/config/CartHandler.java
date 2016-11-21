package com.fashionwardrobe.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;
import com.fashionwardrobe.model.BillingAddress;
import com.fashionwardrobe.model.BuyNow;
import com.fashionwardrobe.model.ShippingAddress;
import com.fashionwardrobe.service.UserService;


@Component
public class CartHandler 
{
	
	@Autowired
	public ShippingAddress shippingAddress;
	
	@Autowired
	public UserService userService;
	
	@Autowired
	public BillingAddress billingAddress;
	
	 public BuyNow initFlow()
	   {
		return new BuyNow();
	   }
	 
	 public String validateShipping(BuyNow buyNow,ShippingAddress shippingAddress, MessageContext messageContext )
	  {
		String status = "success";
		
		if(shippingAddress.getAddress().isEmpty() || shippingAddress.getAddress().length()<20 && !shippingAddress.getAddress().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("address").defaultText(" Please Fill Address").build());
			
			status = "failure";
		}
		if(shippingAddress.getCity().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("city").defaultText(" Please Fill City").build());
			
			status = "failure";
		}
		if(shippingAddress.getState().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("state").defaultText(" Please Fill State").build());
			
			status = "failure";
		}
		if(shippingAddress.getDistrict().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("district").defaultText(" Please Fill District").build());
			
			status = "failure";
		}
		if(shippingAddress.getPincode().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("pincode").defaultText(" Please Fill Pincode").build());
			
			status = "failure";
		}
		if(shippingAddress.getLandmark().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("landmark").defaultText(" Please Fill Landmark").build());
			
			status = "failure";
		}
		return status;	
	  }
	 
	 
	 public String validateBilling(BuyNow buyNow,BillingAddress billingAddress, MessageContext messageContext )
	  {
		String status = "success";
		
		if(billingAddress.getAddress().isEmpty() || billingAddress.getAddress().length()<20 && !billingAddress.getAddress().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("address").defaultText(" Please Fill Address").build());
			
			status = "failure";
		}
		if(billingAddress.getCity().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("city").defaultText(" Please Fill City").build());
			
			status = "failure";
		}
		if(billingAddress.getState().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("state").defaultText(" Please Fill State").build());
			
			status = "failure";
		}
		if(billingAddress.getDistrict().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("district").defaultText(" Please Fill District").build());
			
			status = "failure";
		}
		if(billingAddress.getPincode().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("pincode").defaultText(" Please Fill Pincode").build());
			
			status = "failure";
		}
		if(billingAddress.getLandmark().isEmpty())
		{
			messageContext.addMessage(new MessageBuilder().error().source("landmark").defaultText(" Please Fill Landmark").build());
			
			status = "failure";
		}
		return status;	
	  }
	 
	 
	 public String addShippingDetails(BuyNow buyNow, ShippingAddress shippingaddress)
	 {
	 	this.shippingAddress.setAddress(shippingaddress.getAddress());
	 	this.shippingAddress.setCity(shippingaddress.getCity());
	 	this.shippingAddress.setDistrict(shippingaddress.getDistrict());
	 	this.shippingAddress.setLandmark(shippingaddress.getLandmark());
	 	this.shippingAddress.setPincode(shippingaddress.getPincode());
	 	this.shippingAddress.setState(shippingaddress.getState());
	 	
	 	return "success";
	 	
	 }
	 
	 public String addBillingDetails(BuyNow buyNow, BillingAddress billingAddress)
	 {
	 	this.billingAddress.setAddress(billingAddress.getAddress());
	 	this.billingAddress.setCity(billingAddress.getCity());
	 	this.billingAddress.setDistrict(billingAddress.getDistrict());
	 	this.billingAddress.setLandmark(billingAddress.getLandmark());
	 	this.billingAddress.setPincode(billingAddress.getPincode());
	 	this.billingAddress.setState(billingAddress.getState());
	 	
	 	return "success";
	 	
	 }

	 
}
