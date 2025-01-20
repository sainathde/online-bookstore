<%@page import="com.ebook.entity.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.db.DBConnect"%>
<%@page import="com.ebook.daoimpl.OrderDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orders</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f2f4f7">
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container p-4">

		<h3 class="text-center text-primary">Your Order</h3>
		<table class="table mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">OrderId</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				User user = (User) session.getAttribute("user");
				OrderDaoimpl dao = new OrderDaoimpl(DBConnect.getConn());
				List<Orders> o = dao.getBook(user.getEmail());

				for (Orders od : o) {
				%>
				<tr>
					<th scope="row"><%= od.getOrderId() %></th>
					<td><%=od.getUserName() %></td>
					<td><%=od.getBookName() %></td>
					<td><%= od.getAuthor() %></td>
					<td><%= od.getPrice() %></td>
					<td><%= od.getPaymentType() %></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>

</body>
</html>