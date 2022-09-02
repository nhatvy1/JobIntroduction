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
INSERT INTO `comment` VALUES (2,'Môi trường làm việc năng động, sếp thân thiện','2022-01-09 22:00:00',8,8),(3,'Công ty rất okee, lương thưởng quá tuyệt vời','2022-01-09 22:00:00',8,8);
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
INSERT INTO `job_category` VALUES (1,'IT - Phần mềm'),(2,'Kế toán'),(3,'Bất động sản'),(4,'Du lịch'),(5,'Bảo hiểm');
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
INSERT INTO `job_posting` VALUES (1,'Front end','Việc làm front end','<div>Việc làm front end<br></div>',10000,'Đà Nẵng','https://res.cloudinary.com/metavere/image/upload/v1662039915/gzgtr2qfb03shakddvyo.png','2022-09-01 20:45:16',1,8),(2,'Back end','<div>Việc làm back end</div>','<div>Việc làm back end ở Thành Phố Hồ Chí Minh (phòng ban IT BIDV)</div>',2000,'Sài Gòn','https://res.cloudinary.com/metavere/image/upload/v1662040008/pcxfn6gi0lv6pw9cnukj.png','2022-09-01 20:46:48',1,8),(3,'Sales Vinhomes','<div>Tư vấn khách hàng, chăm khóc sách hàng. Giúp khách hàng tìm căn hộ.</div>','<div>Không cần kinh nghiệm, sẽ được đào tạo khi trong quá trình làm việc.</div>',10000,'Thành Phố Hồ Chí Minh','https://res.cloudinary.com/metavere/image/upload/v1662040189/kry21unayragiq7acdov.png','2022-09-01 20:49:49',3,8),(4,'Front end','<div>Thiết kế UI/UX, làm việc với ReactJS, VueJS</div>','Ít nhất 6 tháng kinh nghiệm',1000,'Thành Phố Hồ Chí Minh','https://res.cloudinary.com/metavere/image/upload/v1662040325/snqfr3r9kzcpxwosmqzo.jpg','2022-09-01 20:52:04',1,11),(5,'Backend','<div>Phát triển hệ thống website bằng ngôn ngữ Java</div>','<div>Có kinh nghiệm làm việc với ngôn ngữ Java, framework Spring(Spring MVC, SpringBoot)</div>',10000,'Thành Phố Hồ Chí Minh','https://res.cloudinary.com/metavere/image/upload/v1662040630/p5n6gebbvus4pble56wa.png','2022-09-01 20:57:10',1,11),(6,'Tư vấn thuế - Nam Việt Law','<div><h3 style=\"box-sizing: inherit; color: rgb(77, 121, 184); font-family: &quot;Times New Roman&quot;, Times, serif; background-color: rgb(245, 245, 245);\">Tư vấn miễn phí đối với Thuế Giá trị gia tăng (VAT)</h3></div>','<div><h3 style=\"box-sizing: inherit; font-family: &quot;Times New Roman&quot;, Times, serif; color: rgb(77, 121, 184); background-color: rgb(245, 245, 245);\">Tư vấn miễn phí đối với Thuế Giá trị gia tăng (VAT)</h3></div>',1000,'Thành Phố Hồ Chí Minh','https://res.cloudinary.com/metavere/image/upload/v1662040775/si6eu7n0v8zgasurqp2b.png','2022-09-01 20:59:34',2,11),(7,'Thực tập sinh Pháp lý','<div><span style=\"font-family: Arial, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 14px;\">Phụ trách công tác tuyển dụng, đào tạo nhân sự;</span><br></div>','<div><span style=\"font-family: Arial, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 14px;\">Phụ trách công tác tuyển dụng, đào tạo nhân sự;</span><br></div>',1000,'Thành Phố Hồ Chí Minh','https://res.cloudinary.com/metavere/image/upload/v1662041029/ceegdrxgg22yag6igwvp.png','2022-09-01 21:03:49',2,11),(8,'Tư vấn tài chính - Kế toán','<div>K<span style=\"background-color: rgb(245, 245, 245); color: rgb(48, 48, 48); font-family: Arial, Helvetica, sans-serif; font-size: 1rem;\">iểm Toán là một thuật ngữ rất phổ biến đối với doanh</span></div>','<div>K<span style=\"font-size: 1rem; background-color: rgb(245, 245, 245); color: rgb(48, 48, 48); font-family: Arial, Helvetica, sans-serif;\">iểm Toán là một thuật ngữ rất phổ biến đối với doanh</span><br></div>',1000,'Thành Phố Hồ Chí Minh','https://res.cloudinary.com/metavere/image/upload/v1662041119/b9tiixicqo2zylyoovqo.png','2022-09-01 21:05:18',2,11);
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
INSERT INTO `user` VALUES (8,'Vỹ Huỳnh','vyhuynhak123@gmail.com',NULL,NULL,NULL,'https://res.cloudinary.com/metavere/image/upload/v1661449842/comment_2_jvytl4.png','nhatvy2','$2a$10$xq.xbX3e8UBz07myNZCRbuGJ3ZYScrmSZ3T41pgOGNJu3.R/7.BNO',NULL,'ROLE_EMPLOYER'),(9,'Nhật Vỹ','vyhuynhak123@gmail.com',NULL,NULL,NULL,'https://res.cloudinary.com/metavere/image/upload/v1661449840/comment_3_q9pe5k.png','nhatvy1','$2a$10$489tO0ZDQ4iJ4t4mI4UQ5uIdNsHx/QomjuI88nzrQwFbzk0mk9iDa',NULL,'ROLE_APPLICANT'),(10,'Galaxy','vyhuynhak123@gmail.com',NULL,NULL,NULL,'https://res.cloudinary.com/metavere/image/upload/v1661532045/av80oyjraenkt4a1bosw.jpg','huynhnhatvy1','$2a$10$1l5R62MTMaTkYbya56gabOkLgtGc3yyJU7ljnys9BH.Xwq4MsWiV2',NULL,'ROLE_APPLICANT'),(11,'Huỳnh Vỹ','vyhuynh@gmail.com',NULL,NULL,NULL,'https://res.cloudinary.com/metavere/image/upload/v1661533060/gltg7jh6uf5bsglyrlcw.jpg','nhatvy3','$2a$10$SfXEPDasMRtG.pL.uR0gG.RDCJg2vBTv2nr4ITeogT81hNGAHUAYy',NULL,'ROLE_EMPLOYER'),(12,'Nhật Vỹ','vy@gmail.com',NULL,NULL,NULL,'https://res.cloudinary.com/metavere/image/upload/v1661738571/talphetlthf2u1en4vof.jpg','admin','$2a$10$4VLQQaYbz267fGP83MoScux3cmjqgjq1ezb6FLxGrv3DOElUGZTyK',NULL,'ROLE_ADMIN');
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
