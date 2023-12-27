<%@page import="com.greenstore.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("index.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/includes/head.jsp"%>
	<title>Green Store</title>
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
										every single day on Weekends.<strong class="ms-1">New Coupon Code: Gt123
										</strong>

									</h6>
								</div>
							</div>

							<div>
								<div class="timer-notification">
									<h6>Something you love is now on sale!
										<a  class="text-white">Buy Now !</a>
									</h6>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<ul class="about-list right-nav-about">
						<li class="right-nav-list">
							<div class="dropdown theme-form-select">
								<a href="index.jsp">
									<button class="btn" type="button"  aria-expanded="false">
										<span class="home-btn"> Home</span>
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
						<button class="navbar-toggler d-xl-none d-inline navbar-menu-button" type="button"
								data-bs-toggle="offcanvas" data-bs-target="#primaryMenu">
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



<!-- log in section start -->
<div class="space-signUpPage">
	<form class="log-in-section background-image-2 section-b-space" action="user-login" method="post">
		<div class="container-fluid-lg w-100">
			<div class="row">
				<div class="col-xxl-4 col-xl-5 col-lg-6 col-sm-8 mx-auto">
					<div class="log-in-box">
						<div class="log-in-title">
							<h3>Welcome To Green Store</h3>
							<h4>Log In Your Account</h4>
						</div>
						<div class="input-box">
							<div class="row g-4">
								<div class="col-12">
									<div class="form-floating theme-form-floating log-in-form">
										<input type="email" class="form-control" id="email" name="login-email" placeholder="Email Address">
										<label for="email">Email Address</label>
									</div>
								</div>

								<div class="col-12">
									<div class="form-floating theme-form-floating log-in-form">
										<input type="password" class="form-control" id="password" name="login-password" placeholder="Password">
										<label for="password">Password</label>
									</div>
								</div>

								<div class="col-12">
									<div class="forgot-box">
										<div class="form-check ps-0 m-0 remember-box">
											<a href="signup.jsp" class="forgot-password">Signup ?</a>
										</div>
										<a href="AdminLoging.jsp" class="forgot-password">Admin ?</a>
									</div>
								</div>

								<div class="col-12">
									<button class="btn btn-animation w-100 justify-content-center" type="submit">Login</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div><br><br><br><br>
<%@include file="/includes/footer.jsp"%>
<!-- log in section end -->


</body>
</html>