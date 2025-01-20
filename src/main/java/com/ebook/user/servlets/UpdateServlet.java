package com.ebook.user.servlets;

import java.io.IOException;

import com.ebook.daoimpl.UserDaoimpl;
import com.ebook.db.DBConnect;
import com.ebook.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class UpdateServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String password=req.getParameter("password");
			
			User u = new User();
			u.setId(id);
			u.setName(name);
			u.setEmail(email);
			u.setPhno(phone);
			
			
			UserDaoimpl dao = new UserDaoimpl(DBConnect.getConn());
			boolean f = dao.checkPassword(id, password);
			
			if(f) {
				boolean f2 = dao.updateProfile(u);
				if(f2) {
					resp.sendRedirect("setting.jsp");
				}
				else {
					resp.sendRedirect("editprofile.jsp");;
				}
			}
			else {
				resp.getWriter().println("password entered is wrong.....!");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
