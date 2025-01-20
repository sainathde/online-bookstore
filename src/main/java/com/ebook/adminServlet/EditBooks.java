package com.ebook.adminServlet;

import java.io.IOException;

import com.ebook.daoimpl.BooksDaoimpl;
import com.ebook.db.DBConnect;
import com.ebook.entity.BookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EditBooks extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Retrieve parameters from the request
            int id = Integer.parseInt(req.getParameter("id"));
            String bookName = req.getParameter("bookName");
            String authorName = req.getParameter("authorName");
            String price = req.getParameter("price");
            String status = req.getParameter("status");

            // Set values in the BookDetails object
            BookDetails b = new BookDetails();
            b.setBookId(id); // Set the book ID
            b.setBookName(bookName);
            b.setAuthor(authorName);
            b.setPrice(price);
            b.setStatus(status);

            // DAO implementation to update the book details
            BooksDaoimpl bdao = new BooksDaoimpl(DBConnect.getConn());
            boolean isUpdated = bdao.UpdateBookDetails(b);

            HttpSession session = req.getSession();

            if (isUpdated) {
                // Set a success message in the session
//                session.setAttribute("successMessage", "Book updated successfully!");
                resp.sendRedirect("admin/all_books.jsp");
            } else {
              
//                session.setAttribute("errorMessage", "Failed to update book. Please try again.");
                resp.getWriter().println("some thing went wrong ");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            
            HttpSession session = req.getSession();
//            session.setAttribute("errorMessage", "Invalid Book ID!");
            resp.sendRedirect("admin/all_books.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            
            HttpSession session = req.getSession();
//            session.setAttribute("errorMessage", "Something went wrong. Please try again later!");
            resp.sendRedirect("admin/all_books.jsp");
        }
    }
}
