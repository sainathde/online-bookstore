package com.ebook.user.servlets;

import java.io.IOException;
import java.util.zip.CheckedOutputStream;

import com.ebook.daoimpl.CartDaoimpl;
import com.ebook.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class RemoveBook extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		CartDaoimpl dao = new CartDaoimpl(DBConnect.getConn());
		boolean f = dao.deleteBook(bid,uid,cid);
		
		resp.sendRedirect("checkout.jsp");
		
	}

}
