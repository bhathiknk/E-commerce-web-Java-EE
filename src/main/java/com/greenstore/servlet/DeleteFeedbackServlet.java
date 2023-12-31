package com.greenstore.servlet;

import com.greenstore.connection.DbCon;
import com.greenstore.dao.FeedbackDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/deleteFeedback")
public class DeleteFeedbackServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String feedbackId = request.getParameter("feedbackId");

        Connection connection = null;
        try {
            // Get the existing connection or establish a new one
            connection = DbCon.getConnection();

            // Save the feedback using the FeedbackDao
            FeedbackDao.deleteFeedback(connection, Integer.parseInt(feedbackId));
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }

        response.sendRedirect(request.getContextPath() + "feedback.jsp");
    }
}
