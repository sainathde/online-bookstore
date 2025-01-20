package com.ebook.user.servlets;

import java.io.IOException;

import com.ebook.daoimpl.BooksDaoimpl;
import com.ebook.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class DeleteOldBook extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String email = req.getParameter("email");
			int bid = Integer.parseInt(req.getParameter("bid"));
			
			
			BooksDaoimpl bdao = new BooksDaoimpl(DBConnect.getConn());
			boolean f = bdao.oldBookDelete(email, "Old Book",bid);
			
			resp.sendRedirect("oldbook.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
