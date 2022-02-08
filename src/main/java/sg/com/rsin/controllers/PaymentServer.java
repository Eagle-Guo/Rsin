package sg.com.rsin.controllers;

import static spark.Spark.staticFiles;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;

@Controller
public class PaymentServer {
	
	@Value("${payment.key}")
	String apiKey;
	
	@RequestMapping(value = "/create-checkout-session", method = RequestMethod.POST)
	public void newCompanyConfirmation(HttpServletRequest request, HttpServletResponse response) {
		
		Stripe.apiKey = apiKey;
		Long amount = Long.parseLong(request.getParameter("paymentamount")) * 100;
	    staticFiles.externalLocation(Paths.get("public").toAbsolutePath().toString());
	    
	        String YOUR_DOMAIN = "http://ec2-13-212-176-13.ap-southeast-1.compute.amazonaws.com:8080";
	        SessionCreateParams params =
	          SessionCreateParams.builder()
	            .addPaymentMethodType(SessionCreateParams.PaymentMethodType.CARD)
	            .setMode(SessionCreateParams.Mode.PAYMENT)
	            .setSuccessUrl(YOUR_DOMAIN + "/payment/success")
	            .setCancelUrl(YOUR_DOMAIN + "/payment/cancel")
	            .addLineItem(
	              SessionCreateParams.LineItem.builder()
	                .setQuantity(1L)
	                // Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
	                //.setPrice("price_1JkPEpD35qutlqWwvdAivsyF")
	                .setPriceData(
	                        SessionCreateParams.LineItem.PriceData.builder()
	                        .setCurrency("sgd").setUnitAmount(amount).setProductData(
	                               SessionCreateParams.LineItem.PriceData.ProductData.builder().setName("RsinService").build())
	                             .build())

	            .build()).build();
	      Session session;
		try {
			session = Session.create(params);
			response.sendRedirect(session.getUrl());
		} catch (StripeException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	} 
}
