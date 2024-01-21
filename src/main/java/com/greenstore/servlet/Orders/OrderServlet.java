package com.greenstore.servlet.Orders;

import com.greenstore.model.Address;
import com.greenstore.model.Cart;
import com.greenstore.model.Order;
import com.greenstore.model.Product;
import com.greenstore.model.User;
import com.greenstore.connection.DbCon;
import com.greenstore.dao.AddressDao;
import com.greenstore.dao.OrderDao;
import com.greenstore.dao.ProductDao;
import com.greenstore.servlet.Email.SendEmailUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@WebServlet("/cart-check-out")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			ArrayList<Cart> cartList = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			User auth = (User) request.getSession().getAttribute("auth");

			if (cartList != null && auth != null) {
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				AddressDao addressDao = new AddressDao(DbCon.getConnection());

				// Retrieve addresses for the user
				List<Address> addresses = addressDao.getAddressesByUserId(auth.getId());

				// Assume the first address is selected; you can modify this based on your logic
				Address selectedAddress = addresses.get(0);

				// List to store orders for all products
				List<Order> orders = new ArrayList<>();

				double totalAmount = 0.0; // Initialize total amount

				Order order = null;
				for (Cart cart : cartList) {
					order = new Order();
					order.setId(cart.getId());
					order.setUid(auth.getId());
					order.setQunatity(cart.getQuantity());
					order.setDate(formatter.format(date));

					// Generate a unique order number for each order
					String orderNum = generateOrderNumber();
					order.setOrderNum(orderNum);

					// Retrieve product details based on p_id
					ProductDao productDao = new ProductDao(DbCon.getConnection());
					Product product = productDao.getProductById(cart.getId());

					// Add product details to order
					order.setName(product.getName());
					order.setPrice(product.getPrice());

					// Set the selected address details in the order
					order.setAddress(selectedAddress);

					// Add the order to the list
					orders.add(order);

					// Calculate the order total and accumulate to the totalAmount
					double orderTotal = order.getPrice() * order.getQunatity();
					totalAmount += orderTotal;
				}

				// Insert all orders into the database
				boolean result = orderDao.insertOrders(orders);

				if (result) {
					// Create order details for email content
					List<String> orderDetails = getOrderDetailsForEmail(orders, totalAmount);

					// Send a single order confirmation email for all orders
					SendEmailUtil.sendOrderConfirmationEmail(auth.getEmail(), orders.get(0).getOrderNum(),
							selectedAddress.getAddress(), selectedAddress.getCity(), selectedAddress.getZipcode(),
							selectedAddress.getMobileNumber(), orders, totalAmount, SendEmailUtil.ADMIN_EMAIL);

					// Send order confirmation email to the admin
					SendEmailUtil.sendOrderConfirmationEmailToAdmin(auth.getEmail(), orders.get(0).getOrderNum(),
							selectedAddress.getAddress(), selectedAddress.getCity(), selectedAddress.getZipcode(),
							selectedAddress.getMobileNumber(), orders, totalAmount);

					// Set orderNum in the session (you can choose any orderNum from the list)
					request.getSession().setAttribute("orderNum", orders.get(0).getOrderNum());
					// Set orderDetails in the session
					request.getSession().setAttribute("orderDetails", orderDetails);

					// Clear the cart after successful order processing
					cartList.clear();

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

	private List<String> getOrderDetailsForEmail(List<Order> orders, double totalAmount) {
		List<String> orderDetails = new ArrayList<>();

		for (Order order : orders) {
			double orderTotal = order.getPrice() * order.getQunatity();

			orderDetails.add("Product: " + order.getName() +
					", Price: $" + order.getPrice() +
					", Quantity: " + order.getQunatity() +
					", Total: $" + orderTotal);
		}

		// Add total to the orderDetails
		orderDetails.add("Total: $" + totalAmount);

		return orderDetails;
	}
}
