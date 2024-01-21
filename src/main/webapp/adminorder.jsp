<%--
  Created by IntelliJ IDEA.
  User: Bhathika Nilesh
  Date: 21/01/2024
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.greenstore.dao.OrderDao" %>
<%@ page import="com.greenstore.connection.DbCon" %>
<%@ page import="com.greenstore.model.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);

    // Create OrderDao instance
    OrderDao orderDao = new OrderDao(DbCon.getConnection());

    // Fetch all orders from the database
    List<Order> orders = orderDao.getAllOrders();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="assets/images/favicon/6.png" type="image/x-icon">
    <%@include file="/includes/head.jsp"%>
    <!-- Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        body {
            background-color: #ffffff;
        }
        .navbar a {
            color: white;
            padding: 14px 16px;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s, color 0.3s;
        }
        .navbar a:hover {
            background-color: #45a049;
            color: white;
        }
        .space-top-botom-default-order {
            padding-top: 15px;
            padding-bottom: 30px;
        }
        .card-header {
            background-color: #0da487;
            text-align: center;
            color: white;
            font-weight: bold;
            border-radius: 5px;
        }
        .table th, .table td {
            border: none;
            padding: 15px;
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
        .table tbody tr:hover {
            background-color: rgba(0, 123, 255, 0.1);
        }
        .btn-primary {
            background-color: #0da487;
            border: none;
        }
        .btn-primary:hover {
            transition: 0.8s;
            background-color: #45a049;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        .btn-success:hover {
            transition: 0.8s;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        .btn-info:hover {
            transition: 0.8s;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        .table {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
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
                                    <h6><strong class="me-1">Welcome to Green Store!</strong>Wrap new offers/gift every single day on Weekends.<strong class="ms-1">New Coupon Code: Gt123 </strong></h6>
                                </div>
                            </div>
                            <div>
                                <div class="timer-notification">
                                    <h6>Something you love is now on sale! <a  class="text-white">Buy Now !</a></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <ul class="about-list right-nav-about">
                        <li class="right-nav-list">
                            <div class="dropdown theme-form-select">
                                <a href="AdminDashboard.jsp">
                                    <button class="btn" type="button"  aria-expanded="false">
                                        <span class="home-btn"> Admin Dashboard</span>
                                    </button>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="top-nav top-header sticky-header">
        <div class="container-fluid-lg">
            <div class="row">
                <div class="col-12">
                    <div class="navbar-top">
                        <button class="navbar-toggler d-xl-none d-inline navbar-menu-button" type="button" data-bs-toggle="offcanvas" data-bs-target="#primaryMenu">
                                <span class="navbar-toggler-icon">
                                    <i class="fa-solid fa-bars"></i>
                                </span>
                        </button>
                        <a href="index.jsp" class="web-logo nav-logo">
                            <img src="assets/images/logo/5.png" class="img-fluid blur-up lazyload" alt="">
                        </a>
                        <div class="rightside-box">
                            <div class="search-full">
                                <div class="input-group">
                                        <span class="input-group-text">
                                            <i data-feather="search" class="font-light"></i>
                                        </span>
                                    <input type="text" class="form-control search-type" placeholder="Search here..">
                                    <span class="input-group-text close-search">
                                            <i data-feather="x" class="font-light"></i>
                                    </span>
                                </div>
                            </div>
                            <ul class="right-side-menu">
                                <li class="right-side">
                                    <div class="delivery-login-box">
                                        <div class="delivery-icon">
                                            <div class="search-box">
                                                <i data-feather="search"></i>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Add a search bar -->
<div class="container">
    <div class="card-header my-3">Search Orders by Order Number</div>
    <form action="adminsearchorder.jsp" method="GET">
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Enter Order Number" name="orderNum" required>
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">Search</button>
            </div>
        </div>
    </form>
</div>
<div class="space-top-botom-default-order">
    <div class="container">
        <div class="card-header my-3">All Orders</div>

        <!-- Table with Bootstrap styling -->
        <table class="table table-light">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Date</th>
                <th scope="col">Name</th>
                <th scope="col">Category</th>
                <th scope="col">Quantity</th>
                <th scope="col">Price</th>
                <th scope="col">Order Number</th>
                <th scope="col">Status</th>
            </tr>
            </thead>
            <tbody>
            <%
                if (orders != null) {
                    for (Order o : orders) {
            %>
            <tr>
                <td><%= o.getDate() %></td>
                <td><%= o.getName() %></td>
                <td><%= o.getCategory() %></td>
                <td><%= o.getQunatity() %></td>
                <td><%= dcf.format(o.getPrice()) %></td>
                <td><%= o.getOrderNum() %></td>
                <td><%= o.getStatus() %></td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<!-- Bg overlay Start -->
<div class="bg-overlay"></div>
<!-- Bg overlay End -->

<!-- Bootstrap JS and Popper.js scripts -->
<%@include file="/includes/footer.jsp"%>
</body>
</html>

