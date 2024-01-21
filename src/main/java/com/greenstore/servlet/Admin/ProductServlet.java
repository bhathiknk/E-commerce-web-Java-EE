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
import java.sql.Connection;
import java.sql.SQLException;


@WebServlet("/ProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,             // 10MB
        maxRequestSize = 1024 * 1024 * 50)          // 50MB
public class ProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String productCategory = request.getParameter("productCategory");
        String productPriceStr = request.getParameter("productPrice");

        // Handle file upload
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        Part filePart = request.getPart("productImage");
        String fileName = "";
        if (filePart != null) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String filePath = uploadPath + File.separator + fileName;
            try (InputStream fileContent = filePart.getInputStream();
                 OutputStream os = new FileOutputStream(filePath)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
            }
        }

        double productPrice = 0.0;
        if (productPriceStr != null && !productPriceStr.trim().isEmpty()) {
            try {
                productPrice = Double.parseDouble(productPriceStr);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        if (productName == null || productName.trim().isEmpty()) {
            response.sendRedirect("AdminDashboard.jsp?error=productName");
            return;
        }

        Product product = new Product();
        product.setName(productName);
        product.setCategory(productCategory);
        product.setPrice(productPrice);
        product.setImage(fileName);

        try {
            Connection con = DbCon.getConnection();
            ProductDao productDao = new ProductDao(con);
            productDao.addProduct(product);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("AdminDashboard.jsp");
    }
}

/*
 * Created by IntelliJ IDEA.
 * @author Bhathika Nilesh
 * @since 2023/12
 */
