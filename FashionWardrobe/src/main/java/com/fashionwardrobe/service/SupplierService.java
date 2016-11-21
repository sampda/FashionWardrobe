package com.fashionwardrobe.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fashionwardrobe.daoimpl.SupplierDaoImpl;
import com.fashionwardrobe.model.Supplier;



@Service
public class SupplierService 
{
	@Autowired
	   private SupplierDaoImpl supplierDaoImpl;
	   
		@Transactional
		public void addSupplier(Supplier supplier)
		{
			supplierDaoImpl.addSupplier(supplier);;
		}
		
		@Transactional
		public List<Supplier> listSupplier() 
		{
		return supplierDaoImpl.listSupplier();
		}
		
		@Transactional
		public Supplier getsupIdByName(String supplierName)
		{
			return supplierDaoImpl.getIdFromName(supplierName);
		}
		
		@Transactional
		public String stringSupplier()
		{
			return supplierDaoImpl.listSupplierViaJson();
		}
		
		@Transactional
		public Supplier getById(int supplier_id)
		{
			return supplierDaoImpl.getIdFromId(supplier_id);
		}
		
		@Transactional
		public void deleteSupplier(int supplier_id)
		{
			supplierDaoImpl.deleteSupplier(supplier_id);
		}
		
}
