CREATE DATABASE  IF NOT EXISTS `corso_gestione_aula` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `corso_gestione_aula`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: corso_gestione_aula
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `corsisti`
--

DROP TABLE IF EXISTS `corsisti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corsisti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `codice_fiscale` varchar(16) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `email` tinytext DEFAULT NULL,
  `numero_telefono` varchar(20) DEFAULT NULL,
  `indirizzo_di_residenza` varchar(50) DEFAULT NULL,
  `localita_di_residenza` varchar(80) DEFAULT NULL,
  `provincia_di_residenza` varchar(2) DEFAULT NULL,
  `cap_residenza` varchar(5) DEFAULT NULL,
  `genere` enum('M','F','N') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codice_fiscale_UNIQUE` (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsisti`
--

LOCK TABLES `corsisti` WRITE;
/*!40000 ALTER TABLE `corsisti` DISABLE KEYS */;
/*!40000 ALTER TABLE `corsisti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iscrizioni`
--

DROP TABLE IF EXISTS `iscrizioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iscrizioni` (
  `corsista_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  PRIMARY KEY (`corsista_id`,`modulo_id`),
  KEY `fk_corsisti_has_moduli_moduli1_idx` (`modulo_id`),
  KEY `fk_corsisti_has_moduli_corsisti1_idx` (`corsista_id`),
  CONSTRAINT `fk_corsisti_has_moduli_corsisti1` FOREIGN KEY (`corsista_id`) REFERENCES `corsisti` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_corsisti_has_moduli_moduli1` FOREIGN KEY (`modulo_id`) REFERENCES `moduli` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iscrizioni`
--

LOCK TABLES `iscrizioni` WRITE;
/*!40000 ALTER TABLE `iscrizioni` DISABLE KEYS */;
/*!40000 ALTER TABLE `iscrizioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moduli`
--

DROP TABLE IF EXISTS `moduli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moduli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unita_formativa_id` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `numero_ore` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_moduli_unita_formative_idx` (`unita_formativa_id`),
  CONSTRAINT `fk_moduli_unita_formative` FOREIGN KEY (`unita_formativa_id`) REFERENCES `unita_formative` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moduli`
--

LOCK TABLES `moduli` WRITE;
/*!40000 ALTER TABLE `moduli` DISABLE KEYS */;
/*!40000 ALTER TABLE `moduli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'chiave primaria',
  `nome` varchar(45) DEFAULT NULL,
  `sigla` char(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sigla_province_unique` (`sigla`),
  KEY `province_index` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unita_formative`
--

DROP TABLE IF EXISTS `unita_formative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unita_formative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) DEFAULT NULL,
  `numero_ore` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unita_formative`
--

LOCK TABLES `unita_formative` WRITE;
/*!40000 ALTER TABLE `unita_formative` DISABLE KEYS */;
INSERT INTO `unita_formative` VALUES (1,'UF1',100),(2,'UF2',80),(3,'UF3',110),(4,'UF4',115);
/*!40000 ALTER TABLE `unita_formative` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-09  9:36:12
