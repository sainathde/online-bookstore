package com.ebook.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ebook.dao.CartDao;
import com.ebook.entity.Cart;

public class CartDaoimpl implements CartDao {

	private Connection conn;
	
	
	
	public CartDaoimpl(Connection conn) {
		this.conn = conn;
	}



	@Override
	public boolean addCart(Cart c) {
		boolean f = false;
		try {
			String sql = "insert into cart(bid, uid, bookName, author, price, totalPrice) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getBid());
			pstmt.setInt(2, c.getUserId());
			pstmt.setString(3, c.getBookName());
			pstmt.setString(4, c.getAuthor());
			pstmt.setDouble(5, c.getPrice());
			pstmt.setDouble(6, c.getTotalPrice());
			
			int i = pstmt.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}



	@Override
	public List<Cart> getBookByuser(int id) {
		List<Cart> list= new ArrayList<Cart>();
		Cart c = null;
		double totalPrice=0;
		
		
		try {
			String sql="select * from cart where uid=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			ResultSet rset = pstmt.executeQuery();
			
			while(rset.next()) {
				c = new Cart();
				c.setCid(rset.getInt(1));
				c.setBid(rset.getInt(2));
				c.setUserId(rset.getInt(3));
				c.setBookName(rset.getString(4));
				c.setAuthor(rset.getString(5));
				c.setPrice(rset.getDouble(6));
				
				totalPrice=totalPrice+rset.getDouble(7);
				c.setTotalPrice(totalPrice);
				
				list.add(c);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public boolean deleteBook(int bid,int uid,int cid) {
		boolean f = false;
		try {
			String sql = "delete from cart where bid=? and uid=? and cid=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			pstmt.setInt(2, uid);
			pstmt.setInt(3, cid);
			
			int i =pstmt.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
