CREATE DATABASE IF NOT EXISTS homedecor;

USE homedecor;

-- Table structure for table `carts`
CREATE TABLE IF NOT EXISTS `carts` (
  `Id` int(11) NOT NULL PRIMARY KEY,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL
);

-- Dumping data for table `carts`
INSERT INTO `carts` (`Id`, `customer_id`, `product_id`, `quantity`, `price`, `sub_total`) VALUES
(1, 1, 101, 2, 20.00, 40.00),
(2, 2, 102, 1, 15.00, 15.00),
(3, 1, 103, 3, 10.00, 30.00),
(4, 3, 104, 1, 25.00, 25.00),
(5, 2, 105, 2, 18.00, 36.00);

-- Table structure for table `categories`
CREATE TABLE IF NOT EXISTS `categories` (
  `Id` int(11) NOT NULL PRIMARY KEY,
  `slug` varchar(191) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `categories`
INSERT INTO `categories` (`Id`, `slug`, `name`, `status`) VALUES
(1, 'electronics', 'Electronics', 1),
(2, 'furniture', 'Furniture', 1),
(3, 'clothing', 'Clothing', 1),
(4, 'appliances', 'Appliances', 1),
(5, 'decor', 'Home Decor', 1);


-- Table structure for table `contact_us`
CREATE TABLE IF NOT EXISTS `contact_us` (
  `Id` int(11) NOT NULL PRIMARY KEY,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

-- Dumping data for table `contact_us`
INSERT INTO `contact_us` (`Id`, `user_id`, `name`, `email`, `mobile_no`, `subject`, `description`) VALUES
(1, 1, 'John Doe', 'john@example.com', '1234567890', 'Inquiry', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(2, 2, 'Jane Smith', 'jane@example.com', '9876543210', 'Support', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.'),
(3, 3, 'Bob Johnson', 'bob@example.com', '5678901234', 'Feedback', 'Nulla facilisi. Ut sit amet semper tortor, vel accumsan leo.'),
(4, 4, 'Alice Williams', 'alice@example.com', '3456789012', 'Complaint', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.'),
(5, 5, 'Eva Davis', 'eva@example.com', '7890123456', 'Query', 'Quisque euismod libero quis felis ullamcorper scelerisque.');

-- Table structure for table `customers`
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL UNIQUE,
  `mobile_no` bigint(20) NOT NULL UNIQUE,
  `address` longtext DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table `customers`
INSERT INTO `customers` (`id`, `full_name`, `email`, `mobile_no`, `address`, `photo`, `password`) VALUES
(1, 'John Doe', 'john@example.com', 1234567890, '123 Main St, Cityville', 'john.jpg', 'password123'),
(2, 'Jane Smith', 'jane@example.com', 9876543210, '456 Oak Ave, Townsville', 'jane.jpg', 'password456'),
(3, 'Bob Johnson', 'bob@example.com', 5678901234, '789 Pine Rd, Villagetown', 'bob.jpg', 'password789'),
(4, 'Alice Williams', 'alice@example.com', 3456789012, '101 Elm St, Hamletsville', 'alice.jpg', 'passwordabc'),
(5, 'Eva Davis', 'eva@example.com', 7890123456, '202 Cedar Ave, Villageville', 'eva.jpg', 'passwordefg');

-- Table structure for table `orders`
CREATE TABLE IF NOT EXISTS `orders` (
  `Id` int(11) NOT NULL PRIMARY KEY,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `billing_subtotal` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `billing_total` decimal(10,2) DEFAULT NULL,
  `payment_gateway` int(11) DEFAULT NULL,
  `device` varchar(191) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `device_id` varchar(191) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
);

-- Dumping data for table `orders`
INSERT INTO `orders` (`Id`, `customer_id`, `delivery_date`, `billing_subtotal`, `tax`, `billing_total`, `payment_gateway`, `device`, `ip_address`, `device_id`, `status`) VALUES
(101, 1, '2023-12-17', 110.00, 8.80, 118.80, 1, 'Web', '192.168.1.1', NULL, 1),
(102, 2, '2023-12-18', 45.00, 3.60, 48.60, 2, 'iOS', '192.168.1.2', 'iOS123', 1),
(103, 3, '2023-12-19', 60.00, 4.80, 64.80, 3, 'Android', '192.168.1.3', 'android456', 1),
(104, 4, '2023-12-20', 25.00, 2.00, 27.00, 1, 'Web', '192.168.1.4', NULL, 1),
(105, 5, '2023-12-21', 36.00, 2.88, 38.88, 2, 'Android', '192.168.1.5', 'android789', 1);


-- Table structure for table `order_products`
CREATE TABLE IF NOT EXISTS `order_products` (
  `Id` int(11) NOT NULL PRIMARY KEY,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `comment` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `order_products`
INSERT INTO `order_products` (`Id`, `order_id`, `product_id`, `name`, `quantity`, `price`, `sub_total`, `comment`) VALUES
(1, 101, 201, 'Product A', 2, 20.00, 40.00, 'Needed 1 day delivery'),
(2, 102, 202, 'Product B', 1, 15.00, 15.00, NULL),
(3, 103, 203, 'Product C', 3, 10.00, 30.00, 'Gift wrapping requested'),
(4, 104, 204, 'Product D', 1, 25.00, 25.00, NULL),
(5, 105, 205, 'Product E', 2, 18.00, 36.00, 'Handle with care');

-- Table structure for table `products`
CREATE TABLE IF NOT EXISTS `products` (
  `Id` int(11) NOT NULL PRIMARY KEY,
  `category_id` int(11) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `products`
INSERT INTO `products` (`Id`, `category_id`, `slug`, `name`, `price`, `quantity`, `description`, `status`) VALUES
(201, 1, 'product-a', 'Product A', 20.00, 100, 'Description of Product A', 1),
(202, 1, 'product-b', 'Product B', 15.00, 200, 'Description of Product B', 1),
(203, 2, 'product-c', 'Product C', 10.00, 150, 'Description of Product C', 1),
(204, 2, 'product-d', 'Product D', 25.00, 120, 'Description of Product D', 1),
(205, 3, 'product-e', 'Product E', 18.00, 180, 'Description of Product E', 1);

-- Table structure for table `users`
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(190) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `password` varchar(190) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `users`
INSERT INTO `users` (`id`, `name`, `email`, `password`, `status`) VALUES
(1, 'John Doe', 'john@example.com', 'password123', 1),
(2, 'Jane Smith', 'jane@example.com', 'password456', 1),
(3, 'Bob Johnson', 'bob@example.com', 'password789', 1),
(4, 'Alice Williams', 'alice@example.com', 'passwordabc', 1),
(5, 'Eva Davis', 'eva@example.com', 'passwordefg', 1);

select * from carts