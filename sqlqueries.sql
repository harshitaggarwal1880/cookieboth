-- MySQL dump 10.19  Distrib 10.3.35-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: lesSurdoues
-- ------------------------------------------------------
-- Server version	10.3.35-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chargesEcole`
--

DROP TABLE IF EXISTS `chargesEcole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chargesEcole` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `categorie` varchar(200) NOT NULL,
  `datePaiement` date NOT NULL,
  `montantPaye` int(11) NOT NULL,
  `electriciteMois` varchar(200) DEFAULT NULL,
  `poste` varchar(200) DEFAULT NULL,
  `libelle` varchar(200) DEFAULT NULL,
  `commentaire` varchar(300) DEFAULT NULL,
  `nomPrenom` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chargesEcole`
--

LOCK TABLES `chargesEcole` WRITE;
/*!40000 ALTER TABLE `chargesEcole` DISABLE KEYS */;
INSERT INTO `chargesEcole` VALUES (15,'electricite','2023-08-17',655,'juin','undefined','undefined','undefined','undefined'),(16,'salaire','2023-08-18',500,'undefined','enseignant','undefined','ce salaire','eny ge'),(17,'salaire','2023-09-10',67,'undefined','enseignant','undefined','ghd','enye franky'),(18,'autreCharge','2023-09-20',500,'undefined','undefined','ménagère','test vanelle','undefined'),(19,'salaire','2023-09-27',500,'undefined','administration','undefined','test vanelle','Amewa vanelle'),(20,'salaire','2023-09-12',50,'undefined','administration','undefined','test van','vanelle'),(21,'electricite','2023-09-11',50,'septembre','undefined','undefined','undefined','undefined');
/*!40000 ALTER TABLE `chargesEcole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `effectif` int(100) DEFAULT NULL,
  `enseignant` text NOT NULL,
  `personnels_id` int(100) DEFAULT NULL,
  `section_id` int(100) DEFAULT NULL,
  `utilisateurs_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_utilisateurs` (`utilisateurs_id`),
  KEY `section_id` (`section_id`),
  KEY `enseignant` (`enseignant`(768)),
  KEY `personnels_id` (`personnels_id`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`),
  CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`),
  CONSTRAINT `classes_ibfk_3` FOREIGN KEY (`personnels_id`) REFERENCES `personnels` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (76,'class 2',0,'naa nadine',NULL,1,4),(77,'cm2',5,'Fullbasard Fullbasard',47,2,4),(78,'cm1',3,'charlessssss',NULL,2,4),(79,'class 0',1,'enyegue',NULL,1,4),(80,'ce2',NULL,'francis',NULL,2,4);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directeur`
--

DROP TABLE IF EXISTS `directeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directeur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `utilisateurs_id` int(11) DEFAULT NULL,
  `telephone` int(11) NOT NULL,
  `section` text NOT NULL,
  `email` varchar(500) NOT NULL,
  `salaire` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_utilisateurs` (`utilisateurs_id`),
  CONSTRAINT `directeur_ibfk_1` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directeur`
--

LOCK TABLES `directeur` WRITE;
/*!40000 ALTER TABLE `directeur` DISABLE KEYS */;
/*!40000 ALTER TABLE `directeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleves`
--

DROP TABLE IF EXISTS `eleves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleves` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `anciennete` varchar(100) DEFAULT NULL,
  `decouverteDateArrivee` varchar(200) DEFAULT NULL,
  `nom` varchar(300) NOT NULL,
  `prenom` varchar(300) NOT NULL,
  `dateNaissance` date NOT NULL,
  `section_id` int(100) NOT NULL,
  `classes_id` int(100) DEFAULT NULL,
  `entreesArgent_id` int(11) DEFAULT NULL,
  `scolariteTotale` int(200) DEFAULT NULL,
  `tenueClasseTotale` int(200) DEFAULT NULL,
  `transportTotale` int(200) DEFAULT NULL,
  `cantineTotale` int(200) DEFAULT NULL,
  `montantTotalEleve` int(200) DEFAULT NULL,
  `dateDernierPaiement` date DEFAULT NULL,
  `utilisateurs_id` int(11) DEFAULT NULL,
  `nomParent1` varchar(200) NOT NULL,
  `contactParent1` int(200) NOT NULL,
  `nomParent2` varchar(200) DEFAULT NULL,
  `contactParent2` int(200) DEFAULT NULL,
  `dateInscription` date NOT NULL,
  `montantPaye` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_section` (`section_id`),
  KEY `id_utilisateurs` (`utilisateurs_id`),
  KEY `classes_id` (`classes_id`),
  KEY `classes_id_2` (`classes_id`),
  KEY `entreesArgent_id` (`entreesArgent_id`),
  CONSTRAINT `eleves_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`),
  CONSTRAINT `eleves_ibfk_3` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`),
  CONSTRAINT `eleves_ibfk_4` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `eleves_ibfk_5` FOREIGN KEY (`entreesArgent_id`) REFERENCES `entreesArgent` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleves`
--

LOCK TABLES `eleves` WRITE;
/*!40000 ALTER TABLE `eleves` DISABLE KEYS */;
INSERT INTO `eleves` VALUES (132,'Oui','2023-08-17','Enyegue','Franky','2023-08-17',1,78,171,1000,3000,1000,5555,10555,'2023-09-12',4,'frantest',769088,NULL,NULL,'0000-00-00',500),(133,'Non','insta','vanelle','Franky','2023-08-14',2,77,125,1000,NULL,NULL,NULL,1000,'2023-08-18',4,'feta',22222,NULL,NULL,'2023-08-14',500),(134,'Non','insta','franky','franky christian','2023-07-20',2,77,139,50055,NULL,NULL,NULL,50055,NULL,4,'feta',549,NULL,NULL,'2023-09-12',50055),(136,'Non','internet','odelvine','vanelle','2023-09-04',2,79,140,100,NULL,NULL,NULL,100,NULL,4,'odel',76211,NULL,NULL,'2023-09-05',100),(137,'Oui','2023-09-09','hhh','ttr','2023-09-21',2,77,147,44,NULL,NULL,NULL,44,NULL,4,'uuu',2222,NULL,NULL,'2023-09-08',44),(138,'Oui','2023-09-07','Chego','Vanelle','2023-09-06',2,77,148,500,NULL,NULL,NULL,500,NULL,4,'chego',0,NULL,NULL,'2023-09-13',500),(139,'Non','tel','odel','van','2023-09-06',2,77,169,100,NULL,NULL,NULL,100,NULL,4,'celine',1203040,NULL,NULL,'2023-09-04',100),(140,'Non','','Amewa ','Odelvine','2023-09-08',2,78,NULL,100,NULL,NULL,NULL,100,NULL,4,'van',762123,NULL,NULL,'2017-09-25',100),(141,'Non','','2','Vanelle','2023-09-05',2,77,NULL,100,NULL,NULL,NULL,100,NULL,4,'tel',8765,NULL,NULL,'2023-09-05',100),(142,'Oui','2023-09-08','test','test','2023-09-07',2,78,170,100,NULL,NULL,NULL,100,NULL,4,'telt',76543,NULL,NULL,'2023-09-06',100);
/*!40000 ALTER TABLE `eleves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entreesArgent`
--

DROP TABLE IF EXISTS `entreesArgent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entreesArgent` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `scolarite` int(200) DEFAULT 0,
  `tenueClasse` int(200) DEFAULT 0,
  `transport` int(200) DEFAULT 0,
  `cantine` int(200) DEFAULT 0,
  `datePaiement` date NOT NULL,
  `montantPaye` int(200) NOT NULL,
  `eleves_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eleves_id` (`eleves_id`),
  CONSTRAINT `entreesargent_ibfk_1` FOREIGN KEY (`eleves_id`) REFERENCES `eleves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entreesArgent`
--

LOCK TABLES `entreesArgent` WRITE;
/*!40000 ALTER TABLE `entreesArgent` DISABLE KEYS */;
INSERT INTO `entreesArgent` VALUES (121,500,0,0,0,'2023-08-17',500,132),(122,500,0,0,0,'2023-08-19',500,132),(123,0,0,500,0,'2023-08-17',500,132),(124,500,0,0,0,'2023-08-14',500,133),(125,500,0,0,0,'2023-08-18',500,133),(126,50055,0,0,0,'2023-08-15',50055,134),(127,0,0,0,5555,'2023-07-18',5555,132),(129,0,1000,0,0,'2023-09-19',1000,132),(130,0,0,500,0,'2023-09-10',500,132),(131,50055,0,0,0,'2023-09-12',50055,134),(132,50055,0,0,0,'2023-09-12',50055,134),(133,50055,0,0,0,'2023-09-12',50055,134),(134,50055,0,0,0,'2023-09-12',50055,134),(135,50055,0,0,0,'2023-09-12',50055,134),(136,50055,0,0,0,'2023-09-12',50055,134),(137,50055,0,0,0,'2023-09-12',50055,134),(138,50055,0,0,0,'2023-09-12',50055,134),(139,50055,0,0,0,'2023-09-12',50055,134),(140,100,0,0,0,'2023-09-05',100,136),(141,44,0,0,0,'2023-09-08',44,137),(142,44,0,0,0,'2023-09-08',44,137),(143,44,0,0,0,'2023-09-08',44,137),(144,44,0,0,0,'2023-09-08',44,137),(145,44,0,0,0,'2023-09-08',44,137),(146,44,0,0,0,'2023-09-08',44,137),(147,44,0,0,0,'2023-09-08',44,137),(148,500,0,0,0,'2023-09-13',500,138),(149,100,0,0,0,'2023-09-04',100,139),(150,100,0,0,0,'2023-09-04',100,139),(151,100,0,0,0,'2023-09-04',100,139),(152,100,0,0,0,'2023-09-04',100,139),(153,100,0,0,0,'2023-09-04',100,139),(154,100,0,0,0,'2023-09-04',100,139),(155,100,0,0,0,'2023-09-04',100,139),(156,100,0,0,0,'2023-09-04',100,139),(157,100,0,0,0,'2023-09-04',100,139),(158,100,0,0,0,'2023-09-04',100,139),(159,100,0,0,0,'2023-09-04',100,139),(160,100,0,0,0,'2023-09-04',100,139),(161,100,0,0,0,'2023-09-04',100,139),(162,100,0,0,0,'2023-09-04',100,139),(163,100,0,0,0,'2023-09-04',100,139),(164,100,0,0,0,'2023-09-04',100,139),(165,100,0,0,0,'2023-09-04',100,139),(166,100,0,0,0,'2023-09-04',100,139),(167,100,0,0,0,'2023-09-04',100,139),(168,100,0,0,0,'2023-09-04',100,139),(169,100,0,0,0,'2023-09-04',100,139),(170,100,0,0,0,'2023-09-06',100,142),(171,0,2000,0,0,'2023-09-12',2000,132);
/*!40000 ALTER TABLE `entreesArgent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnels`
--

DROP TABLE IF EXISTS `personnels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnels` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `poste` varchar(100) NOT NULL,
  `contact` int(200) NOT NULL,
  `section_id` int(100) DEFAULT 0,
  `classes_id` int(100) DEFAULT 0,
  `groupeSalariale` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT '---',
  `salaire` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `classes_id` (`classes_id`),
  CONSTRAINT `personnels_ibfk_1` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `personnels_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnels`
--

LOCK TABLES `personnels` WRITE;
/*!40000 ALTER TABLE `personnels` DISABLE KEYS */;
INSERT INTO `personnels` VALUES (45,'vaa','vanille','ménage',432,2,77,'autrePersonnel','vanille@yahoo.fr',3456699),(47,'Fullbasard','Fullbasard','enseignant',8765,2,77,'enseignant','Frankyvanelle@yahoo.com',76549);
/*!40000 ALTER TABLE `personnels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `utilisateurs_id` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `utilisateur_id` (`utilisateurs_id`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'anglophone',4),(2,'francophone',6);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (4,'vanelle à ','autre','lolo@yahoo.com','$2b$10$fmhhF6HpBsx4ZiI.5dGo0.d40E7fZbgbNvtc.YyZNbcPr16Zh5RP2'),(6,'merlin','roger','roger@yahoo.com','$2b$10$nF/8GJyIcR5JN8Qno.597uJuq/AucQIKxk2YxQjWTwfSq0DH95aCq'),(7,'enyegue','franky','enyegue@yahoo.fr','$2b$10$Gf8Lf/YkghiJFLwr/h45jeWC7rXRIBubq4w2X46c85eIlQcRvxF4W');
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lesSurdoues'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-14 13:03:12
