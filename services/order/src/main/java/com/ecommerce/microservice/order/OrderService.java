package com.ecommerce.microservice.order;

import com.ecommerce.microservice.customer.CustomerClient;
import com.ecommerce.microservice.exception.BusinessException;
import com.ecommerce.microservice.kafka.OrderConfirmation;
import com.ecommerce.microservice.kafka.OrderProducer;
import com.ecommerce.microservice.orderline.OrderLineRequest;
import com.ecommerce.microservice.orderline.OrderLineService;
import com.ecommerce.microservice.payment.PaymentClient;
import com.ecommerce.microservice.payment.PaymentRequest;
import com.ecommerce.microservice.product.ProductClient;
import com.ecommerce.microservice.product.PurchaseRequest;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;


@Service
@RequiredArgsConstructor
@Slf4j
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderMapper orderMapper;
    private final CustomerClient customerClient;
    private final ProductClient productClient;
    private final OrderLineService orderLineService;
    private final OrderProducer orderProducer;
    private final PaymentClient paymentClient;

    @Transactional
    public Integer createOrder(OrderRequest orderRequest) {
        log.info("Attempting to find customer with ID: {}", orderRequest.customerId());
        log.info("Calling customer service at URL: {}", customerClient.toString());

        //check if customer exists --> OpenFeign
        var customer = this.customerClient.findCustomerById(orderRequest.customerId())
                .orElseThrow(() -> new BusinessException("Customer not found with provided ID::" + orderRequest.customerId()));

        //purchase products from --> product ms (RestTemplate)
        var purchasedProducts = this.productClient.purchaseProducts(orderRequest.products());

        //persist order
        var order = this.orderRepository.save(orderMapper.toOrder(orderRequest));

        //persist order lines
        for(PurchaseRequest purchaseRequest : orderRequest.products()) {
            orderLineService.saveOrderLine(
                    new OrderLineRequest(
                            null,
                            order.getId(),
                            purchaseRequest.productId(),
                            purchaseRequest.quantity()
                    )
            );
        }

        //start payment process
        var paymentRequest = new PaymentRequest(
                orderRequest.amount(),
                orderRequest.paymentMethod(),
                order.getId(),
                order.getReference(),
                customer
        );
        paymentClient.requestOrderPayment(paymentRequest);

        //send the order notification --> notification ms(kafka)
        orderProducer.sendOrderConfirmation(
                new OrderConfirmation(
                        orderRequest.reference(),
                        orderRequest.amount(),
                        orderRequest.paymentMethod(),
                        customer,
                        purchasedProducts
                )
        );
        log.info("Order confirmation sent to Kafka topic");
        return order.getId();
    }

    public List<OrderResponse> findAll() {
        return orderRepository.findAll()
                .stream()
                .map(orderMapper::fromOrder)
                .collect(Collectors.toList());
    }

    public OrderResponse findById(Integer orderId) {
        return orderRepository.findById(orderId)
                .map(orderMapper::fromOrder)
                .orElseThrow(() -> new EntityNotFoundException("Order not found with provided ID::" + orderId));
    }
}
