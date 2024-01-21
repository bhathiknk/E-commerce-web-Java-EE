package com.greenstore.servlet.FeedBack;

import com.greenstore.connection.DbCon;
import com.greenstore.dao.FeedbackDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetching parameters from the form
        String userEmail = request.getParameter("userEmail");
        String userFeedback = request.getParameter("userFeedback");

        // You can perform additional validation or processing here

        Connection connection = null;
        try {
            // Get the existing connection or establish a new one
            connection = DbCon.getConnection();

            // Save the feedback using the FeedbackDao
            FeedbackDao.saveFeedback(connection, userEmail, userFeedback);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }

        // You can redirect the user to a thank you page or any other page after submitting the feedback
        response.sendRedirect("index.jsp");
    }
}
