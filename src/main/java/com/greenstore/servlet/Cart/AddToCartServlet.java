package com.greenstore.servlet.Cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import com.greenstore.model.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name = "AddToCartServlet", urlPatterns = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(true);

            // Set the session timeout (in seconds) - adjust this based on your requirements
            int sessionTimeout = 30 * 60; // 30 minutes
            session.setMaxInactiveInterval(sessionTimeout);

            // Retrieve or create the cart list specific to the user
            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");

            if (cartList == null) {
                // If the cart list doesn't exist for this user, create a new one
                cartList = new ArrayList<>();
                session.setAttribute("cart-list", cartList);
            }

            int id = Integer.parseInt(request.getParameter("id"));
            Cart cm = new Cart();
            cm.setId(id);
            cm.setQuantity(1);

            boolean exist = false;
            for (Cart c : cartList) {
                if (c.getId() == id) {
                    exist = true;
                    out.println("<h3 style='color:crimson; text-align: center'>Item Already in Cart. <a href='cart.jsp'>GO to Cart Page</a></h3>");
                }
            }

            if (!exist) {
                // Add the new item to the user's cart list
                cartList.add(cm);
                response.sendRedirect("index.jsp");
            }
        }
    }
}



/*
 * Created by IntelliJ IDEA.
 * @author Bhathika Nilesh
 * @since 2023/12
 */
