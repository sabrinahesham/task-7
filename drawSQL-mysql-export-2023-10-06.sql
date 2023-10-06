CREATE TABLE `cart`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `quantity` BIGINT NOT NULL
);
CREATE TABLE `user_phone`(
    `id`.`user` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `pnone` BIGINT NOT NULL
);
CREATE TABLE `categories`(
    `id`.`cat` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `products`(
    `id`.`pro` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id`.`categories` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `quantity` BIGINT NOT NULL,
    `price` BIGINT NOT NULL,
    `order`.`id` BIGINT NOT NULL
);
CREATE TABLE `order`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id`.`user` BIGINT NOT NULL,
    `id`.`cart` BIGINT NOT NULL
);
CREATE TABLE `users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` INT NOT NULL,
    `address` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `products` ADD CONSTRAINT `products_id_categories_foreign` FOREIGN KEY(`id`.`categories`) REFERENCES `categories`(`id`.`cat`);
ALTER TABLE
    `products` ADD CONSTRAINT `products_order_id_foreign` FOREIGN KEY(`order`.`id`) REFERENCES `order`(`id`);
ALTER TABLE
    `order` ADD CONSTRAINT `order_id_user_foreign` FOREIGN KEY(`id`.`user`) REFERENCES `users`(`id`);
ALTER TABLE
    `user_phone` ADD CONSTRAINT `user_phone_id_user_foreign` FOREIGN KEY(`id`.`user`) REFERENCES `users`(`id`);
ALTER TABLE
    `order` ADD CONSTRAINT `order_id_cart_foreign` FOREIGN KEY(`id`.`cart`) REFERENCES `cart`(`id`);