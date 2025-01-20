<%@ page import="com.ebook.entity.*" %>

<%
    // Get the User object from the session
    User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EBooks</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Include Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <!-- Top Blue Bar -->
    <div class="container-fluid" style="height: 10px; background-color: blue"></div>

    <!-- Header Section -->
    <div class="container-fluid p-4"> 
        <div class="row">
            <div class="col-md-3 text-success">
                <h3><i class="fa-solid fa-book"></i> EBooks</h3>
            </div>
            <div class="col-md-6">
                
            </div>
            <div class="col-md-3 d-flex justify-content-end align-items-center gap-3">
                <%
                    if (user != null) {
                %>
                    <a href="home.jsp" class="btn btn-success">
                        <i class="fa-solid fa-user"></i> <%= user.getName() %>
                    </a>
                    <a href="#" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#logoutModal">
                        <i class="fa-solid fa-right-to-bracket"></i> Logout
                    </a>
                <%
                    } else {
                %>
                    <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                    <a href="register.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Register</a>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="home.jsp"><i class="fa-solid fa-house"></i> Home</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Logout Modal -->
    <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="logoutModalLabel">Confirm Logout</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to logout?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <a href="../Logout" class="btn btn-danger">Logout</a>
                </div>
            </div>
        </div>
    </div>

   
</body>
</html>
