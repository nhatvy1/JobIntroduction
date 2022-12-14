-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: jobportal
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_apply_user_idx` (`user_id`),
  CONSTRAINT `fk_apply_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apply_detail`
--

DROP TABLE IF EXISTS `apply_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `job_posting_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detail_apply_idx` (`user_id`),
  KEY `fk_post_detail_idx` (`job_posting_id`),
  CONSTRAINT `fk_detail_apply` FOREIGN KEY (`user_id`) REFERENCES `apply` (`id`),
  CONSTRAINT `fk_post_detail` FOREIGN KEY (`job_posting_id`) REFERENCES `job_posting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply_detail`
--

LOCK TABLES `apply_detail` WRITE;
/*!40000 ALTER TABLE `apply_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `apply_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `job_posting_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_posting_com_idx` (`job_posting_id`),
  KEY `fk_user_com_idx` (`user_id`),
  CONSTRAINT `fk_posting_com` FOREIGN KEY (`job_posting_id`) REFERENCES `job_posting` (`id`),
  CONSTRAINT `fk_user_com` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,'M??i tr?????ng l??m vi???c n??ng ?????ng, s???p th??n thi???n','2022-01-09 22:00:00',8,8),(3,'C??ng ty r???t okee, l????ng th?????ng qu?? tuy???t v???i','2022-01-09 22:00:00',8,8);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_category`
--

DROP TABLE IF EXISTS `job_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_category`
--

LOCK TABLES `job_category` WRITE;
/*!40000 ALTER TABLE `job_category` DISABLE KEYS */;
INSERT INTO `job_category` VALUES (1,'IT - Ph???n m???m'),(2,'K??? to??n'),(3,'B???t ?????ng s???n'),(4,'Du l???ch'),(5,'B???o hi???m');
/*!40000 ALTER TABLE `job_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_posting`
--

DROP TABLE IF EXISTS `job_posting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_posting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(10,0) DEFAULT NULL,
  `job_location` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `job_category_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_posting_category_idx` (`job_category_id`),
  KEY `fk_post_user_idx` (`user_id`),
  CONSTRAINT `fk_post_cate` FOREIGN KEY (`job_category_id`) REFERENCES `job_category` (`id`),
  CONSTRAINT `fk_post_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_posting`
--

LOCK TABLES `job_posting` WRITE;
/*!40000 ALTER TABLE `job_posting` DISABLE KEYS */;
INSERT INTO `job_posting` VALUES (1,'Front end','Vi???c l??m front end','<div>Vi???c l??m front end<br></div>',10000,'???? N???ng','https://res.cloudinary.com/metavere/image/upload/v1662039915/gzgtr2qfb03shakddvyo.png','2022-09-01 20:45:16',1,8),(2,'Back end','<div>Vi???c l??m back end</div>','<div>Vi???c l??m back end ??? Th??nh Ph??? H??? Ch?? Minh (ph??ng ban IT BIDV)</div>',2000,'S??i G??n','https://res.cloudinary.com/metavere/image/upload/v1662040008/pcxfn6gi0lv6pw9cnukj.png','2022-09-01 20:46:48',1,8),(3,'Sales Vinhomes','<div>T?? v???n kh??ch h??ng, ch??m kh??c s??ch h??ng. Gi??p kh??ch h??ng t??m c??n h???.</div>','<div>Kh??ng c???n kinh nghi???m, s??? ???????c ????o t???o khi trong qu?? tr??nh l??m vi???c.</div>',10000,'Th??nh Ph??? H??? Ch?? Minh','https://res.cloudinary.com/metavere/image/upload/v1662040189/kry21unayragiq7acdov.png','2022-09-01 20:49:49',3,8),(4,'Front end','<div>Thi???t k??? UI/UX, l??m vi???c v???i ReactJS, VueJS</div>','??t nh???t 6 th??ng kinh nghi???m',1000,'Th??nh Ph??? H??? Ch?? Minh','https://res.cloudinary.com/metavere/image/upload/v1662040325/snqfr3r9kzcpxwosmqzo.jpg','2022-09-01 20:52:04',1,11),(5,'Backend','<div>Ph??t tri???n h??? th???ng website b???ng ng??n ng??? Java</div>','<div>C?? kinh nghi???m l??m vi???c v???i ng??n ng??? Java, framework Spring(Spring MVC, SpringBoot)</div>',10000,'Th??nh Ph??? H??? Ch?? Minh','https://res.cloudinary.com/metavere/image/upload/v1662040630/p5n6gebbvus4pble56wa.png','2022-09-01 20:57:10',1,11),(6,'T?? v???n thu??? - Nam Vi???t Law','<div><h3 style=\"box-sizing: inherit; color: rgb(77, 121, 184); font-family: &quot;Times New Roman&quot;, Times, serif; background-color: rgb(245, 245, 245);\">T?? v????n mi????n phi?? ??????i v????i Thu???? Gia?? tri?? gia t??ng (VAT)</h3></div>','<div><h3 style=\"box-sizing: inherit; font-family: &quot;Times New Roman&quot;, Times, serif; color: rgb(77, 121, 184); background-color: rgb(245, 245, 245);\">T?? v????n mi????n phi?? ??????i v????i Thu???? Gia?? tri?? gia t??ng (VAT)</h3></div>',1000,'Th??nh Ph??? H??? Ch?? Minh','https://res.cloudinary.com/metavere/image/upload/v1662040775/si6eu7n0v8zgasurqp2b.png','2022-09-01 20:59:34',2,11),(7,'Th???c t???p sinh Ph??p l??','<div><span style=\"font-family: Arial, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 14px;\">Ph??? tr??ch c??ng t??c tuy???n d???ng, ????o t???o nh??n s???;</span><br></div>','<div><span style=\"font-family: Arial, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 14px;\">Ph??? tr??ch c??ng t??c tuy???n d???ng, ????o t???o nh??n s???;</span><br></div>',1000,'Th??nh Ph??? H??? Ch?? Minh','https://res.cloudinary.com/metavere/image/upload/v1662041029/ceegdrxgg22yag6igwvp.png','2022-09-01 21:03:49',2,11),(8,'T?? v???n t??i ch??nh - K??? to??n','<div>K<span style=\"background-color: rgb(245, 245, 245); color: rgb(48, 48, 48); font-family: Arial, Helvetica, sans-serif; font-size: 1rem;\">i???m To??n l?? m???t thu???t ng??? r???t ph??? bi???n ?????i v???i doanh</span></div>','<div>K<span style=\"font-size: 1rem; background-color: rgb(245, 245, 245); color: rgb(48, 48, 48); font-family: Arial, Helvetica, sans-serif;\">i???m To??n l?? m???t thu???t ng??? r???t ph??? bi???n ?????i v???i doanh</span><br></div>',1000,'Th??nh Ph??? H??? Ch?? Minh','https://res.cloudinary.com/metavere/image/upload/v1662041119/b9tiixicqo2zylyoovqo.png','2022-09-01 21:05:18',2,11);
/*!40000 ALTER TABLE `job_posting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_experience` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` bit(1) DEFAULT b'0',
  `user_role` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (8,'V??? Hu???nh','vyhuynhak123@gmail.com',NULL,NULL,NULL,'https://res.cloudinary.com/metavere/image/upload/v1661449842/comment_2_jvytl4.png','nhatvy2','$2a$10$xq.xbX3e8UBz07myNZCRbuGJ3ZYScrmSZ3T41pgOGNJu3.R/7.BNO',NULL,'ROLE_EMPLOYER'),(9,'Nh???t V???','vyhuynhak123@gmail.com',NULL,NULL,NULL,'https://res.cloudinary.com/metavere/image/upload/v1661449840/comment_3_q9pe5k.png','nhatvy1','$2a$10$489tO0ZDQ4iJ4t4mI4UQ5uIdNsHx/QomjuI88nzrQwFbzk0mk9iDa',NULL,'ROLE_APPLICANT'),(10,'Galaxy','vyhuynhak123@gmail.com',NULL,NULL,NULL,'https://res.cloudinary.com/metavere/image/upload/v1661532045/av80oyjraenkt4a1bosw.jpg','huynhnhatvy1','$2a$10$1l5R62MTMaTkYbya56gabOkLgtGc3yyJU7ljnys9BH.Xwq4MsWiV2',NULL,'ROLE_APPLICANT'),(11,'Hu???nh V???','vyhuynh@gmail.com',NULL,NULL,NULL,'https://res.cloudinary.com/metavere/image/upload/v1661533060/gltg7jh6uf5bsglyrlcw.jpg','nhatvy3','$2a$10$SfXEPDasMRtG.pL.uR0gG.RDCJg2vBTv2nr4ITeogT81hNGAHUAYy',NULL,'ROLE_EMPLOYER'),(12,'Nh???t V???','vy@gmail.com',NULL,NULL,NULL,'https://res.cloudinary.com/metavere/image/upload/v1661738571/talphetlthf2u1en4vof.jpg','admin','$2a$10$4VLQQaYbz267fGP83MoScux3cmjqgjq1ezb6FLxGrv3DOElUGZTyK',NULL,'ROLE_ADMIN');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-02 20:02:37
