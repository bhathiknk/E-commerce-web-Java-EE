<%--
  Created by IntelliJ IDEA.
  User: Bhathika Nilesh
  Date: 29/12/2023
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.greenstore.model.Product" %>
<%@ page import="com.greenstore.dao.ProductDao" %>
<%@ page import="com.greenstore.connection.DbCon" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            background-color: #ffffff;
            margin-top: 50px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #007bff;
        }

        label {
            font-weight: bold;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .btn-primary {
            background-color: #007bff;
            border: 1px solid #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border: 1px solid #0056b3;
        }

        #selectedFileName {
            display: block;
            margin-top: 10px;
        }
    </style>
    <title>Edit Product</title>
</head>
<body>
<%
    String productIdParam = request.getParameter("productId");
    if (productIdParam != null) {
        int productId = Integer.parseInt(productIdParam);
        ProductDao pd = new ProductDao(DbCon.getConnection());
        Product product = pd.getProductById(productId);

        // Check if the product exists
        if (product != null) {
%>

<%
    System.out.println("productId: " + product.getId());
    System.out.println("productName: " + product.getName());
    System.out.println("productCategory: " + product.getCategory());
    System.out.println("productPrice: " + product.getPrice());
%>

<div class="container">
    <h2 class="mt-4">Edit Product</h2>
    <div class="row">
        <div class="col-md-6">
            <!-- New Grid for Product Information Fields -->
            <form action="UpdateProductServlet" method="post" enctype="multipart/form-data">
                <input type="hidden" name="productId" value="<%= product.getId() %>">
                <div class="form-group">
                    <label for="productName">Product Name</label>
                    <input type="text" class="form-control" id="productName" name="productName" value="<%= product.getName() %>" required>
                </div>

                <div class="form-group">
                    <label for="productCategory">Product Category</label>
                    <input type="text" class="form-control" id="productCategory" name="productCategory" value="<%= product.getCategory() %>" required>
                </div>

                <div class="form-group">
                    <label for="productPrice">Product Price</label>
                    <input type="number" class="form-control" id="productPrice" name="productPrice" value="<%= product.getPrice() %>" required>
                </div>

                <div class="form-group">
                    <label for="productImage">Product Image</label>
                    <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*" >
                </div>

                <button type="submit">Update Product</button>
            </form>

            <!-- End of New Grid for Product Information Fields -->
        </div>
    </div>
</div>
<%
        }
    }
%>

<!-- Bootstrap JS and Popper.js (Optional) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
