-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: aura_eventos
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `autoid` int NOT NULL AUTO_INCREMENT,
  `contratante` int DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `horaEvento` time DEFAULT NULL,
  `qtdConvidados` int DEFAULT NULL,
  `local` varchar(255) DEFAULT NULL,
  `descricao` text,
  PRIMARY KEY (`autoid`),
  KEY `evento_ibfk_1` (`contratante`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`contratante`) REFERENCES `contratante` (`autoid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,7,'Churrasco em Família','Reuniões Familiares','2025-11-20','11:50:00',58,'Rondonópolis, MT','Encontro familiar'),(2,5,'Batizado','Cerimônias','2026-12-06','04:06:00',31,'Cuiabá, MT','Cerimônia religiosa'),(3,9,'Palestra','Educação','2025-06-30','16:41:00',21,'Sinop, MT','Palestra sobre tecnologia'),(4,10,'Workshop','Educação','2025-07-13','10:14:00',68,'Cuiabá, MT','Workshop sobre programação'),(5,8,'Encontro de Amigos','Encontros Casuais','2026-07-27','20:31:00',17,'Chapada dos Guimarães, MT','Reunião entre amigos'),(6,5,'Confraternização','Eventos Corporativos','2025-06-15','07:35:00',11,'Sinop, MT','Confraternização de fim de ano'),(7,4,'Casamento','Casamentos','2026-05-27','05:15:00',85,'Chapada dos Guimarães, MT','Cerimônia ao ar livre'),(8,2,'Casamento','Casamentos','2025-08-19','23:35:00',70,'Chapada dos Guimarães, MT','Cerimônia ao ar livre'),(9,10,'Reunião de Trabalho','Reuniões','2026-03-14','17:52:00',26,'Cuiabá, MT','Reunião de negócios'),(10,2,'Batizado','Cerimônias','2026-12-19','17:34:00',80,'Cuiabá, MT','Cerimônia religiosa'),(11,4,'Confraternização','Eventos Corporativos','2026-12-19','21:09:00',58,'Sinop, MT','Confraternização de fim de ano'),(12,1,'Encontro de Amigos','Encontros Casuais','2026-04-26','20:56:00',12,'Chapada dos Guimarães, MT','Reunião entre amigos'),(13,1,'Encontro de Amigos','Encontros Casuais','2025-04-04','07:11:00',37,'Chapada dos Guimarães, MT','Reunião entre amigos'),(14,1,'Batizado','Cerimônias','2025-01-30','05:43:00',28,'Cuiabá, MT','Cerimônia religiosa'),(15,5,'Palestra','Educação','2026-05-26','04:30:00',88,'Sinop, MT','Palestra sobre tecnologia'),(16,7,'Reunião de Trabalho','Reuniões','2026-06-12','03:40:00',34,'Cuiabá, MT','Reunião de negócios'),(17,3,'Batizado','Cerimônias','2025-02-26','13:11:00',90,'Cuiabá, MT','Cerimônia religiosa'),(18,1,'Churrasco em Família','Reuniões Familiares','2026-11-29','02:42:00',53,'Rondonópolis, MT','Encontro familiar'),(19,3,'Batizado','Cerimônias','2025-08-09','17:57:00',40,'Cuiabá, MT','Cerimônia religiosa'),(20,4,'Palestra','Educação','2025-10-01','01:03:00',25,'Sinop, MT','Palestra sobre tecnologia'),(21,1,'Workshop','Educação','2026-10-03','03:17:00',93,'Cuiabá, MT','Workshop sobre programação'),(22,6,'Batizado','Cerimônias','2026-01-25','23:19:00',37,'Cuiabá, MT','Cerimônia religiosa'),(23,7,'Encontro de Amigos','Encontros Casuais','2025-01-30','15:50:00',24,'Chapada dos Guimarães, MT','Reunião entre amigos'),(24,3,'Churrasco em Família','Reuniões Familiares','2025-01-30','21:47:00',43,'Rondonópolis, MT','Encontro familiar'),(25,2,'Casamento','Casamentos','2026-07-18','15:39:00',57,'Chapada dos Guimarães, MT','Cerimônia ao ar livre'),(26,4,'Reunião de Trabalho','Reuniões','2025-02-06','22:30:00',99,'Cuiabá, MT','Reunião de negócios'),(27,9,'Reunião de Trabalho','Reuniões','2025-01-10','08:45:00',74,'Cuiabá, MT','Reunião de negócios'),(28,5,'Jantar de Noivado','Encontros Casuais','2026-08-14','13:22:00',93,'Sinop, MT','Jantar em família'),(29,5,'Confraternização','Eventos Corporativos','2026-12-08','13:24:00',19,'Sinop, MT','Confraternização de fim de ano'),(30,6,'Jantar de Noivado','Encontros Casuais','2025-09-30','09:35:00',55,'Sinop, MT','Jantar em família'),(31,6,'Reunião de Trabalho','Reuniões','2026-06-01','16:49:00',15,'Cuiabá, MT','Reunião de negócios'),(33,7,'Reunião de Trabalho','Reuniões','2025-05-10','17:19:00',97,'Cuiabá, MT','Reunião de negócios'),(34,4,'Palestra','Educação','2026-03-24','14:54:00',66,'Sinop, MT','Palestra sobre tecnologia'),(35,6,'Palestra','Educação','2026-05-09','04:46:00',66,'Sinop, MT','Palestra sobre tecnologia'),(36,6,'Batizado','Cerimônias','2026-11-30','20:05:00',49,'Cuiabá, MT','Cerimônia religiosa'),(37,10,'Confraternização','Eventos Corporativos','2026-02-28','05:01:00',28,'Sinop, MT','Confraternização de fim de ano'),(38,5,'Festa de Aniversário','Festas','2025-02-03','06:00:00',27,'Cuiabá, MT','Aniversário infantil'),(39,4,'Jantar de Noivado','Encontros Casuais','2026-09-04','08:43:00',96,'Sinop, MT','Jantar em família'),(40,7,'Festa de Aniversário','Festas','2026-04-12','07:42:00',53,'Cuiabá, MT','Aniversário infantil');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-20 12:24:18
