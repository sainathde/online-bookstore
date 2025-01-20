package com.ebook.user.servlets;

import java.io.IOException;

import com.ebook.daoimpl.BooksDaoimpl;
import com.ebook.daoimpl.CartDaoimpl;
import com.ebook.db.DBConnect;
import com.ebook.entity.BookDetails;
import com.ebook.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class CartServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int bid= Integer.parseInt(req.getParameter("bid"));
			int uid= Integer.parseInt(req.getParameter("uid"));
			
			BooksDaoimpl bdao = new BooksDaoimpl(DBConnect.getConn());
			BookDetails b = bdao.getBookById(bid);
			
			Cart c = new Cart();
			
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDaoimpl cdao = new CartDaoimpl(DBConnect.getConn());
			boolean f = cdao.addCart(c);
			
			HttpSession session = req.getSession();
			
			if(f) {
//				session.setAttribute("addCart", "Book Added to Cart");
				resp.sendRedirect("all_new_books.jsp");
			}
			else {
//				session.setAttribute("failed", "Some thing wrong on server");
				resp.sendRedirect("all_new_books.jsp");		
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
