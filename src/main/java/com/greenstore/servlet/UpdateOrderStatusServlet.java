package com.greenstore.servlet;

import com.greenstore.connection.DbCon;
import com.greenstore.dao.OrderDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/update-all-orders-status")
public class UpdateOrderStatusServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the orderNum and status parameters from the request
        String orderNum = request.getParameter("orderNum");
        String status = request.getParameter("status");

        // Perform the logic to update the status based on orderNum
        OrderDao orderDao = null;
        try {
            orderDao = new OrderDao(DbCon.getConnection());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        boolean success = orderDao.updateOrderStatus(orderNum, status);

        // Redirect back to the orders page after updating the status
        response.sendRedirect("adminorder.jsp");

    }
}
