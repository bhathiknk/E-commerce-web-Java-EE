<%@ page import="java.util.List" %>
<%@ page import="com.greenstore.model.Order" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.greenstore.dao.OrderDao" %>
<%@ page import="com.greenstore.connection.DbCon" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.greenstore.model.*" %>

<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);

    // Create OrderDao instance
    OrderDao orderDao = new OrderDao(DbCon.getConnection());

    // Fetch orders based on the orderNum parameter
    String orderNumParam = request.getParameter("orderNum");
    List<Order> orders = orderDao.searchOrderByOrderNum(orderNumParam);
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
    <!-- Your header content... -->
</header>

<div class="space-top-botom-default-order">
    <div class="container">
        <div class="card-header my-3">Search Orders</div>

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

        <%
            if (orders != null && !orders.isEmpty()) {
                Order sampleOrder = orders.get(0);
        %>
        <!-- Button to mark all orders as shipped -->
        <a class="btn btn-sm btn-success" href="update-all-orders-status?status=Shipped&orderNum=<%= sampleOrder.getOrderNum() %>">Mark All as Shipped</a>
        <%
            }
        %>


    </div>
</div>

<!-- Bg overlay Start -->
<div class="bg-overlay"></div>
<!-- Bg overlay End -->

<!-- Bootstrap JS and Popper.js scripts -->
<%@include file="/includes/footer.jsp"%>
</body>
</html>
