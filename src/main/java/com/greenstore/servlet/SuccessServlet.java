package com.greenstore.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/success")
public class SuccessServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve information about the successful payment
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");


        // Send a redirect to /success.jsp
        response.sendRedirect(request.getContextPath() + "/success.jsp");
    }
}

