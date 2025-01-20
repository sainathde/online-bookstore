<%@page import="com.ebook.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.db.DBConnect"%>
<%@page import="com.ebook.daoimpl.BooksDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>old books</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container p-5">
	<table class="table ">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Category</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  	User user= (User)session.getAttribute("user");
  	BooksDaoimpl bdao = new BooksDaoimpl(DBConnect.getConn());
  	List<BookDetails> list = bdao.getBookByUserId(user.getEmail(), "Old Book");
  	for(BookDetails b : list){%>
  	  <tr>
      <th ><%=b.getBookName() %></th>
      <td><%=b.getAuthor() %></td>
      <td><%= b.getPrice() %></td>
      <td><%= b.getBookCategory() %></td>
      <td><a href="DeleteOldBook?email=<%=b.getEmail() %>&&bid=<%=b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a></td>
      </tr>
  	<% }
  %>
  
    
    
  </tbody>
</table>
	</div>
</body>
</html>