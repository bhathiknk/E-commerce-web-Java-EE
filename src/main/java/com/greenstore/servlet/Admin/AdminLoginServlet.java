package com.greenstore.servlet.Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import com.greenstore.connection.DbCon;
import com.greenstore.dao.AdminDao;
import com.greenstore.model.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("login-email");
            String password = request.getParameter("login-password");

            AdminDao adao = null;
            try {
                adao = new AdminDao(DbCon.getConnection());
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            Admin admin = adao.adminLogin(email, password);
            if (admin != null) {
                // Successfully authenticated, you can perform additional actions if needed
                response.sendRedirect("AdminDashboard.jsp");
            } else {
                out.println("Invalid admin credentials");
            }
        }
    }
}
