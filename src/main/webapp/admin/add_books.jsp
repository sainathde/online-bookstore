<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Add Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@ include file="navbar.jsp"%>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center mb-4">Add Books</h4>
						<form action="../BookAdd" method="post"
							enctype="multipart/form-data">
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

							<!-- Book Categories -->
							<div class="mb-3">
								<label for="category" class="form-label">Book Categories</label>
								<select name="category" id="category" class="form-select"
									required>
									<option value="New Book" selected>New Book</option>
								</select>
							</div>

							<!-- Book Status -->
							<div class="mb-3">
								<label for="status" class="form-label">Book Status</label> <select
									name="status" id="status" class="form-select" required>
									<option value="Active" selected>Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<!-- Upload Photo -->
							<div class="mb-3">
								<label for="bookPhoto" class="form-label">Upload Photo</label> <input
									type="file" name="bookPhoto" class="form-control"
									id="bookPhoto" accept="image/*" required>
							</div>

							<!-- Submit Button -->
							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Add Book</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
