package com.ecommerce.microservice.kafka;

import com.ecommerce.microservice.customer.CustomerResponse;
import com.ecommerce.microservice.order.PaymentMethod;
import com.ecommerce.microservice.product.PurchaseResponse;

import java.math.BigDecimal;
import java.util.List;

public record OrderConfirmation(
        String orderReference,
        BigDecimal totalAmount,
        PaymentMethod paymentMethod,
        CustomerResponse customer,
        List<PurchaseResponse> products
) {
}
