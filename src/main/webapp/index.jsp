<%@page import="com.ebook.daoimpl.BooksDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ebook.db.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ebook.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook-Index</title>
<%@include file="all_components/allCss.jsp"%>
<style type="text/css">
.back-img {
	background-image: url("img/book.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>
<body style="background-color: #f2f4f7">
	<%
	User user = (User) session.getAttribute("user");
	%>


	<%@ include file="all_components/navbar.jsp"%>

	<div class="container-fluid back-img">
		<h2>EBook management System</h2>
	</div>


	<!-- Start Recent Book -->
	<div class="container py-5">
		<h3 class="text-center mb-4">Recent Books</h3>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">
			<%
			BooksDaoimpl bdao1 = new BooksDaoimpl(DBConnect.getConn());
			List<BookDetails> list1 = bdao1.getRecentBooks();
			if (list1 != null && !list1.isEmpty()) {
				for (BookDetails b : list1) {
			%>
			<div class="col">
				<div class="card shadow-sm rounded-lg crd-ho"
					style="max-width: 280px; height: 400px;">
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
							
							<%
							}
							%>

							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm px-2"
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
			}
			} else {
			%>
			<div class="text-center">
				<p>No recent books available at the moment.</p>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-3">
			<a href="all_recent_books.jsp" class="btn btn-danger btn-small">View
				All</a>
		</div>
	</div>
	<!-- End Recent Book -->


	<hr>

	<!-- Start New Book -->
	<div class="container py-5">
		<h3 class="text-center mb-4">New Books</h3>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">
			<%
			BooksDaoimpl bdao = new BooksDaoimpl(DBConnect.getConn());
			List<BookDetails> list = bdao.getNewBook();
			if (list != null && !list.isEmpty()) {
				for (BookDetails b : list) {
			%>
			<div class="col">
				<div class="card shadow-sm rounded-lg crd-ho"
					style="max-width: 280px; height: 400px;">
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
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm px-2"
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
			}
			} else {
			%>
			<div class="text-center">
				<p>No new books available at the moment.</p>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-3">
			<a href="all_new_books.jsp" class="btn btn-danger btn-small">View
				All</a>
		</div>
	</div>


	<!-- End New Book -->

	<hr>

	<!-- Start Old Book -->
	<div class="container py-5">
		<h3 class="text-center mb-4">Old Books</h3>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">
			<%
			BooksDaoimpl bdaoOld = new BooksDaoimpl(DBConnect.getConn());
			List<BookDetails> oldBookList = bdaoOld.getOldBooks(); 
			if (oldBookList != null && !oldBookList.isEmpty()) {
				for (BookDetails oldBook : oldBookList) {
			%>
			<div class="col">
				<div class="card shadow-sm rounded-lg crd-ho"
					style="max-width: 280px; height: 400px;">
					<img src="book/<%=oldBook.getPhotoName()%>" alt="Book Image"
						class="card-img-top" style="height: 200px; object-fit: cover;">
					<div
						class="card-body text-center d-flex flex-column justify-content-between"
						style="height: calc(100% - 200px);">
						<h5 class="card-title mb-2"
							style="font-size: 1.1rem; font-weight: bold;">
							<%=oldBook.getBookName()%>
						</h5>
						<p class="card-text text-muted mb-2" style="font-size: 0.9rem;">
							by
							<%=oldBook.getAuthor()%>
						</p>
						<p class="text-muted mb-3" style="font-size: 0.85rem;">
							Categories:
							<%=oldBook.getBookCategory()%>
						</p>
						<div class="d-flex justify-content-between">
							<a href="view_book.jsp?bid=<%=oldBook.getBookId()%>"
								class="btn btn-success btn-sm px-2"
								style="font-size: 0.8rem; border-radius: 20px; padding: 5px 10px;">
								View Details </a> <a href="#" class="btn btn-danger btn-sm px-2"
								style="font-size: 0.8rem; border-radius: 20px; padding: 5px 10px;">
								₹<%=oldBook.getPrice()%>
							</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			%>
			<div class="text-center">
				<p>No old books available at the moment.</p>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-3">
			<a href="all_old_books.jsp" class="btn btn-danger btn-small">View
				All</a>
		</div>
	</div>
	<!-- End Old Book -->







	<%@ include file="all_components/footer.jsp"%>
</body>
</html>
