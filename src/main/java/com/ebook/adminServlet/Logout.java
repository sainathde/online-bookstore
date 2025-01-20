package com.ebook.adminServlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class Logout extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			session.removeAttribute("user");
			
			resp.sendRedirect("login.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

}
