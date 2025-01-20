<%@page import="java.util.List"%>
<%@page import="com.ebook.db.DBConnect"%>
<%@page import="com.ebook.daoimpl.OrderDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - All Orders</title>
<%@ include file="allCss.jsp"%>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    h3 {
        margin: 20px 0;
    }
    table {
        margin-top: 20px;
    }
    .table th, .table td {
        text-align: center;
        vertical-align: middle;
    }
    .btn {
        margin: 0 5px;
    }
</style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <!-- Admin Greeting -->
    <div class="container">
        <h3 class="text-center text-primary">Hello, Admin</h3>

        <!-- Orders Table -->
        <table class="table table-striped">
            <thead class="bg-success text-white">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Ph No</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment Type</th>
                </tr>
            </thead>
            <tbody>
            	<%
            		OrderDaoimpl dao = new OrderDaoimpl(DBConnect.getConn());
            		List<Orders> od = dao.getAllOrders();
            		
            		for(Orders o : od){%>
            		<tr>
                    <th scope="row"><%= o.getOrderId() %></th>
                    <td><%=o.getUserName() %></td>
                    <td><%=o.getEmail() %></td>
                    <td><%=o.getFullAddress() %></td>
                    <td><%=o.getPhno() %></td>
                    <td><%=o.getBookName() %></td>
                    <td><%=o.getAuthor() %></td>
                    <td><%=o.getPrice() %></td>
                    <td><%=o.getPaymentType() %></td>
                </tr>
            	<%}
            	%>
               
                
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <div style="margin-top: 320px;">
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>
