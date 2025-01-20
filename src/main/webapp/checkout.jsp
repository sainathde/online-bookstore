<%@page import="com.ebook.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="com.ebook.db.DBConnect"%>
<%@page import="com.ebook.daoimpl.CartDaoimpl"%>
<%@page import="com.ebook.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<%@include file="all_components/allCss.jsp"%>
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


<div class="container">
<div class="row">
	<div class="col-md-6">
    <div class="card bg-white mt-5">
        <h3 class="text-center text-success">Your Selected Items</h3>
        <div class="card-body">
            <%
                CartDaoimpl dao = new CartDaoimpl(DBConnect.getConn());
                List<Cart> cart = dao.getBookByuser(user.getId());
                Double totalPrice = 0.00;

                if (cart.isEmpty()) {
            %>
                <div class="text-center">
                    <p class="text-danger">Your cart is empty. Please select books to continue.</p>
                    <a href="index.jsp" class="btn btn-primary">Browse Books</a>
                </div>
            <%
                } else {
            %>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Book Name</th>
                            <th scope="col">Author</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Cart c : cart) {
                                totalPrice += c.getPrice(); // Accumulate the total price
                        %>
                            <tr>
                                <th scope="row"><%= c.getBookName() %></th>
                                <td><%= c.getAuthor() %></td>
                                <td><%= c.getPrice() %></td>
                                <td>
                                    <a href="RemoveBook?bid=<%= c.getBid() %>&&uid=<%= user.getId() %>&&cid=<%= c.getCid() %>" class="btn btn-sm btn-danger">Remove</a>
                                </td>
                            </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td>Total Price</td>
                            <td></td>
                            <td><%= totalPrice %></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            <%
                }
            %>
        </div>
    </div>
</div>

	
	<div class="col-md-6">
		<div class="card mt-5">
			<div class="card-body">
				<h3 class="text-center text-success">Your Details for Order</h3>
				<form class="row g-3" action="OrderServlet" method="post">
					<input type="hidden" value="<%=user.getId() %>" name="id">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Name</label> <input
									type="text" class="form-control" name="name" value="<%=user.getName() %>" readonly="readonly"  >
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Email</label>
								<input type="email" class="form-control" name="email" value="<%=user.getEmail()%>">
							</div>
							
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Ph Number</label> <input
									type="number" class="form-control" name="phno" required value="<%= user.getPhno()%>">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Address</label>
								<input type="text" class="form-control" name="address">
							</div>
							
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">land mark</label> <input
									type="text" class="form-control" name="landmark">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">City</label>
								<input type="text" class="form-control" name="city">
							</div>
							
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">State</label>
								<input type="text" class="form-control" name="state">
							</div>
							
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Pin Code</label>
								<input type="number" class="form-control" name="pin">
							</div>
							
							<div class="form-group">
							<label>Payment Mode</label>
							<select class="form-control" name="paymentType">
								<option value="noselect">--Select--</option>
								<option value="COD"> Cash On Delivery</option>
							</select>
							</div>
							
							<div class="text-center">
								<button  class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">continue Shopping</a>
							</div>
						</form>	
			</div>
		</div>
	</div>
</div>
</div>

</body>
</html>