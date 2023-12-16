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
                                                  String selectedMobileNumber,List<Order> orders) {
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
                    + "}"
                    + ".header {"
                    + "    background-color: #0da487; /* Purple color */"
                    + "    color: #000; /* Black color */"
                    + "    padding: 8px;"
                    + "    text-align: center;"
                    + "    border-radius: 5px;"
                    + "}"
                    + "p {"
                    + "    font-size: 16px;"
                    + "    margin-bottom: 10px;"
                    + "    text-align: center;"
                    + "}"
                    + "strong {"
                    + "    color: #555;"
                    + "}"
                    + "h1 {"
                    + "    color: #ffffff;"
                    + "}"
                    + ".footer {"
                    + "    background-color: #333; /* Dark color for the footer */"
                    + "    color: #fff; /* White text color */"
                    + "    text-align: center;"
                    + "    padding: 10px;"
                    + "    position: fixed;"
                    + "    bottom: 0;"
                    + "    width: 100%;"
                    + "}"
                    + ".footer img {"
                    + "    max-width: 50px; /* Adjust the max-width of the logo as needed */"
                    + "    height: auto;"
                    + "    margin-top: -5px; /* Adjust the margin-top to align the logo with text */"
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
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='header'>"
                    + "    <h1>Green Store</h1>"
                    + "</div>"
                    + "<p>Thank you for your purchase!</p>"
                    + "<p>Your order ID is: <strong>" + orderNum + "</strong></p>"
                    + "<p>Customer Address- "
                    + "<p> Address: <strong>" + selectedAddress + "</strong> </p>"
                    + "<p> City: <strong>" + selectedCity + "</strong> </p>"
                    + "<p> Zip Code: <strong>" + selectedZipcode + "</strong> </p>"
                    + "<p>Mobile Number: <strong>" + selectedMobileNumber + "</strong></p>"
                    + "<p>Order Details:</p>"
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
                        .append("<td>").append(order.getPrice()).append("</td>")
                        .append("<td>").append(order.getPrice() * order.getQunatity()).append("</td>")
                        .append("</tr>");
            }

            emailContent.append("    </tbody>"
                    + "</table>"
                    + "<div class=\"footer\">"
                    + "    <img src=\"assets/images/logo/ftlogo.png\" alt=\"Logo\">"
                    + "    <h6 class=\"text-content\"> &copy; Green Store All rights reserved</h6>"
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
