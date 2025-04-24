package com.zosh.service.implementation;

import com.zosh.model.Order;
import com.zosh.model.PaymentResponse;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;
import com.zosh.service.PaymentService;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImplementation implements PaymentService {


	@Value("${stripe.api.key}")
	private String stripeSecretKey;

	@Override
	public PaymentResponse generatePaymentLink(Order order) throws StripeException {

		Stripe.apiKey = stripeSecretKey;

		// Tạo đối tượng params cho phiên thanh toán của Stripe
		SessionCreateParams params = SessionCreateParams.builder()
				.addPaymentMethodType(SessionCreateParams.PaymentMethodType.CARD)
				.setMode(SessionCreateParams.Mode.PAYMENT)
				.setSuccessUrl("http://localhost:3000/payment/success/" + order.getId())
				.setCancelUrl("http://localhost:3000/cart")
				.addLineItem(SessionCreateParams.LineItem.builder()
						.setQuantity(1L)
						.setPriceData(SessionCreateParams.LineItem.PriceData.builder()
								.setCurrency("usd")
								.setUnitAmount((long) (order.getTotalAmount() + 6000) * 100)
								.setProductData(SessionCreateParams.LineItem.PriceData.ProductData.builder()
										.setName("Giá trị đơn hàng")
										.build())
								.build())
						.build())
				.build();

		Session session = Session.create(params);

		System.out.println("section-----------------" + session);
		PaymentResponse res = new PaymentResponse();
		res.setPayment_url(session.getUrl());

		return res;
	}

}
