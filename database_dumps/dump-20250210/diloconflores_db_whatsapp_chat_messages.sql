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
-- Table structure for table `whatsapp_chat_messages`
--

DROP TABLE IF EXISTS `whatsapp_chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `whatsapp_chat_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `sender` enum('user','bot','system','self') NOT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `session_id` int NOT NULL,
  `user_id` int NOT NULL,
  `message` text NOT NULL,
  `type` enum('text','image','audio','video','document','location','contact') NOT NULL,
  `forwarded` tinyint(1) NOT NULL DEFAULT '0',
  `has_media` tinyint(1) NOT NULL DEFAULT '0',
  `edited` tinyint(1) NOT NULL DEFAULT '0',
  `old_chat_id` int DEFAULT NULL,
  `revoke_reason` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `whatsapp_chat_messages_session_id_foreign` (`session_id`),
  KEY `whatsapp_chat_messages_user_id_foreign` (`user_id`),
  CONSTRAINT `whatsapp_chat_messages_session_id_foreign` FOREIGN KEY (`session_id`) REFERENCES `whatsapp_chat_sessions` (`id`),
  CONSTRAINT `whatsapp_chat_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `whatsapp_chat_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whatsapp_chat_messages`
--

LOCK TABLES `whatsapp_chat_messages` WRITE;
/*!40000 ALTER TABLE `whatsapp_chat_messages` DISABLE KEYS */;
INSERT INTO `whatsapp_chat_messages` VALUES (1,'ba5214f2-863a-4519-bda9-d90740828191','user',NULL,1,1,'321','text',0,0,0,NULL,NULL,'2025-02-05 02:55:35','2025-02-05 02:55:35',NULL),(2,'a4f47e2c-a3ac-4ea3-b6aa-5d2dee97aa2a','user',NULL,1,1,'3216549687','image',0,1,0,NULL,NULL,'2025-02-05 03:03:59','2025-02-05 03:03:59',NULL),(3,'5fe09f37-beb3-4702-b4fb-fe7908b1fc5d','user',NULL,1,1,'123456789987654321','image',0,1,0,NULL,NULL,'2025-02-05 15:07:34','2025-02-05 15:07:34',NULL),(4,'669ee2c2-f441-46ff-be60-819417a454d1','user',NULL,1,1,'anaranjado','image',0,1,0,NULL,NULL,'2025-02-05 15:09:40','2025-02-05 15:09:40',NULL),(5,'1eeba140-6be4-4120-88d7-70a606541dae','user',NULL,1,1,'naranja','image',0,1,0,NULL,NULL,'2025-02-05 15:11:43','2025-02-05 15:11:43',NULL),(6,'a196f9e5-db25-4c2d-8d9f-e1e254639399','user','3EB0A1FFDDFEA618916A67',1,1,'Message','text',0,0,0,NULL,NULL,'2025-02-05 16:06:43','2025-02-05 16:06:43',NULL),(7,'1370a0a1-d032-4952-8696-f11c769e9867','user','3EB060C002EA1DC9A28735',1,1,'asfasfsfasfasfasfasf','image',0,1,0,NULL,NULL,'2025-02-05 16:16:30','2025-02-05 16:16:30',NULL),(8,'6731e8d8-145e-429e-bb4e-8610a9b18ffd','user','3EB003DDD95EB8E3C3DDF1',1,1,'mensaje','text',0,0,0,NULL,NULL,'2025-02-05 17:00:41','2025-02-05 17:00:41',NULL),(9,'cc83fd38-1920-41ab-8734-5dec791c1daf','user','3EB0662076B311DAAEB1EE',1,1,'321321','text',0,0,0,NULL,NULL,'2025-02-05 17:02:43','2025-02-05 17:02:43',NULL),(10,'a1f9a760-f384-45a8-8b5b-7c8111e25899','user','3EB098C4250011C3B5E17F',1,1,'Este mensaje que estoy enviando se va a eliminar un tiempo despues.','text',0,0,0,NULL,NULL,'2025-02-05 17:21:13','2025-02-05 17:21:13',NULL),(11,'0bfeb833-0af9-4ca3-8c0e-faf9f616907c','user','3EB02EA8EEC75B554C8941',1,1,'Este msnaje se va a eliminar','text',0,0,0,NULL,NULL,'2025-02-05 17:23:15','2025-02-05 17:23:15',NULL),(12,'6584f757-c9f8-455f-8900-c0fc1e869147','user','3EB0B538EEF105993FCF6B',1,1,'Este otro mensaje tambein se va a eliminar','text',0,0,0,NULL,NULL,'2025-02-05 17:27:35','2025-02-05 17:27:35',NULL),(13,'55d20312-0ccf-4f5c-b1a0-fdf14fe431c9','user','3EB001F1BCE4D052354072',1,1,'Este mensaje qse va a eliminar','text',0,0,0,NULL,NULL,'2025-02-05 17:29:46','2025-02-05 17:29:54','2025-02-05 17:29:54'),(14,'f722d197-190a-47f1-9863-10cc8fe02c55','user','3EB09CB5C1A84B2698EC1D',1,1,'Este mensaje se esta eliminando tambien','text',0,0,0,NULL,'REVOKE_BY_USER','2025-02-05 17:35:14','2025-02-05 17:35:36','2025-02-05 17:35:36'),(15,'530f1b0a-a60a-4e82-81ef-ac33b726b76c','user','3EB0C7A0BC76A66FA55930',1,1,'Este mensaje se va a eliminar por el receptor','text',0,0,0,NULL,NULL,'2025-02-05 17:39:43','2025-02-05 17:39:43',NULL),(16,'0053c90b-343b-4019-8761-a945f6a1791f','user','3EB07B0AE2BFF125B9A925',1,1,'Este mensaje se va a eliminar por el receptor','text',0,0,0,NULL,NULL,'2025-02-05 22:41:48','2025-02-05 22:41:48',NULL),(17,'bfb105ee-63d7-4f82-b085-eab7418cb8f3','user','3EB0DA5ED59B6954369187',1,1,'321321','text',0,0,0,NULL,'REVOKE_BY_RECEIVER','2025-02-05 22:45:49','2025-02-05 22:46:05','2025-02-05 22:46:05'),(18,'865968e0-a8d5-429d-bf0a-e27548ca3ff6','user','3EB0B62FADDC4FF6363D00',1,1,'Este mensaje se eliminara desde el telefono','text',0,0,0,NULL,'REVOKE_BY_RECEIVER','2025-02-05 22:50:29','2025-02-05 22:52:37','2025-02-05 22:52:37'),(19,'21f72bae-9132-4070-909c-7f7c6a2bd546','user','3EB0BFE9A61762D61EBDD3',1,1,'Este mensaje es para verificar que se guarden dos mensajes seguidos sin problema','text',0,0,0,NULL,NULL,'2025-02-05 22:50:53','2025-02-05 22:50:53',NULL),(20,'03115fba-a92c-4ee4-8861-099d8376c7b9','user','3EB05DCA1E760B793A38B7',1,1,'Ahora va un tercer mensaje','text',0,0,0,NULL,NULL,'2025-02-05 22:51:06','2025-02-05 22:51:06',NULL),(21,'f7e2dee9-43b1-4fed-b26d-5967a78df944','user','3EB0916B4B1F85E54BC3A9',1,1,'Este mensaje se envia','text',0,0,0,NULL,'REVOKE_BY_EDIT','2025-02-05 23:06:46','2025-02-05 23:07:09','2025-02-05 23:07:09'),(22,'0ff978f6-76b9-4c1f-9763-27b19ae694c9','user','3EB0916B4B1F85E54BC3A9',1,1,'Este mensaje se envia. Ahora realizo algunas modificaciones','text',0,0,1,21,NULL,'2025-02-05 23:07:09','2025-02-05 23:07:09',NULL);
/*!40000 ALTER TABLE `whatsapp_chat_messages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-10 17:44:34
