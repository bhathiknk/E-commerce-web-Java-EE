package com.greenstore.servlet.Paypal;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import com.greenstore.model.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/paypal-Payment")
public class PayPalPaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

        double total = Double.parseDouble(request.getParameter("total"));



        String cancelUrl = "http://localhost:8080/cancel"; // Replace with your cancel URL
        String successUrl = "http://localhost:8080/success"; // Replace with your success URL

        // Set up the payment
        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(String.format("%.2f", total));

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription("Payment for Green Store Products");

        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);

        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        Payment payment = new Payment();
        payment.setIntent("sale");
        payment.setPayer(payer);
        payment.setTransactions(transactions);

        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl(cancelUrl);
        redirectUrls.setReturnUrl(successUrl);
        payment.setRedirectUrls(redirectUrls);

        try {
            APIContext apiContext = new APIContext("ARQyk4Cfn32QiSJtEfkvSFXs6oR5VhPpXNzWHg8aDS7mArEIiUZg-y09D6kJuxgKDdxemvS35SfzGsn0", "ECTgqZwZksutXKZ8XdfEJd6lfuwT9O2e2eFImTMXSmF787yhaiU2EFfXVT_mbREIbUq3IYBnUwTb84vH", "sandbox");
            Payment createdPayment = payment.create(apiContext);
            String redirectUrl = createdPayment.getLinks().stream()
                    .filter(link -> "approval_url".equals(link.getRel()))
                    .findFirst()
                    .orElseThrow(() -> new RuntimeException("No 'approval_url' found"))
                    .getHref();
            response.sendRedirect(redirectUrl);
        } catch (PayPalRESTException e) {
            e.printStackTrace();
            response.sendRedirect(cancelUrl);
        }
    }
}

