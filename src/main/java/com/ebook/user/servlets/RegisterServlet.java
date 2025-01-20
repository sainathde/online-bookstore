package com.ebook.user.servlets;

import java.io.IOException;

import com.ebook.daoimpl.UserDaoimpl;
import com.ebook.db.DBConnect;
import com.ebook.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");

//			resp.getWriter().println(name+" "+email+" "+phone+" "+password);

			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);
			user.setPhno(phone);

			UserDaoimpl udao = new UserDaoimpl(DBConnect.getConn());
			boolean f2 =udao.checkUser(email);
			if(f2) {
				boolean f = udao.userRegister(user);

				if (f) {

//					session.setAttribute("successmessage", "user Registeration Success");
					resp.sendRedirect("register.jsp");
				} else {
//					session.setAttribute("failuremessage", "user Registration failed");
					resp.sendRedirect("register.jsp");
				}
			}
			else {
				resp.getWriter().println("user already exists");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
