package com.ebook.adminServlet;

import java.io.IOException;

import com.ebook.dao.BooksDao;
import com.ebook.daoimpl.BooksDaoimpl;
import com.ebook.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Delete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Parse the book ID from the request
            int id = Integer.parseInt(req.getParameter("id"));

            // Call the DAO to delete the book
            BooksDao bdao = new BooksDaoimpl(DBConnect.getConn());
            boolean isDeleted = bdao.deleteBooks(id);

            // Set up the session for feedback messages
            HttpSession session = req.getSession();

            if (isDeleted) {
                // Success message
                session.setAttribute("successMessage", "Book deleted successfully!");
            } else {
                // Failure message
                session.setAttribute("errorMessage", "Failed to delete the book. Please try again.");
            }

            // Redirect to the books page
            resp.sendRedirect("admin/all_books.jsp");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            // Handle invalid ID error
            HttpSession session = req.getSession();
            session.setAttribute("errorMessage", "Invalid book ID!");
            resp.sendRedirect("admin/all_books.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            // Handle other exceptions
            HttpSession session = req.getSession();
            session.setAttribute("errorMessage", "Something went wrong. Please try again later!");
            resp.sendRedirect("admin/all_books.jsp");
        }
    }
}
