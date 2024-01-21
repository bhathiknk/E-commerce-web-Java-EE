<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Payment Success</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Add your custom styles or include additional CSS files here -->

    <!-- Optional: Include your custom CSS styles -->
    <style>
        /* Custom CSS for success.jsp */

        body {
            padding: 20px;
            background-color: #f8f9fa; /* Light gray background */
        }

        .success-container {
            max-width: 600px;
            margin: 0 auto;
            text-align: center;
            padding: 20px;
            background-color: #ffffff; /* White container background */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Box shadow for container */
        }

        h2 {
            color: #28a745; /* Green color for success message */
        }

        p {
            font-size: 18px;
        }

        .btn-primary {
            color: #ffffff;
            background-color: #007bff; /* Blue color for "Go to Home" button */
            border: 1px solid #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3; /* Darker blue on hover */
            border: 1px solid #0056b3;
        }

    </style>
</head>
<body>

<div class="success-container">
    <h2 class="text-success">Payment Successful!</h2>
    <p class="lead">Thank you for your purchase.</p>
    <!-- You can display additional information or messages here -->
</div>

<div class="mt-3 text-center">
    <!-- Example: Link to go back to the home page -->
    <a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-primary">Go to Home</a>
</div>

<!-- Include Bootstrap JS and jQuery (optional, but required for some Bootstrap features) -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
    // Function to remove items from the cart
    function removeItemsFromCart() {
        // Perform an AJAX request to your servlet to remove items from the cart
        $.ajax({
            type: "GET",
            url: "<%= request.getContextPath() %>/cart-remove-items", // Replace with the actual URL of your servlet
            success: function(data) {
                // Handle success if needed
                console.log("Items removed from the cart");
            },
            error: function(xhr, status, error) {
                // Handle error if needed
                console.error("Error removing items from the cart:", status, error);
            }
        });
    }

    // Use jQuery to make an AJAX request to /cart-check-out in the background
    $(document).ready(function() {
        $.ajax({
            type: "GET",
            url: "<%= request.getContextPath() %>/cart-check-out",
            success: function(data) {
                // Handle success if needed
                console.log("Background request to /cart-check-out successful");

                // Call the function to remove items from the cart after the background request
                removeItemsFromCart();
            },
            error: function(xhr, status, error) {
                // Handle error if needed
                console.error("Error making background request to /cart-check-out:", status, error);
            }
        });
    });

    // Attach click event listener to the "Go to Home" button
    $(document).ready(function() {
        // Assuming your "Go to Home" button has the ID "goToHomeBtn"
        $("#goToHomeBtn").on("click", function() {
            // Call the function to remove items from the cart before navigating to the home page
            removeItemsFromCart();
        });
    });
</script>



<!-- Include Bootstrap JS and jQuery (optional, but required for some Bootstrap features) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</body>
</html>
