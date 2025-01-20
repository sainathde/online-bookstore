<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook - Admin</title>
<%@ include file="allCss.jsp"%>

<style type="text/css">
    a {
        text-decoration: none;
        color: black;
    }
    a:hover {
        text-decoration: none;
        color: black;
    }
    .card {
        border: none;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.2s ease-in-out;
    }
    .card:hover {
        transform: scale(1.05);
    }
    .separator {
        margin: 5px auto;
        width: 50%;
        height: 2px;
        background-color: #ccc;
    }
</style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="container mt-5">
        <div class="row g-4">
            <!-- Add Books -->
            <div class="col-md-3">
                <a href="add_books.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-plus fa-3x text-primary"></i>
                            <h4 class="mt-3">Add Books</h4>
                            <div class="separator"></div>
                        </div>
                    </div>
                </a>
            </div>
            
            <!-- All Books -->
            <div class="col-md-3">
                <a href="all_books.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-book-open fa-3x text-danger"></i>
                            <h4 class="mt-3">All Books</h4>
                            <div class="separator"></div>
                        </div>
                    </div>
                </a>
            </div>
            
            <!-- Orders -->
            <div class="col-md-3">
                <a href="orders.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-box-open fa-3x text-warning"></i>
                            <h4 class="mt-3">Orders</h4>
                            <div class="separator"></div>
                        </div>
                    </div>
                </a>
            </div>
            
            <!-- Logout -->
            <div class="col-md-3">
                <!-- Trigger modal on click -->
                <a href="#" data-bs-toggle="modal" data-bs-target="#logoutModal">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i>
                            <h4 class="mt-3">Logout</h4>
                            <div class="separator"></div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    
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

    <!-- Footer -->
    <div style="margin-top: 400px;">
        <%@ include file="footer.jsp" %>
    </div>

    
</body>
</html>
