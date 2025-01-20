<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>order success</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f2f4f7">
<%@ include file="all_components/navbar.jsp"%>
	<div class="container text-center mt-3">
		<i class="fa fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Successfully placed</h2>
		<h5>With in 7 days your order will be delivered at your door step</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a>
		<a href="orders.jsp" class="btn btn-warning mt-3">View Order</a>
	</div>
</body >
</html>