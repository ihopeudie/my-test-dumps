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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_type_id` bigint DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `sku` varchar(12) DEFAULT NULL,
  `min_price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_type_id` (`product_type_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Фанера ФСФ 1800х1200х27 мм бежевая береза','6549922',5100),(2,2,'Мягкие панели прямоугольник велюр цвет оливковый 600х300х35 мм','7018556',1880),(3,4,'Бетонная плитка Белый кирпич микс 30х7,3 см','5028272',2080),(4,3,'Плитка Мозаика 10x10 см цвет белый глянец','8028248',2500),(5,5,'Ламинат Дуб Античный серый 32 класс толщина 8 мм с фаской','9250282',4050),(6,2,'Стеновая панель МДФ Флора 1440x500x10 мм','7130981',2100.56),(7,4,'Бетонная плитка Красный кирпич 20x6,5 см','5029784',2760),(8,5,'Ламинат Канди Дизайн 33 класс толщина 8 мм с фаской','9658953',3200.96),(9,1,'Плита ДСП 11 мм влагостойкая 594x1815 мм','6026662',497.69),(10,5,'Ламинат с натуральным шпоном Дуб Эксперт толщина 6 мм с фаской','9159043',3750),(11,3,'Плитка настенная Формат 20x40 см матовая цвет мята','8588376',2500),(12,1,'Плита ДСП Кантри 16 мм 900x1200 мм','6758375',1050.96),(13,2,'Стеновая панель МДФ Сосна Полярная 60х280х4мсм цвет коричневый','7759324',1700),(14,4,'Клинкерная плитка коричневая 29,8х29,8 см','5118827',860),(15,3,'Плитка настенная Цветок 60x120 см цвет зелено-голубой','8559898',2300),(16,2,'Пробковое настенное покрытие 600х300х3 мм белый ','7259474',3300),(17,3,'Плитка настенная Нева 30x60 см цвет серый','8115947',1700),(18,4,'Гипсовая плитка настенная Дом на берегу кирпич белый 18,5х4,5 см','5033136',499),(19,5,'Ламинат Дуб Северный белый 32 класс толщина 8 мм с фаской','9028048',2550),(20,1,'Дерево волокнистая плита Дуб Винтаж 1200х620х3 мм светло-коричневый','6123459',900.5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
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
