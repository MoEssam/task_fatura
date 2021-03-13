CREATE TABLE `category` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `parent_id` int DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `parent_id_key` (`parent_id`),
    CONSTRAINT `parent_id_fk` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
) ENGINE = InnoDB  DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

CREATE TABLE `products` (
 `id` int NOT NULL AUTO_INCREMENT,
 `name` varchar(45) NOT NULL,
 `image_uri` varchar(255) DEFAULT NULL,
 `featured` tinyint(1) NOT NULL,
 `category_id` int NOT NULL,
 PRIMARY KEY (`id`),
 KEY `category_id` (`category_id`),
 CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `providers` (
 `id` int NOT NULL AUTO_INCREMENT,
 `name` varchar(45) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	
CREATE TABLE `product_providers` (
 `products_id` int NOT NULL AUTO_INCREMENT,
 `providers_id` int NOT NULL,
 `price` double NOT NULL,
 `availabe` tinyint(1) DEFAULT NULL,
 PRIMARY KEY (`products_id`,`providers_id`),
 KEY `providers_id` (`providers_id`),
 CONSTRAINT `products_id` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
 CONSTRAINT `providers_id` FOREIGN KEY (`providers_id`) REFERENCES `providers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;