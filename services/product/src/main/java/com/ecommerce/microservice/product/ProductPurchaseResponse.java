package com.ecommerce.microservice.product;

import java.math.BigDecimal;

public record ProductPurchaseResponse(
        Integer product_id,
        String name,
        String description,
        BigDecimal price,
        double quantity
) {
}
