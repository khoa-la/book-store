<%-- 
    Document   : cart
    Created on : Jun 26, 2021, 5:51:51 PM
    Author     : lakho
--%>

<%@page import="java.util.List"%>
<%@page import="store.models.CategoryDTO"%>
<%@page import="store.models.DAO"%>
<%@page import="store.models.UserError"%>
<%@page import="store.models.UserDTO"%>
<%@page import="store.shopping.Book"%>
<%@page import="store.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body>
        <%
            DAO dao = new DAO();
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
                                <%
                                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
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
                    <%                        String search = request.getParameter("search");
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

        <%
            String message = (String) request.getAttribute("SHOPPING_MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <h5><%= message%></h5>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null || cart.getCart().isEmpty()) {
                String messageCart = "No books in cart";
                request.setAttribute("SHOPPING_MESSAGE", messageCart);
                request.getRequestDispatcher("home.jsp").forward(request, response);
                return;
            } else {
        %>
        
        <div class="cart-page">                
            <div class="col-lg-4">
                <div class="cart-summary">
                    <div class="cart-btn">
                        <form action="home.jsp">
                            <button>Shopping more</button>
                        </form>                                         
                    </div>
                </div>
            </div>
        </div>
         <!--Cart Start--> 
        <div class="cart-page">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="cart-page-inner">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>No</th>
                                            <th>Product</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th>Update</th>
                                            <th>Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle"> 
                                        <%
                                            int count = 1;
                                            double total = 0;
                                            for (Book book : cart.getCart().values()) {
                                                total += book.getQuanityID() * book.getPrice();
                                        %>
                                    <form action="MainController" method="POST">      
                                        <tr>                                         
                                            <td><%= count++%></td>
                                            <td>
                                                <div class="img">
                                                    <img src="images/<%= book.getImage()%>"alt="Image"/>
                                                    <p><%= book.getName()%></p>
                                                </div>
                                            </td>
                                            <td>$<%= book.getPrice()%></td>
                                            <td>
                                                <div class="qty">
                                                    <input type="number" name="quantity" value="<%= book.getQuanityID()%>" required="" min="1"/>
                                                </div>
                                            </td>
                                            <td>$<%= book.getQuanityID() * book.getPrice()%></td>
                                            <td>                
                                                <button class="fa fa-sync-alt" type="submit" name="action" value="Modify"></button>
                                                <input type="hidden" name="productID" value="<%= book.getProductID()%>"/>
                                                <input type="hidden" name="image" value="<%= book.getImage()%>"/>
                                                <input type="hidden" name="name" value="<%= book.getName()%>"/>
                                            </td>
                                            <td>
                                                <button class="fa fa-trash" type="submit" name="action" value="Remove"></button>
                                            </td>
                                        </tr>
                                    </form>  
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart-page-inner">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="cart-summary">
                                        <div class="cart-content">
                                            <h1>Cart Summary</h1>
                                            <h2>Total<span>$<%= total%></span></h2>
                                        </div><br/>
                                        <div class="cart-btn">
                                            <%
                                                UserError userError = (UserError) request.getAttribute("USER_ERROR");
                                                if (userError == null) {
                                                    userError = new UserError();
                                                }
                                            %>
                                            <form action="MainController" method="POST">
                                                <input type="text" name="address" placeholder="Address"/><br/>
                                                <%= userError.getMessageError()%><br/><br/>
                                                <input type="text" name="phone" placeholder="Phone" value="<%= loginUser.getPhone()%>"/><br/>
                                                <%= userError.getPhoneError()%><br/>             
                                                <button type="submit" name="action" value="Checkout">Checkout</button>
                                                <input type="hidden" name="userID" value="<%= loginUser.getUserID()%>"/>
                                                <input type="hidden" name="email" value="<%= loginUser.getEmail()%>"/>
                                                <input type="hidden" name="totalMoney" value="<%= total%>"/>
                                            </form>                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>       
        <jsp:include page="footer.jsp"></jsp:include><br/><br/>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
