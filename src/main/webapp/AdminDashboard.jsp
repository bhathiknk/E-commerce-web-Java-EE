<%--
  Created by IntelliJ IDEA.
  User: Bhathika Nilesh
  Date: 24/12/2023
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>



<%@page import="com.greenstore.connection.DbCon"%>
<%@page import="com.greenstore.dao.ProductDao"%>
<%@page import="com.greenstore.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%
    ProductDao pd = new ProductDao(DbCon.getConnection());
    List<Product> products = pd.getAllProducts();

%>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
    <title>Admin DashBoard</title>

    <style>
        .save-button:hover{
            color: #ffffff;
            transition: 0.8s;
            background-color: #0da68a;
        }

        .remove-button:hover{
            color: #ffffff;
            transition: 0.8s;
            background-color: #e50c1d;
        }

        .edit-button:hover{
            color: #ffffff;
            transition: 0.8s;
            background-color: #6a21ea;
        }

    </style>
</head>
<body>
<!-- Loader Start -->
<div class="fullpage-loader">
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
</div>
<!-- Loader End -->

<!-- Header Start -->
<header class="pb-md-4 pb-0">
    <div class="header-top">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-xxl-3 d-xxl-block d-none">
                    <div class="top-left-header">
                        <i class="iconly-Location icli text-white"></i>
                        <span class="text-white">Hilton Road, Colombo</span>
                    </div>
                </div>

                <div class="col-xxl-6 col-lg-9 d-lg-block d-none">
                    <div class="header-offer">
                        <div class="notification-slider">
                            <div>
                                <div class="timer-notification">
                                    <h6>
                                        <strong class="me-1">Green Store</strong>Admin /.
                                        <strong class="ms-1">Admin Dashboard.
                                        </strong>
                                    </h6>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>
<!-- Header End -->


<!-- mobile fix menu start -->
<div class="mobile-menu d-md-none d-block mobile-cart">
    <ul>
        <li class="active">
            <a href="assets/images/index.jsp">
                <i class="iconly-Home icli"></i>
                <span>Home</span>
            </a>
        </li>

        <li class="mobile-category">
            <a href="javascript:void(0)">
                <i class="iconly-Category icli js-link"></i>
                <span>Category</span>
            </a>
        </li>

        <li>
            <a href="#" class="search-box">
                <i class="iconly-Search icli"></i>
                <span>Search</span>
            </a>
        </li>

        <li>
            <a href="wishlist.jsp" class="notifi-wishlist">
                <i class="iconly-Heart icli"></i>
                <span>My Wish</span>
            </a>
        </li>

        <li>
            <a href="cart.jsp">
                <i class="iconly-Bag-2 icli fly-cate"></i>
                <span>Cart</span>
            </a>
        </li>
    </ul>
</div>
<!-- mobile fix menu end -->

<!-- Breadcrumb Section Start -->
<section class="breadscrumb-section pt-0">
    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-12">
                <div class="breadscrumb-contain">
                    <h2>Green Store : Admin DashBoard</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="#">
                                    <i class="fa-sharp fa-solid fa-envelope"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page"> <a href="feedback.jsp">Feedbacks</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->



<!-- Poster Section Start -->
<section>
    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-12">
                <div class="slider-1 slider-animate product-wrapper no-arrow">
                    <div>
                        <div class="banner-contain-2 hover-effect">
                            <img src="assets/images/shop/admin.png" class="bg-img rounded-3 blur-up lazyload" alt="">
                            <div
                                    class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                <div>
                                    <h2>Admin</h2>
                                    <h3>Dashboard</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="banner-contain-2 hover-effect">
                            <img src="assets/images/shop/admin2.png" class="bg-img rounded-3 blur-up lazyload" alt="">
                            <div
                                    class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                <div>
                                    <h2>Admin</h2>
                                    <h3>Dashboard</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="banner-contain-2 hover-effect">
                            <img src="assets/images/shop/admin3.png" class="bg-img rounded-3 blur-up lazyload" alt="">
                            <div
                                    class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                <div>
                                    <h2>Admin</h2>
                                    <h3>Dashboard</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Poster Section End -->

