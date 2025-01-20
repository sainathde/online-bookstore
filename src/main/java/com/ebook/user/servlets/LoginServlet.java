package com.ebook.user.servlets;

import java.io.IOException;

import com.ebook.dao.UserDao;
import com.ebook.daoimpl.UserDaoimpl;
import com.ebook.db.DBConnect;
import com.ebook.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    UserDao usdao = new UserDaoimpl(DBConnect.getConn());
	    HttpSession session = req.getSession();
	    
	    try {
	        String email = req.getParameter("email");
	        String password = req.getParameter("password");
	        

	        
	        if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
	        	User user = new User();
	        	user.setName("Admin");
	            session.setAttribute("user", user);
	            resp.sendRedirect("admin/home.jsp");
	        } else {
	           
	            User us = usdao.login(email, password);
	            
	            if (us != null) {
	                session.setAttribute("user", us);
	                resp.sendRedirect("index.jsp");
	            } else {
//	                session.setAttribute("failedMessage", "Invalid email or password!");
	                resp.sendRedirect("login.jsp");
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }
	}


}
