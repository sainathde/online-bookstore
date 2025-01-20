<%@page import="com.ebook.entity.User"%>
<%
    User u = (User) session.getAttribute("user"); // Fetching the user object from the session
%>

<div class="container-fluied" style="height:10px; background-color: blue"></div>

<div class="container-fluid p-4"> 
  <div class="row">
    <div class="col-md-3 text-success">
      <h3><i class="fa-solid fa-book"></i> EBooks</h3>
    </div>
    <div class="col-md-6">
      <form class="d-flex" action="search.jsp" method="post">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="ch">
        <button class="btn btn-primary" type="submit">Search</button>
      </form>
    </div>
    <div class="col-md-3 d-flex justify-content-end align-items-center gap-3">
      <% if (u != null) { %>
        <!-- Cart Icon -->
        <a href="checkout.jsp" class="btn btn-warning d-flex align-items-center gap-2" style="font-size: 1rem; font-weight: bold;">
          <i class="fa-solid fa-cart-shopping"></i> Cart
        </a>
        <!-- User's Name Button -->
        <a href="home.jsp" class="btn btn-success d-flex align-items-center gap-2" style="font-size: 1rem; font-weight: bold;">
          <i class="fa-solid fa-user"></i> <%= u.getName() %>
        </a>
        <!-- Logout Button -->
        <a href="LogOutServlet" class="btn btn-danger d-flex align-items-center gap-2" style="font-size: 1rem; font-weight: bold;">
          <i class="fa-solid fa-right-to-bracket"></i> Logout
        </a>
      <% } else { %>
        <!-- User is not logged in: Display login and register buttons -->
        <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
        <a href="register.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Register</a>
      <% } %>
    </div>
  </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i>Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="all_recent_books.jsp"><i class="fa-solid fa-book-open"></i> Recent Book</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="all_new_books.jsp"><i class="fa-solid fa-book-open"></i> New Book</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="all_old_books.jsp"><i class="fa-solid fa-book-open"></i> Old Book</a>
        </li>
      </ul>
      <form class="d-flex">
        <a href="setting.jsp" class="btn btn-outline-light ms-1" type="submit"><i class="fa-solid fa-gear"></i> Settings</a>
        <button class="btn btn-outline-light ms-1" type="submit"><i class="fa-solid fa-phone"></i> Contact us</button>
      </form>
    </div>
  </div>
</nav>
