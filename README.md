# E-Commerce Microservices Project

This project is a cloud-native e-commerce platform built using microservices architecture with Spring Boot 3 and Spring Cloud. It features distributed services for customer management, product catalog, order processing, payment, and notifications.

## Architecture

Here is the overall architecture of the microservices system:
![E-Commerce Microservices Domain Model](<img width="1088" alt="Screenshot 2024-08-23 at 00 50 15" src="https://github.com/user-attachments/assets/a7b1312f-50f3-47aa-b69e-b67f9ee2f023">)

- **Customer Domain**: Manages customer information, including the customer details and address.
- **Product Domain**: Contains details about products and their categories.
- **Order Domain**: Handles customer orders and includes the order lines.
- **Payment Domain**: Processes customer payments for the orders.
- **Notification Domain**: Sends notifications related to orders and payments.

Each service is isolated by domain, ensuring scalability and easier maintenance.

### Key Components

1. **API Gateway**:  
   It routes requests to the appropriate microservices (`/customers`, `/products`, `/orders`).

2. **Customer Service**:  
   Manages customer information and stores data in a MongoDB database.

3. **Product Service**:  
   Handles product information and uses a PostgreSQL database for storage.

4. **Order Service**:  
   Processes customer orders, interacts with the product service to retrieve product details, and uses PostgreSQL for order data persistence.

5. **Payment Service**:  
   Manages payment processing and communicates asynchronously with the `Message Broker` to send payment confirmations.

6. **Message Broker (Kafka)**:  
   Facilitates asynchronous communication between services (e.g., sending payment and order confirmations).

7. **Notification Service**:  
   Listens for messages from the message broker to send notifications to customers about their orders.

8. **Eureka Server**:  
   A service registry that allows microservices to discover each other dynamically.

9. **Config Server**:  
   Centralized configuration management for all services.

10. **Distributed Tracing**:  
    A system for tracking requests across different microservices to help monitor and debug the distributed system.

## Technologies Used
- **Backend**: Spring Boot 3, Spring Cloud
- **Databases**: 
  - MongoDB (for Customer and Notification services)
  - PostgreSQL (for Product and Order services)
- **Message Broker**: Apache Kafka
- **Service Discovery**: Eureka Server
- **Configuration Management**: Spring Cloud Config Server
- **Distributed Tracing**: Sleuth/Zipkin
- **Containerization**: Docker
