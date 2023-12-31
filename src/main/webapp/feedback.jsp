<%--
  Created by IntelliJ IDEA.
  User: Bhathika Nilesh
  Date: 24/12/2023
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.greenstore.connection.DbCon" %>

<%
  Connection connection = DbCon.getConnection();
  PreparedStatement preparedStatement = null;
  ResultSet resultSet = null;

  try {
    String query = "SELECT * FROM feedback";
    preparedStatement = connection.prepareStatement(query);
    resultSet = preparedStatement.executeQuery();
  } catch (SQLException e) {
    e.printStackTrace(); // Handle the exception appropriately
  }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%@include file="/includes/head.jsp"%>
  <title>Feedback</title>


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
                    <strong class="me-1">Contact Us: </strong>GreenStore
                    <strong class="ms-1">+94 74123456</strong>
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
          <h2>Green Store: FeedBacks</h2>
          <nav>
            <ol class="breadcrumb mb-0">
              <li class="breadcrumb-item">
                <a href="#">
                  <i class="fa-solid fa-table-columns"></i>
                </a>
              </li>
              <li class="breadcrumb-item active" aria-current="page"><a href="AdminDashboard.jsp">Admin DashBoard</a></li>
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
                  <h3>Feedbacks</h3>
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

            <!-- Feedback Table Section Start -->
            <section class="feedback-section">
              <div class="container-fluid-lg">
                <div class="row">
                  <div class="col-12">
                    <div class="table-responsive shadow p-3 mb-5 bg-body rounded">
                      <table class="table table-bordered table-hover">
                        <thead class="table-dark">
                        <tr>
                          <th>Email</th>
                          <th>Date</th>
                          <th>Feedback</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                          // Check if the resultSet is not null before iterating
                          if (resultSet != null) {
                            while (resultSet.next()) {
                        %>
                        <tr>
                          <td><%= resultSet.getString("Email") %></td>
                          <td><%= resultSet.getString("Date") %></td>
                          <td><%= resultSet.getString("Feedback") %></td>
                          <td>
                            <div class="add-to-cart-box bg-white">
                             <form action="deleteFeedback" method="post">
                              <input type="hidden" name="feedbackId" value="<%= resultSet.getInt("ID") %>">
                              <button type="submit" class="btn btn-add-cart remove-button">Delete</button>
                            </form>
                            </div>
                          </td>
                        </tr>
                        <% }
                        }%>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </section>
            <!-- Feedback Table Section End -->

          </div>
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
