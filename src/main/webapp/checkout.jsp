<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.greenstore.model.Cart" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.greenstore.dao.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.greenstore.connection.DbCon" %>

<%@ include file="/includes/head.jsp" %>

<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    double total = 0;
    if (cart_list != null) {
        ProductDao pDao = new ProductDao(DbCon.getConnection());
        cartProduct = pDao.getCartProducts(cart_list);
        total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("total", total);
        request.setAttribute("cart_list", cart_list);
    }

    // Retrieve selected address details from the request parameters
    String selectedAddress = (String) request.getAttribute("selectedAddress");
    String selectedCity = (String) request.getAttribute("selectedCity");
    String selectedZipcode = (String) request.getAttribute("selectedZipcode");
    String selectedMobileNumber = (String) request.getAttribute("selectedMobileNumber");


%>
<html>
<head>
    <title>Checkout - Green Store</title>
    <!-- Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://www.paypal.com/sdk/js?client-id=ARQyk4Cfn32QiSJtEfkvSFXs6oR5VhPpXNzWHg8aDS7mArEIiUZg-y09D6kJuxgKDdxemvS35SfzGsn0"></script>

    <!-- Add your custom styles here -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            padding-top: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            margin: 30px;
        }

        table {
            width: 100%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        .selected-address {
            margin-top: 20px;
        }

        button {
            background-color: #0da487;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 0px;
            margin-top: 10px;

        }

        button:hover {
            background-color: #0da487;
        }

        .h2-checkout{
            background-color: #0baf9a;
            color: #ffffff;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            padding: 20px;
            margin-top: 5px;
            margin-bottom: 5px;
        }

        .h3-cls-total-p{
            margin-top: 10px;
            margin-bottom: 10px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            background-color: rgba(28, 61, 133, 0.85);
            color: #fff;
            border-radius: 5px;
            padding: 5px;
            width: 50%;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: .3s;
        }


        .ctn{
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .head-add-sel{
            background-color: #0baf9a;
            color: #ffffff;
            text-align: center;
            border-radius: 5px;
            padding: 20px;
        }

        .add-dt{
            margin: 10px 0;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }


        strong {
            color: #333;
        }

        /* Responsive styles for mobile devices */
        @media (max-width: 767px) {
            .container {
                margin: 10px;
            }

            table {
                font-size: 12px;
            }

            .h2-checkout {
                padding: 15px;
            }

            .total-price, .selected-address {
                text-align: center;
            }
        }

        .succss-msg-pay{
            margin-top: 20px;
            margin-bottom: 15px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            background-color: #0baf9a;
            color: #fff;
            border-radius: 5px;
            padding: 5px;
            width: 50%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: .3s;
        }
        .btn-go-my-od :hover{
            transition: 0.8s;
            background-color: red;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

    </style>
</head>
<body>
<div class="container my-3">
    <h2 class="h2-checkout">Checkout</h2>
    <table class="table table-light">
        <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <!-- Add any other columns you want to display -->
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
            <td><%=dcf.format(c.getPrice())%></td>
            <td><%=c.getQuantity()%></td>
            <!-- Add any other columns you want to display -->
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="4">No items in the cart</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <!-- Display total price -->
    <div class="total-price">
        <h3 class="h3-cls-total-p">Total Price: &nbsp; Rs.<%=dcf.format(total)%>.00</h3>
    </div>
    <form>
        <div id="paypal-button-container"></div>
    </form>


    <!-- Success message container -->
    <div id="success-message" style="display: none;">
        <div class="succss-msg-pay">
            <h4>Payment Successful !</h4>
            <p>Thank you for your purchase.</p>
        </div>


        <!-- Add a button to go to the order page -->
        <button class="btn-go-my-od" onclick="goToOrderPage()">Go to My Orders</button>

    </div>

</div>

<div class="container selected-address">
    <div class="ctn">
        <h3 class="head-add-sel">Selected Address</h3>
        <p class="add-dt"><strong>Address:</strong> <%=selectedAddress%></p>
        <p class="add-dt"><strong>City:</strong> <%=selectedCity%></p>
        <p class="add-dt"><strong>Zipcode:</strong> <%=selectedZipcode%></p>
        <p class="add-dt"><strong>Mobile Number:</strong> <%=selectedMobileNumber%></p>
    </div>

</div>


<script>
    function goToOrderPage() {
        // Redirect to the order page or update the location as needed
        window.location.href = '/orders.jsp';
    }
    paypal.Buttons({
        createOrder: function (data, actions) {
            // Set up the transaction details
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        currency_code: 'USD', // Change this to your desired currency code
                        value: '<%=dcf.format(total)%>'
                    }
                }]
            });
        },
        onApprove: function (data, actions) {
            // Capture the funds from the transaction
            return actions.order.capture().then(function (details) {
                // Hide PayPal button container
                document.getElementById('paypal-button-container').style.display = 'none';

                // Show the success message
                document.getElementById('success-message').style.display = 'block';

                // Make an AJAX call to the CartServlet
                $.ajax({
                    url: '/cart-check-out',
                    method: 'GET',
                    success: function(response) {
                        // Handle the response if needed
                    },
                    error: function(error) {
                        console.error('Error in AJAX call:', error);
                        // Handle the error if needed
                    }
                });

            });


        },
        onError: function (err) {
            // Handle errors or display an error message to the user
            console.error('PayPal error:', err);
            // You can display an error message to the user here
        }
    }).render('#paypal-button-container');

</script>



<!-- Bootstrap JS and Popper.js scripts -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
