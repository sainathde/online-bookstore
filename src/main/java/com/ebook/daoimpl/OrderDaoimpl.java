package com.ebook.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.ebook.dao.OrderDao;
import com.ebook.entity.Orders;
import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

public class OrderDaoimpl implements OrderDao {
	
	private Connection conn;

	public OrderDaoimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	
	
	
	
//	@Override
//	public int getOrderNo() {
//		int i=1;
//		try {
//			
//			String sql = "select * from orders";
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			ResultSet rset = pstmt.executeQuery();
//			while(rset.next()) {
//				i++;
//			}
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		return i;
//	}





	@Override
	public boolean saveOrder(List<Orders> order) {
	    boolean isSaved = false;
	    try {
	        String sql = "INSERT INTO orders (order_id, username, email, address, phone, book_name, author, price, payment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        conn.setAutoCommit(false);
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        
	        for (Orders o : order) {
	            pstmt.setString(1, o.getOrderId());
	            pstmt.setString(2, o.getUserName());
	            pstmt.setString(3, o.getEmail());
	            pstmt.setString(4, o.getFullAddress());
	            pstmt.setString(5, o.getPhno());
	            pstmt.setString(6, o.getBookName());
	            pstmt.setString(7, o.getAuthor());
	            pstmt.setString(8, o.getPrice());
	            pstmt.setString(9, o.getPaymentType());
	            pstmt.addBatch();
	        }
	        
	        int[] count = pstmt.executeBatch();
	        conn.commit();
	        
	        // Check if all operations were successful
	        isSaved = Arrays.stream(count).allMatch(i -> i > 0);
	    } catch (Exception e) {
	        e.printStackTrace();
	        try {
	            conn.rollback();
	        } catch (Exception rollbackEx) {
	            rollbackEx.printStackTrace();
	        }
	    } finally {
	        try {
	            conn.setAutoCommit(true);
	        } catch (Exception autoCommitEx) {
	            autoCommitEx.printStackTrace();
	        }
	    }
	    return isSaved;
	}





	@Override
	public List<Orders> getBook(String email) {
		List<Orders> list = new ArrayList<Orders>();
		Orders o = null;
		try {
			String sql = "select * from orders where email=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rset =pstmt.executeQuery();
			
			while(rset.next()) {
				o = new Orders();
				o.setOrderId(rset.getString(1));
				o.setOrderId(rset.getString(2));
				o.setUserName(rset.getString(3));
				o.setEmail(rset.getString(4));
				o.setFullAddress(rset.getString(5));
				o.setPhno(rset.getString(6));
				o.setBookName(rset.getString(7));
				o.setAuthor(rset.getString(8));
				o.setPrice(rset.getString(9));
				o.setPaymentType(rset.getString(10));
				
				list.add(o);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}





	@Override
	public List<Orders> getAllOrders() {
		List<Orders> list = new ArrayList<Orders>();
		Orders o = null;
		try {
			String sql = "select * from orders";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rset =pstmt.executeQuery();
			
			while(rset.next()) {
				o = new Orders();
				o.setOrderId(rset.getString(1));
				o.setOrderId(rset.getString(2));
				o.setUserName(rset.getString(3));
				o.setEmail(rset.getString(4));
				o.setFullAddress(rset.getString(5));
				o.setPhno(rset.getString(6));
				o.setBookName(rset.getString(7));
				o.setAuthor(rset.getString(8));
				o.setPrice(rset.getString(9));
				o.setPaymentType(rset.getString(10));
				
				list.add(o);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
}
