<%-- 
    Document   : home
    Created on : Jun 26, 2021, 4:00:17 PM
    Author     : lakho
--%>

<%@page import="store.models.CategoryDTO"%>
<%@page import="store.models.UserDTO"%>
<%@page import="store.models.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="store.models.DAO"%>
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
                                    <%                                        List<CategoryDTO> listCategory = dao.getListCategory();
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
        <%
            String message = (String) request.getAttribute("SHOPPING_MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <h4><%= message%></h4>         
        <div class="featured-product product">
            <div class="container-fluid">
                <div class="section-header">
                    <h1>Books</h1>
                </div>               
                <div class="row align-items-center product-slider product-slider-4">
                    <%
                        List<BookDTO> listRandom= dao.getRandomTop10BooksActive();
                        List<BookDTO> listSearch = (List<BookDTO>) request.getAttribute("LIST_BOOK");
                        List<BookDTO> listByCate = (List<BookDTO>) request.getAttribute("LIST_BOOK_BY_CATE");
                        if (listSearch != null) {
                            if (!listSearch.isEmpty()) {
                                for (BookDTO bookSearch : listSearch) {
                    %>
                    <div class="col-lg-12">
                        <div class="product-item">
                            <div class="product-title">
                                <a href="#"><%= bookSearch.getProductName()%></a>
                            </div>
                            <div class="product-image">
                                <a href="#">
                                    <img src="images/<%= bookSearch.getImage()%>" width="300" height="400" alt="Product Image">
                                </a>
                            </div>
                            <div class="product-title">
                                <a href="#"><%= bookSearch.getAuthor()%></a><br/>
                                <h4>Quantity: <%= bookSearch.getQuantity()%></h4>
                            </div>
                            <div class="product-price">                               
                                <form action="MainController" method="POST">
                                    <h3><span>$</span><%= bookSearch.getPrice()%></h3><br/>
                                    <input type="number" name="quantity" min="1" value="1"/>   
                                    <input class="btn" type="submit" name="action" value="Add to Cart"/>
                                    <input type="hidden" name="productID" value="<%= bookSearch.getProductID()%>"/>
                                    <input type="hidden" name="name" value="<%= bookSearch.getProductName()%>"/>
                                    <input type="hidden" name="author" value="<%= bookSearch.getAuthor()%>"/>
                                    <input type="hidden" name="price" value="<%= bookSearch.getPrice()%>"/>
                                    <input type="hidden" name="available" value="<%= bookSearch.getQuantity()%>"/>
                                    <input type="hidden" name="image" value="<%= bookSearch.getImage()%>"/>
                                    <input type="hidden" name="categoryID" value="<%= bookSearch.getCategoryID()%>"/>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    } else if (listByCate != null) {
                        if (!listByCate.isEmpty()) {
                            for (BookDTO bookByCate : listByCate) {
                    %>
                    <div class="col-lg-12">
                        <div class="product-item">
                            <div class="product-title">
                                <a href="#"><%= bookByCate.getProductName()%></a>
                            </div>
                            <div class="product-image">
                                <a href="#">
                                    <img src="images/<%= bookByCate.getImage()%>" width="300" height="400" alt="Product Image">
                                </a>
                            </div>
                            <div class="product-title">
                                <a href="#"><%= bookByCate.getAuthor()%></a><br/>
                                <h4>Quantity: <%= bookByCate.getQuantity()%></h4>
                            </div>
                            <div class="product-price">                               
                                <form action="MainController" method="POST">
                                    <h3><span>$</span><%= bookByCate.getPrice()%></h3><br/>
                                    <input type="number" name="quantity" min="1" value="1"/>   
                                    <input class="btn" type="submit" name="action" value="Add to Cart"/>
                                    <input type="hidden" name="productID" value="<%= bookByCate.getProductID()%>"/>
                                    <input type="hidden" name="name" value="<%= bookByCate.getProductName()%>"/>
                                    <input type="hidden" name="author" value="<%= bookByCate.getAuthor()%>"/>
                                    <input type="hidden" name="price" value="<%= bookByCate.getPrice()%>"/>
                                    <input type="hidden" name="available" value="<%= bookByCate.getQuantity()%>"/>
                                    <input type="hidden" name="image" value="<%= bookByCate.getImage()%>"/>
                                    <input type="hidden" name="categoryID" value="<%= bookByCate.getCategoryID()%>"/>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    } else if (listRandom != null) {
                        if (!listRandom.isEmpty()) {
                            for (BookDTO bookRandon : listRandom) {
                    %>
                    <div class="col-lg-12">
                        <div class="product-item">
                            <div class="product-title">
                                <a href="#"><%= bookRandon.getProductName()%></a>
                            </div>
                            <div class="product-image">
                                <a href="#">
                                    <img src="images/<%= bookRandon.getImage()%>" width="300" height="400" alt="Product Image">
                                </a>
                            </div>
                            <div class="product-title">
                                <a href="#"><%= bookRandon.getAuthor()%></a><br/>
                                <h4>Quantity: <%= bookRandon.getQuantity()%></h4>
                            </div>
                            <div class="product-price">                               
                                <form action="MainController" method="POST">
                                    <h3><span>$</span><%= bookRandon.getPrice()%></h3><br/>                                   
                                    <input type="number" name="quantity" min="1" value="1"/>   
                                    <input class="btn" type="submit" name="action" value="Add to Cart"/>
                                    <input type="hidden" name="productID" value="<%= bookRandon.getProductID()%>"/>
                                    <input type="hidden" name="name" value="<%= bookRandon.getProductName()%>"/>
                                    <input type="hidden" name="author" value="<%= bookRandon.getAuthor()%>"/>
                                    <input type="hidden" name="price" value="<%= bookRandon.getPrice()%>"/>
                                    <input type="hidden" name="available" value="<%= bookRandon.getQuantity()%>"/>
                                    <input type="hidden" name="image" value="<%= bookRandon.getImage()%>"/>
                                    <input type="hidden" name="categoryID" value="<%= bookRandon.getCategoryID()%>"/>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%
                                }
                            }
                        }
                    %>
                </div>               
            </div>
        </div>
        <!--List All Book-->        
        <div class="featured-product product">
            <div class="container-fluid">
                <div class="section-header">
                    <h1>All Books</h1>
                </div>               
                <div class="row align-items-center product-slider product-slider-4">
                    <%
                        List<BookDTO> list = dao.getListAllBooksActive();
                        if (list != null) {
                            if (!list.isEmpty()) {
                                for (BookDTO book : list) {
                    %>
                    <div class="col-lg-12">
                        <div class="product-item">
                            <div class="product-title">
                                <a href="#"><%= book.getProductName()%></a>
                            </div>
                            <div class="product-image">
                                <a href="#">
                                    <img src="images/<%= book.getImage()%>" width="300" height="400" alt="Product Image">
                                </a>
                            </div>
                            <div class="product-title">
                                <a href="#"><%= book.getAuthor()%></a><br/>
                                <h4>Quantity: <%= book.getQuantity()%></h4>
                            </div>
                            <div class="product-price">                               
                                <form action="MainController">
                                    <h3><span>$</span><%= book.getPrice()%></h3><br/>
                                    <input type="number" name="quantity" min="1" value="1"/>   
                                    <input class="btn" type="submit" name="action" value="Add to Cart"/>
                                    <input type="hidden" name="productID" value="<%= book.getProductID()%>"/>
                                    <input type="hidden" name="name" value="<%= book.getProductName()%>"/>
                                    <input type="hidden" name="author" value="<%= book.getAuthor()%>"/>
                                    <input type="hidden" name="price" value="<%= book.getPrice()%>"/>
                                    <input type="hidden" name="available" value="<%= book.getQuantity()%>"/>
                                    <input type="hidden" name="image" value="<%= book.getImage()%>"/>
                                    <input type="hidden" name="categoryID" value="<%= book.getCategoryID()%>"/>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    } 
                    %>                   
                </div>               
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include><br/><br/>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
