<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook-Register</title>
<%@ include file="all_components/allCss.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="false"%>
<style>
body {
	background-color: #f8f9fa;
	/* Light gray background for better contrast */
}

.form-container {
	margin-top: 50px; /* Adjust space below the navbar */
	margin-bottom: 50px; /* Add some space below the form */
}
</style>
</head>
<body>
	<%@ include file="all_components/navbar.jsp"%>

	<div class="container form-container">
		<div class="card mx-auto" style="width: 30rem;">
			<!-- Centered card using mx-auto -->
			<div class="card-body">
				<h3 class="card-title text-center mb-4">Register</h3>

				<!-- Success Message -->
				<c:if test="${not empty sessionScope.successmessage}">
					<p class="text-center text-success">${sessionScope.successmessage}</p>
					<c:remove var="successmessage" scope="session" />
				</c:if>

				<!-- Failure Message -->
				<c:if test="${not empty sessionScope.failuremessage}">
					<p class="text-center text-danger">${sessionScope.failuremessage}</p>
					<c:remove var="failuremessage" scope="session" />
				</c:if>


				<form action="RegisterServlet" method="post">
					<div class="mb-3">
						<label for="inputName" class="form-label">Name</label> <input
							type="text" class="form-control" id="inputName" name="name"
							placeholder="Enter your full name" required>
					</div>
					<div class="mb-3">
						<label for="inputEmail" class="form-label">Email address</label> <input
							type="email" class="form-control" id="inputEmail" name="email"
							aria-describedby="emailHelp" placeholder="Enter your email"
							required>
						<div id="emailHelp" class="form-text">We'll never share your
							email with anyone else.</div>
					</div>
					<div class="mb-3">
						<label for="inputPhone" class="form-label">Phone</label> <input
							type="tel" class="form-control" id="inputPhone" name="phone"
							placeholder="Enter your phone number" required>
					</div>
					<div class="mb-3">
						<label for="inputPassword" class="form-label">Password</label> <input
							type="password" class="form-control" id="inputPassword"
							name="password" placeholder="Enter your password" required>
					</div>
					<button type="submit" class="btn btn-primary w-100">Submit</button>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="all_components/footer.jsp"%>
</body>
</html>
