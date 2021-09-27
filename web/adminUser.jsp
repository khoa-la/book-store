<%-- 
    Document   : adminUser
    Created on : Jul 4, 2021, 1:34:13 PM
    Author     : lakho
--%>

<%@page import="java.util.List"%>
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
            List<UserDTO> list = (List<UserDTO>) session.getAttribute("LIST_USER");
            if (list != null) {
                if (!list.isEmpty()) {
        %>
        <div class="col-lg-8">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>User ID</th>
                        <th>Name</th>
                        <th>Password</th>
                        <th>Phone</th>
                        <th>Email</th>                    
                        <th>Create Date</th>
                        <th>Role ID</th>
                        <th>Status ID</th>
                        <th>Update</th>
                        <th>Hide</th>
                    </tr>
                </thead>
                <tbody class="align-middle">
                    <%
                        int count = 1;
                        for (UserDTO user : list) {
                    %>
                <form action="MainController" method="POST">            
                    <tr>
                        <td><%= count++%></td>
                        <td><%= user.getUserID()%></td>
                        <td>
                            <input type="text" name="name" value="<%= user.getName()%>"/>
                        </td>
                        <td>
                            <input type="text" name="password" value="<%= user.getPassword()%>"/>
                        </td>
                        <td>
                            <input type="text" name="phone" value="<%= user.getPhone()%>"/>
                        </td>
                        <td>
                            <input type="text" name="email" value="<%= user.getEmail()%>"/>
                        </td>                    
                        <td><%= user.getCreateDate()%></td>
                        <td><%= user.getRoleID()%></td>
                        <td>
                            <input type="number" name="statusID" value="<%= user.getStatus()%>" min="0" max="1"/>
                        </td>
                        <td>
                            <input type="submit" name="action" value="Update User"/>
                            <input type="hidden" name="roleID" value="<%= user.getRoleID()%>"/>
                            <input type="hidden" name="userID" value="<%= user.getUserID()%>"/>
                            <input type="hidden" name="createDate" value="<%= user.getCreateDate()%>"/>
                        </td>
                        <td>
                            <input type="submit" name="action" value="Hide User"/>
                        </td>
                    </tr>
                </form>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
        <%
                }
            }
        %>
    </body>
</html>
