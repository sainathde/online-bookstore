<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook-Login</title>
<%@ include file="all_components/allCss.jsp" %>
<style>
    /* Ensure the body takes the full height */
    html, body {
        height: 100%;
        margin: 0;
        background-color: #f8f9fa; 
        display: flex;
        flex-direction: column;
    }

   
    .content {
        flex: 1; 
        display: flex;
        justify-content: center; 
        align-items: center; /
    }

    .form-container {
        width: 25rem;
    }

    /* Footer styling */
    footer {
        background-color: #f1f1f1;
        padding: 10px 0;
        text-align: center;
        width: 100%;
    }
</style>
</head>
<body>
    <%@ include file="all_components/navbar.jsp" %>

    <!-- Main content area -->
    <div class="content">
        <div class="card form-container">
            <div class="card-body">
                <h3 class="card-title text-center mb-4">Login</h3>
                <form action="LoginServlet" method="post">
                    <div class="mb-3">
                        <label for="inputEmail" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="inputEmail" name="email" placeholder="Enter your email" required>
                    </div>
                    <div class="mb-3">
                        <label for="inputPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Enter your password" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Login</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="all_components/footer.jsp" %>
</body>
</html>
