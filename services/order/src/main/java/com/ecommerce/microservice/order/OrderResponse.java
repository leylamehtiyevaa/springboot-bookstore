package com.ecommerce.microservice.order;

import java.math.BigDecimal;

public record OrderResponse(
        Integer id,
        String customerId,
        String reference,
        BigDecimal amount,
        PaymentMethod paymentMethod
) {
}
