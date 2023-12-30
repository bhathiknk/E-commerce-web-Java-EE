package com.greenstore.servlet;

import com.greenstore.connection.DbCon;
import com.greenstore.dao.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

// DeleteProductServlet.java
@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));

            Connection con = DbCon.getConnection();
            ProductDao productDao = new ProductDao(con);
            productDao.deleteProduct(productId);

            response.sendRedirect("AdminDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AdminDashboard.jsp?error=delete");
        }
    }
}


/*
 * Created by IntelliJ IDEA.
 * @author Bhathika Nilesh
 * @since 2023/12
 */
