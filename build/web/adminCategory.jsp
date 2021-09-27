<%-- 
    Document   : adminCategory
    Created on : Jun 29, 2021, 11:08:47 AM
    Author     : lakho
--%>

<%@page import="store.models.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="store.models.CategoryDTO"%>
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
        </div><br/>
        <%
            List<CategoryDTO> list = (List<CategoryDTO>) session.getAttribute("LIST_CATEGORY");
            if (list != null) {
        %>
        <div class="col-lg-8">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Category ID</th>
                        <th>Category Name</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody class="align-middle">
                    <%
                        for (CategoryDTO cate : list) {
                    %>
                <form action="MainController" method="POST">
                    <tr>
                        <td><%= cate.getCategoryID()%></td>
                        <td>
                            <input type="text" name="categoryName" value="<%= cate.getName()%>"/>
                        </td>
                        <td>
                            <button class="fa fa-sync-alt" type="submit" name="action" value="Edit"></button>
                            <input type="hidden" name="categoryID" value="<%= cate.getCategoryID()%>"/>
                        </td>
                        <td>
                            <button class="fa fa-trash" type="submit" name="action" value="Delete"></button>
                            <input type="hidden" name="categoryID" value="<%= cate.getCategoryID()%>"/>
                        </td>
                    </tr>
                </form>
                <%
                    }
                %>           
                </tbody>
            </table>
        </div>
        <div style="margin-left: 20px">
            <a href="MainController?action=addCate">Add Category</a>
        </div>
        <%
            }
        %>
    </body>
</html>
