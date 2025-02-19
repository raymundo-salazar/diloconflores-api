CREATE DATABASE  IF NOT EXISTS `diloconflores_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `diloconflores_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: diloconflores_db
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `action_types`
--

DROP TABLE IF EXISTS `action_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `permission_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `name` (`name`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `action_types_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_types`
--

LOCK TABLES `action_types` WRITE;
/*!40000 ALTER TABLE `action_types` DISABLE KEYS */;
INSERT INTO `action_types` VALUES (1,'1d8ed398-df30-11ef-85e8-1d8440b2bd9d','product_create','Create a new product',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(2,'1d8efba2-df30-11ef-85e8-1d8440b2bd9d','product_update','Update an existing product',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(3,'1d8efc4c-df30-11ef-85e8-1d8440b2bd9d','product_delete','Delete a product',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(4,'1d8efc92-df30-11ef-85e8-1d8440b2bd9d','product_view','View a product',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(5,'1d8efcce-df30-11ef-85e8-1d8440b2bd9d','product_add_to_cart','Add a product to the cart',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(6,'1d8efd0a-df30-11ef-85e8-1d8440b2bd9d','product_remove_from_cart','Remove a product from the cart',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(7,'1d8efd6e-df30-11ef-85e8-1d8440b2bd9d','cart_view','View shopping cart',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(8,'1d8efda0-df30-11ef-85e8-1d8440b2bd9d','cart_checkout','Initiate checkout process',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(9,'1d8efddc-df30-11ef-85e8-1d8440b2bd9d','order_create','Create a new order',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(10,'1d8efe18-df30-11ef-85e8-1d8440b2bd9d','order_update','Update an order',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(11,'1d8efe4a-df30-11ef-85e8-1d8440b2bd9d','order_cancel','Cancel an order',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(12,'1d8efe7c-df30-11ef-85e8-1d8440b2bd9d','order_complete','Complete an order',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(13,'1d8efeae-df30-11ef-85e8-1d8440b2bd9d','order_return','Return an order',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(14,'1d8efeea-df30-11ef-85e8-1d8440b2bd9d','payment_initiated','Initiate a payment process',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(15,'1d8eff1c-df30-11ef-85e8-1d8440b2bd9d','payment_success','Payment completed successfully',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(16,'1d8eff58-df30-11ef-85e8-1d8440b2bd9d','payment_failed','Payment failed',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(17,'1d8eff8a-df30-11ef-85e8-1d8440b2bd9d','payment_refund','Process a payment refund',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(18,'1d8effc6-df30-11ef-85e8-1d8440b2bd9d','user_register','Register a new user',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(19,'1d8efff8-df30-11ef-85e8-1d8440b2bd9d','user_login','User login',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(20,'1d8f002a-df30-11ef-85e8-1d8440b2bd9d','user_logout','User logout',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(21,'1d8f005c-df30-11ef-85e8-1d8440b2bd9d','user_profile_update','Update user profile',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(22,'1d8f0098-df30-11ef-85e8-1d8440b2bd9d','user_change_password','Change user password',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(23,'1d8f00d4-df30-11ef-85e8-1d8440b2bd9d','user_reset_password','Reset user password',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(24,'1d8f0106-df30-11ef-85e8-1d8440b2bd9d','review_create','Create a product review',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(25,'1d8f0142-df30-11ef-85e8-1d8440b2bd9d','review_update','Update a product review',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(26,'1d8f017e-df30-11ef-85e8-1d8440b2bd9d','review_delete','Delete a product review',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(27,'1d8f01b0-df30-11ef-85e8-1d8440b2bd9d','support_ticket_create','Create a new support ticket',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(28,'1d8f01e2-df30-11ef-85e8-1d8440b2bd9d','support_ticket_update','Update a support ticket',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(29,'1d8f0232-df30-11ef-85e8-1d8440b2bd9d','support_ticket_close','Close a support ticket',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(30,'1d8f0282-df30-11ef-85e8-1d8440b2bd9d','tracking_page_view','Track page view',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(31,'1d8f02be-df30-11ef-85e8-1d8440b2bd9d','tracking_product_click','Track product click',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(32,'1d8f02fa-df30-11ef-85e8-1d8440b2bd9d','admin_create_user','Admin creates a new user',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(33,'1d8f032c-df30-11ef-85e8-1d8440b2bd9d','admin_update_user','Admin updates a user profile',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(34,'1d8f0ce6-df30-11ef-85e8-1d8440b2bd9d','admin_delete_user','Admin deletes a user account',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(35,'1d8f0d36-df30-11ef-85e8-1d8440b2bd9d','admin_reset_password','Admin resets a user password',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(36,'1d8f0d7c-df30-11ef-85e8-1d8440b2bd9d','admin_manage_roles','Admin manages user roles',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(37,'1d8f0db8-df30-11ef-85e8-1d8440b2bd9d','admin_manage_permissions','Admin manages permissions',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(38,'1d8f0df4-df30-11ef-85e8-1d8440b2bd9d','admin_view_logs','Admin views system logs',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(39,'1d8f0e26-df30-11ef-85e8-1d8440b2bd9d','admin_clear_cache','Admin clears system cache',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(40,'1d8f0e62-df30-11ef-85e8-1d8440b2bd9d','admin_update_store_settings','Admin updates store settings',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(41,'1d8f0e94-df30-11ef-85e8-1d8440b2bd9d','admin_manage_discounts','Admin manages discount codes and promotions',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(42,'1d8f0ed0-df30-11ef-85e8-1d8440b2bd9d','admin_dashboard_access','Admin accesses the admin dashboard',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(43,'1d8f0f0c-df30-11ef-85e8-1d8440b2bd9d','employee_login','Employee logs into the system',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(44,'1d8f0f3e-df30-11ef-85e8-1d8440b2bd9d','employee_logout','Employee logs out of the system',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(45,'1d8f0f70-df30-11ef-85e8-1d8440b2bd9d','employee_order_fulfillment','Employee processes an order for shipping',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(46,'1d8f0fb6-df30-11ef-85e8-1d8440b2bd9d','employee_update_stock','Employee updates stock levels',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(47,'1d8f0ff2-df30-11ef-85e8-1d8440b2bd9d','employee_handle_returns','Employee processes a returned order',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(48,'1d8f1024-df30-11ef-85e8-1d8440b2bd9d','employee_respond_to_tickets','Employee responds to customer support tickets',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(49,'1d8f1056-df30-11ef-85e8-1d8440b2bd9d','employee_process_refund','Employee processes a refund request',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(50,'1d8f10f6-df30-11ef-85e8-1d8440b2bd9d','employee_update_product_price','Employee updates a product price',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01'),(51,'1d8f1132-df30-11ef-85e8-1d8440b2bd9d','employee_access_employee_portal','Employee accesses the employee dashboard',1,NULL,'2025-01-30 17:32:01','2025-01-30 17:32:01');
/*!40000 ALTER TABLE `action_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-10 17:44:43
