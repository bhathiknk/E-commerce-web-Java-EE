package com.greenstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.greenstore.connection.DbCon;
import com.greenstore.dao.AddressDao;
import com.greenstore.dao.OrderDao;
import com.greenstore.dao.ProductDao;
import com.greenstore.model.Address;
import com.greenstore.model.Cart;
import com.greenstore.model.Order;
import com.greenstore.model.Product;
import com.greenstore.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cart-check-out")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			User auth = (User) request.getSession().getAttribute("auth");

			if (cart_list != null && auth != null) {
				OrderDao oDao = new OrderDao(DbCon.getConnection());
				AddressDao addressDao = new AddressDao(DbCon.getConnection());

				// Retrieve addresses for the user
				List<Address> addresses = addressDao.getAddressesByUserId(auth.getId());

				// Assume the first address is selected; you can modify this based on your logic
				Address selectedAddress = addresses.get(0);

				// List to store orders for all products
				List<Order> orders = new ArrayList<>();

				Order order = null;
				for (Cart c : cart_list) {
					order = new Order();
					order.setId(c.getId());
					order.setUid(auth.getId());
					order.setQunatity(c.getQuantity());
					order.setDate(formatter.format(date));

					// Generate a unique order number for each order
					String orderNum = generateOrderNumber();
					order.setOrderNum(orderNum);

					// Retrieve product details based on p_id
					ProductDao productDao = new ProductDao(DbCon.getConnection());
					Product product = productDao.getProductById(c.getId());

					// Add product details to order
					order.setName(product.getName());
					order.setPrice(product.getPrice());

					// Set the selected address details in the order
					order.setAddress(selectedAddress);

					// Add the order to the list
					orders.add(order);
				}

				// Insert all orders into the database
				boolean result = oDao.insertOrders(orders);

				if (result) {
					// Create order details for email content
					List<String> orderDetails = getOrderDetailsForEmail(orders);

					// Send a single order confirmation email for all orders
					SendEmailUtil.sendOrderConfirmationEmail(auth.getEmail(), orders.get(0).getOrderNum(),
							selectedAddress.getAddress(), selectedAddress.getCity(), selectedAddress.getZipcode(),
							selectedAddress.getMobileNumber(),orders);

					// Set orderNum in the session (you can choose any orderNum from the list)
					request.getSession().setAttribute("orderNum", orders.get(0).getOrderNum());
					// Set orderDetails in the session
					request.getSession().setAttribute("orderDetails", orderDetails);

					// Clear the cart after successful order processing
					cart_list.clear();

					// Send a success response
					response.getWriter().write("Orders processed successfully");
				} else {
					// Handle the case where order insertion failed
					response.getWriter().write("Order processing failed");
				}
			} else {
				if (auth == null) {
					// Send a response indicating the need for authentication
					response.getWriter().write("Authentication required");
				} else {
					// Send a response indicating the failure of order processing
					response.getWriter().write("Order processing failed");
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			// Send a response indicating the failure of order processing
			response.getWriter().write("Order processing failed");
		}
	}

	// Existing doPost method...

	private String generateOrderNumber() {
		// Static prefix for the order number
		String prefix = "ORD";

		// Generate a timestamp portion
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String timestamp = dateFormat.format(new Date());

		// Generate a random portion using UUID
		String randomString = UUID.randomUUID().toString().replace("-", "").substring(0, 6);

		// Combine all parts to form the unique order number
		return prefix + timestamp + randomString;
	}

	// Helper method to create order details for email content
	private List<String> getOrderDetailsForEmail(List<Order> orders) {
		List<String> orderDetails = new ArrayList<>();
		for (Order order : orders) {
			orderDetails.add("Product: " + order.getName() +
					", Price: $" + order.getPrice() +
					", Quantity: " + order.getQunatity() +
					", Total: $" + (order.getPrice() * order.getQunatity()));
		}
		return orderDetails;
	}
}
