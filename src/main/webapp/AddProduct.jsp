<!DOCTYPE html>
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

        .btn-primary {
            background-color: #007bff;
            border: 1px solid #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border: 1px solid #0056b3;
        }
    </style>
    <title>Add Product</title>
</head>
<body>
<div class="container">
    <h2 class="mt-4">Add Product</h2>
    <div class="row">
        <div class="col-md-6">
            <!-- New Grid for Product Information Fields -->
            <form action="/ProductServlet" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="productName">Product Name</label>
                    <input type="text" class="form-control" id="productName" name="productName" required>
                </div>

                <div class="form-group">
                    <label for="productCategory">Product Category</label>
                    <input type="text" class="form-control" id="productCategory" name="productCategory" required>
                </div>

                <div class="form-group">
                    <label for="productPrice">Product Price</label>
                    <input type="number" class="form-control" id="productPrice" name="productPrice" required>
                </div>

                <div class="form-group">
                    <label for="productImage">Product Image</label>
                    <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*" required>
                </div>
                <button type="submit" class="btn btn-primary btn-lg">Save Product</button>
            </form>
            <!-- End of New Grid for Product Information Fields -->
        </div>
    </div>
</div>

<!-- Bootstrap JS and Popper.js (Optional) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
