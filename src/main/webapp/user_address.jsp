<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Address</title>
<%@ include file="all_components/allCss.jsp" %>
</head>
<body style="background-color: #f2f4f7">
<%@ include file="all_components/navbar.jsp" %>
<div class="container p-5">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h2 class="text-center text-success">Add Address</h2>
						<form class="row g-3">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Address</label> <input
									type="text" class="form-control" id="phno" value="">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Land Mark</label>
								<input type="text" class="form-control" id="address">
							</div>
							
							<div class="col-md-4">
								<label for="inputPassword4" class="form-label">City</label>
								<input type="text" class="form-control" id="address">
							</div>
							
							<div class="col-md-4">
								<label for="inputPassword4" class="form-label">State</label>
								<input type="text" class="form-control" id="address">
							</div>
							<div class="col-md-4">
								<label for="inputPassword4" class="form-label">Pin</label>
								<input type="number" class="form-control" id="address">
							</div>
							
							<div class="text-center">
								<button class="btn btn-warning">Add Address</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>