<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ebook.dao.*"%>
<%@ page import="com.ebook.daoimpl.*"%>
<%@ page import="com.ebook.db.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ebook.entity.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Edit Books</title>
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
<body style="background-color: #f0f2f2">
	<%@ include file="navbar.jsp"%>

	<div class="container">
		<h3 class="text-center text-primary">Hello, Admin</h3>

		<table class="table table-striped">
			<thead class="bg-success text-white">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				try {
					BooksDao bdao = new BooksDaoimpl(DBConnect.getConn());
					List<BookDetails> list = bdao.getAllBooks();
					if (list != null && !list.isEmpty()) {
						for (BookDetails b : list) {
				%>
				<tr>
					<td><%= b.getBookId() %></td>
					<td>
						<%
						if (b.getPhotoName() != null && !b.getPhotoName().isEmpty()) {
						%>
						<img src="../book/<%= b.getPhotoName() %>" style="width: 50px; height: 50px;">
						<%
						} else {
							out.println("No Image");
						}
						%>
					</td>
					<td><%= b.getBookName() %></td>
					<td><%= b.getAuthor() %></td>
					<td><%= b.getPrice() %></td>
					<td><%= b.getBookCategory() %></td>
					<td><%= b.getStatus() %></td>
					<td>
						<a href="editBooks.jsp?id=<%= b.getBookId() %>" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
						<a href="../Delete?id=<%=b.getBookId() %>" class="btn btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
					</td>
				</tr>
				<%
						}
					} else {
						out.println("<tr><td colspan='8'>No Books Found</td></tr>");
					}
				} catch (Exception e) {
					out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
					e.printStackTrace();
				}
				%>
			</tbody>
		</table>
	</div>

	<div style="margin-top: 300px;">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>
