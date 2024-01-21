package com.greenstore.servlet.Email;

import com.greenstore.model.Order;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;

public class SendEmailUtil {
    public static final String ADMIN_EMAIL ="bnkdevelopmenttest@gmail.com" ;
    private static final String SENDER_EMAIL = "bhathikanilesh000@gmail.com";
    private static final String SENDER_PASSWORD = "vngj tdfz pvhe dzym";

    public static void sendOrderConfirmationEmail(String userEmail, String orderNum,
                                                  String selectedAddress, String selectedCity, String selectedZipcode,
                                                  String selectedMobileNumber, List<Order> orders, double totalAmount,
                                                  String adminEmail) {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            // Remove the BCC line since it's not needed anymore
            message.setSubject("Order Confirmation");

            StringBuilder emailContent = new StringBuilder("<html>"
                    + "<head>"
                    + "<style>"
                    // ... (CSS styles)
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='header'>"
                    + "    <h1>Green Store Invoice</h1>"
                    + "</div>"
                    + "<div class='content'>"
                    + "<p>Thank you for your purchase!</p>"
                    + "<p>Your order ID is: <strong>" + orders.get(0).getOrderNum() + "</strong></p>"
                    + "<p>Customer Address- "
                    + "<p> Address: <strong>" + selectedAddress + "</strong> </p>"
                    + "<p> City: <strong>" + selectedCity + "</strong> </p>"
                    + "<p> Zip Code: <strong>" + selectedZipcode + "</strong> </p>"
                    + "<p>Mobile Number: <strong>" + selectedMobileNumber + "</strong></p>"
                    + "<table>"
                    + "    <thead>"
                    + "        <tr>"
                    + "            <th>Product Name</th>"
                    + "            <th>Quantity</th>"
                    + "            <th>Price</th>"
                    + "            <th>Total</th>"
                    + "        </tr>"
                    + "    </thead>"
                    + "    <tbody>");

            // Add order details to the email content
            for (Order order : orders) {
                emailContent.append("<tr>")
                        .append("<td>").append(order.getName()).append("</td>")
                        .append("<td>").append(order.getQunatity()).append("</td>")
                        .append("<td>").append("$").append(order.getPrice()).append("</td>")
                        .append("<td>").append("$").append(order.getPrice() * order.getQunatity()).append("</td>")
                        .append("</tr>");
            }

            emailContent.append("    </tbody>"
                    + "</table>"
                    + "<p>Total: <strong>$").append(totalAmount).append("</strong></p>"
                    + "</div>"
                    + "<div class='footer'>"
                    + "    <p>&copy; Green Store All rights reserved</p>"
                    + "</div>"
                    + "</div>"
                    + "</body>"
                    + "</html>");

            // Set the HTML content
            message.setContent(emailContent.toString(), "text/html");

            // Send the email
            Transport.send(message);

            System.out.println("Order confirmation email sent successfully.");

        } catch (MessagingException mex) {
            mex.printStackTrace();
            System.out.println("Error sending order confirmation email.");
        }
    }

    public static void sendOrderConfirmationEmailToAdmin(String userEmail, String orderNum,
                                                         String selectedAddress, String selectedCity, String selectedZipcode,
                                                         String selectedMobileNumber, List<Order> orders, double totalAmount) {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(ADMIN_EMAIL));
            message.setSubject("New Order Placed");

            StringBuilder emailContent = new StringBuilder("<html>"
                    + "<head>"
                    + "<style>"
                    // ... (CSS styles)
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='header'>"
                    + "    <h1>Green Store Invoice</h1>"
                    + "</div>"
                    + "<div class='content'>"
                    + "<p>New order has been placed with the following details</p>"
                    + "<p>Your order ID is: <strong>" + orders.get(0).getOrderNum() + "</strong></p>"
                    + "<p>Customer Address- "
                    + "<p> Address: <strong>" + selectedAddress + "</strong> </p>"
                    + "<p> City: <strong>" + selectedCity + "</strong> </p>"
                    + "<p> Zip Code: <strong>" + selectedZipcode + "</strong> </p>"
                    + "<p>Mobile Number: <strong>" + selectedMobileNumber + "</strong></p>"
                    + "<table>"
                    + "    <thead>"
                    + "        <tr>"
                    + "            <th>Product Name</th>"
                    + "            <th>Quantity</th>"
                    + "            <th>Price</th>"
                    + "            <th>Total</th>"
                    + "        </tr>"
                    + "    </thead>"
                    + "    <tbody>");

            // Add order details to the email content
            for (Order order : orders) {
                emailContent.append("<tr>")
                        .append("<td>").append(order.getName()).append("</td>")
                        .append("<td>").append(order.getQunatity()).append("</td>")
                        .append("<td>").append("$").append(order.getPrice()).append("</td>")
                        .append("<td>").append("$").append(order.getPrice() * order.getQunatity()).append("</td>")
                        .append("</tr>");
            }

            emailContent.append("    </tbody>"
                    + "</table>"
                    + "<p>Total: <strong>$").append(totalAmount).append("</strong></p>"
                    + "</div>"
                    + "<div class='footer'>"
                    + "    <p>&copy; Green Store All rights reserved</p>"
                    + "</div>"
                    + "</div>"
                    + "</body>"
                    + "</html>");

            // Set the HTML content
            message.setContent(emailContent.toString(), "text/html");

            // Send the email
            Transport.send(message);

            System.out.println("Order confirmation email sent to admin successfully.");

        } catch (MessagingException mex) {
            mex.printStackTrace();
            System.out.println("Error sending order confirmation email to admin.");
        }
    }
}
