/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 10.4.21-MariaDB : Database - fitness_club
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fitness_club` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `fitness_club`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'sit','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(2,'consequuntur','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(3,'voluptatem','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(4,'odit','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(5,'culpa','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(6,'atque','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(7,'vero','2023-02-20 12:45:17','2023-02-20 12:45:17');

/*Table structure for table `coaches` */

DROP TABLE IF EXISTS `coaches`;

CREATE TABLE `coaches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `experience` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `started` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `coaches` */

insert  into `coaches`(`id`,`firstname`,`lastname`,`experience`,`started`,`created_at`,`updated_at`) values 
(1,'Ebony','Lehner','Et nihil ab voluptas impedit corporis. Mollitia eos consequatur provident velit deleniti quibusdam iure.','1999-12-22','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(2,'Derick','Boyer','Ea aliquam voluptatem nihil pariatur distinctio doloremque. Quam adipisci sed maxime totam. Repellendus fugiat et id.','1987-07-07','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(3,'Maeve','Wisoky','Maxime sint eveniet consequatur ullam magnam maxime ullam. Fugiat nemo fugiat et repudiandae omnis ea qui. Consectetur excepturi et maiores sit.','1978-03-09','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(7,'adasf','afafas','asfasfassf','2023-02-01','2023-02-21 20:15:42','2023-02-21 20:15:42');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2023_02_04_182435_create_categories_table',1),
(6,'2023_02_04_182501_create_types_table',1),
(7,'2023_02_04_182540_create_coaches_table',1),
(8,'2023_02_04_182618_create_services_table',1),
(9,'2023_02_04_182704_create_usages_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values 
(77,'App\\Models\\User',6,'auth_token','5ca1430473b1210c4c485f5473cccac8eccf78cafd4f428d095f9fdd543e7871','[\"*\"]','2023-02-21 21:28:24',NULL,'2023-02-21 21:28:24','2023-02-21 21:28:24');

/*Table structure for table `services` */

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `duration` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `services` */

insert  into `services`(`id`,`name`,`price`,`duration`,`description`,`type_id`,`created_at`,`updated_at`) values 
(1,'voluptas',1967.2969,51,'Modi aut distinctio iure qui iste laborum. Et perspiciatis magni quos voluptas blanditiis in. Libero modi molestiae in voluptas delectus.',1,'2023-02-20 12:45:17','2023-02-20 12:45:17'),
(2,'dahs',5603.0403,277,'Rerum quas tempora rerum repellat odit. Et ut magni voluptas. Porro nobis sit et illo.',2,'2023-02-20 12:45:17','2023-02-20 12:45:17'),
(3,'praesentium',5674.4423,144,'Laboriosam et placeat illum qui. Quisquam temporibus est officiis sunt asperiores sit. Quia aperiam aut sunt aliquam et. Optio laudantium repudiandae sit est quas unde ex.',3,'2023-02-20 12:45:17','2023-02-20 12:45:17'),
(4,'hic',6467.3259,152,'Error velit rerum esse quia tempore. Ut aperiam enim sint sit est. Sed voluptatibus est sunt nostrum deleniti consequatur labore. Ut blanditiis voluptas aut animi vel id reprehenderit.',4,'2023-02-20 12:45:17','2023-02-20 12:45:17'),
(5,'ipsa',6989.3499,42,'Et hic architecto commodi vel nesciunt. Eum ut voluptatibus laborum omnis eum. Tenetur magni sint magni iure.',5,'2023-02-20 12:45:17','2023-02-20 12:45:17'),
(6,'quis',2471.6595,343,'Ipsam sapiente ex ducimus aut voluptas. Temporibus commodi iste sed velit dolorem ut reiciendis. Molestias voluptatum incidunt voluptatum ea. Repellendus explicabo quo nobis atque assumenda.',6,'2023-02-20 12:45:17','2023-02-20 12:45:17'),
(7,'ad',2363.2125,323,'Harum ad dolores itaque vel voluptas neque ut. Sapiente corporis et et corporis harum aliquam debitis. Animi mollitia enim deleniti rerum nisi.',7,'2023-02-20 12:45:17','2023-02-20 12:45:17'),
(8,'asfafs',2333,23,'asfasfsfa',5,'2023-02-21 11:40:22','2023-02-21 11:40:22'),
(9,'asfasf',2222,32,'asfafsasf',4,'2023-02-21 11:47:11','2023-02-21 11:47:11'),
(10,'safasfafs',2333,33,'asfafsafasfa',5,'2023-02-21 11:48:43','2023-02-21 11:48:43');

/*Table structure for table `types` */

DROP TABLE IF EXISTS `types`;

CREATE TABLE `types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `types` */

insert  into `types`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'adipisci','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(2,'provident','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(3,'nam','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(4,'placeat','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(5,'aperiam','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(6,'at','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(7,'minus','2023-02-20 12:45:17','2023-02-20 12:45:17');

/*Table structure for table `usages` */

DROP TABLE IF EXISTS `usages`;

CREATE TABLE `usages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `service_id` bigint(20) unsigned NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usages_user_id_service_id_unique` (`user_id`,`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=483 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `usages` */

insert  into `usages`(`id`,`user_id`,`service_id`,`date_from`,`date_to`,`created_at`,`updated_at`) values 
(1,1,6,'2023-02-20','2024-01-29','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(2,2,7,'2023-02-20','2024-01-09','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(3,3,3,'2023-02-02','2024-11-11','2023-02-20 16:05:32','2023-02-20 16:05:32'),
(4,4,1,'2023-02-20','2023-04-12','2023-02-20 16:06:00','2023-02-20 16:06:00'),
(6,5,2,'2023-02-20','2023-11-24','2023-02-20 16:06:01','2023-02-20 16:06:01'),
(10,7,4,'2023-02-20','2023-07-22','2023-02-20 16:06:01','2023-02-20 16:06:01'),
(12,7,5,'2023-02-20','2023-04-03','2023-02-20 16:06:02','2023-02-20 16:06:02'),
(481,7,6,'2023-02-20','2024-01-29','2023-02-20 18:16:11','2023-02-20 18:16:11'),
(482,7,2,'2023-02-21','2023-11-25','2023-02-21 21:25:33','2023-02-21 21:25:33');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`firstname`,`lastname`,`birthday`,`email`,`email_verified_at`,`password`,`category_id`,`admin`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Jonatan','Rau','2004-03-10','cleora.collier@example.net','2023-02-20 12:45:17','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',1,0,'2nJ0PPxV3q','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(2,'Madalyn','Collier','1986-01-20','charity.abshire@example.net','2023-02-20 12:45:17','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',2,0,'JRfzurbwvC','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(3,'Ofelia','Gottlieb','1998-04-05','reilly.dora@example.org','2023-02-20 12:45:17','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',3,0,'WoTNRKhFqh','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(4,'Keon','Mayer','1988-05-14','qleffler@example.com','2023-02-20 12:45:17','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',4,0,'YytBulddie','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(5,'Waylon','Marvin','2010-09-24','wilma.paucek@example.org','2023-02-20 12:45:17','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',5,0,'5yL9XxL1BW','2023-02-20 12:45:17','2023-02-20 12:45:17'),
(6,'Nemanja','Gojkovic','2000-01-04','admin@gmail.com',NULL,'$2y$10$yuq.oqw7.Et3qxLOqgM34.8d4sW.k3tfk8lhc0wp8Hnh.bJap5IoK',6,1,NULL,'2023-02-20 12:45:17','2023-02-20 12:45:17'),
(7,'Filip','Filipovic','2001-06-11','filip@gmail.com',NULL,'$2y$10$FLvbK9UtSmNhQ2iEwtXwteo/rZt5Su3JqCRCeT74Iwf6HjdinY6SK',7,0,NULL,'2023-02-20 12:45:17','2023-02-20 12:45:17');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
