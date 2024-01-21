// UpdateProductServlet.java
package com.greenstore.servlet.Admin;

import com.greenstore.connection.DbCon;
import com.greenstore.dao.ProductDao;
import com.greenstore.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;
import java.nio.file.Paths;

@WebServlet("/UpdateProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,             // 10MB
        maxRequestSize = 1024 * 1024 * 50)          // 50MB
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("UpdateProductServlet - doPost");

        String productIdParam = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String productCategory = request.getParameter("productCategory");
        String productPriceStr = request.getParameter("productPrice");

        // Debbuging
        System.out.println("productIdParam: " + productIdParam);
        System.out.println("productName: " + productName);
        System.out.println("productCategory: " + productCategory);
        System.out.println("productPriceStr: " + productPriceStr);

        if (productIdParam != null && productName != null && productCategory != null && productPriceStr != null) {
            int productId = Integer.parseInt(productIdParam);
            double productPrice = Double.parseDouble(productPriceStr);

            try {
                ProductDao productDao = new ProductDao(DbCon.getConnection());

                // Fetch existing product details from the database
                Product existingProduct = productDao.getProductById(productId);

                // Create an updated product object
                Product updatedProduct = new Product();
                updatedProduct.setId(productId);
                updatedProduct.setName(productName);
                updatedProduct.setCategory(productCategory);
                updatedProduct.setPrice(productPrice);

                // Handle file upload
                Part filePart = request.getPart("productImage");
                String fileName = "";

                if (filePart != null && filePart.getSize() > 0) {
                    // New image provided, update the 'image' property
                    fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                    String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                    String filePath = uploadPath + File.separator + fileName;

                    try (InputStream fileContent = filePart.getInputStream();
                         OutputStream os = new FileOutputStream(filePath)) {
                        byte[] buffer = new byte[1024];
                        int bytesRead;
                        while ((bytesRead = fileContent.read(buffer)) != -1) {
                            os.write(buffer, 0, bytesRead);
                        }
                    }
                    updatedProduct.setImage(fileName);
                } else {
                    // No new image provided, use the existing image value
                    updatedProduct.setImage(existingProduct.getImage());
                }

                // Update the product
                productDao.updateProduct(updatedProduct);

                System.out.println("Product updated successfully!");

                response.sendRedirect("AdminDashboard.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error updating product: " + e.getMessage());
                response.sendRedirect("UpdateProduct.jsp?error=updateFailed");
            }
        } else {
            System.out.println("Invalid input detected. Redirecting to UpdateProduct.jsp");
            response.sendRedirect("UpdateProduct.jsp?error=invalidInput");
        }
    }
}

/*
 * Created by IntelliJ IDEA.
 * @author Bhathika Nilesh
 * @since 2023/12
 */
