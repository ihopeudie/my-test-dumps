-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: Test2
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` varchar(200) DEFAULT NULL,
  `partner_id` varchar(200) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,'4','1',2000),(2,'5','2',3000),(3,'1','3',1000),(4,'3','4',9500),(5,'1','5',2000),(6,'18','6',1100),(7,'12','7',5000),(8,'1','8',2500),(9,'2','9',6000),(10,'6','10',7000),(11,'4','11',5000),(12,'4','12',7500),(13,'1','13',3000),(14,'18','14',500),(15,'16','15',7000),(16,'9','16',4000),(17,'1','17',3500),(18,'1','18',7900),(19,'15','19',9600),(20,'15','20',1200),(21,'11','1',1500),(22,'8','2',3000),(23,'2','3',3010),(24,'7','4',3020),(25,'5','5',3050),(26,'14','6',3040),(27,'19','7',3050),(28,'4','8',3060),(29,'18','9',3070),(30,'9','10',5400),(31,'12','11',5500),(32,'11','12',5600),(33,'9','13',5700),(34,'14','14',5800),(35,'2','15',5900),(36,'12','16',6000),(37,'6','17',6100),(38,'9','18',8000),(39,'3','19',7060),(40,'17','20',6120),(41,NULL,'1',5180),(42,'10','2',4240),(43,'10','3',3300),(44,'10','4',2360),(45,'8','5',1420),(46,'11','6',1500),(47,'5','7',1700),(48,'12','8',1900),(49,'15','9',2100),(50,'12','10',2300),(51,'8','11',2500),(52,'15','12',2700),(53,'12','13',2900),(54,'1','14',3100),(55,'18','15',3300),(56,'20','16',3500),(57,'10','17',3750),(58,'14','18',6700),(59,'7','19',6950),(60,'11','20',7200),(61,'17','1',7450),(62,'19','2',7700),(63,'20','3',7950),(64,'8','4',8200),(65,'10','5',8450),(66,'7','6',8700),(67,'8','7',8950),(68,'20','8',9200),(69,'4','9',1300),(70,'16','10',1500),(71,'16','11',1700),(72,'12','12',1900),(73,'20','13',2100),(74,'9','14',2300),(75,'13','15',2500),(76,'13','16',2700),(77,'12','17',2900),(78,'3','18',3100),(79,'14','19',3300),(80,'18','20',3500);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-30 22:52:50
