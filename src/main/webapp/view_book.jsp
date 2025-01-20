<%@page import="com.ebook.daoimpl.BooksDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ebook.db.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ebook.entity.*"%>
<%@ page import="com.ebook.daoimpl.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Details</title>
    <%@include file="all_components/allCss.jsp"%>
    <style>
        body {
            background-color: #f2f4f7;
            font-family: 'Arial', sans-serif;
        }
        .book-image {
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            font-size: 14px;
            padding: 6px 12px;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-secondary {
            background-color: #6c757d;
            border: none;
            font-size: 14px;
            padding: 6px 12px;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .price {
            font-size: 18px;
            font-weight: bold;
            color: #ff5733;
            margin-top: 10px;
            display: inline-block;
        }
        .text-danger i {
            color: #dc3545;
        }
        .text-danger p {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <%@ include file="all_components/navbar.jsp"%>

    <%
    int bid = Integer.parseInt(request.getParameter("bid"));
    BooksDaoimpl bdao = new BooksDaoimpl(DBConnect.getConn());
    BookDetails b = bdao.getBookById(bid);
    String email=b.getEmail();

    // Simulating seller details retrieval (Adjust as needed for your project)
    String sellerDetails = "Seller: John Doe | Contact: "+email;
    %>

    <div class="container mt-5">
        <div class="row">
            <!-- Left Section: Book Details -->
            <div class="col-md-6 text-center p-5 border bg-white">
                <img src="book/<%=b.getPhotoName()%>" alt="Book Image" class="book-image" style="height: 200px; width: 200px;"><br>
                <h4>Book Name: <%=b.getBookName()%></h4>
                <h5>Author Name: <%=b.getAuthor()%></h5>
                <h5>Category: <%=b.getBookCategory()%></h5>
            </div>

            <!-- Right Section: Pricing and Features -->
            <div class="col-md-6 text-center p-5 border bg-white">
                <h3 style="font-weight: 700;"><%=b.getBookName()%></h3>

                <!-- Seller Details -->
                <%
                if ("Old Book".equalsIgnoreCase(b.getBookCategory())) {
                %>
                    <h6 class="text-muted mt-2"><%=sellerDetails%></h6>
                <% 
                } 
                %>

                <div class="row mt-2">
                    <div class="col-md-4 text-danger p-2">
                        <i class="fa-solid fa-money-bill-1-wave fa-2x"></i>
                        <p>Cash On Delivery</p>
                    </div>
                    <div class="col-md-4 text-danger p-2">
                        <i class="fa-solid fa-rotate-left fa-2x"></i>
                        <p>Return Available</p>
                    </div>
                    <div class="col-md-4 text-danger p-2">
                        <i class="fa-solid fa-truck fa-2x"></i>
                        <p>Free Shipping</p>
                    </div>
                </div>

                <!-- Call-to-Action Buttons -->
                <div class="row text-center mt-3">
                    <%
                    if ("Old Book".equalsIgnoreCase(b.getBookCategory())) {
                    %>
                        <div class="col-6">
                            <a href="index.jsp" class="btn btn-secondary">
                                <i class="fa-solid fa-arrow-left"></i> Continue Shopping
                            </a>
                        </div>
                    <% 
                    } else {
                    %>
                        <div class="col-6">
                            <a href="addToCart.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary">
                                <i class="fa-solid fa-cart-shopping"></i> Add to Cart
                            </a>
                        </div>
                    <% 
                    }
                    %>
                    <div class="col-6">
                        <span class="price">Price: <i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
