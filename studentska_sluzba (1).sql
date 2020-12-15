-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: studentska_sluzba
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `dugovanje`
--

DROP TABLE IF EXISTS `dugovanje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dugovanje` (
  `id_dugovanje` int NOT NULL AUTO_INCREMENT,
  `ukupno` varchar(45) NOT NULL,
  `placeno(da/ne)` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_dugovanje`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dugovanje`
--

LOCK TABLES `dugovanje` WRITE;
/*!40000 ALTER TABLE `dugovanje` DISABLE KEYS */;
INSERT INTO `dugovanje` VALUES (1,'2000','Da'),(2,'2000','Ne'),(3,'1800','Da'),(4,'900','Da'),(5,'1000','Ne'),(6,'2000','Ne'),(7,'100','Da'),(8,'100','Da'),(9,'2000','Ne'),(10,'2000','Ne');
/*!40000 ALTER TABLE `dugovanje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `godina_studiranja`
--

DROP TABLE IF EXISTS `godina_studiranja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `godina_studiranja` (
  `id_godine` int NOT NULL AUTO_INCREMENT,
  `Broj` int DEFAULT NULL,
  PRIMARY KEY (`id_godine`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `godina_studiranja`
--

LOCK TABLES `godina_studiranja` WRITE;
/*!40000 ALTER TABLE `godina_studiranja` DISABLE KEYS */;
INSERT INTO `godina_studiranja` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `godina_studiranja` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `godina_studiranja_update` BEFORE UPDATE ON `godina_studiranja` FOR EACH ROW BEGIN
DECLARE msg VARCHAR(255);
 IF (NEW.broj < OLD.broj)
THEN
SET msg='Greska: nova godina studiranja je manja od stare!';
 SIGNAL sqlstate '45000' SET message_text= msg;
END IF ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `grupe`
--

DROP TABLE IF EXISTS `grupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupe` (
  `id_grupe` int NOT NULL AUTO_INCREMENT,
  `id_godine` int NOT NULL,
  PRIMARY KEY (`id_grupe`),
  KEY `id_grupafk` (`id_godine`),
  CONSTRAINT `id_grupafk` FOREIGN KEY (`id_godine`) REFERENCES `godina_studiranja` (`id_godine`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupe`
--

LOCK TABLES `grupe` WRITE;
/*!40000 ALTER TABLE `grupe` DISABLE KEYS */;
INSERT INTO `grupe` VALUES (1,1),(2,1),(3,1),(5,1),(4,2),(6,2),(7,2),(8,2),(9,2),(10,3);
/*!40000 ALTER TABLE `grupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ispit`
--

DROP TABLE IF EXISTS `ispit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ispit` (
  `id_ispit` int NOT NULL AUTO_INCREMENT,
  `id_predmet` int NOT NULL,
  `id_prijavljenih` int NOT NULL,
  `termin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_ispit`),
  KEY `id_ispitfk` (`id_predmet`),
  KEY `id_ispitfk3` (`id_prijavljenih`),
  CONSTRAINT `id_ispitfk` FOREIGN KEY (`id_predmet`) REFERENCES `predmet` (`id_predmet`),
  CONSTRAINT `id_ispitfk3` FOREIGN KEY (`id_prijavljenih`) REFERENCES `prijavljeni_ispit` (`id_prijavljeni_ispit`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ispit`
--

LOCK TABLES `ispit` WRITE;
/*!40000 ALTER TABLE `ispit` DISABLE KEYS */;
INSERT INTO `ispit` VALUES (1,1,1,'18:00'),(2,2,2,'9:00'),(3,2,3,'9:00'),(4,3,4,'10:00'),(5,5,5,'18:00'),(6,7,6,'09:00'),(7,6,7,'10:00'),(8,10,8,'13:00'),(9,8,9,'14:30'),(10,9,10,'11:00');
/*!40000 ALTER TABLE `ispit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `komentar` (
  `id_komentar` int NOT NULL,
  `komentar` longtext,
  `id_student` int NOT NULL,
  `id_profesor` int NOT NULL,
  `id_predmeta` int NOT NULL,
  PRIMARY KEY (`id_komentar`),
  KEY `komentar` (`id_student`),
  KEY `komentarfl2` (`id_profesor`),
  KEY `komentarfk3` (`id_predmeta`),
  CONSTRAINT `komentar` FOREIGN KEY (`id_student`) REFERENCES `registar_studenata` (`id_studenta`),
  CONSTRAINT `komentarfk3` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id_predmet`),
  CONSTRAINT `komentarfl2` FOREIGN KEY (`id_profesor`) REFERENCES `registar_uposlenika` (`id_uposlenika`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komentar`
--

LOCK TABLES `komentar` WRITE;
/*!40000 ALTER TABLE `komentar` DISABLE KEYS */;
INSERT INTO `komentar` VALUES (1,'Dobro',2,2,2),(2,'Uzas',3,2,3),(3,'Drugo pitanje nije uredu',4,2,4),(4,'Dobro urađeno',1,3,5),(5,'Odlicno',5,4,1),(6,'',1,1,1),(7,'',2,2,2),(8,'Solidno',3,3,3),(9,'Uredno',4,4,4),(10,'Odlično',5,5,5);
/*!40000 ALTER TABLE `komentar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konacna_ocjena`
--

DROP TABLE IF EXISTS `konacna_ocjena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konacna_ocjena` (
  `idkonacna_ocjena` int NOT NULL AUTO_INCREMENT,
  `ukupno_bodova` int DEFAULT NULL,
  `ocjena` int DEFAULT NULL,
  `id_predmeta` int NOT NULL,
  `student` int NOT NULL,
  PRIMARY KEY (`idkonacna_ocjena`),
  KEY `konacna_ocjenafk` (`id_predmeta`),
  KEY `konacna_studentfk` (`student`),
  CONSTRAINT `konacna_ocjenafk` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id_predmet`),
  CONSTRAINT `konacna_studentfk` FOREIGN KEY (`student`) REFERENCES `registar_studenata` (`id_studenta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konacna_ocjena`
--

LOCK TABLES `konacna_ocjena` WRITE;
/*!40000 ALTER TABLE `konacna_ocjena` DISABLE KEYS */;
INSERT INTO `konacna_ocjena` VALUES (1,56,6,1,1),(2,42,5,2,2),(3,95,10,3,3),(4,23,2,4,4),(5,12,1,5,5),(6,94,10,6,6),(7,83,9,7,7),(8,75,7,8,8),(9,91,10,9,9),(10,100,10,10,10);
/*!40000 ALTER TABLE `konacna_ocjena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivo_pristupa`
--

DROP TABLE IF EXISTS `nivo_pristupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivo_pristupa` (
  `idnivo_pristupa` int NOT NULL AUTO_INCREMENT,
  `Naziv_pristupa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idnivo_pristupa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivo_pristupa`
--

LOCK TABLES `nivo_pristupa` WRITE;
/*!40000 ALTER TABLE `nivo_pristupa` DISABLE KEYS */;
INSERT INTO `nivo_pristupa` VALUES (1,'Administrator'),(2,'Profesor'),(3,'Student'),(4,'Student sa privilegijama'),(5,'Moderator');
/*!40000 ALTER TABLE `nivo_pristupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predavanja`
--

DROP TABLE IF EXISTS `predavanja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predavanja` (
  `id_predavanja` int NOT NULL AUTO_INCREMENT,
  `termin` varchar(45) DEFAULT NULL,
  `id_uposlenika` int NOT NULL,
  `id_sale` int NOT NULL,
  PRIMARY KEY (`id_predavanja`),
  KEY `id_predavanjefk` (`id_uposlenika`),
  KEY `id_predavanjefk2` (`id_sale`),
  CONSTRAINT `id_predavanjefk` FOREIGN KEY (`id_uposlenika`) REFERENCES `registar_uposlenika` (`id_uposlenika`),
  CONSTRAINT `id_predavanjefk2` FOREIGN KEY (`id_sale`) REFERENCES `sale` (`id_sale`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predavanja`
--

LOCK TABLES `predavanja` WRITE;
/*!40000 ALTER TABLE `predavanja` DISABLE KEYS */;
INSERT INTO `predavanja` VALUES (1,'11:00',1,1),(2,'12:00',2,2),(3,'10:00',3,3),(4,'9:00',4,1),(5,'13:00',5,5),(6,'13:30',6,6),(7,'09:00',7,10),(8,'14:00',10,7),(9,'12:00',8,8),(10,'15:00',9,9);
/*!40000 ALTER TABLE `predavanja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predmet`
--

DROP TABLE IF EXISTS `predmet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predmet` (
  `id_predmet` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(20) DEFAULT NULL,
  `id_profesora` int NOT NULL,
  PRIMARY KEY (`id_predmet`),
  KEY `id_predmetafk` (`id_profesora`),
  CONSTRAINT `id_predmetafk` FOREIGN KEY (`id_profesora`) REFERENCES `registar_uposlenika` (`id_uposlenika`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predmet`
--

LOCK TABLES `predmet` WRITE;
/*!40000 ALTER TABLE `predmet` DISABLE KEYS */;
INSERT INTO `predmet` VALUES (1,'MUR1',1),(2,'MUR2',1),(3,'UUP',2),(4,'UBP',3),(5,'FWT',4),(6,'RP',6),(7,'LAG',7),(8,'OE',8),(9,'TP',9),(10,'IM2',10);
/*!40000 ALTER TABLE `predmet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prijavljeni_ispit`
--

DROP TABLE IF EXISTS `prijavljeni_ispit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prijavljeni_ispit` (
  `id_prijavljeni_ispit` int NOT NULL AUTO_INCREMENT,
  `ukupan_broj` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_prijavljeni_ispit`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prijavljeni_ispit`
--

LOCK TABLES `prijavljeni_ispit` WRITE;
/*!40000 ALTER TABLE `prijavljeni_ispit` DISABLE KEYS */;
INSERT INTO `prijavljeni_ispit` VALUES (1,'20'),(2,'18'),(3,'32'),(4,'89'),(5,'10'),(6,'55'),(7,'63'),(8,'38'),(9,'24'),(10,'41');
/*!40000 ALTER TABLE `prijavljeni_ispit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registar_studenata`
--

DROP TABLE IF EXISTS `registar_studenata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registar_studenata` (
  `id_studenta` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(25) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `broj` char(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `adresa` varchar(50) NOT NULL,
  `korisnicko_ime` varchar(25) NOT NULL,
  `datum_rodenja` date NOT NULL,
  `id_smjera` int NOT NULL,
  `id_nivo` int DEFAULT NULL,
  `id_grupe` int DEFAULT NULL,
  PRIMARY KEY (`id_studenta`),
  KEY `id_smjerstudentafk` (`id_smjera`),
  KEY `id_nivostudentfk_idx` (`id_nivo`),
  CONSTRAINT `id_nivostudentfk` FOREIGN KEY (`id_nivo`) REFERENCES `nivo_pristupa` (`idnivo_pristupa`),
  CONSTRAINT `id_smjerstudentafk` FOREIGN KEY (`id_smjera`) REFERENCES `smjer` (`id_smjer`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registar_studenata`
--

LOCK TABLES `registar_studenata` WRITE;
/*!40000 ALTER TABLE `registar_studenata` DISABLE KEYS */;
INSERT INTO `registar_studenata` VALUES (1,'Armin','Sloboda','033423224','arminsloboda18@gmail.com','Hadzici bb','asloboda1','2000-04-04',1,3,1),(2,'Naida','Kovacevic','033421123','naidakovacevic18@gmail.com','Hadzici bb','nkovacevic1','2001-03-03',1,3,1),(3,'Anesa','Atlic','033432567','anesaatlic18@gmail.com','Sarajevo bb','aatlic1','2001-02-01',2,4,2),(4,'Ena ','Juric','033345213','enajuric18@gmail.com','Sarajevo bb','ejuric1','2002-03-04',2,3,2),(5,'Nermana ','Kovacevic','033345212','nermanakovaeciv18@gmail.com','Mostar bb','nkovacevic2','1999-04-05',3,4,3),(6,'Mensura','Kudic','361845356','mkudic1@gmail.com','Otoka','mkudic1','2001-05-10',1,3,1),(7,'Arzija ','Pajic','361835251','arzijapajic@gmail.com','Sarajevo bb','apajic1','1997-07-11',2,3,7),(8,'Sejma','Kudic','361875745','sejmakudic@gmail.com','Sarajevo bb','skudic1','1996-12-06',2,3,10),(9,'Armin ','Sabaredzovic','361839496','arminsabaredzovic@gmail.com','Sarajevo bb','asabaredzovic1','2001-01-05',1,3,1),(10,' Omer','Bukurevic','361858389','omerbukurevic@gmail.com','Sarajevo bb','obukurevac2','2001-10-03',1,3,1);
/*!40000 ALTER TABLE `registar_studenata` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_student_update` BEFORE UPDATE ON `registar_studenata` FOR EACH ROW INSERT INTO registar_studenata_trigger
 SET action = 'update' ,
     id_studenta = OLD.id_studenta,
     ime=old.ime,
     prezime = OLD.prezime,
     adresa=old.adresa,
     korisnicko_ime=old. korisnicko_ime,
     changedat = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `registar_studenata_trigger`
--

DROP TABLE IF EXISTS `registar_studenata_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registar_studenata_trigger` (
  `id_studenta` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(25) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `adresa` varchar(50) NOT NULL,
  `korisnicko_ime` varchar(25) NOT NULL,
  `changedat` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_studenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registar_studenata_trigger`
--

LOCK TABLES `registar_studenata_trigger` WRITE;
/*!40000 ALTER TABLE `registar_studenata_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `registar_studenata_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registar_uposlenika`
--

DROP TABLE IF EXISTS `registar_uposlenika`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registar_uposlenika` (
  `id_uposlenika` int NOT NULL AUTO_INCREMENT,
  `ime` tinytext,
  `prezime` tinytext,
  `email` varchar(45) DEFAULT NULL,
  `broj_telefona` varchar(45) DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `datum_zaposlenja` date DEFAULT NULL,
  `id_nivo` int DEFAULT NULL,
  PRIMARY KEY (`id_uposlenika`),
  UNIQUE KEY `id_uposlenika_UNIQUE` (`id_uposlenika`),
  KEY `id_nivouposlenik_idx` (`id_nivo`),
  CONSTRAINT `id_nivouposlenik` FOREIGN KEY (`id_nivo`) REFERENCES `nivo_pristupa` (`idnivo_pristupa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registar_uposlenika`
--

LOCK TABLES `registar_uposlenika` WRITE;
/*!40000 ALTER TABLE `registar_uposlenika` DISABLE KEYS */;
INSERT INTO `registar_uposlenika` VALUES (1,'Anes','Basic','profesor1@gmail.com','062323125','Sarajevo bb','2020-10-03',2),(2,'Denis','Denic','profesor2@gmail.com','062323124','Tuzla bb','2020-10-02',2),(3,'Mujo ','Mujic','profesor3@gmail.com','062323123','Zenica bb','2020-10-01',5),(4,'Suljo ','Sujic','profesor4@gmail.com','062323122','Zenica bb','2020-10-04',2),(5,'Medin ','Balic','profesor5@gmail.com','062323121','Mostar bb','2020-10-05',2),(6,'Jelena','Jelenic','profesor6@gmail.com','061434958','Bihać bb','2010-10-02',2),(7,'Bob','Bobić','profesor7@gmail.com','062945394','Sanski Most bb','2014-05-03',2),(8,'Helena ','Helenic','profesor8@gmail.com','061546378','Kljuc bb','2017-04-04',2),(9,'Rob','Robic','profesor9@gmail.com','061750384','Cazin bb','2020-11-04',2),(10,'Melina','Melic','profesor10@gmail.com','062957395','Travnik bb','2029-02-12',2);
/*!40000 ALTER TABLE `registar_uposlenika` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezultati_ispita`
--

DROP TABLE IF EXISTS `rezultati_ispita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezultati_ispita` (
  `idrezultati_ispita` int NOT NULL AUTO_INCREMENT,
  `Broj_bodova` int DEFAULT NULL,
  `Ukupan_broj_bodova` int DEFAULT NULL,
  `id_studenta` int NOT NULL,
  `id_predmeta` int NOT NULL,
  `id_profesora` int NOT NULL,
  `id_ispita` int NOT NULL,
  PRIMARY KEY (`idrezultati_ispita`),
  KEY `id_rezultat` (`id_studenta`),
  KEY `id_rezultatfk2` (`id_predmeta`),
  KEY `id_rezultatfk3` (`id_profesora`),
  KEY `id_rezultatfk4` (`id_ispita`),
  CONSTRAINT `id_rezultat` FOREIGN KEY (`id_studenta`) REFERENCES `registar_studenata` (`id_studenta`),
  CONSTRAINT `id_rezultatfk2` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id_predmet`),
  CONSTRAINT `id_rezultatfk3` FOREIGN KEY (`id_profesora`) REFERENCES `registar_uposlenika` (`id_uposlenika`),
  CONSTRAINT `id_rezultatfk4` FOREIGN KEY (`id_ispita`) REFERENCES `ispit` (`id_ispit`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezultati_ispita`
--

LOCK TABLES `rezultati_ispita` WRITE;
/*!40000 ALTER TABLE `rezultati_ispita` DISABLE KEYS */;
INSERT INTO `rezultati_ispita` VALUES (1,4,4,1,1,1,1),(2,10,10,2,2,2,1),(3,18,18,3,3,3,1),(4,4,4,4,4,4,1),(5,6,6,5,5,5,1),(6,2,2,8,7,7,6),(7,20,20,6,1,1,1),(8,19,19,7,8,8,9),(9,15,15,10,5,4,5),(10,7,7,9,6,6,7);
/*!40000 ALTER TABLE `rezultati_ispita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `id_sale` int NOT NULL AUTO_INCREMENT,
  `broj_sale` int DEFAULT NULL,
  PRIMARY KEY (`id_sale`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smjer`
--

DROP TABLE IF EXISTS `smjer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smjer` (
  `id_smjer` int NOT NULL AUTO_INCREMENT,
  `naziv_smjera` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_smjer`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smjer`
--

LOCK TABLES `smjer` WRITE;
/*!40000 ALTER TABLE `smjer` DISABLE KEYS */;
INSERT INTO `smjer` VALUES (1,'RS'),(2,'RI'),(3,'TK'),(4,'AT'),(5,'EN');
/*!40000 ALTER TABLE `smjer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ugovor`
--

DROP TABLE IF EXISTS `ugovor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ugovor` (
  `id_ugovora` int NOT NULL AUTO_INCREMENT,
  `datum_potpisivanja` date DEFAULT NULL,
  `datum_isteka` date DEFAULT NULL,
  `id_dugovanje` int NOT NULL,
  `student` int NOT NULL,
  PRIMARY KEY (`id_ugovora`),
  KEY `id_ugovorfk` (`id_dugovanje`),
  KEY `ugovor_student` (`student`),
  CONSTRAINT `id_ugovorfk` FOREIGN KEY (`id_dugovanje`) REFERENCES `dugovanje` (`id_dugovanje`),
  CONSTRAINT `ugovor_student` FOREIGN KEY (`student`) REFERENCES `registar_studenata` (`id_studenta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ugovor`
--

LOCK TABLES `ugovor` WRITE;
/*!40000 ALTER TABLE `ugovor` DISABLE KEYS */;
INSERT INTO `ugovor` VALUES (1,'2020-05-05','2022-05-05',1,1),(2,'2020-05-04','2022-05-04',2,2),(3,'2020-05-03','2022-05-03',3,3),(4,'2020-05-02','2022-05-02',4,4),(5,'2020-05-01','2022-05-01',5,5),(6,'2020-10-02','2022-10-02',6,6),(7,'2020-10-10','2022-10-10',7,7),(8,'2020-03-03','2022-03-03',8,8),(9,'2020-12-12','2022-12-12',9,9),(10,'2020-01-01','2022-01-01',10,10);
/*!40000 ALTER TABLE `ugovor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zadaca`
--

DROP TABLE IF EXISTS `zadaca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zadaca` (
  `id_zadaca` int NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `broj_bodova` int DEFAULT NULL,
  `id_komentara` int NOT NULL,
  `student` int NOT NULL,
  `predmet` int NOT NULL,
  PRIMARY KEY (`id_zadaca`),
  KEY `komentar_zadaca` (`id_komentara`),
  KEY `komentar_student` (`student`),
  KEY `komentar_predmet` (`predmet`),
  CONSTRAINT `komentar_predmet` FOREIGN KEY (`predmet`) REFERENCES `predmet` (`id_predmet`),
  CONSTRAINT `komentar_student` FOREIGN KEY (`student`) REFERENCES `registar_studenata` (`id_studenta`),
  CONSTRAINT `komentar_zadaca` FOREIGN KEY (`id_komentara`) REFERENCES `komentar` (`id_komentar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zadaca`
--

LOCK TABLES `zadaca` WRITE;
/*!40000 ALTER TABLE `zadaca` DISABLE KEYS */;
INSERT INTO `zadaca` VALUES (1,'U toku',0,1,1,1),(2,'Zavrseno',4,2,2,2),(3,'Zavrseno',3,3,3,3),(4,'U toku',0,4,4,4),(5,'Prepisano',0,5,5,5),(6,'U toku',0,6,6,6),(7,'U toku',0,7,7,7),(8,'Zavrseno',2,8,8,8),(9,'Zavrseno',4,9,9,9),(10,'Prepisano',0,10,10,10);
/*!40000 ALTER TABLE `zadaca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zahtjevi`
--

DROP TABLE IF EXISTS `zahtjevi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zahtjevi` (
  `id_zahtjeva` int NOT NULL AUTO_INCREMENT,
  `svrha` varchar(30) NOT NULL,
  `datum_predaje` date NOT NULL,
  `id_studenta` int NOT NULL,
  PRIMARY KEY (`id_zahtjeva`),
  KEY `student_idfk` (`id_studenta`),
  CONSTRAINT `student_idfk` FOREIGN KEY (`id_studenta`) REFERENCES `registar_studenata` (`id_studenta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zahtjevi`
--

LOCK TABLES `zahtjevi` WRITE;
/*!40000 ALTER TABLE `zahtjevi` DISABLE KEYS */;
INSERT INTO `zahtjevi` VALUES (1,'Zdravstveno','2020-01-01',1),(2,'Prevoz','2020-01-02',1),(3,'Prevoz','2020-01-03',2),(4,'Stipendija','2020-01-04',3),(5,'Zdravstveno','2020-01-05',3),(6,'Pravo na šehidsku penziju','2020-02-05',8),(7,'Socijalni status','2020-02-06',7),(8,'Prevoz','2020-01-03',6),(9,'Stipendija','2020-01-04',6),(10,'Zdravstveno','2020-01-09',9);
/*!40000 ALTER TABLE `zahtjevi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'studentska_sluzba'
--

--
-- Dumping routines for database 'studentska_sluzba'
--
/*!50003 DROP PROCEDURE IF EXISTS `brojac` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `brojac`(
	INOUT broj_bodova INT,
    IN bodovi_parcijala INT
)
BEGIN
	SET  broj_bodova=broj_bodova + bodovi_parcijala;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Broj_studenata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Broj_studenata`()
BEGIN
	DECLARE id_studenata INT DEFAULT 0;
    
    SELECT COUNT(*) 
    INTO id_studenata
    FROM registar_studenata;
    
    SELECT id_studenata;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_smjer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_smjer`()
BEGIN
SELECT * FROM smjer;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `grupe_po_id_grupe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `grupe_po_id_grupe`(id_grupe INT)
BEGIN
IF
id_grupe IS NULL THEN
SELECT * FROM grupe;
ELSE 
SELECT * FROM grupe g
WHERE g.id_grupe=id_grupe;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `predmet_po_nazivu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `predmet_po_nazivu`(
naziv CHAR(2)
)
BEGIN
SELECT * FROM predmet p
WHERE p.naziv=naziv;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-15 22:52:48
