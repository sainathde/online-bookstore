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
<title>All New Books</title>
<%@include file="all_components/allCss.jsp"%>
<style>
	.crd-ho:hover {
		background-color: #f7e9ec;
	}
</style>
</head>
<body style="background-color: #f2f4f7">

<%
	User user = (User) session.getAttribute("user");
	%>
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container my-5"> 
		<h3 class="text-center mb-4">New Books</h3>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4"> <!-- Added spacing -->
		    <%
		    BooksDaoimpl bdao = new BooksDaoimpl(DBConnect.getConn());
		    List<BookDetails> list = bdao.getAllNewBooks();
		    if (list != null && !list.isEmpty()) {
		        for (BookDetails b : list) {
		    %>
		    <div class="col">
		        <div class="card shadow-sm rounded-lg crd-ho" 
		             style="max-width: 280px; height: 400px; margin: auto;">
		            <img src="book/<%= b.getPhotoName() %>" alt="Book Image" class="card-img-top" 
		                 style="height: 200px; object-fit: cover;">
		            <div class="card-body text-center d-flex flex-column justify-content-between" 
		                 style="height: calc(100% - 200px);">
		                <h5 class="card-title mb-2" style="font-size: 1.1rem; font-weight: bold;">
		                    <%= b.getBookName() %>
		                </h5>
		                <p class="card-text text-muted mb-2" style="font-size: 0.9rem;">
		                    by <%= b.getAuthor() %>
		                </p>
		                <p class="text-muted mb-3" style="font-size: 0.85rem;">
		                    Categories: <%= b.getBookCategory() %>
		                </p>
		                <div class="d-flex justify-content-between">
		                <%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm px-2"
								style="font-size: 0.8rem; border-radius: 20px; padding: 5px 10px;">
								Add to Cart </a>

							<%
							}else{
							%>
								<a href="CartServlet?bid=<%=b.getBookId() %>&&uid=<%=user.getId() %>" class="btn btn-danger btn-sm px-2"
								style="font-size: 0.8rem; border-radius: 20px; padding: 5px 10px;">
								Add to Cart </a>
							<%} %>
		                
		                   
		                    <a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm px-2" 
		                       style="font-size: 0.8rem; border-radius: 20px; padding: 5px 10px;">
		                        View Details
		                    </a>
		                    <a href="#" class="btn btn-danger btn-sm px-2" 
		                       style="font-size: 0.8rem; border-radius: 20px; padding: 5px 10px;">
		                        ₹<%= b.getPrice() %>
		                    </a>
		                </div>
		            </div>
		        </div>
		    </div>
		    <%
		        }
		    } else {
		    %>
		    <div class="text-center my-4">
		        <p>No new books available at the moment.</p>
		    </div>
		    <%
		    }
		    %>
		</div>
	</div>
</body>
</html>
