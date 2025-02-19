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
-- Table structure for table `whatsapp_chat_medias`
--

DROP TABLE IF EXISTS `whatsapp_chat_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `whatsapp_chat_medias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `message_id` int NOT NULL,
  `bucket_name` varchar(255) NOT NULL,
  `object_name` varchar(255) NOT NULL,
  `media_type` enum('image','audio','video','document','sticker','voice','ptt','gif') NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  `size` int NOT NULL,
  `caption` text NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `width` int NOT NULL DEFAULT '0',
  `height` int NOT NULL DEFAULT '0',
  `is_view_once` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `whatsapp_chat_medias_message_id_foreign` (`message_id`),
  CONSTRAINT `whatsapp_chat_medias_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `whatsapp_chat_messages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whatsapp_chat_medias`
--

LOCK TABLES `whatsapp_chat_medias` WRITE;
/*!40000 ALTER TABLE `whatsapp_chat_medias` DISABLE KEYS */;
INSERT INTO `whatsapp_chat_medias` VALUES (1,'29815585-9e0b-4cfc-b076-bcb5da4fcf02',5,'local','/Users/raymundo-salazar/_WORK/_DILOCONFLORES/diloconflores-api/downloads/3EB00EC9BA30F23710440E.jpeg','image','image/jpeg',0,'naranja',NULL,0,0,0,'2025-02-05 15:11:44','2025-02-05 15:11:44'),(2,'735f0540-153e-4f19-b3e7-316b041a1b23',7,'local','/Users/raymundo-salazar/_WORK/_DILOCONFLORES/diloconflores-api/downloads/3EB060C002EA1DC9A28735.jpeg','image','image/jpeg',76500,'asfasfsfasfasfasfasf',NULL,1485,1600,0,'2025-02-05 16:16:31','2025-02-05 16:16:31');
/*!40000 ALTER TABLE `whatsapp_chat_medias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-10 17:44:41
