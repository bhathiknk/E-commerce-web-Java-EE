package com.greenstore.servlet;

import com.greenstore.model.Order;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Properties;

public class SendEmailUtil {
    public static void sendOrderConfirmationEmail(String userEmail, String orderNum,
                                                  String selectedAddress, String selectedCity, String selectedZipcode,
                                                  String selectedMobileNumber,List<Order> orders,double totalAmount) {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("bhathikanilesh000@gmail.com", "vngj tdfz pvhe dzym");
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("bhathikanilesh000@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            message.setSubject("Order Confirmation");

            StringBuilder emailContent = new StringBuilder("<html>"
                    + "<head>"
                    + "<style>"
                    + "body {"
                    + "    font-family: 'Arial', sans-serif;"
                    + "    background-color: #f4f4f4;"
                    + "    color: #333;"
                    + "    margin: 0;"
                    + "    padding: 0;"
                    + "}"
                    + ".container {"
                    + "    max-width: 600px;"
                    + "    margin: 0 auto;"
                    + "}"
                    + ".header {"
                    + "    background-color: #0da487; /* Green color */"
                    + "    color: #fff;"
                    + "    text-align: center;"
                    + "    padding: 20px;"
                    + "    border-top-left-radius: 5px;"
                    + "    border-top-right-radius: 5px;"
                    + "}"
                    + ".content {"
                    + "    padding: 20px;"
                    + "}"
                    + "table {"
                    + "    width: 100%;"
                    + "    border-collapse: collapse;"
                    + "    margin-top: 20px;"
                    + "}"
                    + "table, th, td {"
                    + "    border: 1px solid #ddd;"
                    + "}"
                    + "th, td {"
                    + "    padding: 10px;"
                    + "    text-align: left;"
                    + "}"
                    + ".footer {"
                    + "    background-color: #333; /* Dark color for the footer */"
                    + "    color: #fff; /* White text color */"
                    + "    text-align: center;"
                    + "    padding: 10px;"
                    + "    border-bottom-left-radius: 5px;"
                    + "    border-bottom-right-radius: 5px;"
                    + "}"
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

            Transport.send(message);

            System.out.println("Order confirmation email sent successfully.");

        } catch (MessagingException mex) {
            mex.printStackTrace();
            System.out.println("Error sending order confirmation email.");
        }
    }
}

/*
 * Created by IntelliJ IDEA.
 * @author Bhathika Nilesh
 * @since 2023/12
 */
