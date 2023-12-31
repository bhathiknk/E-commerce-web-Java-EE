package com.greenstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FeedbackDao {

    public static void saveFeedback(Connection connection, String userEmail, String userFeedback) {
        try {
            String sql = "INSERT INTO feedback (Email, Feedback) VALUES (?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, userEmail);
                preparedStatement.setString(2, userFeedback);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
    }

    public static void deleteFeedback(Connection connection, int feedbackId) {
        try {
            String sql = "DELETE FROM feedback WHERE ID=?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, feedbackId);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
    }
}
