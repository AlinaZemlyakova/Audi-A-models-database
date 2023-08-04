-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: audi_a_models
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `body_type`
--

DROP TABLE IF EXISTS `body_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `body_type` (
  `id_body_type` int NOT NULL AUTO_INCREMENT,
  `body_type_name` varchar(45) NOT NULL,
  `door_number` int DEFAULT NULL,
  PRIMARY KEY (`id_body_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drive_gear`
--

DROP TABLE IF EXISTS `drive_gear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drive_gear` (
  `id_drive_gear` int NOT NULL AUTO_INCREMENT,
  `drive_gear_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_drive_gear`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `engine`
--

DROP TABLE IF EXISTS `engine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engine` (
  `id_engine` int NOT NULL AUTO_INCREMENT,
  `engine_name` varchar(45) DEFAULT NULL,
  `engine_size_in_l` float DEFAULT NULL,
  `max_power_in_hp` int DEFAULT NULL,
  PRIMARY KEY (`id_engine`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gearbox_type`
--

DROP TABLE IF EXISTS `gearbox_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gearbox_type` (
  `id_gearbox_type` int NOT NULL AUTO_INCREMENT,
  `gearbox_type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_gearbox_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generation`
--

DROP TABLE IF EXISTS `generation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generation` (
  `id_generation` int NOT NULL AUTO_INCREMENT,
  `generation_name` varchar(45) DEFAULT NULL,
  `release_year` year DEFAULT NULL,
  `end_year` year DEFAULT NULL,
  PRIMARY KEY (`id_generation`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_info`
--

DROP TABLE IF EXISTS `main_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_model` int NOT NULL,
  `id_generation` int NOT NULL,
  `id_body_type` int DEFAULT NULL,
  `id_transmission` int DEFAULT NULL,
  `id_engine` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `model_idx` (`id_model`),
  KEY `generation_idx` (`id_generation`),
  KEY `body_type_idx` (`id_body_type`),
  KEY `transmission_idx` (`id_transmission`),
  KEY `engine_idx` (`id_engine`),
  CONSTRAINT `body_type` FOREIGN KEY (`id_body_type`) REFERENCES `body_type` (`id_body_type`),
  CONSTRAINT `engine` FOREIGN KEY (`id_engine`) REFERENCES `engine` (`id_engine`),
  CONSTRAINT `generation` FOREIGN KEY (`id_generation`) REFERENCES `generation` (`id_generation`),
  CONSTRAINT `model` FOREIGN KEY (`id_model`) REFERENCES `model` (`id_model`),
  CONSTRAINT `transmission` FOREIGN KEY (`id_transmission`) REFERENCES `transmission` (`id_transmission`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `id_model` int NOT NULL AUTO_INCREMENT,
  `model_name` varchar(5) NOT NULL,
  PRIMARY KEY (`id_model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transmission`
--

DROP TABLE IF EXISTS `transmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transmission` (
  `id_transmission` int NOT NULL AUTO_INCREMENT,
  `id_gearbox_type` int DEFAULT NULL,
  `id_drive_gear` int DEFAULT NULL,
  PRIMARY KEY (`id_transmission`),
  KEY `gearbox_type_idx` (`id_gearbox_type`),
  KEY `drive_gear_idx` (`id_drive_gear`),
  CONSTRAINT `drive_gear` FOREIGN KEY (`id_drive_gear`) REFERENCES `drive_gear` (`id_drive_gear`),
  CONSTRAINT `gearbox_type` FOREIGN KEY (`id_gearbox_type`) REFERENCES `gearbox_type` (`id_gearbox_type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-02 20:45:10
