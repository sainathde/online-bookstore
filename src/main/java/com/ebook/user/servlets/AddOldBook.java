package com.ebook.user.servlets;

import java.io.File;
import java.io.IOException;

import com.ebook.dao.BooksDao;
import com.ebook.daoimpl.BooksDaoimpl;
import com.ebook.db.DBConnect;
import com.ebook.entity.BookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
public class AddOldBook extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String bookName=req.getParameter("bookName");
			String authorName=req.getParameter("authorName");
			String price=req.getParameter("price");
			String categories = "Old Book";
			String status = "Active";
			Part part = req.getPart("bookPhoto");
			String fileName=part.getSubmittedFileName();
			
			String userEmail=req.getParameter("userEmail");
			
			BookDetails bd = new BookDetails(bookName, authorName, price, categories, status, fileName,userEmail);
			
			BooksDao bookdao = new BooksDaoimpl(DBConnect.getConn());
			
			
			
			
			boolean f= bookdao.addBooks(bd);
			
			HttpSession session =req.getSession();
			
			if(f) {
				
				String path=getServletContext().getRealPath("")+"book";
				
				File file= new File(path);
				
				part.write(path+File.separator+fileName);
				
				
				
//				session.setAttribute("successMessage", "Book Add successfully");
				resp.sendRedirect("sellbook.jsp");
			}
			else {
//				session.setAttribute("failureMessage", "something went wrong");
				resp.sendRedirect("sellbook.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
