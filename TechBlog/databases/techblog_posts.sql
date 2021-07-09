-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: techblog
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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext,
  `pCode` longtext,
  `pPic` varchar(100) DEFAULT NULL,
  `pDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `catId` int DEFAULT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid_idx` (`catId`),
  KEY `id_idx` (`userId`),
  CONSTRAINT `cid` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`),
  CONSTRAINT `id` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,'what is java','java is dynamic , robust, platform independent , compile and interpreted high level programming language ','no','IMG_20210221_232904.jpg','2021-06-04 17:44:14',1,21),(4,'what is web application','web application is application software that runs on a web server. web application are accessed by the user through web browser with an active network connection','no','IMG_20210217_230453.jpg','2021-06-04 17:52:46',3,21),(7,'HashMap class in java collection framework','HashMap is an important class to handle key value pairs ','no','profile.jpg','2021-06-05 07:58:16',1,21),(8,'what is web application','it is very trending technology ','no','','2021-06-05 08:22:18',3,21),(9,'what is web application','it is very trending technology ','no','','2021-06-05 08:22:21',3,21),(10,'what is web application','it is very trending technology ','no','','2021-06-05 08:22:37',3,21),(11,'what is web application','it is very trending technology ','no','default.png','2021-06-05 08:22:48',3,21),(12,'what is web application','it is very trending technology ','no','default.png','2021-06-05 08:22:51',3,21),(13,'what is web application','it is very trending technology ','no','default.png','2021-06-05 08:22:52',3,21),(14,'What is collection framework ?','its defined several classes and interfaces to represent group of individual object as a single entities ','no ','IMG_20210217_230453.jpg','2021-06-05 09:22:33',1,21),(15,'What is Python ?','python is mostly used for machine  and deep learning ','no','IMG_20210217_230453.jpg','2021-06-05 10:07:03',2,23),(16,'what is database ?','database is integrated collection of related information along with the details so that it is available for several user ','no code because it is definition','','2021-06-06 06:59:06',7,21);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-09 23:14:02
