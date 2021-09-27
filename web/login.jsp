<%-- 
    Document   : login
    Created on : Jun 26, 2021, 4:21:50 PM
    Author     : lakho
--%>

<%@page import="store.models.UserError"%>
<%@page import="store.models.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="store.models.DAO"%>
<%@page import="store.models.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kieran's Store</title>
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
        <script type="text/javascript">
            var onloadCallback = function () {
                grecaptcha.render('html_element', {
                    'sitekey': '6LeHnHgbAAAAAAG1KAb0CbcoCk9iOxPSTOhMO6co'
                });
            };
        </script>     
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            DAO dao = new DAO();
            if (loginUser != null) {
        %>
        <div>
            <a href="MainController?action=Logout" class="nav-item nav-link active">Logout</a><br/>
        </div>
        <h2>Welcome: <%= loginUser.getName()%></h2>
        <%
            }
            if (loginUser == null) {
        %>
        <div class="nav">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="home.jsp" class="nav-item nav-link active">Home</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">More Category</a>
                                <div class="dropdown-menu">
                                    <%
                                        List<CategoryDTO> listCategory = dao.getListCategory();
                                        for (CategoryDTO c : listCategory) {
                                    %>
                                    <a href="SearchByCategoryController?searchByCate=<%=c.getCategoryID()%>" class="dropdown-item"><%=c.getName()%></a>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>                            
                        </div>
                        <div class="navbar-nav ml-auto">
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">User Account</a>
                                <div class="dropdown-menu">
                                    <a href="login.jsp" class="dropdown-item">Login</a>
                                    <a href="login.jsp" class="dropdown-item">Register</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <%
            }
        %>
        <div class="bottom-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <div class="logo">
                            <a href="home.jsp">
                                <img src="images/logo-store.png" alt="Logo">
                            </a>
                        </div>
                    </div>
                    <%
                        String search = request.getParameter("search");
                        if (search == null) {
                            search = "";
                        }
                    %>
                    <div class="col-md-6">
                        <div class="search">
                            <form action="MainController">
                                <input type="text" name="search" value="<%= search%>" placeholder="Search">
                                <button type="submit" name="action" value="Search"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="user">
                            <a href="cart.jsp" class="btn cart">
                                <i class="fa fa-shopping-cart"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="login">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <form action="MainController" method="POST">

                            <div class="login-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>User ID</label>
                                        <input class="form-control" type="text" name="userID" placeholder="User ID">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Password</label>
                                        <input class="form-control" type="password" name="password" placeholder="Password">
                                    </div>                                   
                                    <div id="html_element" class="col-md-6"></div>
                                    <div class="col-md-12">
                                        <input class="btn" type="submit" name="action" value="Login"/>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <%
                        UserError userError = (UserError) request.getAttribute("USER_ERROR");
                        if (userError == null) {
                            userError = new UserError();
                        }
                    %>
                    <div class="col-lg-6">
                        <form action="MainController" method="POST">
                            <div class="register-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>User ID</label>
                                        <input class="form-control" type="text" name="userID" placeholder="User ID">
                                        <%= userError.getUserIDError()%>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Full Name</label>
                                        <input class="form-control" type="text" name="name" placeholder="Full Name">   
                                        <%= userError.getNameError()%>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Password</label>
                                        <input class="form-control" type="password" name="password" placeholder="Password">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Confirm Password</label>
                                        <input class="form-control" type="password" name="confirm" placeholder="Re-Password">
                                        <%= userError.getConfirmError()%>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Phone</label>
                                        <input class="form-control" type="text" name="phone" placeholder="Phone">
                                        <%= userError.getPhoneError()%>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Email</label>
                                        <input class="form-control" type="text" name="email" placeholder="Email">
                                        <%= userError.getEmailError()%>
                                    </div>
                                    <div class="col-md-12">
                                        <input class="btn" type="submit" name="action" value="Register">
                                        <%= userError.getMessageError()%>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include><br/><br/>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
                async defer>
        </script>
    </body>
</html>