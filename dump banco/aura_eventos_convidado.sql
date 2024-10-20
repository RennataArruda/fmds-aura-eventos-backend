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
-- Table structure for table `convidado`
--

DROP TABLE IF EXISTS `convidado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convidado` (
  `autoid` int NOT NULL AUTO_INCREMENT,
  `eventoId` int DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`autoid`),
  KEY `convidado_ibfk_1` (`eventoId`),
  CONSTRAINT `convidado_ibfk_1` FOREIGN KEY (`eventoId`) REFERENCES `evento` (`autoid`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convidado`
--

LOCK TABLES `convidado` WRITE;
/*!40000 ALTER TABLE `convidado` DISABLE KEYS */;
INSERT INTO `convidado` VALUES (1,1,'Changbin','6598989865',1),(2,1,'Patricia','6598989333',0),(3,1,'Ana Beatriz','6598989555',0),(4,1,'Fernanda','6598989454',1),(5,1,'Lucas','6598989122',0),(6,2,'Fernanda','6598989454',0),(7,2,'Marcos','6598989432',0),(8,2,'Fernanda','6598989454',1),(9,3,'Ana Beatriz','6598989555',1),(10,3,'Changbin','6598989865',1),(11,3,'Ana Beatriz','6598989555',0),(12,3,'Ana Beatriz','6598989555',0),(13,4,'Lucas','6598989122',0),(14,4,'Carlos','6598989121',0),(15,4,'Juliana','6598989645',1),(16,4,'Patricia','6598989333',0),(17,5,'Patricia','6598989333',1),(18,5,'Carlos','6598989121',1),(19,5,'Felix','6598989342',0),(20,6,'Patricia','6598989333',1),(21,6,'Lucas','6598989122',1),(22,6,'Marcos','6598989432',1),(23,6,'Marcos','6598989432',1),(24,7,'Carlos','6598989121',1),(25,7,'Changbin','6598989865',0),(26,7,'Felix','6598989342',0),(27,7,'Ana Beatriz','6598989555',0),(28,7,'Changbin','6598989865',0),(29,8,'Patricia','6598989333',0),(30,8,'Carlos','6598989121',1),(31,8,'Felix','6598989342',1),(32,8,'Ana Beatriz','6598989555',1),(33,9,'Lucas','6598989122',1),(34,9,'Marcos','6598989432',0),(35,10,'Carla','6565656963',0),(36,10,'Changbin','6598989865',1),(37,10,'Patricia','6598989333',1),(38,11,'Juliana','6598989645',0),(39,12,'Fernanda','6598989454',0),(40,12,'Carlos','6598989121',0),(41,13,'Carlos','6598989121',0),(42,13,'Marcos','6598989432',1),(43,13,'Patricia','6598989333',0),(44,13,'Lucas','6598989122',0),(45,13,'Patricia','6598989333',0),(46,14,'Fernanda','6598989454',1),(47,14,'Carlos','6598989121',1),(48,14,'Carlos','6598989121',1),(49,15,'Carla','6565656963',0),(50,15,'Carlos','6598989121',1),(51,15,'Changbin','6598989865',0),(52,15,'Carlos','6598989121',0),(53,15,'Changbin','6598989865',1),(54,16,'Juliana','6598989645',0),(55,16,'Carla','6565656963',1),(56,16,'Carlos','6598989121',0),(57,16,'Lucas','6598989122',1),(58,17,'Carla','6565656963',1),(59,18,'Felix','6598989342',0),(60,18,'Ana Beatriz','6598989555',0),(61,18,'Ana Beatriz','6598989555',1),(62,18,'Felix','6598989342',0),(63,18,'Changbin','6598989865',1),(64,19,'Ana Beatriz','6598989555',0),(65,20,'Carla','6565656963',1),(66,20,'Felix','6598989342',0),(67,20,'Patricia','6598989333',1),(68,21,'Changbin','6598989865',0),(69,21,'Ana Beatriz','6598989555',0),(70,21,'Lucas','6598989122',1),(71,21,'Carlos','6598989121',0),(72,22,'Lucas','6598989122',1),(73,22,'Juliana','6598989645',0),(74,22,'Changbin','6598989865',1),(75,22,'Felix','6598989342',0),(76,22,'Lucas','6598989122',0),(77,23,'Lucas','6598989122',1),(78,23,'Marcos','6598989432',0),(79,24,'Carla','6565656963',0),(80,24,'Ana Beatriz','6598989555',1),(81,24,'Carla','6565656963',1),(82,25,'Juliana','6598989645',0),(83,25,'Marcos','6598989432',1),(84,25,'Juliana','6598989645',0),(85,26,'Fernanda','6598989454',1),(89,28,'Carlos','6598989121',0),(90,29,'Ana Beatriz','6598989555',0),(91,30,'Carlos','6598989121',1),(92,31,'Fernanda','6598989454',1),(93,31,'Ana Beatriz','6598989555',0),(94,31,'Patricia','6598989333',1),(95,31,'Fernanda','6598989454',1),(96,31,'Carla','6565656963',0),(102,33,'Carlos','6598989121',1),(103,33,'Carlos','6598989121',0),(104,33,'Carla','6565656963',1),(105,34,'Carla','6565656963',1),(106,34,'Patricia','6598989333',0),(107,34,'Marcos','6598989432',1),(108,34,'Felix','6598989342',1),(109,34,'Fernanda','6598989454',0),(110,35,'Juliana','6598989645',1),(111,36,'Patricia','6598989333',0),(112,36,'Lucas','6598989122',1),(113,36,'Ana Beatriz','6598989555',1),(114,36,'Marcos','6598989432',1),(115,36,'Carla','6565656963',1),(116,37,'Lucas','6598989122',1),(117,37,'Changbin','6598989865',0),(118,38,'Fernanda','6598989454',1),(119,38,'Juliana','6598989645',1),(120,38,'Patricia','6598989333',1),(121,38,'Changbin','6598989865',0),(122,39,'Ana Beatriz','6598989555',0),(123,39,'Changbin','6598989865',1),(124,40,'Marcos','6598989432',1),(125,40,'Patricia','6598989333',0),(126,40,'Marcos','6598989432',1),(127,40,'Patricia','6598989333',1),(128,40,'Lucas','6598989122',0),(144,27,'Marcos','6598989432',1),(145,27,'Fernanda','6598989454',1),(146,27,'Juliana','6598989645',1),(147,27,'Fernanda','6598989454',1);
/*!40000 ALTER TABLE `convidado` ENABLE KEYS */;
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
