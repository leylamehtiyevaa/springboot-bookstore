package com.ecommerce.microservice.payment;

import com.ecommerce.microservice.customer.CustomerResponse;
import com.ecommerce.microservice.order.PaymentMethod;

import java.math.BigDecimal;

public record PaymentRequest(
        BigDecimal amount,
        PaymentMethod paymentMethod,
        Integer orderId,
        String orderReference,
        CustomerResponse customer
) {
}
