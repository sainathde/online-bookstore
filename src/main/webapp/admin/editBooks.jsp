<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ebook.dao.*"%>
<%@ page import="com.ebook.daoimpl.*"%>
<%@ page import="com.ebook.db.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ebook.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Edit Book</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@ include file="navbar.jsp"%>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center mb-4">Edit Book</h4>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BooksDaoimpl bdao = new BooksDaoimpl(DBConnect.getConn());
						BookDetails b = bdao.getBookById(id);
						%>

						<form action="../EditBooks" method="post">
							<input type="hidden" name="id" value="<%= b.getBookId()%>">
							<!-- Book Name -->
							<div class="mb-3">
								<label for="bookName" class="form-label">Book Name</label> <input
									type="text" name="bookName" class="form-control" id="bookName"
									placeholder="Enter book name" value ="<%= b.getBookName()  %>" required>
							</div>

							<!-- Author Name -->
							<div class="mb-3">
								<label for="authorName" class="form-label">Author Name</label> <input
									type="text" name="authorName" class="form-control"
									id="authorName" placeholder="Enter author name"  value ="<%=b.getAuthor() %>" required>
							</div>

							<!-- Price -->
							<div class="mb-3">
								<label for="price" class="form-label">Price</label> <input
									type="number" name="price" class="form-control" id="price"
									placeholder="Enter price" value ="<%=b.getPrice() %>" required>
							</div>


							<!-- Book Status -->
							<div class="mb-3">
								<label for="status" class="form-label">Book Status</label> <select
									name="status" id="status" class="form-select" required>
									<%if("Active".equals(b.getStatus())){%>
									
									<option value="Active" >Active</option>
									<option value="Inactive">Incative</option>
									<%
									}else{
									%>
										<option value="Inactive">Incative</option>
										<option value="Active" >Active</option>
										
									<%
									}
									%>
										
										
								</select>
							</div>					
							<!-- Submit Button -->
							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Apply changes</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
