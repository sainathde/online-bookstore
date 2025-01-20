package com.ebook.dao;

import java.util.List;

import com.ebook.entity.Cart;

public interface CartDao {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getBookByuser(int id);
	
	public boolean deleteBook(int bid,int uid,int cid);
	
	
	
}
