<%-- 
    Document   : adminBook
    Created on : Jun 29, 2021, 1:56:58 PM
    Author     : lakho
--%>

<%@page import="store.models.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="store.models.BookDTO"%>
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
        <div style="margin-left: 20px; font-size:30px; ">
            <a href="MainController?action=addProduct">Add New Product</a>
        </div>
        <%
            List<BookDTO> list = (List<BookDTO>) session.getAttribute("ADMIN_LIST_BOOK");
            if (list != null) {
                if (!list.isEmpty()) {
        %>
        <div class="col-lg-8">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Category ID</th>
                        <th>Book ID</th>
                        <th>Image</th>
                        <th>Book Name</th>
                        <th>Author</th>                    
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Status ID</th>
                        <th>Create Date</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody class="align-middle">
                    <%
                        int count = 1;
                        for (BookDTO book : list) {
                    %>
                <form action="MainController" method="POST">            
                    <tr>
                        <td><%= count++%></td>
                        <td>
                            <input type="text" name="categoryID" value="<%= book.getCategoryID()%>"/>
                        </td>
                        <td><%= book.getProductID()%></td>
                        <td>
                            <img src="images/<%= book.getImage()%>" width="100" height="120"/>
                        </td>
                        <td>
                            <input type="text" name="productName" value="<%= book.getProductName()%>"/>
                        </td>
                        <td>
                            <input type="text" name="author" value="<%= book.getAuthor()%>"/>
                        </td>                    
                        <td>
                            <input type="text" name="price" value="<%= book.getPrice()%>"/>
                        </td>
                        <td>
                            <input type="number" name="quantity" value="<%= book.getQuantity()%>" min="0"/>
                        </td>
                        <td>
                            <input type="number" name="statusID" value="<%= book.getStatusID()%>" min="0" max="1"/>
                        </td>
                        <td><%= book.getCreateDate()%></td>
                        <td>
                            <input type="submit" name="action" value="Update"/>
                            <input type="hidden" name="productID" value="<%= book.getProductID()%>"/>
                            <input type="hidden" name="image" value="<%= book.getImage()%>"/>
                            <input type="hidden" name="createDate" value="<%= book.getCreateDate()%>"/>
                        </td>
                        <td>
                            <input type="submit" name="action" value="Hide"/>
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
