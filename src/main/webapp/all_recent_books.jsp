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
<title>All Recent Books</title>
<%@include file="all_components/allCss.jsp"%>
<style>
	.crd-ho:hover {
	background-color: #f7e9ec;
}
</style>
</head>
<body style="background-color: #f2f4f7">
	<%@ include file="all_components/navbar.jsp"%>
	<div class="container my-5"> 
		<%
		BooksDaoimpl bdao1 = new BooksDaoimpl(DBConnect.getConn());
		List<BookDetails> list1 = bdao1.getAllRecentBooks();
		if (list1 != null && !list1.isEmpty()) {
		    int count = 0; // Counter to track the number of cards
		    for (BookDetails b : list1) {
		        if (count % 4 == 0) {
		%>
		<div class="row row-cols-1 row-cols-md-4 g-4 mb-4 px-2"> 
		<%
		        }
		%>
			<div class="col">
				<div class="card shadow-sm rounded-lg crd-ho"
					style="max-width: 280px; height: 400px; margin: auto;">
					<img src="book/<%=b.getPhotoName()%>" alt="Book Image"
						class="card-img-top" style="height: 200px; object-fit: cover;">
					<div
						class="card-body text-center d-flex flex-column justify-content-between"
						style="height: calc(100% - 200px);">
						<h5 class="card-title mb-2"
							style="font-size: 1.1rem; font-weight: bold;">
							<%=b.getBookName()%>
						</h5>
						<p class="card-text text-muted mb-2" style="font-size: 0.9rem;">
							by
							<%=b.getAuthor()%>
						</p>
						<p class="text-muted mb-3" style="font-size: 0.85rem;">
							Categories:
							<%=b.getBookCategory()%>
						</p>

						<div class="d-flex justify-content-between">
							<%
							if (!"Old Book".equals(b.getBookCategory())) {
							%>
							<a href="CartServlet?bid=<%=b.getBookId()%>" class="btn btn-danger btn-sm px-2"
								style="font-size: 0.8rem; border-radius: 20px; padding: 5px 10px;">
								Add to Cart </a>
							<%
							}
							%>

							<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm px-2"
								style="font-size: 0.8rem; border-radius: 20px; padding: 5px 10px;">
								View Details </a> <a href="#" class="btn btn-danger btn-sm px-2"
								style="font-size: 0.8rem; border-radius: 20px; padding: 5px 10px;">
								₹<%=b.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>
		<%
		        count++;
		        if (count % 4 == 0) {
		%>
		</div>
		<%
		        }
		    }
		    if (count % 4 != 0) { 
		%>
		</div>
		<%
		    }
		} else {
		%>
		<div class="text-center my-4">
			<p>No recent books available at the moment.</p>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>
