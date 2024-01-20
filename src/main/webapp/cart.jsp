<%@page import="com.greenstore.connection.DbCon"%>
<%@page import="com.greenstore.dao.ProductDao"%>
<%@page import="com.greenstore.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		request.setAttribute("person", auth);
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if (cart_list != null) {
		ProductDao pDao = new ProductDao(DbCon.getConnection());
		cartProduct = pDao.getCartProducts(cart_list);
		double total = pDao.getTotalCartPrice(cart_list);
		request.setAttribute("total", total);
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/includes/head.jsp"%>
	<title>Green Store</title>
	<style type="text/css">

		.space-cart {
			border-radius: 10px;
			padding: 15px;
			background-color: #fff; /* Optional: Set a background color */
		}

		#checkoutBtn {
			border-radius: 5px;
			background-color: #0da487;
			color: #ffffff;
			float: left;
		}
		#checkoutBtn:hover{
			transition: 0.8s;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			background-image: linear-gradient(to right, #0ba360, #3cba92, #30dd8a, #2bb673);
		}

		.btn-danger:hover{
			transition: 0.8s;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		}

		.home-btn{
			color: #ffffff;
		}
		.table {
			width: 100%;
			margin-bottom: 1rem;
			color: #212529;
			border-collapse: collapse;
			border-radius: 10px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
			overflow: hidden;
			margin-bottom: 20px;

		}

		.table td {
			padding: 0.75rem;
			vertical-align: top;
			border-top: 1px solid #dee2e6;

		}

		.table th {
			background-color: #dee2e6;
			color: white;
			padding: 0.75rem; /* Add padding for space inside header cells */
			vertical-align: top;
			border-top: 1px solid #dee2e6;
		}


		.table thead th {
			vertical-align: bottom;
			border-bottom: 2px solid #dee2e6;
			background-color: #0da487;
			color: #ffffff;
		}


		.btn {
			display: inline-block;
			font-weight: 200;
			text-align: center;
			white-space: nowrap;
			vertical-align: middle;
			user-select: none;
			border: 1px solid transparent;
			padding: 0.375rem 0.75rem;
			font-size: 1rem;
			line-height: 1.5;
			border-radius: 0.25rem;
			transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
		}

		.btn-danger {
			color: #fff;
			background-color: #dc3545;
			border-color: #dc3545;
		}

		.btn-incre,
		.btn-decre {
			margin: 5px;
		}

		.btn-incre:hover{
			color: #0da487;
		}

		.btn-decre:hover{
			color: #0da487;
		}


		.form-inline {
			display: flex;
			align-items: center;
		}

		.form-group {
			margin-bottom: 0;
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

<!---->


<div class="space-cart">
	<div class="container my-3">

		<div class="d-flex py-3 ">
			<h3>Total Price: Rs. ${(total>0)?dcf.format(total):0}</h3>
			<a id="checkoutBtn" class="mx-3 btn " href="#">Check Out</a>
		</div>
		<table class="table table-light">
			<thead >
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col">Price</th>
				<th scope="col">Quantity</th>
				<th scope="col">Cancel</th>
			</tr>
			</thead>
			<tbody>
			<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
			%>
			<tr>
				<td><%=c.getName()%></td>
				<td><%=c.getCategory()%></td>
				<td><%= dcf.format(c.getPrice())%></td>
				<td>
					<form action="order-now" method="post" class="form-inline">
					<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
					<div class="form-group d-flex justify-content-between">
						<a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a>
						<input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly>
						<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
					</div>
				</form>
				</td>
				<td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
			</tr>

			<%
					}}%>
			</tbody>
		</table>
	</div>
</div>


<script>
	document.getElementById('checkoutBtn').addEventListener('click', function() {
		window.location.href = 'Address.jsp';
	});
</script>
<!-- Bg overlay Start -->
<div class="bg-overlay"></div>
<!-- Bg overlay End -->

<%@include file="/includes/footer.jsp"%>

</body>
</html>