<!-- Shop Section Start -->
<section class="section-b-space shop-section">
    <div class="container-fluid-lg">
        <div class="row">
            <div class="col-custome-3">
                <div class="left-box wow fadeInUp">
                    <div class="shop-left-sidebar">
                        <div class="back-button">
                            <h3><i class="fa-solid fa-arrow-left"></i> Back</h3>
                        </div>
                    </div>
                </div>
            </div>
            <!--
                        <div class="col-custome-9">
                            <div class="show-button">
                                <div class="filter-button-group mt-0">
                                    <div class="filter-button d-inline-block d-lg-none"></div>



                        <form action="/ProductServlet" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="productName" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="productName" name="productName" required>
                            </div>

                            <div class="mb-3">
                                <label for="productCategory" class="form-label">Product Category</label>
                                <input type="text" class="form-control" id="productCategory" name="productCategory" required>
                            </div>

                            <div class="mb-3">
                                <label for="productPrice" class="form-label">Product Price</label>
                                <input type="number" class="form-control" id="productPrice" name="productPrice" required>
                            </div>

                            <div class="mb-3">
                                <label for="productImage" class="form-label">Product Image</label>
                                <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Save Product</button>
                        </form>
                    </div>
                    -->


            <div class="top-filter-menu text-center">
                <div class="category-dropdown">
                    <h5 class="text-content font-weight-bold">Admin Dashboard</h5>
                    <div class="add-to-cart-box bg-white">
                        <a href="AddProduct.jsp" class="text-decoration-none">
                            <button class="btn btn-add-cart edit-button btn-success">Add Product</button>
                        </a>
                    </div>
                </div>
            </div>





            <div class="row row-cols-xxl-6 row-cols-lg-5 row-cols-md-4 row-cols-sm-3 row-cols-2 g-sm-4 g-3 section-b-space">
                        <%
                            if (!products.isEmpty()) {
                                for (Product p : products) {
                        %>
                        <div>
                            <div class="product-box product-white-bg wow fadeIn">
                                <div class="product-image">
                                    <a href=#>
                                        <img src="ProductImages/<%=p.getImage() %>"
                                             class="img-fluid blur-up lazyload" alt="">
                                    </a>

                                </div>
                                <div class="product-detail position-relative">
                                    <a href="#">
                                        <h6 class="name">
                                            <%=p.getCategory() %>
                                        </h6>
                                    </a>

                                    <h6 class="sold weight text-content fw-normal"> <%=p.getName() %></h6>

                                    <h6 class="price theme-color"> Rs. <%=p.getPrice() %></h6>

                                    <div class="add-to-cart-box bg-white">
                                        <form action="/DeleteProductServlet" method="post">
                                            <input type="hidden" name="productId" value="<%=p.getId() %>">
                                            <button type="submit" class="btn btn-add-cart remove-button">Remove</button>
                                        </form>
                                    </div>

                                    <div class="add-to-cart-box bg-white">
                                        <a href="UpdateProduct.jsp?productId=<%=p.getId() %>" class="text-decoration-none">
                                            <button class="btn btn-add-cart edit-button btn-success">Edit</button>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                            else
                            {
                                out.println("There is no products");
                            }
                        %>
                    </div>



                <nav class="custome-pagination">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="javascript:void(0)" tabindex="-1" aria-disabled="true">
                                <i class="fa-solid fa-angles-left"></i>
                            </a>
                        </li>
                        <li class="page-item active">
                            <a class="page-link" href="AdminDashboard.jsp">Admin Dashboard</a>
                        </li>
                        <li class="page-item" aria-current="page">
                            <a class="page-link" href="feedback.jsp">Feedback</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript:void(0)">
                                <i class="fa-solid fa-angles-right"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- Shop Section End -->

<!-- Tap to top start -->
<div class="theme-option">
    <div class="back-to-top">
        <a id="back-to-top" href="#">
            <i class="fas fa-chevron-up"></i>
        </a>
    </div>
</div>
<!-- Tap to top end -->

<%@include file="/includes/footer.jsp"%>
</body>
</html>
