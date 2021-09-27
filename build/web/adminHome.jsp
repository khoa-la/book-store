<%-- 
    Document   : adminHome
    Created on : Jun 27, 2021, 11:01:24 PM
    Author     : lakho
--%>

<%@page import="store.models.DAO"%>
<%@page import="java.util.List"%>
<%@page import="store.models.CategoryDTO"%>
<%@page import="store.models.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Store</title>
        <meta charset="UTF-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="eCommerce HTML Template Free Download" name="keywords">
        <meta content="eCommerce HTML Template Free Download" name="description">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/slick/slick.css" rel="stylesheet">
        <link href="lib/slick/slick-theme.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("LogoutController");
                return;
            }
        %>       
        <%
            DAO dao = new DAO();
        %>
        <div class="nav">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="adminHome.jsp" class="nav-item nav-link active">Home</a>
                            <a href="MainController?action=listCate" class="nav-item nav-link active">Category</a>                        
                            <a href="MainController?action=listBook" class="nav-item nav-link active">Books</a>                        
                            <a href="MainController?action=listUser" class="nav-item nav-link active">Users</a>                        
                        </div>
                        <div class="navbar-nav ml-auto">
                            <div class="nav-item dropdown">
                                <%
                                    if (loginUser != null) {
                                %>
                                <div class="navbar-nav mr-auto">
                                    <a class="nav-item nav-link active">Welcome: <%= loginUser.getName()%></a>
                                    <a href="MainController?action=Logout" class="nav-item nav-link active">Logout</a>
                                </div>                               
                                <%
                                    }
                                    if (loginUser == null) {
                                %>
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">User Account</a>
                                <div class="dropdown-menu">
                                    <a href="login.jsp" class="dropdown-item">Login</a>
                                    <a href="login.jsp" class="dropdown-item">Register</a>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-2">
                    <a href="adminHome.jsp"><img alt="" src="images/home.png">
                        <p style="text-align: center; font-size: 20px;">HOME</p></a>
                </div>
                <div class="col-md-2">
                    <a href="AdminCategoryController"><img alt="" src="images/categorys.png">
                        <p style="text-align: center; font-size: 20px;">CATEGORY</p></a>
                </div>
                <div class="col-md-2">
                    <a href="AdminBookController"><img alt="" src="images/book.png">
                        <p style="text-align: center; font-size: 20px;">BOOKS</p></a>
                </div>
                <div class="col-md-2">
                    <a href="AdminUserController"><img alt="" src="images/users.png">
                        <p style="text-align: center; font-size: 20px;">Users</p></a>
                </div>
            </div>
        </div>
    </body>
</html>
