<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editProfile</title>
<%@ include file="all_components/allCss.jsp" %>
</head>
<body>
<%@ include file="all_components/navbar.jsp" %>


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
						<h5 class="text-center text-primary ">Edit Profile</h5>
						<form action="UpdateServlet" method="post">
						<input type="hidden" value="<%=user.getId() %>" name="id">
					<div class="mb-3">
						<label for="inputName" class="form-label">Name</label> <input
							type="text" class="form-control" id="inputName" name="name"
							 value="<%=user.getName() %>" required>
					</div>
					<div class="mb-3">
						<label for="inputEmail" class="form-label">Email address</label> <input
							type="email" class="form-control" id="inputEmail" name="email"
							aria-describedby="emailHelp" value="<%=user.getEmail() %>"
							required>
						
					</div>
					<div class="mb-3">
						<label for="inputPhone" class="form-label">Phone</label> <input
							type="tel" class="form-control" id="inputPhone" name="phone"
							value="<%=user.getPhno() %>" required>
					</div>
					<div class="mb-3">
						<label for="inputPassword" class="form-label">Password</label> <input
							type="password" class="form-control" id="inputPassword"
							name="password" placeholder="Enter your password" required>
					</div>
					<button type="submit" class="btn btn-primary w-100">Update</button>
				</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>