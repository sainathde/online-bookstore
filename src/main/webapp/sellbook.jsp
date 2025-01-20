<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sell book</title>
<%@ include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f2f4f7">
	<%@ include file="all_components/navbar.jsp"%>
	<%
    HttpSession session1 = request.getSession(false); 
    if (session1 == null || session1.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    User user = (User) session.getAttribute("user");
%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-primary ">Sell old Book</h5>
						<form action="AddOldBook" method="post" enctype="multipart/form-data">
						<input type="hidden" value="<%=user.getEmail()%>" name="userEmail">
							<!-- Book Name -->
							<div class="mb-3">
								<label for="bookName" class="form-label">Book Name</label> <input
									type="text" name="bookName" class="form-control" id="bookName"
									placeholder="Enter book name" required>
							</div>

							<!-- Author Name -->
							<div class="mb-3">
								<label for="authorName" class="form-label">Author Name</label> <input
									type="text" name="authorName" class="form-control"
									id="authorName" placeholder="Enter author name" required>
							</div>

							<!-- Price -->
							<div class="mb-3">
								<label for="price" class="form-label">Price</label> <input
									type="number" name="price" class="form-control" id="price"
									placeholder="Enter price" required>
							</div>



							<!-- Upload Photo -->
							<div class="mb-3">
								<label for="bookPhoto" class="form-label">Upload Photo</label> <input
									type="file" name="bookPhoto" class="form-control"
									id="bookPhoto" accept="image/*" required>
							</div>

							<!-- Submit Button -->
							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Sell</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>