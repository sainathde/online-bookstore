package com.ebook.dao;

import java.util.List;

import com.ebook.entity.Orders;

public interface OrderDao {
//	public int getOrderNo();
	
	public boolean saveOrder(List<Orders> order);
	
	public List<Orders> getBook(String email);
	
	public List<Orders> getAllOrders();
	
}
