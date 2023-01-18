DROP TABLE IF EXISTS `role_has_model`;
CREATE TABLE `role_has_model`
(
    `id`      int NOT NULL AUTO_INCREMENT,
    `role_id` int DEFAULT NULL,
    `user_id` int DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`
(
    `id`    int NOT NULL AUTO_INCREMENT,
    `name`  varchar(100) DEFAULT NULL,
    `model` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`
(
    `id`   int NOT NULL AUTO_INCREMENT,
    `name` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `role_has_model` (`id`, `role_id`, `user_id`)
VALUES (1, 1, 1),
       (2, 1, 2),
       (3, 2, 1);

INSERT INTO `roles` (`id`, `name`, `model`)
VALUES (1, 'admin', NULL),
       (2, 'user', NULL);

INSERT INTO `users` (`id`, `name`)
VALUES (1, 'kartubi');