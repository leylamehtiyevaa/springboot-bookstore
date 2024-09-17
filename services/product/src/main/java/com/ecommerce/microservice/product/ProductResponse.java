package com.ecommerce.microservice.product;

import java.math.BigDecimal;

public record ProductResponse(
        Integer id,
        String name,
        String description,
        double available_quantity,
        BigDecimal price,
        Integer category_id,
        String category_name,
        String category_description
) {
}
