<%@page import="com.greenstore.dao.ProductDao"%>
<%@page import="com.greenstore.model.Product"%>
<%@page import="java.util.List"%>
<%@ page import="com.greenstore.connection.DbCon" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/includes/head.jsp"%>
<head>
    <title>Green Store</title>
    <style>
        .addcart-button:hover{
            color: #ffffff;
            transition: 0.8s;
            background-color: #0da487;
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
                                    <h6><strong class="me-1">Welcome to Green Store!</strong>Wrap new offers/gift
                                        every single day on Weekends.<strong class="ms-1">New Coupon Code: Gst24#24</strong>
                                    </h6>
                                </div>
                            </div>

                            <div>
                                <div class="timer-notification">
                                    <h6><strong class="me-1">Contact us :</strong>+94 112 345678 / +94 74863434
                                        <strong class="ms-1">: greenstore@gmail.com</strong>
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
            <a href="index.jsp">
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
            <a href="search.jsp" class="search-box">
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
                    <h2>Green Store</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="index.jsp">
                                    <i class="fa-solid fa-house"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page"><a href="index.jsp">Home Page</a> </li>
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
                            <img src="assets/images/shop/4a.png" class="bg-img rounded-3 blur-up lazyload" alt="">
                            <div
                                    class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                <div>
                                    <h2>Healthy, nutritious & Biscuits & Snacks</h2>
                                    <h3>Save upto 50%</h3>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="banner-contain-2 hover-effect">
                            <img src="assets/images/shop/5.png" class="bg-img rounded-3 blur-up lazyload" alt="">
                            <div
                                    class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                <div>
                                    <h2>Healthy, nutritious & meat & Sea food</h2>
                                    <h3>Save upto 50%</h3>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="banner-contain-2 hover-effect">
                            <img src="assets/images/shop/6.png" class="bg-img rounded-3 blur-up lazyload" alt="">
                            <div
                                    class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                <div>
                                    <h2>Healthy, nutritious & Milks & Cheese</h2>
                                    <h3>Save upto 35%</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="banner-contain-2 hover-effect">
                            <img src="assets/images/shop/4b.png" class="bg-img rounded-3 blur-up lazyload" alt="">
                            <div
                                    class="banner-detail p-center-right position-relative shop-banner ms-auto banner-small">
                                <div>
                                    <h2>Healthy, nutritious & Biscuits & Snacks</h2>
                                    <h3>Save upto 50%</h3>
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

            <div class="col-custome-9">
                <div class="show-button">
                    <div class="filter-button-group mt-0">
                        <div class="filter-button d-inline-block d-lg-none">
                            <a><i class="fa-solid fa-filter"></i> Filter Menu</a>
                        </div>
                    </div>

                    <div class="top-filter-menu">
                        <div class="category-dropdown">
                            <h5 class="text-content">Category :</h5>
                            <div class="dropdown">
                                <button class="dropdown-toggle" type="button" id="dropdownMenuButton1"
                                        data-bs-toggle="dropdown">
                                    <span><%= request.getParameter("category") %></span>
                                </button>
                            </div>
                        </div>

                        <div class="grid-option d-none d-md-block">
                            <ul>
                                <li class="three-grid">
                                    <a href="javascript:void(0)">
                                        <img src="assets/svg/grid-3.svg" class="blur-up lazyload" alt="">
                                    </a>
                                </li>
                                <li class="grid-btn d-xxl-inline-block d-none active">
                                    <a href="javascript:void(0)">
                                        <img src="assets/svg/grid-4.svg"
                                             class="blur-up lazyload d-lg-inline-block d-none" alt="">
                                        <img src="assets/svg/grid.svg"
                                             class="blur-up lazyload img-fluid d-lg-none d-inline-block" alt="">
                                    </a>
                                </li>
                                <li class="list-btn">
                                    <a href="javascript:void(0)">
                                        <img src="assets/svg/list.svg" class="blur-up lazyload" alt="">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row g-sm-4 g-3 row-cols-xxl-4 row-cols-xl-3 row-cols-lg-2 row-cols-md-3 row-cols-2 product-list-section">
                    <%
                        ProductDao pd = new ProductDao(DbCon.getConnection());
                        List<Product> categoryProducts = pd.getProductsByCategory(request.getParameter("category"));
                        if (!categoryProducts.isEmpty()) {
                            for (Product p : categoryProducts) {
                    %>


                    <div>
                        <div class="product-box-3 h-100 wow fadeInUp">

                            <div class="product-header">

                                <div class="product-image">

                                    <a href="#">
                                        <img src="ProductImages/<%=p.getImage() %>" class="img-fluid blur-up lazyload" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="product-footer">
                                <div class="product-detail">
                                    <span class="span-name"><%=p.getCategory() %></span>
                                    <a href="#">
                                        <h5 class="name"><%=p.getName() %></h5>
                                    </a>
                                    <h5 class="price"><span class="theme-color">Rs. <%=p.getPrice() %></span>
                                    </h5>
                                    <div class="add-to-cart-box bg-white">
                                        <a href="add-to-cart?id=<%=p.getId()%>">
                                            <button class="btn btn-add-cart addcart-button" >Add to Cart</button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%
                            }
                        } else {
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
                            <a class="page-link" href="javascript:void(0)">1</a>
                        </li>
                        <li class="page-item" aria-current="page">
                            <a class="page-link" href="javascript:void(0)">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript:void(0)">3</a>
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


<<<<<<< HEAD
=======

<!-- Deal Box Modal Start -->
<div class="modal fade theme-modal deal-modal" id="deal-box" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-fullscreen-sm-down">
        <div class="modal-content">
            <div class="modal-header">
                <div>
                    <h5 class="modal-title w-100" id="deal_today">Deal Today</h5>
                    <p class="mt-1 text-content">Recommended deals for you.</p>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="fa-solid fa-xmark"></i>
                </button>
            </div>
            <div class="modal-body">
                <div class="deal-offer-box">
                    <ul class="deal-offer-list">
                        <li class="list-1">
                            <div class="deal-offer-contain">
                                <a href="#" class="deal-image">
                                    <img src="assets/images/vegetable/product/10.png" class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="#" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>

                        <li class="list-2">
                            <div class="deal-offer-contain">
                                <a href="#" class="deal-image">
                                    <img src="assets/images/vegetable/product/11.png" class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="#" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>

                        <li class="list-3">
                            <div class="deal-offer-contain">
                                <a href="#" class="deal-image">
                                    <img src="assets/images/vegetable/product/12.png" class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="#" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>

                        <li class="list-1">
                            <div class="deal-offer-contain">
                                <a href="#" class="deal-image">
                                    <img src="assets/images/vegetable/product/13.png" class="blur-up lazyload"
                                         alt="">
                                </a>

                                <a href="#" class="deal-contain">
                                    <h5>Blended Instant Coffee 50 g Buy 1 Get 1 Free</h5>
                                    <h6>$52.57 <del>57.62</del> <span>500 G</span></h6>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Deal Box Modal End -->

>>>>>>> 60904e1823f288077fc1beef0851ccbf7f54e0a8
<!-- Tap to top start -->
<div class="theme-option">
    <div class="setting-box">
        <button class="btn setting-button">
            <i class="fa-solid fa-message" title="Send a feed Back"></i>
        </button>

        <div class="theme-setting-2">
            <div class="theme-box">
                <ul>
                    <li>
                        <div class="setting-name">
                            <h4><i class="fa-solid fa-message"></i></h4>
                        </div>
                        <div class="theme-setting-button color-picker">
                            <form class="form-control">
                                <label  class="form-label mb-0">Give us your valuable feedback !</label>
                            </form>
                        </div>
                    </li>
                    <form>
                        <div class="row g-3 section-b-space">
                            <div class="col-md-12">
                                <label for="userEmail" class="form-label">Your Email:</label>
                                <div class="input-group">
                                    <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="Enter your email" required>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <label for="userFeedback" class="form-label">Your Feedback:</label>
                                <div class="input-group">
                                    <textarea class="form-control" id="userFeedback" name="userFeedback" placeholder="Enter your feedback" rows="3" required></textarea>
                                </div>
                            </div>
                            <div class="col-md-12 mt-3">
                                <button type="submit" class="btn btn-add-cart addcart-button btn-sm">Send</button>
                            </div>
                        </div>
                    </form>
                </ul>
            </div>
        </div>
    </div>

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
