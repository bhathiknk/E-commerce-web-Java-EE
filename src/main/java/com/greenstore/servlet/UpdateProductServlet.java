// UpdateProductServlet.java
package com.greenstore.servlet;

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

// UpdateProductServlet.java
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


        System.out.println("productIdParam: " + productIdParam);
        System.out.println("productName: " + productName);
        System.out.println("productCategory: " + productCategory);
        System.out.println("productPriceStr: " + productPriceStr);

        if (productIdParam != null && productName != null && productCategory != null && productPriceStr != null) {
            int productId = Integer.parseInt(productIdParam);
            double productPrice = Double.parseDouble(productPriceStr);

            Product updatedProduct = new Product();
            updatedProduct.setId(productId);
            updatedProduct.setName(productName);
            updatedProduct.setCategory(productCategory);
            updatedProduct.setPrice(productPrice);

            // Handle file upload
            Part filePart = request.getPart("productImage");
            String fileName = "";
            if (filePart != null) {
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
            }

            try {
                ProductDao productDao = new ProductDao(DbCon.getConnection());
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
