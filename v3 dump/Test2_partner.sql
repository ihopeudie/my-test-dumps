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
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `director` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `inn` varchar(12) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `org_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner`
--

LOCK TABLES `partner` WRITE;
/*!40000 ALTER TABLE `partner` DISABLE KEYS */;
INSERT INTO `partner` VALUES (1,'Стройдвор','Андреева Ангелина Николаевна','angelina77@kart.ru','492 452 22 82','143001, Московская область, город Одинцово, уд. Ленина, 21','9432455179',5,'ЗАО'),(2,'Самоделка','Мельников Максим Петрович','melnikov.maksim88@hm.ru','812 267 19 59','306230, Курская область, город Обоянь, ул. 1 Мая, 89','7803888520',3,'ЗАО'),(3,'Деревянные изделия','Лазарев Алексей Сергеевич','aleksejlazarev@al.ru','922 467 93 83','238340, Калининградская область, город Светлый, ул. Морская, 12','8430391035',4,'ООО'),(4,'Декор и отделка','Саншокова Мадина Муратовна','mmsanshokova@lss.ru','413 230 30 79','685000, Магаданская область, город Магадан, ул. Горького, 15','4318170454',7,'ООО'),(5,'Паркет','Иванов Дмитрий Сергеевич','ivanov.dmitrij@mail.ru','921 851 21 22','606440, Нижегородская область, город Бор, ул. Свободы, 3','7687851800',7,'ООО'),(6,'Дом и сад','Аникеева Екатерина Алексеевна','ekaterina.anikeeva@ml.ru','499 936 29 26','393760, Тамбовская область, город Мичуринск, ул. Красная, 50','6119144874',7,'ПАО'),(7,'Легкий шаг','Богданова Ксения Владимировна','bogdanova.kseniya@bkv.ru','495 445 61 41','307370, Курская область, город Рыльск, ул. Гагарина, 16','1122170258',6,'ОАО'),(8,'СтройМатериалы','Холодова Валерия Борисовна','holodova@education.ru','499 234 56 78','140300, Московская область, город Егорьевск, ул. Советская, 24','8355114917',5,'ПАО'),(9,'Мир отделки','Крылов Савелий Тимофеевич','stkrylov@mail.ru','908 713 51 88','344116, Ростовская область, город Ростов-на-Дону, ул. Артиллерийская, 4','3532367439',8,'ОАО'),(10,'Технологии комфорта','Белов Кирилл Александрович','kirill_belov@kir.ru','918 432 12 34','164500, Архангельская область, город Северодвинск, ул. Ломоносова, 29','2362431140',4,'ОАО'),(11,'Твой дом','Демидов Дмитрий Александрович','dademidov@ml.ru','919 698 75 43','354000, Краснодарский край, город Сочи, ул. Больничная, 11','4159215346',10,'ПАО'),(12,'Новые краски','Алиев Дамир Игоревич','alievdamir@tk.ru','812 823 93 42','187556, Ленинградская область, город Тихвин, ул. Гоголя, 18','9032455179',9,'ЗАО'),(13,'Политехник','Котов Михаил Михайлович','mmkotov56@educat.ru','495 895 71 77','143960, Московская область, город Реутов, ул. Новая, 55','3776671267',5,'ОАО'),(14,'СтройАрсенал','Семенов Дмитрий Максимович','semenov.dm@mail.ru','896 123 45 56','242611, Брянская область, город Фокино, ул. Фокино, 23','7447864518',5,'ОАО'),(15,'Декор и порядок','Болотов Артем Игоревич','artembolotov@ab.ru','950 234 12 12','309500, Белгородская область, город Старый Оскол, ул. Цветочная, 20','9037040523',5,'ПАО'),(16,'Умные решения','Воронова Анастасия Валерьевна','voronova_anastasiya@mail.ru','923 233 27 69','652050, Кемеровская область, город Юрга, ул. Мира, 42','6221520857',3,'ПАО'),(17,'Натуральные покрытия','Горбунов Василий Петрович','vpgorbunov24@vvs.ru','902 688 28 96','188300, Ленинградская область, город Гатчина, пр. 25 Октября, 17','2262431140',9,'ЗАО'),(18,'СтройМастер','Смирнов Иван Андреевич','smirnov_ivan@kv.ru','917 234 75 55','184250, Мурманская область, город Кировск, пр. Ленина, 24','4155215346',9,'ООО'),(19,'Гранит','Джумаев Ахмед Умарович','dzhumaev.ahmed@amail.ru','495 452 55 95','162390, Вологодская область, город Великий Устюг, ул. Железнодорожная, 36','3961234561',5,'ООО'),(20,'Строитель','Петров Николай Тимофеевич','petrov.nikolaj31@mail.ru','916 596 15 55','188910, Ленинградская область, город Приморск, ш. Приморское, 18','9600275878',10,'ЗАО');
/*!40000 ALTER TABLE `partner` ENABLE KEYS */;
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
