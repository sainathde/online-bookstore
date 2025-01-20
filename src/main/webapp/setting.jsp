<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting</title>
<%@ include file="all_components/allCss.jsp" %>
<style>
a{
	text-decoration: none;
	color:black;
}
a:hover{
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f2f4f7">
<%@ include file="all_components/navbar.jsp" %>
<%
    HttpSession session1 = request.getSession(false); 
    if (session1 == null || session1.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    User user = (User) session.getAttribute("user");
%>
<div class="container">
	<h3 class="text-center">Hello <%=user.getName() %></h3>
	<div class="row p-5">
		<div class="col-md-4">
			<a href="sellbook.jsp">
				<div class="card">
					<div class="card-body text-center" >
						<div class="text-primary">
							<i class="fa-solid fa-book-open fa-3x"></i>
						</div>
						<h3>Sell Old Book</h3>
					</div>
				</div>
			</a>
		</div>
		
		<div class="col-md-4">
			<a href="oldbook.jsp">
				<div class="card">
					<div class="card-body text-center" >
						<div class="text-primary">
							<i class="fa-solid fa-book-open fa-3x"></i>
						</div>
						<h3>Old Book</h3>
					</div>
				</div>
			</a>
		</div>
		
		<div class="col-md-4">
			<a href="editprofile.jsp">
				<div class="card">
					<div class="card-body text-center" >
						<div class="text-primary">
							<i class="fa-solid fa-pen-to-square fa-3x"></i>
						</div>
						<h3>Edit profile</h3>
					</div>
				</div>
			</a>
		</div>
		
		
		
		<div class="col-md-6 mt-3">
			<a href="orders.jsp">
				<div class="card">
					<div class="card-body text-center" >
						<div class="text-danger">
							<i class="fa-solid fa-box-open fa-3x"></i>
						</div>
						<h3>My Order</h3>
						<p>Track your Order</p>
					</div>
				</div>
			</a>
		</div>
		
		<div class="col-md-6 mt-3">
			<a href="helpline.jsp">
				<div class="card">
					<div class="card-body text-center" >
						<div class="text-primary">
							<i class="fa-solid fa-user-circle fa-3x"></i>
						</div>
						<h3>Help Center</h3>
						<p>24*7 Service</p>
					</div>
				</div>
			</a>
		</div>
	</div>
</div>



</body>
</html>