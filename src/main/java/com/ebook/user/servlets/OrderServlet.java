package com.ebook.user.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.ebook.daoimpl.CartDaoimpl;
import com.ebook.daoimpl.OrderDaoimpl;
import com.ebook.db.DBConnect;
import com.ebook.entity.Cart;
import com.ebook.entity.Orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class OrderServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String address = req.getParameter("address");
            String landMark = req.getParameter("landmark");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String pinCode = req.getParameter("pin");
            String paymentType = req.getParameter("paymentType");

            // Validate required fields
            if (name == null || email == null || phno == null || address == null || city == null || state == null || pinCode == null || paymentType == null) {
                resp.sendRedirect("error.jsp?msg=Missing required fields");
                return;
            }

            String fullAddress = address + "," + landMark + "," + city + "," + state + "," + pinCode;

            CartDaoimpl cdao = new CartDaoimpl(DBConnect.getConn());
            List<Cart> blist = cdao.getBookByuser(id);
            OrderDaoimpl dao2 = new OrderDaoimpl(DBConnect.getConn());

            ArrayList<Orders> orderList = new ArrayList<>();

            for (Cart cart : blist) {
                // Create a new Orders object for each cart item
                Orders o = new Orders();
                o.setOrderId("BOOK-ORD-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
                o.setUserName(name);
                o.setEmail(email);
                o.setPhno(phno);
                o.setFullAddress(fullAddress);
                o.setBookName(cart.getBookName());
                o.setAuthor(cart.getAuthor());
                o.setPrice(cart.getPrice() + "");
                o.setPaymentType(paymentType);

                orderList.add(o);
            }

            if ("noselect".equals(paymentType)) {
                resp.sendRedirect("checkout.jsp?msg=Please select a payment type");
                return;
            }

            boolean isOrderSaved = dao2.saveOrder(orderList);

            if (isOrderSaved) {
                resp.sendRedirect("ordersuccess.jsp?msg=Order placed successfully");
            } else {
                resp.sendRedirect("error.jsp?msg=Failed to place order");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp?msg=Invalid user ID");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp?msg=Something went wrong");
        }
    }
}
