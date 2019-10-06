-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: lento
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bankdeposit`
--

DROP TABLE IF EXISTS `bankdeposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankdeposit` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `transid` varchar(20) NOT NULL,
  `depositdate` date NOT NULL,
  `compcode` varchar(100) NOT NULL,
  `bankname` varchar(100) NOT NULL,
  `acctno` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paymethod` varchar(50) NOT NULL,
  `paytype` varchar(50) NOT NULL,
  `referenceno` varchar(100) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `createdby` varchar(100) NOT NULL,
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `depost` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankdeposit`
--

LOCK TABLES `bankdeposit` WRITE;
/*!40000 ALTER TABLE `bankdeposit` DISABLE KEYS */;
INSERT INTO `bankdeposit` VALUES (001,'00001','2018-07-26','LAF001','Indian Bank','92324327428',1000.00,'Cash','Sales','989898','hhh','Bhairava','2018-07-27 18:46:57'),(002,'00002','2018-07-27','LAF001','HDFC Bank','1234567890',2000.00,'Cash','Sales','212123','sadsa','Bhairava','2018-07-27 06:40:17'),(003,'00003','2018-08-01','LAF001','HDFC Bank','1234567890',1000.00,'Cash','Sales','asdas','sadsa','Bhairava','2018-08-01 09:04:48');
/*!40000 ALTER TABLE `bankdeposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashmemos`
--

DROP TABLE IF EXISTS `cashmemos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashmemos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cashmem_code` varchar(100) DEFAULT NULL,
  `cashmem_owner` varchar(255) DEFAULT NULL,
  `cashmem_customer` varchar(100) DEFAULT NULL,
  `cashmem_comp_code` varchar(100) DEFAULT NULL,
  `cashmem_vendor` varchar(255) DEFAULT NULL,
  `cashmem_receipt_no` varchar(100) DEFAULT NULL,
  `cashmem_cust_ref_phno` varchar(30) DEFAULT NULL,
  `cashmem_date` varchar(100) DEFAULT NULL,
  `cashmem_paymentmode` varchar(255) DEFAULT NULL,
  `cashmem_deliveryat` varchar(100) DEFAULT NULL,
  `cashmem_status` varchar(15) DEFAULT NULL,
  `cashmem_value` varchar(100) DEFAULT NULL,
  `cashmem_tc` varchar(255) DEFAULT NULL,
  `cashmem_notes` varchar(255) DEFAULT NULL,
  `cashmem_items` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashmemos`
--

LOCK TABLES `cashmemos` WRITE;
/*!40000 ALTER TABLE `cashmemos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashmemos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compbank`
--

DROP TABLE IF EXISTS `compbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compbank` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `orgid` varchar(25) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `ctype` varchar(25) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `bankname` varchar(25) DEFAULT NULL,
  `acctno` varchar(20) NOT NULL,
  `acctname` varchar(40) NOT NULL,
  `acctype` varchar(20) NOT NULL,
  `branch` varchar(30) NOT NULL,
  `ifsc` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compbank`
--

LOCK TABLES `compbank` WRITE;
/*!40000 ALTER TABLE `compbank` DISABLE KEYS */;
INSERT INTO `compbank` VALUES (007,'DAPL001',NULL,NULL,NULL,'ANDHRA BANK','0348111000032777','DHIRAJ AGRO PVT LTD','Current','Chennai Main Branch','ANDB0000348');
/*!40000 ALTER TABLE `compbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprofile`
--

DROP TABLE IF EXISTS `comprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprofile` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `orgid` varchar(15) NOT NULL,
  `prefix` varchar(15) DEFAULT 'DAPL',
  `title` varchar(50) NOT NULL,
  `orgname` varchar(100) NOT NULL,
  `shortname` varchar(100) NOT NULL,
  `orgtype` varchar(50) NOT NULL,
  `blocation` varchar(100) NOT NULL,
  `industry` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(30) NOT NULL,
  `workphone` varchar(30) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `email` varchar(40) NOT NULL,
  `web` varchar(40) NOT NULL,
  `gstin` varchar(25) NOT NULL,
  `gstregdate` date NOT NULL,
  `panno` varchar(50) NOT NULL,
  `openbalance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `balasofdate` date NOT NULL,
  `primaryflag` int(20) NOT NULL DEFAULT '0',
  `image` varchar(155) DEFAULT NULL,
  `tandc` varchar(500) DEFAULT NULL,
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdby` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedby` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprofile`
--

LOCK TABLES `comprofile` WRITE;
/*!40000 ALTER TABLE `comprofile` DISABLE KEYS */;
INSERT INTO `comprofile` VALUES (001,'001','DAPL','','Lento India Private Limited','Lento(Registered)','1','','1','Pochampalli,Krishnagiri-Dist','Pochampalli','IN','TN','635104','','9750996500','vinoth@lento.com','www.lento.com','1234567890','2019-09-12','123456',0.00,'2019-09-14',1,'upload/lento-logo.png',NULL,'2019-09-14 10:54:33','2019-09-14 10:54:33','2019-09-14 10:54:33','2019-09-14 10:54:33'),(002,'002','DAPL','','Lento Foods','Lento(Partnership)','3','','1','adadad','asdsat','IN','TN','654345','','87878778','ss@g.com','','8989889','2019-12-31','88',0.00,'2019-09-14',1,'upload/download.jpg',NULL,'2019-09-14 10:56:35','2019-09-14 10:56:35','2019-09-14 10:56:35','2019-09-14 10:56:35'),(003,'003','DAPL','','Maavin','Maavin','3','','1','125-old hall street','London','IN','TN','654545','','987888','maavin@gmail.com','','1111','2019-12-31','',0.00,'2019-09-14',1,'upload/download.jpg',NULL,'2019-09-14 12:20:56','2019-09-14 12:20:56','2019-09-14 12:20:56','2019-09-14 12:20:56');
/*!40000 ALTER TABLE `comprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(10) NOT NULL DEFAULT '0',
  `code` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_lookups`
--

DROP TABLE IF EXISTS `country_lookups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_lookups` (
  `id` int(10) NOT NULL DEFAULT '0',
  `code` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_lookups`
--

LOCK TABLES `country_lookups` WRITE;
/*!40000 ALTER TABLE `country_lookups` DISABLE KEYS */;
INSERT INTO `country_lookups` VALUES (1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe'),(1,'AF','Afghanistan'),(2,'AX','Aland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua and Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AU','Australia'),(15,'AT','Austria'),(16,'AZ','Azerbaijan'),(17,'BS','Bahamas'),(18,'BH','Bahrain'),(19,'BD','Bangladesh'),(20,'BB','Barbados'),(21,'BY','Belarus'),(22,'BE','Belgium'),(23,'BZ','Belize'),(24,'BJ','Benin'),(25,'BM','Bermuda'),(26,'BT','Bhutan'),(27,'BO','Bolivia'),(28,'BQ','Bonaire, Saint Eustatius and Saba'),(29,'BA','Bosnia and Herzegovina'),(30,'BW','Botswana'),(31,'BV','Bouvet Island'),(32,'BR','Brazil'),(33,'IO','British Indian Ocean Territory'),(34,'VG','British Virgin Islands'),(35,'BN','Brunei'),(36,'BG','Bulgaria'),(37,'BF','Burkina Faso'),(38,'BI','Burundi'),(39,'KH','Cambodia'),(40,'CM','Cameroon'),(41,'CA','Canada'),(42,'CV','Cape Verde'),(43,'KY','Cayman Islands'),(44,'CF','Central African Republic'),(45,'TD','Chad'),(46,'CL','Chile'),(47,'CN','China'),(48,'CX','Christmas Island'),(49,'CC','Cocos Islands'),(50,'CO','Colombia'),(51,'KM','Comoros'),(52,'CK','Cook Islands'),(53,'CR','Costa Rica'),(54,'HR','Croatia'),(55,'CU','Cuba'),(56,'CW','Curacao'),(57,'CY','Cyprus'),(58,'CZ','Czech Republic'),(59,'CD','Democratic Republic of the Congo'),(60,'DK','Denmark'),(61,'DJ','Djibouti'),(62,'DM','Dominica'),(63,'DO','Dominican Republic'),(64,'TL','East Timor'),(65,'EC','Ecuador'),(66,'EG','Egypt'),(67,'SV','El Salvador'),(68,'GQ','Equatorial Guinea'),(69,'ER','Eritrea'),(70,'EE','Estonia'),(71,'ET','Ethiopia'),(72,'FK','Falkland Islands'),(73,'FO','Faroe Islands'),(74,'FJ','Fiji'),(75,'FI','Finland'),(76,'FR','France'),(77,'GF','French Guiana'),(78,'PF','French Polynesia'),(79,'TF','French Southern Territories'),(80,'GA','Gabon'),(81,'GM','Gambia'),(82,'GE','Georgia'),(83,'DE','Germany'),(84,'GH','Ghana'),(85,'GI','Gibraltar'),(86,'GR','Greece'),(87,'GL','Greenland'),(88,'GD','Grenada'),(89,'GP','Guadeloupe'),(90,'GU','Guam'),(91,'GT','Guatemala'),(92,'GG','Guernsey'),(93,'GN','Guinea'),(94,'GW','Guinea-Bissau'),(95,'GY','Guyana'),(96,'HT','Haiti'),(97,'HM','Heard Island and McDonald Islands'),(98,'HN','Honduras'),(99,'HK','Hong Kong'),(100,'HU','Hungary'),(101,'IS','Iceland'),(102,'IN','India'),(103,'ID','Indonesia'),(104,'IR','Iran'),(105,'IQ','Iraq'),(106,'IE','Ireland'),(107,'IM','Isle of Man'),(108,'IL','Israel'),(109,'IT','Italy'),(110,'CI','Ivory Coast'),(111,'JM','Jamaica'),(112,'JP','Japan'),(113,'JE','Jersey'),(114,'JO','Jordan'),(115,'KZ','Kazakhstan'),(116,'KE','Kenya'),(117,'KI','Kiribati'),(118,'XK','Kosovo'),(119,'KW','Kuwait'),(120,'KG','Kyrgyzstan'),(121,'LA','Laos'),(122,'LV','Latvia'),(123,'LB','Lebanon'),(124,'LS','Lesotho'),(125,'LR','Liberia'),(126,'LY','Libya'),(127,'LI','Liechtenstein'),(128,'LT','Lithuania'),(129,'LU','Luxembourg'),(130,'MO','Macao'),(131,'MK','Macedonia'),(132,'MG','Madagascar'),(133,'MW','Malawi'),(134,'MY','Malaysia'),(135,'MV','Maldives'),(136,'ML','Mali'),(137,'MT','Malta'),(138,'MH','Marshall Islands'),(139,'MQ','Martinique'),(140,'MR','Mauritania'),(141,'MU','Mauritius'),(142,'YT','Mayotte'),(143,'MX','Mexico'),(144,'FM','Micronesia'),(145,'MD','Moldova'),(146,'MC','Monaco'),(147,'MN','Mongolia'),(148,'ME','Montenegro'),(149,'MS','Montserrat'),(150,'MA','Morocco'),(151,'MZ','Mozambique'),(152,'MM','Myanmar'),(153,'NA','Namibia'),(154,'NR','Nauru'),(155,'NP','Nepal'),(156,'NL','Netherlands'),(157,'AN','Netherlands Antilles'),(158,'NC','New Caledonia'),(159,'NZ','New Zealand'),(160,'NI','Nicaragua'),(161,'NE','Niger'),(162,'NG','Nigeria'),(163,'NU','Niue'),(164,'NF','Norfolk Island'),(165,'KP','North Korea'),(166,'MP','Northern Mariana Islands'),(167,'NO','Norway'),(168,'OM','Oman'),(169,'PK','Pakistan'),(170,'PW','Palau'),(171,'PS','Palestinian Territory'),(172,'PA','Panama'),(173,'PG','Papua New Guinea'),(174,'PY','Paraguay'),(175,'PE','Peru'),(176,'PH','Philippines'),(177,'PN','Pitcairn'),(178,'PL','Poland'),(179,'PT','Portugal'),(180,'PR','Puerto Rico'),(181,'QA','Qatar'),(182,'CG','Republic of the Congo'),(183,'RE','Reunion'),(184,'RO','Romania'),(185,'RU','Russia'),(186,'RW','Rwanda'),(187,'BL','Saint Barthelemy'),(188,'SH','Saint Helena'),(189,'KN','Saint Kitts and Nevis'),(190,'LC','Saint Lucia'),(191,'MF','Saint Martin'),(192,'PM','Saint Pierre and Miquelon'),(193,'VC','Saint Vincent and the Grenadines'),(194,'WS','Samoa'),(195,'SM','San Marino'),(196,'ST','Sao Tome and Principe'),(197,'SA','Saudi Arabia'),(198,'SN','Senegal'),(199,'RS','Serbia'),(200,'CS','Serbia and Montenegro'),(201,'SC','Seychelles'),(202,'SL','Sierra Leone'),(203,'SG','Singapore'),(204,'SX','Sint Maarten'),(205,'SK','Slovakia'),(206,'SI','Slovenia'),(207,'SB','Solomon Islands'),(208,'SO','Somalia'),(209,'ZA','South Africa'),(210,'GS','South Georgia and the South Sandwich Islands'),(211,'KR','South Korea'),(212,'SS','South Sudan'),(213,'ES','Spain'),(214,'LK','Sri Lanka'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard and Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TG','Togo'),(227,'TK','Tokelau'),(228,'TO','Tonga'),(229,'TT','Trinidad and Tobago'),(230,'TN','Tunisia'),(231,'TR','Turkey'),(232,'TM','Turkmenistan'),(233,'TC','Turks and Caicos Islands'),(234,'TV','Tuvalu'),(235,'VI','U.S. Virgin Islands'),(236,'UG','Uganda'),(237,'UA','Ukraine'),(238,'AE','United Arab Emirates'),(239,'GB','United Kingdom'),(240,'US','United States'),(241,'UM','United States Minor Outlying Islands'),(242,'UY','Uruguay'),(243,'UZ','Uzbekistan'),(244,'VU','Vanuatu'),(245,'VA','Vatican'),(246,'VE','Venezuela'),(247,'VN','Vietnam'),(248,'WF','Wallis and Futuna'),(249,'EH','Western Sahara'),(250,'YE','Yemen'),(251,'ZM','Zambia'),(252,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `country_lookups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditnotes`
--

DROP TABLE IF EXISTS `creditnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditnotes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creditnote_id` varchar(100) DEFAULT NULL,
  `creditnote_owner` varchar(255) DEFAULT NULL,
  `creditnote_customer` varchar(20) DEFAULT NULL,
  `creditnote_comp_code` varchar(100) DEFAULT NULL,
  `creditnote_inv_code` varchar(50) DEFAULT NULL,
  `creditnote_cust_ref_no` varchar(30) DEFAULT NULL,
  `creditnote_paymentdate` varchar(20) DEFAULT NULL,
  `creditnote_paymentmode` varchar(20) DEFAULT NULL,
  `creditnote_status` varchar(15) DEFAULT NULL,
  `creditnote_shipping_street` varchar(255) DEFAULT NULL,
  `creditnote_shipping_city` varchar(255) DEFAULT NULL,
  `creditnote_shipping_state` varchar(255) DEFAULT NULL,
  `creditnote_shipping_country` varchar(255) DEFAULT NULL,
  `creditnote_shipping_zip` varchar(255) DEFAULT NULL,
  `creditnote_shipping_phone` varchar(255) DEFAULT NULL,
  `creditnote_shipping_gstin` varchar(255) DEFAULT NULL,
  `creditnote_billing_street` varchar(255) DEFAULT NULL,
  `creditnote_billing_city` varchar(255) DEFAULT NULL,
  `creditnote_billing_state` varchar(255) DEFAULT NULL,
  `creditnote_billing_country` varchar(255) DEFAULT NULL,
  `creditnote_billing_zip` varchar(255) DEFAULT NULL,
  `creditnote_billing_phone` varchar(255) DEFAULT NULL,
  `creditnote_billing_gstin` varchar(255) DEFAULT NULL,
  `creditnote_value` varchar(100) DEFAULT NULL,
  `creditnote_tc` varchar(255) DEFAULT NULL,
  `creditnote_notes` varchar(255) DEFAULT NULL,
  `creditnote_email_notification` varchar(10) DEFAULT NULL,
  `creditnote_items` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditnotes`
--

LOCK TABLES `creditnotes` WRITE;
/*!40000 ALTER TABLE `creditnotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditnotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_payments`
--

DROP TABLE IF EXISTS `customer_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cust_payment_id` varchar(30) NOT NULL,
  `cust_payment_customer` varchar(45) DEFAULT NULL,
  `cust_payment_invoice_no` varchar(45) DEFAULT NULL,
  `cust_payment_amount` varchar(100) DEFAULT NULL,
  `cust_payment_credits_used` varchar(100) DEFAULT NULL,
  `cust_payment_date` varchar(45) DEFAULT NULL,
  `cust_payment_mode` varchar(45) DEFAULT NULL,
  `cust_payment_ref_no` varchar(45) DEFAULT NULL,
  `cust_payment_so_code` varchar(45) DEFAULT NULL,
  `cust_payment_inv_id` varchar(45) DEFAULT NULL,
  `cust_payment_user` varchar(100) DEFAULT NULL,
  `cust_payment_notes` varchar(255) DEFAULT NULL,
  `cust_payment_file` varchar(255) DEFAULT NULL,
  `cust_payment_notify` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_payments`
--

LOCK TABLES `customer_payments` WRITE;
/*!40000 ALTER TABLE `customer_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_paymentsacc`
--

DROP TABLE IF EXISTS `customer_paymentsacc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_paymentsacc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cust_payment_id` varchar(30) NOT NULL,
  `cust_payment_customer` varchar(45) DEFAULT NULL,
  `cust_payment_invoice_no` varchar(45) DEFAULT NULL,
  `cust_payment_amount` varchar(100) DEFAULT NULL,
  `cust_payment_credits_used` varchar(100) DEFAULT NULL,
  `cust_payment_date` varchar(45) DEFAULT NULL,
  `cust_payment_mode` varchar(45) DEFAULT NULL,
  `cust_payment_ref_no` varchar(45) DEFAULT NULL,
  `cust_payment_so_code` varchar(45) DEFAULT NULL,
  `cust_payment_inv_id` varchar(45) DEFAULT NULL,
  `cust_payment_user` varchar(100) DEFAULT NULL,
  `cust_payment_notes` varchar(255) DEFAULT NULL,
  `cust_payment_file` varchar(255) DEFAULT NULL,
  `cust_payment_notify` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_paymentsacc`
--

LOCK TABLES `customer_paymentsacc` WRITE;
/*!40000 ALTER TABLE `customer_paymentsacc` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_paymentsacc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerprofile`
--

DROP TABLE IF EXISTS `customerprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerprofile` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `custid` varchar(50) NOT NULL,
  `cust_opening_bal` varchar(100) DEFAULT NULL,
  `prefix` varchar(15) DEFAULT 'DAPL',
  `postfix` varchar(50) NOT NULL DEFAULT '/',
  `title` varchar(6) NOT NULL,
  `custname` varchar(50) NOT NULL,
  `portal` varchar(100) DEFAULT NULL,
  `custype` varchar(50) NOT NULL,
  `blocation` varchar(100) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(30) NOT NULL,
  `workphone` varchar(30) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `email` varchar(40) NOT NULL,
  `web` varchar(40) NOT NULL,
  `gstin` varchar(25) NOT NULL,
  `gstregdate` date DEFAULT NULL,
  `primaryflag` int(20) NOT NULL DEFAULT '0',
  `openbalance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `obasofdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(155) DEFAULT NULL,
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) DEFAULT NULL,
  `updatedon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedby` varchar(100) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT '1',
  `handler` varchar(100) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerprofile`
--

LOCK TABLES `customerprofile` WRITE;
/*!40000 ALTER TABLE `customerprofile` DISABLE KEYS */;
INSERT INTO `customerprofile` VALUES (001,'00001','21700','DAPL','/','M/S.','Latha Rani Agencies',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'9-75, Yerram Reddy Palem','Thukivakam, Renigunta,Chittoor(Dist)','IN','AP','517506','','9032365313','palamakulamohan@gmail.com','','37BACPP8415R1ZY',NULL,0,0.00,'2019-02-05 08:33:10',NULL,'2019-02-05 08:33:10',NULL,'2019-02-05 08:33:10',NULL,'1',NULL,NULL),(002,'00002','75680','DAPL','/','M/S.','T.J.S Agencies',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'15/228','A.M.Puttur By Pass, Srikalahasthi','IN','AP','517644','','9866798935','','','37BACPT3550K1ZE',NULL,0,0.00,'2019-02-05 08:34:58',NULL,'2019-02-05 08:34:58',NULL,'2019-02-05 08:34:58',NULL,'1',NULL,NULL),(003,'00003',NULL,'DAPL','/','M/S.','Bhargavi Stores',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'8-13, Near IOB Bank','Gajulamandyam, Renigunta, Chittoor Dist ','IN','AP','517520','','9866424852','ramanapallisetti@gmail.com','','37CLNPP5473Q1ZX',NULL,0,0.00,'2019-02-05 08:38:12',NULL,'2019-02-05 08:38:12',NULL,'2019-02-05 08:38:12',NULL,'1',NULL,NULL),(004,'00004',NULL,'DAPL','/','M/S.','Sai General Stores',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'5/85, Ammavarisala Bazar','Yerragondapalem, Prakasam Dist','IN','AP','523327','','9396850597','alapati.kishore2@gmail.com','','37CFSPA9357R1ZB',NULL,0,0.00,'2019-02-05 08:41:10',NULL,'2019-02-05 08:41:10',NULL,'2019-02-05 08:41:10',NULL,'1',NULL,NULL),(005,'00005',NULL,'DAPL','/','M/S.','SLB Traders',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'5-18, G.V.R Road','Singarayakonda, Praksam Dist','IN','AP','523101','','9849858403','','','37AJPPT9436R1ZS',NULL,0,0.00,'2019-02-05 08:43:00',NULL,'2019-02-05 08:43:00',NULL,'2019-02-05 08:43:00',NULL,'1',NULL,NULL),(006,'00006','24440','DAPL','/','M/S.','Sri Lakshmi Agencies',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'6-3-10, Lathuvali Gunta','Naidupeta','IN','AP','524126','','9959801473','chanathkumar1983@gmail.com','','37CPKPM5687Q2ZM',NULL,0,0.00,'2019-02-05 08:44:59',NULL,'2019-02-05 08:44:59',NULL,'2019-02-05 08:44:59',NULL,'1',NULL,NULL),(007,'00007','61500','DAPL','/','M/S.','Sri Gayathry Agencies',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'Gudipallipadu','Nellore Rural, Nellore ','IN','AP','524314','','8555843777','b.nandu789@gmail.com','','37BFKPS3956R1Z9',NULL,0,0.00,'2019-02-05 08:46:43',NULL,'2019-02-05 08:46:43',NULL,'2019-02-05 08:46:43',NULL,'1',NULL,NULL),(008,'00008',NULL,'DAPL','/','M/S.','Annapoorna Agencies',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'Vidya Nagar',' Kota','IN','AP','524411','','9493520753','','','37BNBPD6133L2Z0',NULL,0,0.00,'2019-02-12 04:00:20',NULL,'2019-02-12 04:00:20',NULL,'2019-02-12 04:00:20',NULL,'1',NULL,NULL),(009,'00009',NULL,'DAPL','/','MS.','Karthikeya Enterprisers',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'D No.11/95,','Pulavanigunta,Renigunta Road,Tirupathi','IN','AP','517501','','9704914325','','','37BINPG0673F1ZC',NULL,0,0.00,'2019-02-21 00:00:00',NULL,'2019-02-21 03:10:58',NULL,'2019-02-21 03:10:58',NULL,'1','T Subbarayulu',''),(010,'000010','62000','DAPL','/','M/S.','Srivari',NULL,'Distributor/Supplier','Karnataka',NULL,'MANTRI SQUARE, FC 09,3 RD  FLOOR MALLESHWARAM,BANGALORE','Delievry at MGB Felictiy Mall, Dargamitta,SPSR Nellore - 524003','IN','KA','560003','','7680004645','','','29ACDFS9005L1ZP',NULL,0,0.00,'2019-03-31 21:28:48',NULL,'2019-03-31 21:28:48',NULL,'2019-03-31 21:28:48',NULL,'1',NULL,NULL),(011,'000011','72000','DAPL','/','M/S.','S. Narayanan',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'Plotform No.1, ','Railway station, Gudur ','IN','AP','524101','','8985583351','','','37FURPS9788B1ZI',NULL,0,0.00,'2019-03-31 23:35:39',NULL,'2019-03-31 23:35:39',NULL,'2019-03-31 23:35:39',NULL,'1',NULL,NULL),(012,'000012',NULL,'DAPL','/','M/S.','KPR Residency',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'3-545,6,7','.Bazar Street,Srikalahasti.','IN','AP','517644','','0000000000','','','37AANFK8102A1ZL',NULL,0,0.00,'2019-04-01 21:10:28',NULL,'2019-04-01 21:10:28',NULL,'2019-04-01 21:10:28',NULL,'1',NULL,NULL),(013,'000013',NULL,'DAPL','/','M/S.','Jubilant Foodworks Limited',NULL,'Retailer','Andhra Pradesh',NULL,'Sy.No.309,310,311,312, Bommasandra Industrial Area. ','Plot No. 17, Bangalore - 560099','IN','KA','560099','','9743180961','','','29AABCD1821C1Z7',NULL,0,0.00,'2019-04-01 21:55:58',NULL,'2019-04-01 21:55:58',NULL,'2019-04-01 21:55:58',NULL,'1',NULL,NULL),(014,'000014',NULL,'DAPL','/','M/S.','Jayashree Enterprises',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'Sarojini Devi Layout,','D.No-5-5-353 Opp.Sneha Hospital,Tirupathi','IN','AP','517101','','9885551714','','','37AJLPB4985H1ZV',NULL,0,0.00,'2019-04-01 22:01:50',NULL,'2019-04-01 22:01:50',NULL,'2019-04-01 22:01:50',NULL,'1',NULL,NULL),(015,'000015','86404','DAPL','/','M/S.','Jubilant Foodworks Limited.',NULL,'Retailer','Karnataka',NULL,'Cheemasandra Village, Bidarahalli Hobli, ','Sy No.86/1, Bengaluru - 560049','IN','KA','560049','','9743180961','','','29AABCD1821C1Z7',NULL,0,0.00,'2019-04-01 22:47:27',NULL,'2019-04-01 22:47:27',NULL,'2019-04-01 22:47:27',NULL,'1',NULL,NULL),(016,'000016','57750','DAPL','/','M/S.','B Ravi Kumar',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'Platform No.01','Modular Catering Stall, Yerraguntla','IN','AP','516309','','8074474549','','','37BHKPR0831G1Z9',NULL,0,0.00,'2019-04-02 00:45:04',NULL,'2019-04-02 00:45:04',NULL,'2019-04-02 00:45:04',NULL,'1',NULL,NULL),(017,'000017',NULL,'DAPL','/','M/S.','TATA CONSULTANCY SERVICES',NULL,'Retailer','Delhi',NULL,'1/1075/1/2 GF4, ','Mehrauli, New Delhi - 110030','IN','DL','110030','','8142421212','','','',NULL,0,0.00,'2019-04-02 02:41:39',NULL,'2019-04-02 02:41:39',NULL,'2019-04-02 02:41:39',NULL,'1',NULL,NULL),(018,'000018',NULL,'DAPL','/','Mr.','Rathnaiah',NULL,'Retailer','Andhra Pradesh',NULL,'18,8,40B,','Tirumala Bypass Road,Leela Mahal Circle ','IN','AP',' 517501','','0000000000','','','37ACNPR3185L1ZT',NULL,0,0.00,'2019-04-02 04:50:07',NULL,'2019-04-02 04:50:07',NULL,'2019-04-02 04:50:07',NULL,'1',NULL,NULL),(019,'000019',NULL,'DAPL','/','M/S.','R Ramakrishna',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'PF Stall,  ','Railway Station, Madanapalle','IN','AP','517325','','8978108022','','','37BNCPR0852D1Z5',NULL,0,0.00,'2019-04-02 06:23:09',NULL,'2019-04-02 06:23:09',NULL,'2019-04-02 06:23:09',NULL,'1',NULL,NULL),(020,'000020',NULL,'DAPL','/','M/S.','RR Distributors',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'PV Chowdary Compound,Near Kakathiya Apartment,','Court Road,Ananthapur','IN','AP','515001','','9966003922','','','37ASOPM6570D1ZE',NULL,0,0.00,'2019-04-02 23:48:09',NULL,'2019-04-02 23:48:09',NULL,'2019-04-02 23:48:09',NULL,'1',NULL,NULL),(021,'000021',NULL,'DAPL','/','Mr.','Mabbu Srikanth',NULL,'Retailer','Andhra Pradesh',NULL,'AIRPORT TERMINAL BUILDING 0-1,','TIRUPATHI','IN','AP','517501','','0000000000','','','37AGMPM5247R1ZG',NULL,0,0.00,'2019-04-03 04:18:18',NULL,'2019-04-03 04:18:18',NULL,'2019-04-03 04:18:18',NULL,'1',NULL,NULL),(022,'000022',NULL,'DAPL','/','M/S.','ARENCO CATERING',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'PLOT FORM NO - 1,RAILWAY STATION','ONGOLE,PRAKASAM.','IN','AP','523001','','9160505057','','','37AAIFA4388F1ZA',NULL,0,0.00,'2019-04-03 17:55:30',NULL,'2019-04-03 17:55:30',NULL,'2019-04-03 17:55:30',NULL,'1',NULL,NULL),(023,'000023',NULL,'DAPL','/','M/S.','Bhushan Enterprises',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'20-3-5/3a, 2nd Floor, 2nd Cross,','Siva Jyothi Nagar, K.T. Road,Tirupathi','IN','AP','517501','','9490511155','','','37AGZPN8549A1ZQ',NULL,0,0.00,'2019-04-04 01:36:27',NULL,'2019-04-04 01:36:27',NULL,'2019-04-04 01:36:27',NULL,'1',NULL,NULL),(024,'000024',NULL,'DAPL','/','Mr.','PK Shefi',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'Platform No.1','Railway Station,Nellore','IN','AP','524101','','0000000000','','','37AAOPS9703Q1ZL',NULL,0,0.00,'2019-04-14 00:00:00',NULL,'2019-04-04 01:49:46',NULL,'2019-04-04 01:49:46',NULL,'1','Administrator',''),(025,'000025',NULL,'DAPL','/','M/S.','Sri Srinivasa Agencies',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'D.No.40/582, ','Dharmapeta, Kurnool','IN','AP','518004','','9866918609','','','37ATUPD0973E1ZI',NULL,0,0.00,'2019-04-04 06:03:03',NULL,'2019-04-04 06:03:03',NULL,'2019-04-04 06:03:03',NULL,'1',NULL,NULL),(026,'000026',NULL,'DAPL','/','MS.','M/S.Pranavi Krishna Agencies',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'Madanapalli Road,',' Gangavaram,Palamaneru -','IN','AP',' 517408','','9701745579','','','37AENPU2710E1ZG',NULL,0,0.00,'2019-04-05 00:00:00',NULL,'2019-04-04 18:16:45',NULL,'2019-04-04 18:16:45',NULL,'1','T Subbarayulu',''),(027,'000027',NULL,'DAPL','/','M/S.','M/S.Sri Harsha Agencies',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'No.6-1459,','D.M.M Gate Road,Gunthakal','IN','AP','515801','','9963466522','','','37AEWPN7157F1ZT',NULL,0,0.00,'2019-04-04 19:40:59',NULL,'2019-04-04 19:40:59',NULL,'2019-04-04 19:40:59',NULL,'1',NULL,NULL),(028,'000028','900','DAPL','/','M/S.','TATA CONSULTANCY SERVICES (Tirupathi)',NULL,'Retailer','Delhi',NULL,'1/1075/1/2 GF4, ','Mehrauli, New Delhi - 110030','IN','DL','110030','','8142421212','','','NA',NULL,0,0.00,'2019-04-04 22:13:32',NULL,'2019-04-04 22:13:32',NULL,'2019-04-04 22:13:32',NULL,'1',NULL,NULL),(029,'000029','900','DAPL','/','M/S.','TATA CONSULTANCY SERVICES (Kurnool)',NULL,'Retailer','Delhi',NULL,'1/1075/1/2 GF4, ','Mehrauli, New Delhi - 110030','IN','DL','110030','','9700728144','','','NA',NULL,0,0.00,'2019-04-04 22:21:14',NULL,'2019-04-04 22:21:14',NULL,'2019-04-04 22:21:14',NULL,'1',NULL,NULL),(030,'000030',NULL,'DAPL','/','M/S.','Al-Amin Traders',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'Gooty Kota Road,','Gooty','IN','AP','515401','','9848486739','','','37ATYPM0320N1Z5',NULL,0,0.00,'2019-04-05 04:52:07',NULL,'2019-04-05 04:52:07',NULL,'2019-04-05 04:52:07',NULL,'1',NULL,NULL),(031,'000031',NULL,'DAPL','/','M/S.','M/S.ARENCO CATERING',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'PLOT FORM NO - 1,','RAILWAY STATION,ONGOLE,PRAKASAM.','IN','AP','523001','','0000000000','','','37AAIFA4388F1ZA',NULL,0,0.00,'2019-04-05 06:00:23',NULL,'2019-04-05 06:00:23',NULL,'2019-04-05 06:00:23',NULL,'1',NULL,NULL),(032,'000032',NULL,'DAPL','/','M/S.','Sai Prabhakar Agencies',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'Door No: 3-315,','Kummarapet,Puttaparthi ','IN','AP','515134','','9440556900','','','37BQHPP0039G1ZV',NULL,0,0.00,'2019-04-05 23:18:16',NULL,'2019-04-05 23:18:16',NULL,'2019-04-05 23:18:16',NULL,'1',NULL,NULL),(033,'000033',NULL,'DAPL','/','M/S.','Sri Lakshmi Narasimha Enterprises',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'GONEPENT ROAD No.1/1645-1,','MARUTHI NAGAR PENUKONDA','IN','AP','515110','','9989091200','','','37ARXPP3994J1ZL',NULL,0,0.00,'2019-04-07 07:32:49',NULL,'2019-04-07 07:32:49',NULL,'2019-04-07 07:32:49',NULL,'1',NULL,NULL),(034,'000034',NULL,'DAPL','/','MS.','Padmasree Enterprises',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'1/236-25,','Vajralapeta,Penukonda,Ananthapur','IN','AP','515110','','9494042419','','','37AAVFP6806A1Z1',NULL,0,0.00,'2019-04-09 00:00:00',NULL,'2019-04-07 07:34:58',NULL,'2019-04-07 07:34:58',NULL,'1','T Subbarayulu',''),(035,'000035',NULL,'DAPL','/','M/S.','CPC Enterprises',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'Near 1 Town Police Station','Hindupur','IN','AP','515201','','9849849810','','','37EKRPS7245J1Z6',NULL,0,0.00,'2019-04-08 07:01:29',NULL,'2019-04-08 07:01:29',NULL,'2019-04-08 07:01:29',NULL,'1',NULL,NULL),(036,'000036',NULL,'DAPL','/','M/S.','Shaik Enterprises',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,' 1/1106, NH 7 ROAD, ','PENUKONDA - 515110','IN','AP','515110','','0000000000','','','37COSPS3795A1ZB',NULL,0,0.00,'2019-04-08 18:55:29',NULL,'2019-04-08 18:55:29',NULL,'2019-04-08 18:55:29',NULL,'1',NULL,NULL),(037,'000037',NULL,'DAPL','/','M/S.','Danilei India Ltd',NULL,'Retailer','Andhra Pradesh',NULL,'No.7000, Central Express Way,','Sricity, Sathyavedu Mandal,Chittoor - 517588','IN','AP','517588','','8297234533','','',' 37AABCG5359E1ZM',NULL,0,0.00,'2019-04-08 19:03:09',NULL,'2019-04-08 19:03:09',NULL,'2019-04-08 19:03:09',NULL,'1',NULL,NULL),(038,'000038',NULL,'DAPL','/','M/S.','Sree Radha Krishna Associates',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'Platform No.01, ','Railway station, Ongole','IN','AP',' 523001','','9160505057','','','37ABPFS1973A1Z0',NULL,0,0.00,'2019-04-09 05:59:09',NULL,'2019-04-09 05:59:09',NULL,'2019-04-09 05:59:09',NULL,'1',NULL,NULL),(039,'000039',NULL,'DAPL','/','Mr.','Majji Prakasa Rao',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'PLOT FORM NO - 1,','RAILWAY STATION,ONGOLE,PRAKASAM.','IN','AP','523001','','9160505057','','','37AHZPM7623H1ZM',NULL,0,0.00,'2019-04-09 06:01:20',NULL,'2019-04-09 06:01:20',NULL,'2019-04-09 06:01:20',NULL,'1',NULL,NULL),(040,'000040',NULL,'DAPL','/','Mr.','Chitti Babu',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'PLOT FORM NO - 1,','RAILWAY STATION,ONGOLE,PRAKASAM.','IN','AP','523001','','9160505057','','','37BICPP3020J1ZE',NULL,0,0.00,'2019-04-09 06:02:35',NULL,'2019-04-09 06:02:35',NULL,'2019-04-09 06:02:35',NULL,'1',NULL,NULL),(041,'000041',NULL,'DAPL','/','M/S.','Sri Srinivasa Enterprises',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'11/34/1,Nehru Bazar','Pileru','IN','AP','517214','','8008850261','','','37CXFPP7903P1ZO',NULL,0,0.00,'2019-04-09 21:47:13',NULL,'2019-04-09 21:47:13',NULL,'2019-04-09 21:47:13',NULL,'1',NULL,NULL),(042,'000042',NULL,'DAPL','/','M/S.','M/s.Anjali Enterprises',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'D.No:15-291-1,','Darga Vesdhi,Kutagulla,Kadiri','IN','AP',' 515591','','9848985698','','','37CGEPM8773Q1ZB',NULL,0,0.00,'2019-04-10 01:30:39',NULL,'2019-04-10 01:30:39',NULL,'2019-04-10 01:30:39',NULL,'1',NULL,NULL),(043,'000043',NULL,'DAPL','/','Mr.','P Bharath',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'Platform No.2 & 3,',' Railway Station Dhone','IN','AP','518222','','8309994279','','','37ASZPP7781J1ZG',NULL,0,0.00,'2019-04-11 07:41:56',NULL,'2019-04-11 07:41:56',NULL,'2019-04-11 07:41:56',NULL,'1',NULL,NULL),(044,'000044',NULL,'DAPL','/','M/S.','Bharath Agencies',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'2-55,Akkagari Peta,','Pichatoor,Chittoor Dt.','IN','AP','517587','','8885020345','','','37ADJPY3442L2ZV',NULL,0,0.00,'2019-04-11 08:35:59',NULL,'2019-04-11 08:35:59',NULL,'2019-04-11 08:35:59',NULL,'1',NULL,NULL),(045,'000045',NULL,'DAPL','/','M/S.','Keerthi Enterprises',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'D No.28-1357/A,New Balaji Colony,','Chittoor ','IN','AP',' 517001','','9440704005','','','37CVTPS3400A1ZM',NULL,0,0.00,'2019-04-11 08:58:45',NULL,'2019-04-11 08:58:45',NULL,'2019-04-11 08:58:45',NULL,'1',NULL,NULL),(046,'000046',NULL,'DAPL','/','M/S.','Naga Dheeraj Agencies',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'H.No.30/49-2,',' Polytechnic College Road,Dr. Girinath Centrer, Nandyal','IN','AP','518501','','9502091487','','','37DJPPS3355M1ZA',NULL,0,0.00,'2019-04-12 03:19:38',NULL,'2019-04-12 03:19:38',NULL,'2019-04-12 03:19:38',NULL,'1',NULL,NULL),(047,'000047','76050','DAPL','/','M/S.','Al-Amal Agencies',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'No.11/67, Near Darga, ','Kagithala Penta, Kadapa ','IN','AP','516001','','9440133635','','',' 37ANFPA2881F1Z7',NULL,0,0.00,'2019-04-13 06:08:16',NULL,'2019-04-13 06:08:16',NULL,'2019-04-13 06:08:16',NULL,'1',NULL,NULL),(048,'000048',NULL,'DAPL','/','M/S.','GREENPLY INDUSTRIES LIMITED',NULL,'Retailer','Andhra Pradesh',NULL,' SURVEY NO.97/1 AND SURVEY NO.98,99,','ROWTHUSURAMALA VILLAGE,THOTTAMBEDU','IN','AP','517644','','9100953277','','','37AAACG7284R1ZS',NULL,0,0.00,'2019-04-14 22:20:54',NULL,'2019-04-14 22:20:54',NULL,'2019-04-14 22:20:54',NULL,'1',NULL,NULL),(049,'000049','75600','DAPL','/','M/S.','TVR Agencies',NULL,'Distributor/Supplier','Andhra Pradesh',NULL,'Nagaladinne Road,','Mantralayam,Kurnool Dist-','IN','AP','518345','','9989265920','','','37ACRPY6972G1ZK',NULL,0,0.00,'2019-04-15 06:08:35',NULL,'2019-04-15 06:08:35',NULL,'2019-04-15 06:08:35',NULL,'1',NULL,NULL),(050,'000050','3960','DAPL','/','M/S.','V Mega Pictures LLP',NULL,'Retailer','Andhra Pradesh',NULL,'V Mega Talkies, Venugopalapuram','Ananthapur','IN','AP','510051','','9704056264','','','37AAQFV3949M1Z5',NULL,0,0.00,'2019-04-16 07:19:03',NULL,'2019-04-16 07:19:03',NULL,'2019-04-16 07:19:03',NULL,'1',NULL,NULL),(051,'000051',NULL,'DAPL','/','Mr.','Lento Partner',NULL,'Partner','Tamil Nadu',NULL,'no 910, alliance orchid springs , north korattur','chennai','IN','TN','600080','9791129332','9791129332','asaravanan248@gmail.com','','12333333333333333',NULL,0,0.00,'2019-10-01 06:42:17',NULL,'2019-10-01 06:42:17',NULL,'2019-10-01 06:42:17',NULL,'1',NULL,NULL),(052,'000052',NULL,'DAPL','/','Mr.','Maavin ',NULL,'Partner','Tamil Nadu',NULL,'no 920, alliance orchid springs','chennai','IN','TN','600080','9791129332','9887775678','asaravanan248@gmail.com','','234213412333333333',NULL,0,0.00,'2019-10-01 06:43:36',NULL,'2019-10-01 06:43:36',NULL,'2019-10-01 06:43:36',NULL,'1',NULL,NULL);
/*!40000 ALTER TABLE `customerprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custype`
--

DROP TABLE IF EXISTS `custype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custype` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `custype` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custype`
--

LOCK TABLES `custype` WRITE;
/*!40000 ALTER TABLE `custype` DISABLE KEYS */;
INSERT INTO `custype` VALUES (005,'Distributor/Supplier','Distributor'),(006,'Retailer','Retailer'),(007,'Marketing agent','Marketting Agent'),(021,'Wholesaler',''),(022,'Partner','Partner');
/*!40000 ALTER TABLE `custype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debitnotes`
--

DROP TABLE IF EXISTS `debitnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debitnotes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `debitnote_id` varchar(100) DEFAULT NULL,
  `debitnote_owner` varchar(255) DEFAULT NULL,
  `debitnote_vendor` varchar(20) DEFAULT NULL,
  `debitnote_comp_code` varchar(100) DEFAULT NULL,
  `debitnote_grn_id` varchar(50) DEFAULT NULL,
  `debitnote_vendor_ref_no` varchar(30) DEFAULT NULL,
  `debitnote_paymentdate` varchar(20) DEFAULT NULL,
  `debitnote_paymentmode` varchar(20) DEFAULT NULL,
  `debitnote_status` varchar(15) DEFAULT NULL,
  `debitnote_shipping_street` varchar(255) DEFAULT NULL,
  `debitnote_shipping_city` varchar(255) DEFAULT NULL,
  `debitnote_shipping_state` varchar(255) DEFAULT NULL,
  `debitnote_shipping_country` varchar(255) DEFAULT NULL,
  `debitnote_shipping_zip` varchar(255) DEFAULT NULL,
  `debitnote_shipping_phone` varchar(255) DEFAULT NULL,
  `debitnote_shipping_gstin` varchar(255) DEFAULT NULL,
  `debitnote_billing_street` varchar(255) DEFAULT NULL,
  `debitnote_billing_city` varchar(255) DEFAULT NULL,
  `debitnote_billing_state` varchar(255) DEFAULT NULL,
  `debitnote_billing_country` varchar(255) DEFAULT NULL,
  `debitnote_billing_zip` varchar(255) DEFAULT NULL,
  `debitnote_billing_phone` varchar(255) DEFAULT NULL,
  `debitnote_billing_gstin` varchar(255) DEFAULT NULL,
  `debitnote_value` varchar(100) DEFAULT NULL,
  `debitnote_tc` varchar(255) DEFAULT NULL,
  `debitnote_notes` varchar(255) DEFAULT NULL,
  `debitnote_email_notification` varchar(10) DEFAULT NULL,
  `debitnote_items` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debitnotes`
--

LOCK TABLES `debitnotes` WRITE;
/*!40000 ALTER TABLE `debitnotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `debitnotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estimates`
--

DROP TABLE IF EXISTS `estimates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estimates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `est_code` varchar(100) DEFAULT NULL,
  `est_owner` varchar(255) DEFAULT NULL,
  `est_customer` varchar(20) DEFAULT NULL,
  `est_comp_code` varchar(100) DEFAULT NULL,
  `est_cust_ref_no` varchar(30) DEFAULT NULL,
  `est_date` varchar(20) DEFAULT NULL,
  `est_expdate` varchar(20) DEFAULT NULL,
  `est_status` varchar(15) DEFAULT NULL,
  `est_cust_shipping_street` varchar(255) DEFAULT NULL,
  `est_cust_shipping_city` varchar(255) DEFAULT NULL,
  `est_cust_shipping_state` varchar(255) DEFAULT NULL,
  `est_cust_shipping_country` varchar(255) DEFAULT NULL,
  `est_cust_shipping_zip` varchar(255) DEFAULT NULL,
  `est_cust_shipping_phone` varchar(255) DEFAULT NULL,
  `est_cust_shipping_gstin` varchar(255) DEFAULT NULL,
  `est_cust_billing_street` varchar(255) DEFAULT NULL,
  `est_cust_billing_city` varchar(255) DEFAULT NULL,
  `est_cust_billing_state` varchar(255) DEFAULT NULL,
  `est_cust_billing_country` varchar(255) DEFAULT NULL,
  `est_cust_billing_zip` varchar(255) DEFAULT NULL,
  `est_cust_billing_phone` varchar(255) DEFAULT NULL,
  `est_cust_billing_gstin` varchar(255) DEFAULT NULL,
  `est_value` varchar(100) DEFAULT NULL,
  `est_tc` varchar(255) DEFAULT NULL,
  `est_cust_notes` varchar(255) DEFAULT NULL,
  `est_items` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estimates`
--

LOCK TABLES `estimates` WRITE;
/*!40000 ALTER TABLE `estimates` DISABLE KEYS */;
/*!40000 ALTER TABLE `estimates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenseacctmaster`
--

DROP TABLE IF EXISTS `expenseacctmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenseacctmaster` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `accountname` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenseacctmaster`
--

LOCK TABLES `expenseacctmaster` WRITE;
/*!40000 ALTER TABLE `expenseacctmaster` DISABLE KEYS */;
INSERT INTO `expenseacctmaster` VALUES (001,'Advertising & Marketing','Advertising & Marketing'),(002,'Automobile Expense','Automobile Expense'),(003,'Consultant Expense','Consultant Expense'),(004,'Credit Card Charges','Credit Card Charges'),(005,'IT & Internet Expense','IT & Internet Expense'),(006,'Lodging','Lodging'),(007,'Meals and Entertainment','Functions'),(008,'Office Supplies','office'),(009,'Other Expense','Other Expense'),(010,'Printing and Staionary','Printing and Staionary'),(011,'Rent Expense','Rent Expense'),(012,'Repairs & Maintenance','Repairs & Maintenance'),(013,'Salaries & Employee Wages','Salaries & Employee Wages'),(014,'Telephone Expense','Telephone Expense'),(015,'Travel Expense','Travel Expense'),(016,'Employee Reimbursement','Employee Reimbursement'),(020,'Employee Advance','Employee Advance');
/*!40000 ALTER TABLE `expenseacctmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expensenoteslog`
--

DROP TABLE IF EXISTS `expensenoteslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expensenoteslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherid` varchar(100) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `createdby` varchar(100) NOT NULL,
  `updatedby` varchar(100) DEFAULT NULL,
  `createdon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expensenoteslog`
--

LOCK TABLES `expensenoteslog` WRITE;
/*!40000 ALTER TABLE `expensenoteslog` DISABLE KEYS */;
INSERT INTO `expensenoteslog` VALUES (1,'00002','sdfsdfsd',' ','0','2018-05-05 00:00:00','2018-05-05 08:26:39'),(2,'','Updated on cash','','0','2018-05-05 08:28:36','2018-05-05 00:00:00'),(3,'','repairs','','0','2018-05-05 08:31:53','2018-05-05 00:00:00'),(4,'','travel expense','','0','2018-05-05 08:33:13','2018-05-01 00:00:00'),(5,'','travel','','0','2018-05-05 08:34:38','2018-05-05 00:00:00'),(6,'00003','fsdfsdfsd',' ','0','2018-05-05 00:00:00','2018-05-05 08:36:59'),(7,'','afdaf','','0','2018-05-05 08:37:13','2018-05-05 00:00:00'),(8,'','ffs','','0','2018-05-05 08:38:55','2018-05-05 00:00:00'),(9,'','ffs','','0','2018-05-05 08:42:49','2018-05-05 00:00:00'),(10,'','ffs','','0','2018-05-05 08:44:07','2018-05-05 00:00:00'),(11,'','ffs','','0','2018-05-05 08:48:59','2018-05-05 00:00:00'),(12,'','ffs','','0','2018-05-05 08:49:45','2018-05-05 00:00:00'),(13,'00002','asfdfsd','','0','2018-05-05 08:50:56','2018-05-05 00:00:00'),(14,'00002','asfdfsd','','0','2018-05-05 08:51:40','2018-05-05 00:00:00'),(15,'00002','notes','','0','2018-05-05 08:51:51','2018-05-05 00:00:00'),(16,'00002','notesdfgfdghfdg','','0','2018-05-05 08:52:12','2018-05-05 00:00:00'),(17,'00004','etrtretre','Bhairava','0','2018-05-11 00:00:00','2018-05-11 21:45:06'),(18,'00004','','','0','2018-05-11 21:46:10','2018-05-11 00:00:00'),(19,'00004','','','0','2018-05-11 21:50:28','2018-05-11 00:00:00'),(20,'00004','','','0','2018-05-11 21:50:56','2018-05-11 00:00:00'),(21,'00002','adadas','','Bhairava','2018-05-12 21:05:46','2018-05-05 00:00:00'),(22,'00004','asdsada','','Janessha','2018-05-12 21:06:31','2018-05-11 00:00:00'),(23,'00004','aasdasdsa','','Janessha','2018-05-12 21:08:45','2018-05-11 00:00:00'),(24,'00004','','','Janessha','2018-05-12 21:10:46','2018-05-11 00:00:00'),(25,'00005','sfsfsdfs','Janessha',NULL,'2018-05-12 00:00:00','2018-05-12 21:11:19'),(26,'00005','affdsfsd','','Bhairava','2018-05-12 21:11:45','2018-05-12 00:00:00'),(27,'00005','fgdgd','','Bhairava','2018-05-12 21:13:17','2018-05-12 00:00:00'),(28,'00005','','','Bhairava','2018-05-12 21:13:34','2018-05-12 00:00:00'),(29,'00006','fsdfsd','Bhairava',NULL,'2018-05-12 00:00:00','2018-05-12 21:16:38');
/*!40000 ALTER TABLE `expensenoteslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grn_notes`
--

DROP TABLE IF EXISTS `grn_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grn_notes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `grn_id` varchar(100) DEFAULT NULL,
  `grn_comp_code` varchar(50) DEFAULT NULL,
  `grn_owner` varchar(100) DEFAULT NULL,
  `grn_po_code` varchar(100) DEFAULT NULL,
  `grn_po_value` varchar(100) DEFAULT NULL,
  `grn_po_vendor` varchar(50) DEFAULT NULL,
  `grn_payterm` varchar(50) DEFAULT NULL,
  `grn_po_payterm` varchar(50) DEFAULT NULL,
  `grn_po_date` varchar(10) DEFAULT NULL,
  `grn_po_deliveryat` varchar(100) DEFAULT NULL,
  `grn_po_shippingvia` varchar(255) DEFAULT NULL,
  `grn_balance` varchar(45) DEFAULT NULL,
  `grn_date` varchar(45) DEFAULT NULL,
  `grn_due_date` varchar(45) DEFAULT NULL,
  `grn_payment_status` varchar(45) DEFAULT NULL,
  `grn_invoice_no` varchar(45) DEFAULT NULL,
  `grn_invoice_date` varchar(45) DEFAULT NULL,
  `grn_delivery_on` varchar(45) DEFAULT NULL,
  `grn_freight` varchar(100) DEFAULT NULL,
  `grn_status` varchar(45) DEFAULT NULL,
  `grn_notes` varchar(255) DEFAULT NULL,
  `grn_po_items` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grn_notes`
--

LOCK TABLES `grn_notes` WRITE;
/*!40000 ALTER TABLE `grn_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `grn_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Admin','Unrestricted Access to All Modules. Administrator'),(9,'General Manager','General Manager'),(10,'Senior Manager Commercial','Senior Manager Commercial'),(11,'Manager','Senior Manager - Quality Assurance'),(12,'Executive','Stores Executive');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hsncode_lookups`
--

DROP TABLE IF EXISTS `hsncode_lookups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsncode_lookups` (
  `id` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `hsncode` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hsncode_lookups`
--

LOCK TABLES `hsncode_lookups` WRITE;
/*!40000 ALTER TABLE `hsncode_lookups` DISABLE KEYS */;
/*!40000 ALTER TABLE `hsncode_lookups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_code` varchar(100) DEFAULT NULL,
  `inv_type` varchar(30) DEFAULT NULL,
  `inv_owner` varchar(255) DEFAULT NULL,
  `inv_customer` varchar(100) DEFAULT NULL,
  `inv_comp_code` varchar(100) DEFAULT NULL,
  `inv_vendor` varchar(255) DEFAULT NULL,
  `inv_so_code` varchar(100) DEFAULT NULL,
  `inv_description` varchar(255) DEFAULT NULL,
  `inv_date` varchar(100) DEFAULT NULL,
  `inv_duedate` varchar(100) DEFAULT NULL,
  `inv_cust_ref_phno` varchar(100) DEFAULT NULL,
  `inv_paymentmode` varchar(100) DEFAULT NULL,
  `inv_receipt_no` varchar(100) DEFAULT NULL,
  `inv_payterm` varchar(255) DEFAULT NULL,
  `inv_payterm_desc` varchar(50) DEFAULT NULL,
  `inv_shippingvia` varchar(100) DEFAULT NULL,
  `inv_deliveryat` varchar(100) DEFAULT NULL,
  `inv_deliverydate` varchar(100) DEFAULT NULL,
  `inv_status` varchar(15) DEFAULT NULL,
  `inv_freight` varchar(255) DEFAULT NULL,
  `inv_shipping_street` varchar(255) DEFAULT NULL,
  `inv_shipping_city` varchar(255) DEFAULT NULL,
  `inv_shipping_state` varchar(255) DEFAULT NULL,
  `inv_shipping_country` varchar(255) DEFAULT NULL,
  `inv_shipping_zip` varchar(255) DEFAULT NULL,
  `inv_shipping_phone` varchar(255) DEFAULT NULL,
  `inv_shipping_gstin` varchar(255) DEFAULT NULL,
  `inv_billing_street` varchar(255) DEFAULT NULL,
  `inv_billing_city` varchar(255) DEFAULT NULL,
  `inv_billing_state` varchar(255) DEFAULT NULL,
  `inv_billing_country` varchar(255) DEFAULT NULL,
  `inv_billing_zip` varchar(255) DEFAULT NULL,
  `inv_billing_phone` varchar(255) DEFAULT NULL,
  `inv_billing_gstin` varchar(255) DEFAULT NULL,
  `inv_value` varchar(100) DEFAULT NULL,
  `inv_balance_amt` varchar(30) DEFAULT NULL,
  `inv_payment_status` varchar(30) DEFAULT NULL,
  `inv_tc` varchar(255) DEFAULT NULL,
  `inv_notes` varchar(255) DEFAULT NULL,
  `inv_items` longtext,
  `inv_truck_no` varchar(255) DEFAULT NULL,
  `inv_driver_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,'INV-00001-09/2019','Credit Invoice','Administrator','000021','DAPL001',NULL,'21312',NULL,'2019-09-13','2019-09-13',NULL,NULL,NULL,'1',NULL,NULL,'AP',NULL,'Created',NULL,'AIRPORT TERMINAL BUILDING 0-1,','TIRUPATHI','AP','IN','517501','0000000000','37AGMPM5247R1ZG','AIRPORT TERMINAL BUILDING 0-1,','TIRUPATHI','AP','IN','517501','0000000000','37AGMPM5247R1ZG','100.00','100.00','Unpaid',NULL,'sadas','[{\"itemdetails\":\"[000001] Demo\",\"itemcode\":\"1\",\"hsncode\":\"2312\",\"rwqty\":\"10\",\"tax_val\":\"5.00\",\"tax_id\":\"3\",\"tax_type\":\"split\",\"tax_method\":\"1\",\"rwprice\":\"10\",\"rwprice_org\":\"10\",\"rwamt\":\"100\",\"podiscount\":0,\"poadjustmentval\":\"\",\"podiscount_method\":\"flat\",\"uom\":\"BAG\"}]','33','11');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoicesacc`
--

DROP TABLE IF EXISTS `invoicesacc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoicesacc` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_code` varchar(100) DEFAULT NULL,
  `inv_type` varchar(30) DEFAULT NULL,
  `inv_owner` varchar(255) DEFAULT NULL,
  `inv_customer` varchar(100) DEFAULT NULL,
  `inv_comp_code` varchar(100) DEFAULT NULL,
  `inv_vendor` varchar(255) DEFAULT NULL,
  `inv_so_code` varchar(100) DEFAULT NULL,
  `inv_description` varchar(255) DEFAULT NULL,
  `inv_date` varchar(100) DEFAULT NULL,
  `inv_duedate` varchar(100) DEFAULT NULL,
  `inv_cust_ref_phno` varchar(100) DEFAULT NULL,
  `inv_paymentmode` varchar(100) DEFAULT NULL,
  `inv_receipt_no` varchar(100) DEFAULT NULL,
  `inv_payterm` varchar(255) DEFAULT NULL,
  `inv_payterm_desc` varchar(50) DEFAULT NULL,
  `inv_shippingvia` varchar(100) DEFAULT NULL,
  `inv_deliveryat` varchar(100) DEFAULT NULL,
  `inv_deliverydate` varchar(100) DEFAULT NULL,
  `inv_status` varchar(15) DEFAULT NULL,
  `inv_freight` varchar(255) DEFAULT NULL,
  `inv_shipping_street` varchar(255) DEFAULT NULL,
  `inv_shipping_city` varchar(255) DEFAULT NULL,
  `inv_shipping_state` varchar(255) DEFAULT NULL,
  `inv_shipping_country` varchar(255) DEFAULT NULL,
  `inv_shipping_zip` varchar(255) DEFAULT NULL,
  `inv_shipping_phone` varchar(255) DEFAULT NULL,
  `inv_shipping_gstin` varchar(255) DEFAULT NULL,
  `inv_billing_street` varchar(255) DEFAULT NULL,
  `inv_billing_city` varchar(255) DEFAULT NULL,
  `inv_billing_state` varchar(255) DEFAULT NULL,
  `inv_billing_country` varchar(255) DEFAULT NULL,
  `inv_billing_zip` varchar(255) DEFAULT NULL,
  `inv_billing_phone` varchar(255) DEFAULT NULL,
  `inv_billing_gstin` varchar(255) DEFAULT NULL,
  `inv_value` varchar(100) DEFAULT NULL,
  `inv_balance_amt` varchar(30) DEFAULT NULL,
  `inv_payment_status` varchar(30) DEFAULT NULL,
  `inv_tc` varchar(255) DEFAULT NULL,
  `inv_notes` varchar(255) DEFAULT NULL,
  `inv_items` longtext,
  `inv_truck_no` varchar(255) DEFAULT NULL,
  `inv_driver_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicesacc`
--

LOCK TABLES `invoicesacc` WRITE;
/*!40000 ALTER TABLE `invoicesacc` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoicesacc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemaster`
--

DROP TABLE IF EXISTS `itemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemaster` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemaster`
--

LOCK TABLES `itemaster` WRITE;
/*!40000 ALTER TABLE `itemaster` DISABLE KEYS */;
INSERT INTO `itemaster` VALUES (3,'Pectin','pectin'),(4,'Potassium Sorbate','Potassium'),(5,'Ascarbic Acid','acid'),(6,'(KMS) potassium Meta BI Sulphite','Sulphite'),(7,'Sunset Yellow','sunset'),(8,'Mango Flavour S3212','Mango Flavour '),(9,'Mango Pulp','Pulp'),(10,'Sugar','Sugar'),(11,'Apple Pulp 200ML','Petbottle');
/*!40000 ALTER TABLE `itemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemcategory`
--

DROP TABLE IF EXISTS `itemcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemcategory`
--

LOCK TABLES `itemcategory` WRITE;
/*!40000 ALTER TABLE `itemcategory` DISABLE KEYS */;
INSERT INTO `itemcategory` VALUES (1,'CAT001','Mango Pulp','Mango Pulp');
/*!40000 ALTER TABLE `itemcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `locname` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (31,'Andhra','Andhra'),(32,'ARC â€“ Sullurpeta / Renigunta','ARC â€“ Sullurpeta / Renigunta');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(12) NOT NULL,
  `payment_vendor` varchar(45) DEFAULT NULL,
  `payment_invoice_no` varchar(45) DEFAULT NULL,
  `payment_amount` varchar(100) DEFAULT NULL,
  `payment_credits_used` varchar(100) DEFAULT NULL,
  `payment_date` varchar(45) DEFAULT NULL,
  `payment_mode` varchar(45) DEFAULT NULL,
  `payment_ref_no` varchar(45) DEFAULT NULL,
  `payment_bank` varchar(255) DEFAULT NULL,
  `payment_po_code` varchar(45) DEFAULT NULL,
  `payment_grn_id` varchar(45) DEFAULT NULL,
  `payment_user` varchar(100) DEFAULT NULL,
  `payment_notes` varchar(255) DEFAULT NULL,
  `payment_file` varchar(255) DEFAULT NULL,
  `payment_notify` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentterm`
--

DROP TABLE IF EXISTS `paymentterm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentterm` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `paymentterm` varchar(40) NOT NULL,
  `noofdays` varchar(50) NOT NULL,
  `description` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentterm`
--

LOCK TABLES `paymentterm` WRITE;
/*!40000 ALTER TABLE `paymentterm` DISABLE KEYS */;
INSERT INTO `paymentterm` VALUES (031,'Advance','1','Advance'),(032,'Immediate','2','Immediate Payment'),(033,'Due 60 Days','60','Due on 60 Days '),(034,'Due on Receipt','3','Due on Receipt'),(035,'Due 30 Days','30','Due 30 Days'),(036,'Due 15 Days','15','Due on 15 Days'),(037,'Due 7 Days','7','Due 7 Days');
/*!40000 ALTER TABLE `paymentterm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proditemaster`
--

DROP TABLE IF EXISTS `proditemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proditemaster` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `itemcode` varchar(100) NOT NULL,
  `itemname` varchar(100) NOT NULL,
  `prodqty` decimal(10,2) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proditemaster`
--

LOCK TABLES `proditemaster` WRITE;
/*!40000 ALTER TABLE `proditemaster` DISABLE KEYS */;
INSERT INTO `proditemaster` VALUES (1,'P001','Apple Pulp 200ml',0.00,'200ml'),(2,'P002','Mango Pulp',0.00,'Totapuri'),(3,'P003','Gova Pulp 200ML',0.00,'Pulp'),(4,'P004','demo',0.00,'');
/*!40000 ALTER TABLE `proditemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productionlist`
--

DROP TABLE IF EXISTS `productionlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productionlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entrytype` varchar(20) NOT NULL,
  `custid` varchar(10) NOT NULL,
  `orgid` varchar(10) NOT NULL,
  `prod_code` varchar(20) NOT NULL,
  `prod_handler` varchar(100) NOT NULL,
  `prod_company` varchar(100) NOT NULL,
  `prod_item` varchar(10) NOT NULL,
  `prod_qty` int(10) NOT NULL,
  `prod_uom` varchar(50) NOT NULL,
  `prod_date` varchar(12) NOT NULL,
  `prod_status` varchar(15) NOT NULL,
  `prod_raw_items` text NOT NULL,
  `prod_notes` varchar(355) NOT NULL,
  `prod_edit` int(1) NOT NULL,
  `prod_created_date` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productionlist`
--

LOCK TABLES `productionlist` WRITE;
/*!40000 ALTER TABLE `productionlist` DISABLE KEYS */;
INSERT INTO `productionlist` VALUES (10,'self','','','LENPRD-01','Lento','001','000001',12,'BKT','2019-10-03','Created','[{\"item\":\"LRM01\",\"uom\":\"BKT\",\"qty\":\"12\"},{\"item\":\"LRM03\",\"uom\":\"CAN\",\"qty\":\"23\"}]','srarafsgs',0,'2019-10-03');
/*!40000 ALTER TABLE `productionlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseitemaster`
--

DROP TABLE IF EXISTS `purchaseitemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseitemaster` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `entrytype` varchar(50) NOT NULL,
  `orgid` varchar(50) NOT NULL,
  `custid` varchar(50) NOT NULL,
  `itemcode` varchar(100) NOT NULL,
  `itemname` varchar(50) NOT NULL,
  `category` varchar(50) DEFAULT ' ',
  `description` varchar(100) DEFAULT NULL,
  `vendor` varchar(255) NOT NULL,
  `hsncode` varchar(100) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT '1',
  `priceperqty` decimal(10,2) DEFAULT '0.00',
  `salespriceperqty` decimal(10,2) DEFAULT NULL,
  `uom` varchar(100) NOT NULL,
  `taxmethod` varchar(20) NOT NULL DEFAULT '0',
  `taxname` varchar(100) NOT NULL,
  `taxrate` decimal(10,2) NOT NULL,
  `taxtype` varchar(50) NOT NULL,
  `taxid` varchar(50) NOT NULL,
  `taxamount` decimal(10,2) NOT NULL,
  `itemcost` decimal(10,2) NOT NULL,
  `taxableprice` decimal(10,2) NOT NULL,
  `pricedatefrom` date NOT NULL,
  `stockinqty` decimal(10,2) DEFAULT NULL,
  `stockinuom` varchar(100) DEFAULT NULL,
  `lowstockalert` varchar(50) NOT NULL,
  `stockasofdate` date DEFAULT NULL,
  `usageunit` varchar(30) DEFAULT NULL,
  `handler` varchar(30) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `updatedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseitemaster`
--

LOCK TABLES `purchaseitemaster` WRITE;
/*!40000 ALTER TABLE `purchaseitemaster` DISABLE KEYS */;
INSERT INTO `purchaseitemaster` VALUES (1,'','001','','LRM01','Citric Acid','Select Category','','Open Vendors','11','1',10.00,NULL,'KGS','1','5%GST',5.00,'split','3',0.50,9.50,10.00,'2019-09-18',100.00,'KGS','10','2019-09-18',NULL,'Lento','Added','2019-09-18 09:42:02',NULL),(2,'','001','','LRM02','Sodium Benzoate','Select Category','','Open Vendors','10000','1',10.00,NULL,'KGS','Select Tax Method','',0.00,'','0',0.00,10.00,10.00,'2019-09-18',100.00,'BAG','11','2019-09-18',NULL,'Lento','added','2019-09-18 09:43:26',NULL),(3,'','001','','LRM03','Pectin','Select Category','','Open Vendors','11','1',0.00,NULL,'BAG','1','',0.00,'','0',0.00,0.00,0.00,'2019-09-18',211.00,'KGS','10','2019-09-18',NULL,'Lento','added','2019-09-18 09:44:16',NULL),(4,'','001','','LRM04','Sodium Citrate','Select Category','','Open Vendors','','1',0.00,NULL,'0','Select Tax Method','',0.00,'','0',0.00,0.00,0.00,'2019-09-18',100.00,'KGS','10','2019-09-18',NULL,'Lento','added','2019-09-18 09:45:21',NULL),(5,'','001','','LRM05','Potassium Sorbate','Select Category','','Open Vendors','','1',0.00,NULL,'BAG','Select Tax Method','',0.00,'','0',0.00,0.00,0.00,'2019-09-18',100.00,'BAG','10','2019-09-18',NULL,'Lento','added','2019-09-18 09:47:24',NULL),(6,'','001','','LRM06','Ascarbic Acid','Select Category','','Open Vendors','','1',0.00,NULL,'KIT','Select Tax Method','',0.00,'','0',0.00,0.00,0.00,'2019-09-18',100.00,'GAL','5','2019-09-18',NULL,'Lento','added','2019-09-18 09:48:15',NULL),(7,'','001','','LRM07','(KMS) Potassium metta BI Sulphite','Select Category','','Open Vendors','999','1',0.00,NULL,'BAG','Select Tax Method','',0.00,'','0',0.00,0.00,0.00,'2019-09-18',136.00,'DRM','4','2019-09-18',NULL,'Lento','added','2019-09-18 09:49:26',NULL),(8,'','001','','LRM08','Sunset Yellow','Select Category','','Open Vendors','','1',0.00,NULL,'0','Select Tax Method','',0.00,'','0',0.00,0.00,0.00,'2019-09-18',100.00,'BAG','1','2019-09-18',NULL,'Lento','added','2019-09-18 09:52:00',NULL),(9,'','001','','LRM09','Mango Flavour S3212','Select Category','','Open Vendors','','1',0.00,NULL,'FT','Select Tax Method','',0.00,'','0',0.00,0.00,0.00,'2019-09-18',100.00,'IN','1','2019-09-18',NULL,'Lento','added','2019-09-18 09:52:44',NULL),(10,'','001','','LRM010','Mango Pulp','Select Category','','Open Vendors','','1',18.00,NULL,'KGS','1','18%(GST)',18.00,'split','7',3.24,14.76,18.00,'2019-09-18',100.00,'KGS','10','2019-09-18',NULL,'Lento','added','2019-09-18 09:53:31',NULL),(11,'','001','','LRM011','Sugar','Select Category','','Open Vendors','','1',0.00,NULL,'0','1','5%GST',5.00,'split','3',0.00,0.00,0.00,'2019-09-18',100.00,'BAG','1','2019-09-18',NULL,'Lento','added','2019-09-18 09:54:26',NULL),(13,'','002','','LRM012','ssss','Select Category',NULL,'Open Vendors','','1',0.00,NULL,'0','Select Tax Method','',0.00,'','0',0.00,0.00,0.00,'2019-09-19',100.00,'0','2','2019-09-19',NULL,'Lento','','2019-09-19 16:10:09',NULL),(14,'','001','','LenLRM014','sample','CAT001',NULL,'00001','','1',100.00,NULL,'BAG','1','5%GST',5.00,'split','3',5.00,95.00,100.00,'2019-09-23',100.00,'BAG','9','2019-09-24',NULL,'Lento','','2019-09-24 17:21:46',NULL),(16,'outsourced','','000052','MAA015','maa prod','CAT001',NULL,'00001','hsn5252626','1',111.00,NULL,'BAG','1','18%(IGST)',18.00,'single','5',19.98,91.02,111.00,'2019-10-01',121.00,'BAG','10','2019-10-01',NULL,'Lento','ass','2019-10-01 01:56:17',NULL),(17,'outsourced','','000052','MAA017','MaavinProduct','CAT001','','00001','jsjsks111','1',132.00,NULL,'BAG','1','0%',5.00,'single','3',6.10,115.90,132.00,'2019-10-02',142.00,'BAG','10','2019-10-02',NULL,'Lento','ss','2019-10-02 06:33:12',NULL);
/*!40000 ALTER TABLE `purchaseitemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseitemlog`
--

DROP TABLE IF EXISTS `purchaseitemlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseitemlog` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `entrytype` varchar(20) NOT NULL,
  `custid` varchar(10) NOT NULL,
  `orgid` varchar(50) NOT NULL,
  `itemcode` varchar(50) NOT NULL,
  `itemname` varchar(100) NOT NULL,
  `qtyonhand` decimal(10,2) DEFAULT NULL,
  `newqty` decimal(10,2) DEFAULT NULL,
  `qtyadjusted` decimal(10,2) DEFAULT '0.00',
  `uom` varchar(100) DEFAULT NULL,
  `adjustedon` date DEFAULT NULL,
  `handler` varchar(100) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseitemlog`
--

LOCK TABLES `purchaseitemlog` WRITE;
/*!40000 ALTER TABLE `purchaseitemlog` DISABLE KEYS */;
INSERT INTO `purchaseitemlog` VALUES (0001,'','','001','LRM04','Sodium Citrate',100.00,NULL,0.00,'KGS','2019-09-18','Lento','added'),(0002,'','','001','LRM05','Potassium Sorbate',100.00,NULL,0.00,'BAG','2019-09-18','Lento','added'),(0003,'','','001','LRM06','Ascarbic Acid',100.00,NULL,0.00,'GAL','2019-09-18','Lento','added'),(0004,'','','001','LRM07','(KMS) Potassium metta BI Sulphite',100.00,NULL,0.00,'DRM','2019-09-18','Lento','added'),(0005,'','','001','LRM08','Sunset Yellow',100.00,NULL,0.00,'BAG','2019-09-18','Lento','added'),(0006,'','','001','LRM09','Mango Flavour S3212',100.00,NULL,0.00,'IN','2019-09-18','Lento','added'),(0007,'','','001','LRM010','Mango Pulp',100.00,NULL,0.00,'KGS','2019-09-18','Lento','added'),(0008,'','','001','LRM011','Sugar',100.00,NULL,0.00,'BAG','2019-09-18','Lento','added'),(0009,'','','001','LRM012','demotest',99.00,NULL,0.00,'0','2019-09-18','Lento','added'),(0010,'','','002','LRM012','ssss',100.00,NULL,0.00,'0','2019-09-19','Lento',''),(0011,'','','001','LenLRM014','sample',100.00,NULL,0.00,'BAG','2019-09-24','Lento',''),(0012,'','','000052','MAA015','Maavin Product',120.00,NULL,0.00,'BAG','2019-10-01','Lento','sasas'),(0013,'','','000052','MAA015','maa prod',121.00,NULL,0.00,'BAG','2019-10-01','Lento','ass'),(0014,'','','000052','MAA017','MaavinProduct',122.00,NULL,0.00,'BAG','2019-10-02','Lento','ss'),(0015,'','','000052','MAA017','MaavinProduct',142.00,NULL,20.00,'BAG','2019-10-02','Lento','');
/*!40000 ALTER TABLE `purchaseitemlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorders`
--

DROP TABLE IF EXISTS `purchaseorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchaseorders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `po_code` varchar(100) DEFAULT NULL,
  `po_owner` varchar(255) DEFAULT NULL,
  `po_comp_code` varchar(100) DEFAULT NULL,
  `po_vendor` varchar(255) DEFAULT NULL,
  `po_description` varchar(255) DEFAULT NULL,
  `po_date` varchar(100) DEFAULT NULL,
  `po_payterm` varchar(255) DEFAULT NULL,
  `po_payterm_desc` varchar(50) DEFAULT NULL,
  `po_shippingvia` varchar(100) DEFAULT NULL,
  `po_deliveryat` varchar(100) DEFAULT NULL,
  `po_deliverydate` varchar(100) DEFAULT NULL,
  `po_status` varchar(15) DEFAULT NULL,
  `po_freight` varchar(255) DEFAULT NULL,
  `po_shipping_street` varchar(255) DEFAULT NULL,
  `po_shipping_city` varchar(255) DEFAULT NULL,
  `po_shipping_state` varchar(255) DEFAULT NULL,
  `po_shipping_country` varchar(255) DEFAULT NULL,
  `po_shipping_zip` varchar(255) DEFAULT NULL,
  `po_shipping_phone` varchar(255) DEFAULT NULL,
  `po_shipping_gstin` varchar(255) DEFAULT NULL,
  `po_billing_street` varchar(255) DEFAULT NULL,
  `po_billing_city` varchar(255) DEFAULT NULL,
  `po_billing_state` varchar(255) DEFAULT NULL,
  `po_billing_country` varchar(255) DEFAULT NULL,
  `po_billing_zip` varchar(255) DEFAULT NULL,
  `po_billing_phone` varchar(255) DEFAULT NULL,
  `po_billing_gstin` varchar(255) DEFAULT NULL,
  `po_value` varchar(100) DEFAULT NULL,
  `po_tc` varchar(255) DEFAULT NULL,
  `po_notes` varchar(255) DEFAULT NULL,
  `po_items` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorders`
--

LOCK TABLES `purchaseorders` WRITE;
/*!40000 ALTER TABLE `purchaseorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchaseorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purpricemaster`
--

DROP TABLE IF EXISTS `purpricemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purpricemaster` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `itemcode` varchar(30) NOT NULL,
  `taxmethod` varchar(30) NOT NULL,
  `taxrate` decimal(10,1) NOT NULL,
  `priceperqty` decimal(10,1) NOT NULL,
  `priceperuom` decimal(10,1) NOT NULL,
  `datefrom` date NOT NULL,
  `notes` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purpricemaster`
--

LOCK TABLES `purpricemaster` WRITE;
/*!40000 ALTER TABLE `purpricemaster` DISABLE KEYS */;
INSERT INTO `purpricemaster` VALUES (003,'DAPL/Cap/001','0',12.5,12.2,120.2,'2017-04-10','sadasda'),(005,'DAPL/Bott/005','0',18.5,12.2,120.8,'2017-04-18','Notes');
/*!40000 ALTER TABLE `purpricemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rawitemaster`
--

DROP TABLE IF EXISTS `rawitemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rawitemaster` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `entrytype` varchar(50) DEFAULT NULL,
  `custid` varchar(10) DEFAULT NULL,
  `rw_code` varchar(10) NOT NULL,
  `orgid` varchar(10) NOT NULL,
  `proditemcode` varchar(100) NOT NULL,
  `raw_items` text NOT NULL,
  `handler` varchar(255) NOT NULL,
  `createdon` date DEFAULT NULL,
  `createdby` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawitemaster`
--

LOCK TABLES `rawitemaster` WRITE;
/*!40000 ALTER TABLE `rawitemaster` DISABLE KEYS */;
INSERT INTO `rawitemaster` VALUES (22,'self',NULL,'RM-001','001','000001','[{\"item\":\"LRM01\",\"itemname\":\"LRM01-Citric Acid\",\"uom\":\"BKT\",\"qty\":\"12\"},{\"item\":\"LRM03\",\"itemname\":\"LRM03-Pectin\",\"uom\":\"CAN\",\"qty\":\"23\"}]','Lento',NULL,''),(23,'outsourced','000052','RM-0023','','MAA-020','[{\"item\":\"MAA017\",\"itemname\":\"MAA017-MaavinProduct\",\"uom\":\"BKT\",\"qty\":\"12\"}]','Lento',NULL,'');
/*!40000 ALTER TABLE `rawitemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordexpense`
--

DROP TABLE IF EXISTS `recordexpense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordexpense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucherid` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `accountname` varchar(250) NOT NULL,
  `payee` varchar(100) NOT NULL,
  `payeetype` varchar(100) NOT NULL,
  `paymentype` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `image` varchar(155) DEFAULT NULL,
  `createdby` varchar(100) DEFAULT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedby` varchar(100) NOT NULL,
  `updatedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordexpense`
--

LOCK TABLES `recordexpense` WRITE;
/*!40000 ALTER TABLE `recordexpense` DISABLE KEYS */;
/*!40000 ALTER TABLE `recordexpense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordpayments`
--

DROP TABLE IF EXISTS `recordpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recordpayments` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `transid` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `partyname` varchar(155) NOT NULL,
  `place` varchar(155) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `receivedat` varchar(100) NOT NULL,
  `reference` varchar(155) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `image` varchar(155) DEFAULT NULL,
  `createdby` varchar(100) DEFAULT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedby` varchar(100) DEFAULT NULL,
  `updatedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recordpayments`
--

LOCK TABLES `recordpayments` WRITE;
/*!40000 ALTER TABLE `recordpayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `recordpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesitemaster`
--

DROP TABLE IF EXISTS `salesitemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesitemaster` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `entrytype` varchar(20) NOT NULL,
  `custid` varchar(10) NOT NULL,
  `itemcode` varchar(40) NOT NULL,
  `itemname` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `hsncode` varchar(100) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT '1',
  `priceperqty` decimal(10,2) NOT NULL,
  `salespriceperqty` decimal(10,2) NOT NULL,
  `uom` varchar(100) NOT NULL,
  `taxmethod` varchar(20) NOT NULL DEFAULT '0',
  `taxname` varchar(100) NOT NULL,
  `taxrate` decimal(10,1) NOT NULL,
  `taxamount` decimal(10,1) NOT NULL,
  `itemcost` decimal(10,1) NOT NULL,
  `taxableprice` decimal(10,1) NOT NULL,
  `pricedatefrom` date NOT NULL,
  `stockinqty` int(20) NOT NULL,
  `stockinuom` int(20) NOT NULL,
  `lowstockalert` varchar(50) NOT NULL,
  `stockasofdate` date NOT NULL,
  `usageunit` varchar(30) NOT NULL,
  `handler` varchar(30) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `updatedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesitemaster`
--

LOCK TABLES `salesitemaster` WRITE;
/*!40000 ALTER TABLE `salesitemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesitemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesitemaster2`
--

DROP TABLE IF EXISTS `salesitemaster2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesitemaster2` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `entrytype` varchar(20) NOT NULL,
  `custid` varchar(10) NOT NULL,
  `itemcode` varchar(100) DEFAULT NULL,
  `orgid` varchar(10) NOT NULL,
  `itemname` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sales_vendorid` varchar(20) DEFAULT NULL,
  `hsncode` varchar(100) DEFAULT NULL,
  `sales_priceperqty` varchar(100) DEFAULT NULL,
  `priceperqty` varchar(100) DEFAULT NULL,
  `sales_uom` varchar(100) DEFAULT NULL,
  `uom` varchar(100) DEFAULT NULL,
  `sales_taxmethod` varchar(20) DEFAULT '0',
  `taxmethod` varchar(20) DEFAULT '0',
  `sales_taxname` varchar(100) DEFAULT NULL,
  `taxname` varchar(100) DEFAULT NULL,
  `sales_taxrate` varchar(100) DEFAULT NULL,
  `taxrate` varchar(100) DEFAULT NULL,
  `sales_taxtype` varchar(50) DEFAULT NULL,
  `taxtype` varchar(50) DEFAULT NULL,
  `sales_taxamount` varchar(100) DEFAULT NULL,
  `taxamount` varchar(100) DEFAULT NULL,
  `sales_taxid` varchar(50) DEFAULT NULL,
  `taxid` varchar(50) DEFAULT NULL,
  `itemcost` varchar(100) DEFAULT NULL,
  `taxableprice` varchar(100) DEFAULT NULL,
  `sales_pricedatefrom` date DEFAULT NULL,
  `pricedatefrom` date DEFAULT NULL,
  `stockinqty` decimal(10,2) DEFAULT NULL,
  `stockinqty_date` varchar(30) DEFAULT NULL,
  `stockinuom` int(20) DEFAULT NULL,
  `lowstockalert` varchar(50) DEFAULT NULL,
  `stockasofdate` date DEFAULT NULL,
  `usageunit` varchar(30) DEFAULT NULL,
  `handler` varchar(30) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `updatedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesitemaster2`
--

LOCK TABLES `salesitemaster2` WRITE;
/*!40000 ALTER TABLE `salesitemaster2` DISABLE KEYS */;
INSERT INTO `salesitemaster2` VALUES (1,'','','000001','001','Apple','0',NULL,'00001','2312','10','','BAG','0','1','','5%GST','','5.00','0','split','','0.50','0.00','3','0','9.5',NULL,'2019-09-13','2019-09-13',80.00,'2019-09-13',NULL,'9',NULL,NULL,'Administrator','gghgh','2019-09-13 14:56:48',NULL),(2,'','','000002','001','Mango Juice 200ml','Select Category',NULL,'00001','111','10','','BAG','0','1','','5%GST','','5.00','0','split','','0.50','0.00','3','0','9.5',NULL,'2019-09-18','2019-09-18',100.00,'2019-09-18',NULL,'11',NULL,NULL,'Lento','added','2019-09-18 09:10:02',NULL),(3,'','','000003','002','sara','CAT001',NULL,'00001','skksks222','120','','BAG','0','1','','5%GST','','5.00','0','split','','6.00','0.00','3','0','114',NULL,'2019-09-25','2019-09-25',200.00,'2019-09-25',NULL,'10',NULL,NULL,'Lento','dd','2019-09-25 14:58:08',NULL),(4,'','','000004','003','New Product','CAT001',NULL,'Open Vendors','sfasdf','100','','BAG','0','1','','5%GST','','5.00','0','split','','5.00','0.00','3','0','95',NULL,'2019-09-27','2019-09-27',100.00,'2019-09-27',NULL,'10',NULL,NULL,'Lento','sss','2019-09-27 15:50:40',NULL),(5,'','','000005','003','New Product','CAT001',NULL,'Open Vendors','sfasdf','100','','BAG','0','1','','5%GST','','5.00','0','split','','5.00','0.00','3','0','95',NULL,'2019-09-27','2019-09-27',100.00,'2019-09-27',NULL,'10',NULL,NULL,'Lento','sss','2019-09-27 15:51:12',NULL),(6,'','','000006','003','new','CAT001',NULL,'Open Vendors','sdfasdf','11','','BAG','0','1','','18%(IGST)','','18.00','0','single','','1.98','0.00','5','0','9.02',NULL,'2019-09-27','2019-09-27',12.00,'2019-09-27',NULL,'10',NULL,NULL,'Lento','ss','2019-09-27 15:52:44',NULL),(7,'','','003000007','003','New Produc','CAT001',NULL,'00001','hsn322','122','','BAG','0','1','','5%GST','','5.00','0','split','','6.10','0.00','3','0','115.9',NULL,'2019-09-26','2019-09-27',111.00,'2019-09-27',NULL,'34',NULL,NULL,'Lento','ddd','2019-09-27 15:54:33',NULL),(8,'','','008','003','new product','CAT001',NULL,'Open Vendors','HSn29020','122','','BAG','0','1','','5%GST','','5.00','0','split','','6.10','0.00','3','0','115.9',NULL,'2019-09-27','2019-09-27',122.00,'2019-09-27',NULL,'22',NULL,NULL,'Lento','','2019-09-27 15:58:39',NULL),(9,'','','009','003','new product','CAT001',NULL,'Open Vendors','HSn29020','122','','BAG','0','1','','5%GST','','5.00','0','split','','6.10','0.00','3','0','115.9',NULL,'2019-09-27','2019-09-27',122.00,'2019-09-27',NULL,'22',NULL,NULL,'Lento','','2019-09-27 15:58:50',NULL),(10,'','','0030010','003','new product','CAT001',NULL,'Open Vendors','hsn223','122','','BAG','0','1','','5%GST','','5.00','0','split','','6.10','0.00','3','0','115.9',NULL,'2019-09-27','2019-09-27',11.00,'2019-09-27',NULL,'12',NULL,NULL,'Lento','','2019-09-27 16:00:21',NULL),(11,'','','0030011','003','values','CAT001',NULL,'00001','HSN22333','12233','','BKT','0','1','','5%GST','','5.00','0','split','','611.65','0.00','3','0','11621.35',NULL,'2019-09-27','2019-09-27',122.00,'2019-09-27',NULL,'22',NULL,NULL,'Lento','','2019-09-27 16:01:54',NULL),(12,'','','MAA0012','003','new','CAT001',NULL,'00001','hsn999','34','','BAG','0','1','','18%(IGST)','','18.00','0','single','','6.12','0.00','5','0','27.88',NULL,'2019-09-27','2019-09-27',100.00,'2019-09-27',NULL,'11',NULL,NULL,'Lento','','2019-09-27 16:04:14',NULL),(13,'','','MAA-013','000052','MaavinProduct','CAT001',NULL,'Open Vendors','hsn299292','123','','BKT','0','0','','5%GST','','5.00','0','split','','6.15','0.00','3','0','123',NULL,'2019-10-02','2019-10-02',12.00,'2019-10-02',NULL,'12',NULL,NULL,'Lento','xsas','2019-10-02 06:34:44',NULL),(14,'','','MAA-014','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-02 06:39:17',NULL),(15,'','','MAA-015','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-02 06:41:45',NULL),(16,'','','MAA-016','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-02 06:43:19',NULL),(17,'outsourced','000052','MAA-017','','maaproddddddd','CAT001',NULL,'00002','hsn988888','123','','BX','0','0','','18%(IGST)','','18.00','0','single','','22.14','0.00','5','0','123',NULL,'2019-10-02','2019-10-02',12.00,'2019-10-02',NULL,'5',NULL,NULL,'Lento','sasas','2019-10-02 06:46:12',NULL),(18,'outsourced','000052','MAA-018','','maa','CAT001',NULL,'00001','hss99s9','111','','BAG','0','1','','5%GST','','5.00','0','split','','5.55','0.00','3','0','105.45',NULL,'2019-10-03','2019-10-03',111.00,'2019-10-03',NULL,'11',NULL,NULL,'Lento','ssd','2019-10-03 15:30:10',NULL),(19,'outsourced','000052','MAA-019','','maa','CAT001',NULL,'00001','hss99s9','111','','BAG','0','1','','5%GST','','5.00','0','split','','5.55','0.00','3','0','105.45',NULL,'2019-10-03','2019-10-03',111.00,'2019-10-03',NULL,'11',NULL,NULL,'Lento','ssd','2019-10-03 15:30:22',NULL),(20,'outsourced','000052','MAA-020','','maa','CAT001',NULL,'00001','hss99s9','111','','BAG','0','1','','5%GST','','5.00','0','split','','5.55','0.00','3','0','105.45',NULL,'2019-10-03','2019-10-03',111.00,'2019-10-03',NULL,'11',NULL,NULL,'Lento','ssd','2019-10-03 15:30:37',NULL),(21,'outsourced','000052','MAA-021','','maa','CAT001',NULL,'00001','hss99s9','111','','BAG','0','1','','5%GST','','5.00','0','split','','5.55','0.00','3','0','105.45',NULL,'2019-10-03','2019-10-03',111.00,'2019-10-03',NULL,'11',NULL,NULL,'Lento','ssd','2019-10-03 15:32:26',NULL),(22,'outsourced','000052','MAA-022','','maa','CAT001',NULL,'00001','hss99s9','111','','BAG','0','1','','5%GST','','5.00','0','split','','5.55','0.00','3','0','105.45',NULL,'2019-10-03','2019-10-03',111.00,'2019-10-03',NULL,'11',NULL,NULL,'Lento','ssd','2019-10-03 15:32:50',NULL);
/*!40000 ALTER TABLE `salesitemaster2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesitemlog`
--

DROP TABLE IF EXISTS `salesitemlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesitemlog` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `entrytype` varchar(20) DEFAULT NULL,
  `orgid` varchar(10) DEFAULT NULL,
  `custid` varchar(10) NOT NULL,
  `itemcode` varchar(50) NOT NULL,
  `itemname` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `oldpriceqty` decimal(10,1) NOT NULL,
  `newpriceqty` decimal(10,1) NOT NULL,
  `olduom` varchar(100) NOT NULL,
  `newuom` varchar(100) NOT NULL,
  `oldstock` varchar(100) NOT NULL,
  `newstock` varchar(100) NOT NULL,
  `taxmethod` varchar(100) NOT NULL,
  `taxrate` decimal(10,1) NOT NULL,
  `stockasofdate` date NOT NULL,
  `newstockasofdate` date NOT NULL,
  `notes` varchar(500) NOT NULL,
  `updatedon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) NOT NULL,
  `updatedby` varchar(100) NOT NULL,
  `taxname` varchar(100) DEFAULT NULL,
  `newtaxamount` decimal(10,1) NOT NULL,
  `taxamount` decimal(10,1) NOT NULL,
  `newitemcost` decimal(10,1) NOT NULL,
  `itemcost` decimal(10,1) NOT NULL,
  `newtaxableprice` decimal(10,1) NOT NULL,
  `newpriceasofdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `taxableprice` decimal(10,1) NOT NULL,
  `hsncode` varchar(100) NOT NULL,
  `newtaxrate` decimal(10,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesitemlog`
--

LOCK TABLES `salesitemlog` WRITE;
/*!40000 ALTER TABLE `salesitemlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesitemlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesitemlognew`
--

DROP TABLE IF EXISTS `salesitemlognew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesitemlognew` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `entrytype` varchar(20) NOT NULL,
  `orgid` varchar(10) NOT NULL,
  `custid` varchar(10) NOT NULL,
  `itemcode` varchar(50) NOT NULL,
  `itemname` varchar(100) DEFAULT NULL,
  `qtyonhand` decimal(10,2) DEFAULT NULL,
  `newqty` decimal(10,2) DEFAULT NULL,
  `qtyadjusted` decimal(10,2) DEFAULT '0.00',
  `uom` varchar(100) DEFAULT NULL,
  `adjustedon` date DEFAULT NULL,
  `handler` varchar(100) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesitemlognew`
--

LOCK TABLES `salesitemlognew` WRITE;
/*!40000 ALTER TABLE `salesitemlognew` DISABLE KEYS */;
INSERT INTO `salesitemlognew` VALUES (20,'outsourced','','000052','MAA-021','maa',111.00,NULL,0.00,'BAG','2019-10-03','Lento','ssd'),(21,'outsourced','','000052','MAA-022','maa',111.00,NULL,0.00,'BAG','2019-10-03','Lento','ssd');
/*!40000 ALTER TABLE `salesitemlognew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesorders`
--

DROP TABLE IF EXISTS `salesorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesorders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `so_code` varchar(100) DEFAULT NULL,
  `so_owner` varchar(255) DEFAULT NULL,
  `so_comp_code` varchar(100) DEFAULT NULL,
  `so_customer` varchar(100) DEFAULT NULL,
  `so_cust_ref_no` varchar(20) DEFAULT NULL,
  `so_vendor` varchar(255) DEFAULT NULL,
  `so_description` varchar(255) DEFAULT NULL,
  `so_date` varchar(100) DEFAULT NULL,
  `so_payterm` varchar(255) DEFAULT NULL,
  `so_payterm_desc` varchar(50) DEFAULT NULL,
  `so_shippingvia` varchar(100) DEFAULT NULL,
  `so_deliveryat` varchar(100) DEFAULT NULL,
  `so_deliverydate` varchar(100) DEFAULT NULL,
  `so_status` varchar(15) DEFAULT NULL,
  `so_freight` varchar(255) DEFAULT NULL,
  `so_cust_shipping_street` varchar(255) DEFAULT NULL,
  `so_cust_shipping_city` varchar(255) DEFAULT NULL,
  `so_cust_shipping_state` varchar(255) DEFAULT NULL,
  `so_cust_shipping_country` varchar(255) DEFAULT NULL,
  `so_cust_shipping_zip` varchar(255) DEFAULT NULL,
  `so_cust_shipping_phone` varchar(255) DEFAULT NULL,
  `so_cust_shipping_gstin` varchar(255) DEFAULT NULL,
  `so_cust_billing_street` varchar(255) DEFAULT NULL,
  `so_cust_billing_city` varchar(255) DEFAULT NULL,
  `so_cust_billing_state` varchar(255) DEFAULT NULL,
  `so_cust_billing_country` varchar(255) DEFAULT NULL,
  `so_cust_billing_zip` varchar(255) DEFAULT NULL,
  `so_cust_billing_phone` varchar(255) DEFAULT NULL,
  `so_cust_billing_gstin` varchar(255) DEFAULT NULL,
  `so_value` varchar(100) DEFAULT NULL,
  `so_tc` varchar(255) DEFAULT NULL,
  `so_notes` varchar(255) DEFAULT NULL,
  `so_items` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesorders`
--

LOCK TABLES `salesorders` WRITE;
/*!40000 ALTER TABLE `salesorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `salesorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id` int(10) NOT NULL DEFAULT '0',
  `code` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'AP','Andhra Pradesh'),(2,'AR','Arunachal Pradesh'),(3,'AS','Assam'),(4,'BR','Bihar'),(5,'CG','Chhattisgarh'),(6,'GA','Goa'),(7,'GJ','Gujarat'),(8,'HR','Haryana'),(9,'HP','Himachal Pradesh'),(10,'JK','Jammu and Kashmir'),(11,'JH','Jharkhand'),(12,'KA','Karnataka'),(13,'KL','Kerala'),(14,'MP','Madhya Pradesh'),(15,'MH','Maharashtra'),(16,'MN','Manipur'),(17,'ML','Meghalaya'),(18,'MZ','Mizoram'),(19,'NL','Nagaland'),(20,'OR','Orissa'),(21,'PB','Punjab'),(22,'RJ','Rajasthan'),(23,'SK','Sikkim'),(24,'TN','Tamil Nadu'),(25,'TR','Tripura'),(26,'UK','Uttarakhand'),(27,'UP','Uttar Pradesh'),(28,'WB','West Bengal'),(29,'TN','Tamil Nadu'),(30,'TR','Tripura'),(31,'AN','Andaman and Nicobar Islands'),(32,'CH','Chandigarh'),(33,'DH','Dadra and Nagar Haveli'),(34,'DD','Daman and Diu'),(35,'DL','Delhi'),(36,'LD','Lakshadweep'),(37,'PY','Pondicherry'),(38,'TG','Telangana'),(1,'AP','Andhra Pradesh'),(2,'AR','Arunachal Pradesh'),(3,'AS','Assam'),(4,'BR','Bihar'),(5,'CG','Chhattisgarh'),(6,'GA','Goa'),(7,'GJ','Gujarat'),(8,'HR','Haryana'),(9,'HP','Himachal Pradesh'),(10,'JK','Jammu and Kashmir'),(11,'JH','Jharkhand'),(12,'KA','Karnataka'),(13,'KL','Kerala'),(14,'MP','Madhya Pradesh'),(15,'MH','Maharashtra'),(16,'MN','Manipur'),(17,'ML','Meghalaya'),(18,'MZ','Mizoram'),(19,'NL','Nagaland'),(20,'OR','Orissa'),(21,'PB','Punjab'),(22,'RJ','Rajasthan'),(23,'SK','Sikkim'),(24,'TN','Tamil Nadu'),(25,'TR','Tripura'),(26,'UK','Uttarakhand'),(27,'UP','Uttar Pradesh'),(28,'WB','West Bengal'),(29,'TN','Tamil Nadu'),(30,'TR','Tripura'),(31,'AN','Andaman and Nicobar Islands'),(32,'CH','Chandigarh'),(33,'DH','Dadra and Nagar Haveli'),(34,'DD','Daman and Diu'),(35,'DL','Delhi'),(36,'LD','Lakshadweep'),(37,'PY','Pondicherry'),(38,'TG','Telangana'),(1,'AP','Andhra Pradesh'),(2,'AR','Arunachal Pradesh'),(3,'AS','Assam'),(4,'BR','Bihar'),(5,'CG','Chhattisgarh'),(6,'GA','Goa'),(7,'GJ','Gujarat'),(8,'HR','Haryana'),(9,'HP','Himachal Pradesh'),(10,'JK','Jammu and Kashmir'),(11,'JH','Jharkhand'),(12,'KA','Karnataka'),(13,'KL','Kerala'),(14,'MP','Madhya Pradesh'),(15,'MH','Maharashtra'),(16,'MN','Manipur'),(17,'ML','Meghalaya'),(18,'MZ','Mizoram'),(19,'NL','Nagaland'),(20,'OR','Orissa'),(21,'PB','Punjab'),(22,'RJ','Rajasthan'),(23,'SK','Sikkim'),(24,'TN','Tamil Nadu'),(25,'TR','Tripura'),(26,'UK','Uttarakhand'),(27,'UP','Uttar Pradesh'),(28,'WB','West Bengal'),(29,'TN','Tamil Nadu'),(30,'TR','Tripura'),(31,'AN','Andaman and Nicobar Islands'),(32,'CH','Chandigarh'),(33,'DH','Dadra and Nagar Haveli'),(34,'DD','Daman and Diu'),(35,'DL','Delhi'),(36,'LD','Lakshadweep'),(37,'PY','Pondicherry'),(38,'TG','Telangana'),(1,'AP','Andhra Pradesh'),(2,'AR','Arunachal Pradesh'),(3,'AS','Assam'),(4,'BR','Bihar'),(5,'CG','Chhattisgarh'),(6,'GA','Goa'),(7,'GJ','Gujarat'),(8,'HR','Haryana'),(9,'HP','Himachal Pradesh'),(10,'JK','Jammu and Kashmir'),(11,'JH','Jharkhand'),(12,'KA','Karnataka'),(13,'KL','Kerala'),(14,'MP','Madhya Pradesh'),(15,'MH','Maharashtra'),(16,'MN','Manipur'),(17,'ML','Meghalaya'),(18,'MZ','Mizoram'),(19,'NL','Nagaland'),(20,'OR','Orissa'),(21,'PB','Punjab'),(22,'RJ','Rajasthan'),(23,'SK','Sikkim'),(24,'TN','Tamil Nadu'),(25,'TR','Tripura'),(26,'UK','Uttarakhand'),(27,'UP','Uttar Pradesh'),(28,'WB','West Bengal'),(29,'TN','Tamil Nadu'),(30,'TR','Tripura'),(31,'AN','Andaman and Nicobar Islands'),(32,'CH','Chandigarh'),(33,'DH','Dadra and Nagar Haveli'),(34,'DD','Daman and Diu'),(35,'DL','Delhi'),(36,'LD','Lakshadweep'),(37,'PY','Pondicherry'),(38,'TG','Telangana'),(1,'AP','Andhra Pradesh'),(2,'AR','Arunachal Pradesh'),(3,'AS','Assam'),(4,'BR','Bihar'),(5,'CG','Chhattisgarh'),(6,'GA','Goa'),(7,'GJ','Gujarat'),(8,'HR','Haryana'),(9,'HP','Himachal Pradesh'),(10,'JK','Jammu and Kashmir'),(11,'JH','Jharkhand'),(12,'KA','Karnataka'),(13,'KL','Kerala'),(14,'MP','Madhya Pradesh'),(15,'MH','Maharashtra'),(16,'MN','Manipur'),(17,'ML','Meghalaya'),(18,'MZ','Mizoram'),(19,'NL','Nagaland'),(20,'OR','Orissa'),(21,'PB','Punjab'),(22,'RJ','Rajasthan'),(23,'SK','Sikkim'),(24,'TN','Tamil Nadu'),(25,'TR','Tripura'),(26,'UK','Uttarakhand'),(27,'UP','Uttar Pradesh'),(28,'WB','West Bengal'),(29,'TN','Tamil Nadu'),(30,'TR','Tripura'),(31,'AN','Andaman and Nicobar Islands'),(32,'CH','Chandigarh'),(33,'DH','Dadra and Nagar Haveli'),(34,'DD','Daman and Diu'),(35,'DL','Delhi'),(36,'LD','Lakshadweep'),(37,'PY','Pondicherry'),(38,'TG','Telangana'),(1,'AP','Andhra Pradesh'),(2,'AR','Arunachal Pradesh'),(3,'AS','Assam'),(4,'BR','Bihar'),(5,'CG','Chhattisgarh'),(6,'GA','Goa'),(7,'GJ','Gujarat'),(8,'HR','Haryana'),(9,'HP','Himachal Pradesh'),(10,'JK','Jammu and Kashmir'),(11,'JH','Jharkhand'),(12,'KA','Karnataka'),(13,'KL','Kerala'),(14,'MP','Madhya Pradesh'),(15,'MH','Maharashtra'),(16,'MN','Manipur'),(17,'ML','Meghalaya'),(18,'MZ','Mizoram'),(19,'NL','Nagaland'),(20,'OR','Orissa'),(21,'PB','Punjab'),(22,'RJ','Rajasthan'),(23,'SK','Sikkim'),(24,'TN','Tamil Nadu'),(25,'TR','Tripura'),(26,'UK','Uttarakhand'),(27,'UP','Uttar Pradesh'),(28,'WB','West Bengal'),(29,'TN','Tamil Nadu'),(30,'TR','Tripura'),(31,'AN','Andaman and Nicobar Islands'),(32,'CH','Chandigarh'),(33,'DH','Dadra and Nagar Haveli'),(34,'DD','Daman and Diu'),(35,'DL','Delhi'),(36,'LD','Lakshadweep'),(37,'PY','Pondicherry'),(38,'TG','Telangana');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_lookups`
--

DROP TABLE IF EXISTS `state_lookups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_lookups` (
  `id` int(10) NOT NULL DEFAULT '0',
  `code` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_lookups`
--

LOCK TABLES `state_lookups` WRITE;
/*!40000 ALTER TABLE `state_lookups` DISABLE KEYS */;
INSERT INTO `state_lookups` VALUES (1,'AP','Andhra Pradesh'),(2,'AR','Arunachal Pradesh'),(3,'AS','Assam'),(4,'BR','Bihar'),(5,'CG','Chhattisgarh'),(6,'GA','Goa'),(7,'GJ','Gujarat'),(8,'HR','Haryana'),(9,'HP','Himachal Pradesh'),(10,'JK','Jammu and Kashmir'),(11,'JH','Jharkhand'),(12,'KA','Karnataka'),(13,'KL','Kerala'),(14,'MP','Madhya Pradesh'),(15,'MH','Maharashtra'),(16,'MN','Manipur'),(17,'ML','Meghalaya'),(18,'MZ','Mizoram'),(19,'NL','Nagaland'),(20,'OR','Orissa'),(21,'PB','Punjab'),(22,'RJ','Rajasthan'),(23,'SK','Sikkim'),(24,'TN','Tamil Nadu'),(25,'TR','Tripura'),(26,'UK','Uttarakhand'),(27,'UP','Uttar Pradesh'),(28,'WB','West Bengal'),(29,'TN','Tamil Nadu'),(30,'TR','Tripura'),(31,'AN','Andaman and Nicobar Islands'),(32,'CH','Chandigarh'),(33,'DH','Dadra and Nagar Haveli'),(34,'DD','Daman and Diu'),(35,'DL','Delhi'),(36,'LD','Lakshadweep'),(37,'PY','Pondicherry'),(38,'TG','Telangana'),(1,'AP','Andhra Pradesh'),(2,'AR','Arunachal Pradesh'),(3,'AS','Assam'),(4,'BR','Bihar'),(5,'CG','Chhattisgarh'),(6,'GA','Goa'),(7,'GJ','Gujarat'),(8,'HR','Haryana'),(9,'HP','Himachal Pradesh'),(10,'JK','Jammu and Kashmir'),(11,'JH','Jharkhand'),(12,'KA','Karnataka'),(13,'KL','Kerala'),(14,'MP','Madhya Pradesh'),(15,'MH','Maharashtra'),(16,'MN','Manipur'),(17,'ML','Meghalaya'),(18,'MZ','Mizoram'),(19,'NL','Nagaland'),(20,'OR','Orissa'),(21,'PB','Punjab'),(22,'RJ','Rajasthan'),(23,'SK','Sikkim'),(24,'TN','Tamil Nadu'),(25,'TR','Tripura'),(26,'UK','Uttarakhand'),(27,'UP','Uttar Pradesh'),(28,'WB','West Bengal'),(29,'TN','Tamil Nadu'),(30,'TR','Tripura'),(31,'AN','Andaman and Nicobar Islands'),(32,'CH','Chandigarh'),(33,'DH','Dadra and Nagar Haveli'),(34,'DD','Daman and Diu'),(35,'DL','Delhi'),(36,'LD','Lakshadweep'),(37,'PY','Pondicherry'),(38,'TG','Telangana'),(1,'AP','Andhra Pradesh'),(2,'AR','Arunachal Pradesh'),(3,'AS','Assam'),(4,'BR','Bihar'),(5,'CG','Chhattisgarh'),(6,'GA','Goa'),(7,'GJ','Gujarat'),(8,'HR','Haryana'),(9,'HP','Himachal Pradesh'),(10,'JK','Jammu and Kashmir'),(11,'JH','Jharkhand'),(12,'KA','Karnataka'),(13,'KL','Kerala'),(14,'MP','Madhya Pradesh'),(15,'MH','Maharashtra'),(16,'MN','Manipur'),(17,'ML','Meghalaya'),(18,'MZ','Mizoram'),(19,'NL','Nagaland'),(20,'OR','Orissa'),(21,'PB','Punjab'),(22,'RJ','Rajasthan'),(23,'SK','Sikkim'),(24,'TN','Tamil Nadu'),(25,'TR','Tripura'),(26,'UK','Uttarakhand'),(27,'UP','Uttar Pradesh'),(28,'WB','West Bengal'),(29,'TN','Tamil Nadu'),(30,'TR','Tripura'),(31,'AN','Andaman and Nicobar Islands'),(32,'CH','Chandigarh'),(33,'DH','Dadra and Nagar Haveli'),(34,'DD','Daman and Diu'),(35,'DL','Delhi'),(36,'LD','Lakshadweep'),(37,'PY','Pondicherry'),(38,'TG','Telangana'),(1,'AP','Andhra Pradesh'),(2,'AR','Arunachal Pradesh'),(3,'AS','Assam'),(4,'BR','Bihar'),(5,'CG','Chhattisgarh'),(6,'GA','Goa'),(7,'GJ','Gujarat'),(8,'HR','Haryana'),(9,'HP','Himachal Pradesh'),(10,'JK','Jammu and Kashmir'),(11,'JH','Jharkhand'),(12,'KA','Karnataka'),(13,'KL','Kerala'),(14,'MP','Madhya Pradesh'),(15,'MH','Maharashtra'),(16,'MN','Manipur'),(17,'ML','Meghalaya'),(18,'MZ','Mizoram'),(19,'NL','Nagaland'),(20,'OR','Orissa'),(21,'PB','Punjab'),(22,'RJ','Rajasthan'),(23,'SK','Sikkim'),(24,'TN','Tamil Nadu'),(25,'TR','Tripura'),(26,'UK','Uttarakhand'),(27,'UP','Uttar Pradesh'),(28,'WB','West Bengal'),(29,'TN','Tamil Nadu'),(30,'TR','Tripura'),(31,'AN','Andaman and Nicobar Islands'),(32,'CH','Chandigarh'),(33,'DH','Dadra and Nagar Haveli'),(34,'DD','Daman and Diu'),(35,'DL','Delhi'),(36,'LD','Lakshadweep'),(37,'PY','Pondicherry'),(38,'TG','Telangana'),(1,'AP','Andhra Pradesh'),(2,'AR','Arunachal Pradesh'),(3,'AS','Assam'),(4,'BR','Bihar'),(5,'CG','Chhattisgarh'),(6,'GA','Goa'),(7,'GJ','Gujarat'),(8,'HR','Haryana'),(9,'HP','Himachal Pradesh'),(10,'JK','Jammu and Kashmir'),(11,'JH','Jharkhand'),(12,'KA','Karnataka'),(13,'KL','Kerala'),(14,'MP','Madhya Pradesh'),(15,'MH','Maharashtra'),(16,'MN','Manipur'),(17,'ML','Meghalaya'),(18,'MZ','Mizoram'),(19,'NL','Nagaland'),(20,'OR','Orissa'),(21,'PB','Punjab'),(22,'RJ','Rajasthan'),(23,'SK','Sikkim'),(24,'TN','Tamil Nadu'),(25,'TR','Tripura'),(26,'UK','Uttarakhand'),(27,'UP','Uttar Pradesh'),(28,'WB','West Bengal'),(29,'TN','Tamil Nadu'),(30,'TR','Tripura'),(31,'AN','Andaman and Nicobar Islands'),(32,'CH','Chandigarh'),(33,'DH','Dadra and Nagar Haveli'),(34,'DD','Daman and Diu'),(35,'DL','Delhi'),(36,'LD','Lakshadweep'),(37,'PY','Pondicherry'),(38,'TG','Telangana'),(1,'AP','Andhra Pradesh'),(2,'AR','Arunachal Pradesh'),(3,'AS','Assam'),(4,'BR','Bihar'),(5,'CG','Chhattisgarh'),(6,'GA','Goa'),(7,'GJ','Gujarat'),(8,'HR','Haryana'),(9,'HP','Himachal Pradesh'),(10,'JK','Jammu and Kashmir'),(11,'JH','Jharkhand'),(12,'KA','Karnataka'),(13,'KL','Kerala'),(14,'MP','Madhya Pradesh'),(15,'MH','Maharashtra'),(16,'MN','Manipur'),(17,'ML','Meghalaya'),(18,'MZ','Mizoram'),(19,'NL','Nagaland'),(20,'OR','Orissa'),(21,'PB','Punjab'),(22,'RJ','Rajasthan'),(23,'SK','Sikkim'),(24,'TN','Tamil Nadu'),(25,'TR','Tripura'),(26,'UK','Uttarakhand'),(27,'UP','Uttar Pradesh'),(28,'WB','West Bengal'),(29,'TN','Tamil Nadu'),(30,'TR','Tripura'),(31,'AN','Andaman and Nicobar Islands'),(32,'CH','Chandigarh'),(33,'DH','Dadra and Nagar Haveli'),(34,'DD','Daman and Diu'),(35,'DL','Delhi'),(36,'LD','Lakshadweep'),(37,'PY','Pondicherry'),(38,'TG','Telangana');
/*!40000 ALTER TABLE `state_lookups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_movement`
--

DROP TABLE IF EXISTS `stock_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_movement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stk_mov_id` varchar(15) DEFAULT NULL,
  `stk_mov_type` varchar(10) DEFAULT NULL,
  `stk_mov_owner` varchar(100) DEFAULT NULL,
  `stk_mov_req_date` varchar(10) DEFAULT NULL,
  `stk_mov_location` varchar(255) DEFAULT NULL,
  `stk_value` varchar(100) DEFAULT NULL,
  `stk_mov_category` varchar(100) DEFAULT NULL,
  `stk_mov_docref` varchar(255) DEFAULT NULL,
  `stk_mov_status` varchar(100) DEFAULT NULL,
  `stk_mov_items` longtext,
  `stk_mov_notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_movement`
--

LOCK TABLES `stock_movement` WRITE;
/*!40000 ALTER TABLE `stock_movement` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppbank`
--

DROP TABLE IF EXISTS `suppbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppbank` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `supcode` varchar(25) NOT NULL,
  `bankname` varchar(25) DEFAULT NULL,
  `acctno` varchar(20) NOT NULL,
  `acctname` varchar(40) NOT NULL,
  `acctype` varchar(20) NOT NULL,
  `branch` varchar(30) NOT NULL,
  `ifsc` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppbank`
--

LOCK TABLES `suppbank` WRITE;
/*!40000 ALTER TABLE `suppbank` DISABLE KEYS */;
INSERT INTO `suppbank` VALUES (001,'DAPL/GST009/001','Indian','12312312','dsfdsfsd','Savings','sdfsdf','123324'),(003,'DAPL/GST3434342/003','Indian Bank','121212','asdas`','Savings','sfdf','21432423'),(004,'DAPL/1234567890/001','HDFC Bank','1234567890','Hitesh Plastics','Savings','Vellore','98999'),(005,'00001','HDFC Bank','1234567890','Capricord Food Produts','Current','Krishnagiri','HDFC9897001');
/*!40000 ALTER TABLE `suppbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suptype`
--

DROP TABLE IF EXISTS `suptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suptype` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `suptype` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suptype`
--

LOCK TABLES `suptype` WRITE;
/*!40000 ALTER TABLE `suptype` DISABLE KEYS */;
INSERT INTO `suptype` VALUES (001,'Distributor','Distributor'),(002,'Material Supplier','Material Supplier'),(003,'Wholesaler','Wholesaler'),(004,'Retailer','Retailer');
/*!40000 ALTER TABLE `suptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxmaster`
--

DROP TABLE IF EXISTS `taxmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxmaster` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `prefix` varchar(10) DEFAULT NULL,
  `postfix` varchar(10) DEFAULT NULL,
  `taxname` varchar(100) NOT NULL,
  `description` varchar(40) NOT NULL,
  `taxtype` varchar(50) NOT NULL,
  `taxrate` decimal(10,2) NOT NULL,
  `createdon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxmaster`
--

LOCK TABLES `taxmaster` WRITE;
/*!40000 ALTER TABLE `taxmaster` DISABLE KEYS */;
INSERT INTO `taxmaster` VALUES (3,NULL,NULL,'5%GST','','split',5.00,'2018-08-25 00:32:42','2018-08-25 00:32:42'),(5,NULL,NULL,'18%(IGST)','','single',18.00,'2018-08-25 20:42:06','2018-08-25 20:42:06'),(6,NULL,NULL,'28%(GST)','','split',28.00,'2018-08-25 20:42:59','2018-08-25 20:42:59'),(7,NULL,NULL,'18%(GST)','','split',18.00,'2018-08-25 20:43:25','2018-08-25 20:43:25'),(9,NULL,NULL,'28%(IGST)','','single',28.00,'2018-08-25 20:44:40','2018-08-25 20:44:40'),(14,NULL,NULL,'5%IGST','','single',5.00,'2018-11-20 16:21:51','2018-11-20 16:21:51'),(15,NULL,NULL,'12%(IGST)','','single',12.00,'2018-12-02 15:37:51','2018-12-02 15:37:51'),(16,NULL,NULL,'12%(GST)','','split',12.00,'2018-12-02 15:41:40','2018-12-02 15:41:40'),(17,NULL,NULL,'0%','','single',0.00,'2019-06-05 07:59:39','2019-06-05 07:59:39');
/*!40000 ALTER TABLE `taxmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportmaster`
--

DROP TABLE IF EXISTS `transportmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportmaster` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `transname` varchar(40) NOT NULL,
  `vtype` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportmaster`
--

LOCK TABLES `transportmaster` WRITE;
/*!40000 ALTER TABLE `transportmaster` DISABLE KEYS */;
INSERT INTO `transportmaster` VALUES (001,'ARC Parcel Services','Truck');
/*!40000 ALTER TABLE `transportmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom`
--

DROP TABLE IF EXISTS `uom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uom` (
  `id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom`
--

LOCK TABLES `uom` WRITE;
/*!40000 ALTER TABLE `uom` DISABLE KEYS */;
INSERT INTO `uom` VALUES (1,'BAG','Bag'),(2,'BKT','Bucket'),(3,'BND','Bundle'),(4,'BOWL','Bowl'),(5,'BX','Box'),(6,'CRD','Card'),(7,'CAN','Cans'),(8,'CM','Centimeters'),(9,'CS','Case'),(10,'CTN','Carton'),(11,'DZ','Dozen'),(12,'DRM','Drums'),(13,'EA','Each'),(14,'FT','Foot'),(15,'GAL','Gallon'),(16,'GROSS','Gross'),(17,'IN','Inches'),(18,'KIT','Kit'),(19,'LOT','Lot'),(20,'M','Meter'),(21,'MM','Millimeter'),(22,'PC','Piece'),(23,'PK','Pack'),(24,'PK100','Pack 100'),(25,'PK50','Pack 50'),(26,'PR','Pair'),(27,'RACK','Rack'),(28,'RL','Roll'),(29,'SET','Set'),(30,'SET3','Set of 3'),(31,'SET4','Set of 4'),(32,'SET5','Set of 5'),(33,'SGL','Single'),(34,'SHT','Sheet'),(35,'SQFT','Square ft'),(36,'TUBE','Tube'),(37,'YD','Yard'),(38,'KGS','Kiliograms'),(39,'KLR','Kilolitter'),(40,'NOS','Numbers'),(41,'TON ','Tonnes'),(42,'TUB ','Tubes'),(43,'BTL','Bottles'),(44,'UNT','Units'),(45,'OTH','Others'),(1,'BAG','Bag'),(2,'BKT','Bucket'),(3,'BND','Bundle'),(4,'BOWL','Bowl'),(5,'BX','Box'),(6,'CRD','Card'),(7,'CAN','Cans'),(8,'CM','Centimeters'),(9,'CS','Case'),(10,'CTN','Carton'),(11,'DZ','Dozen'),(12,'DRM','Drums'),(13,'EA','Each'),(14,'FT','Foot'),(15,'GAL','Gallon'),(16,'GROSS','Gross'),(17,'IN','Inches'),(18,'KIT','Kit'),(19,'LOT','Lot'),(20,'M','Meter'),(21,'MM','Millimeter'),(22,'PC','Piece'),(23,'PK','Pack'),(24,'PK100','Pack 100'),(25,'PK50','Pack 50'),(26,'PR','Pair'),(27,'RACK','Rack'),(28,'RL','Roll'),(29,'SET','Set'),(30,'SET3','Set of 3'),(31,'SET4','Set of 4'),(32,'SET5','Set of 5'),(33,'SGL','Single'),(34,'SHT','Sheet'),(35,'SQFT','Square ft'),(36,'TUBE','Tube'),(37,'YD','Yard'),(38,'KGS','Kiliograms'),(39,'KLR','Kilolitter'),(40,'NOS','Numbers'),(41,'TON ','Tonnes'),(42,'TUB ','Tubes'),(43,'BTL','Bottles'),(44,'UNT','Units'),(45,'OTH','Others'),(1,'BAG','Bag'),(2,'BKT','Bucket'),(3,'BND','Bundle'),(4,'BOWL','Bowl'),(5,'BX','Box'),(6,'CRD','Card'),(7,'CAN','Cans'),(8,'CM','Centimeters'),(9,'CS','Case'),(10,'CTN','Carton'),(11,'DZ','Dozen'),(12,'DRM','Drums'),(13,'EA','Each'),(14,'FT','Foot'),(15,'GAL','Gallon'),(16,'GROSS','Gross'),(17,'IN','Inches'),(18,'KIT','Kit'),(19,'LOT','Lot'),(20,'M','Meter'),(21,'MM','Millimeter'),(22,'PC','Piece'),(23,'PK','Pack'),(24,'PK100','Pack 100'),(25,'PK50','Pack 50'),(26,'PR','Pair'),(27,'RACK','Rack'),(28,'RL','Roll'),(29,'SET','Set'),(30,'SET3','Set of 3'),(31,'SET4','Set of 4'),(32,'SET5','Set of 5'),(33,'SGL','Single'),(34,'SHT','Sheet'),(35,'SQFT','Square ft'),(36,'TUBE','Tube'),(37,'YD','Yard'),(38,'KGS','Kiliograms'),(39,'KLR','Kilolitter'),(40,'NOS','Numbers'),(41,'TON ','Tonnes'),(42,'TUB ','Tubes'),(43,'BTL','Bottles'),(44,'UNT','Units'),(45,'OTH','Others');
/*!40000 ALTER TABLE `uom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom_lookups`
--

DROP TABLE IF EXISTS `uom_lookups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uom_lookups` (
  `id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom_lookups`
--

LOCK TABLES `uom_lookups` WRITE;
/*!40000 ALTER TABLE `uom_lookups` DISABLE KEYS */;
INSERT INTO `uom_lookups` VALUES (1,'BAG','Bag'),(2,'BKT','Bucket'),(3,'BND','Bundle'),(4,'BOWL','Bowl'),(5,'BX','Box'),(6,'CRD','Card'),(7,'CAN','Cans'),(8,'CM','Centimeters'),(9,'CS','Case'),(10,'CTN','Carton'),(11,'DZ','Dozen'),(12,'DRM','Drums'),(13,'EA','Each'),(14,'FT','Foot'),(15,'GAL','Gallon'),(16,'GROSS','Gross'),(17,'IN','Inches'),(18,'KIT','Kit'),(19,'LOT','Lot'),(20,'M','Meter'),(21,'MM','Millimeter'),(22,'PC','Piece'),(23,'PK','Pack'),(24,'PK100','Pack 100'),(25,'PK50','Pack 50'),(26,'PR','Pair'),(27,'RACK','Rack'),(28,'RL','Roll'),(29,'SET','Set'),(30,'SET3','Set of 3'),(31,'SET4','Set of 4'),(32,'SET5','Set of 5'),(33,'SGL','Single'),(34,'SHT','Sheet'),(35,'SQFT','Square ft'),(36,'TUBE','Tube'),(37,'YD','Yard'),(38,'KGS','Kiliograms'),(39,'KLR','Kilolitter'),(40,'NOS','Numbers'),(41,'TON ','Tonnes'),(42,'TUB ','Tubes'),(43,'BTL','Bottles'),(44,'UNT','Units'),(45,'OTH','Others'),(1,'BAG','Bag'),(2,'BKT','Bucket'),(3,'BND','Bundle'),(4,'BOWL','Bowl'),(5,'BX','Box'),(6,'CRD','Card'),(7,'CAN','Cans'),(8,'CM','Centimeters'),(9,'CS','Case'),(10,'CTN','Carton'),(11,'DZ','Dozen'),(12,'DRM','Drums'),(13,'EA','Each'),(14,'FT','Foot'),(15,'GAL','Gallon'),(16,'GROSS','Gross'),(17,'IN','Inches'),(18,'KIT','Kit'),(19,'LOT','Lot'),(20,'M','Meter'),(21,'MM','Millimeter'),(22,'PC','Piece'),(23,'PK','Pack'),(24,'PK100','Pack 100'),(25,'PK50','Pack 50'),(26,'PR','Pair'),(27,'RACK','Rack'),(28,'RL','Roll'),(29,'SET','Set'),(30,'SET3','Set of 3'),(31,'SET4','Set of 4'),(32,'SET5','Set of 5'),(33,'SGL','Single'),(34,'SHT','Sheet'),(35,'SQFT','Square ft'),(36,'TUBE','Tube'),(37,'YD','Yard'),(38,'KGS','Kiliograms'),(39,'KLR','Kilolitter'),(40,'NOS','Numbers'),(41,'TON ','Tonnes'),(42,'TUB ','Tubes'),(43,'BTL','Bottles'),(44,'UNT','Units'),(45,'OTH','Others'),(1,'BAG','Bag'),(2,'BKT','Bucket'),(3,'BND','Bundle'),(4,'BOWL','Bowl'),(5,'BX','Box'),(6,'CRD','Card'),(7,'CAN','Cans'),(8,'CM','Centimeters'),(9,'CS','Case'),(10,'CTN','Carton'),(11,'DZ','Dozen'),(12,'DRM','Drums'),(13,'EA','Each'),(14,'FT','Foot'),(15,'GAL','Gallon'),(16,'GROSS','Gross'),(17,'IN','Inches'),(18,'KIT','Kit'),(19,'LOT','Lot'),(20,'M','Meter'),(21,'MM','Millimeter'),(22,'PC','Piece'),(23,'PK','Pack'),(24,'PK100','Pack 100'),(25,'PK50','Pack 50'),(26,'PR','Pair'),(27,'RACK','Rack'),(28,'RL','Roll'),(29,'SET','Set'),(30,'SET3','Set of 3'),(31,'SET4','Set of 4'),(32,'SET5','Set of 5'),(33,'SGL','Single'),(34,'SHT','Sheet'),(35,'SQFT','Square ft'),(36,'TUBE','Tube'),(37,'YD','Yard'),(38,'KGS','Kiliograms'),(39,'KLR','Kilolitter'),(40,'NOS','Numbers'),(41,'TON ','Tonnes'),(42,'TUB ','Tubes'),(43,'BTL','Bottles'),(44,'UNT','Units'),(45,'OTH','Others'),(0,'CVR','COVER'),(46,'CVR','COVER'),(46,'CVR','COVER'),(0,'CVR','COVER');
/*!40000 ALTER TABLE `uom_lookups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_forgot_password`
--

DROP TABLE IF EXISTS `user_forgot_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_forgot_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `token` varchar(500) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_forgot_password`
--

LOCK TABLES `user_forgot_password` WRITE;
/*!40000 ALTER TABLE `user_forgot_password` DISABLE KEYS */;
INSERT INTO `user_forgot_password` VALUES (1,'saravanas.office@gmail.com','8e5710705445a85cc571c5903456d17a','2018-11-26 05:36:07'),(2,'rasaafactory@gmail.com','93b718e8f7a5724f54a07ac23eb802f2','2019-02-06 03:42:30'),(3,'rasaafactory@gmail.com','75165928c8cc1948f9f5d1fc4136ee5c','2019-02-06 03:45:12'),(4,'rasaafactory@gmail.com','92b131a5c4b9e3b8a226d8755f3a5279','2019-03-07 08:34:36'),(5,'rasaafactory@gmail.com','b697d315e7cc6695058dad5358be91e9','2019-03-19 06:48:03');
/*!40000 ALTER TABLE `user_forgot_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `groupid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprofile`
--

DROP TABLE IF EXISTS `userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userprofile` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(100) NOT NULL,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `useremail` varchar(255) NOT NULL,
  `userpassword` varchar(255) NOT NULL,
  `repass` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `groupname` varchar(35) NOT NULL,
  `compcode` varchar(40) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT '1',
  `image_name` varchar(155) NOT NULL,
  `image` longblob,
  `emailverified` varchar(10) NOT NULL DEFAULT '0',
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(30) DEFAULT NULL,
  `validtill` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofile`
--

LOCK TABLES `userprofile` WRITE;
/*!40000 ALTER TABLE `userprofile` DISABLE KEYS */;
INSERT INTO `userprofile` VALUES (1,'L001','Lento','Lento Agro India Pvt ','Ltd','Administrator','1','lento@gmail.com','Lento@2019','Lento@2019','9750996500','Pochampalli','Admin','001 Lento(Registered)','1','upload/lento-logo.png',NULL,'0','2019-09-14 06:07:13',NULL,'2019-09-14 06:07:13');
/*!40000 ALTER TABLE `userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_repass` varchar(255) NOT NULL,
  `user_mobile` varchar(15) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_role` varchar(25) NOT NULL,
  `user_status` varchar(10) NOT NULL DEFAULT '0',
  `image_name` varchar(155) NOT NULL,
  `image` longblob NOT NULL,
  `user_createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_refund`
--

DROP TABLE IF EXISTS `vendor_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_refund` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `v_refund_id` varchar(20) DEFAULT NULL,
  `v_refund_creditsid` varchar(20) DEFAULT NULL,
  `v_refund_refno` varchar(100) DEFAULT NULL,
  `v_refund_paymentmode` varchar(255) DEFAULT NULL,
  `v_refund_paymentdate` varchar(10) DEFAULT NULL,
  `v_refund_amount` decimal(10,2) DEFAULT NULL,
  `v_refund_handler` varchar(100) DEFAULT NULL,
  `v_refund_notes` varchar(255) DEFAULT NULL,
  `v_refund_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_refund`
--

LOCK TABLES `vendor_refund` WRITE;
/*!40000 ALTER TABLE `vendor_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendorcredits`
--

DROP TABLE IF EXISTS `vendorcredits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendorcredits` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `v_credits_id` varchar(20) DEFAULT NULL,
  `v_credits_suptype` varchar(100) DEFAULT NULL,
  `v_credits_vendorid` varchar(10) DEFAULT NULL,
  `v_credits_paymentmode` varchar(255) DEFAULT NULL,
  `v_credits_refno` varchar(100) DEFAULT NULL,
  `v_credits_paymentdate` varchar(10) DEFAULT NULL,
  `v_credits_amount` decimal(10,2) DEFAULT NULL,
  `v_credits_availcredits` decimal(10,2) DEFAULT NULL,
  `v_credits_handler` varchar(100) DEFAULT NULL,
  `v_credits_notes` varchar(255) DEFAULT NULL,
  `v_credits_image` varchar(155) DEFAULT NULL,
  `v_credits_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `v_credits_email_notification` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorcredits`
--

LOCK TABLES `vendorcredits` WRITE;
/*!40000 ALTER TABLE `vendorcredits` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendorcredits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendorcredits_log`
--

DROP TABLE IF EXISTS `vendorcredits_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendorcredits_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creditrefno` varchar(50) NOT NULL,
  `vendorid` varchar(50) NOT NULL,
  `oldcredits` decimal(10,2) NOT NULL,
  `newcredits` decimal(10,2) NOT NULL,
  `dateofpayment` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `handler` varchar(100) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `image` varchar(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorcredits_log`
--

LOCK TABLES `vendorcredits_log` WRITE;
/*!40000 ALTER TABLE `vendorcredits_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendorcredits_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendorprofile`
--

DROP TABLE IF EXISTS `vendorprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendorprofile` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `vendorid` varchar(50) NOT NULL,
  `vendor_opening_bal` varchar(100) DEFAULT NULL,
  `prefix` varchar(15) DEFAULT 'DAPL',
  `postfix` varchar(50) NOT NULL DEFAULT '/',
  `title` varchar(6) NOT NULL,
  `supname` varchar(50) NOT NULL,
  `portal` varchar(100) DEFAULT NULL,
  `suptype` varchar(50) NOT NULL,
  `blocation` varchar(100) NOT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(30) NOT NULL,
  `workphone` varchar(30) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `email` varchar(40) NOT NULL,
  `web` varchar(40) NOT NULL,
  `gstin` varchar(25) NOT NULL,
  `gstregdate` date DEFAULT NULL,
  `openbalance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `obasofdate` date DEFAULT NULL,
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) DEFAULT NULL,
  `updatedon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedby` varchar(100) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT '1',
  `handler` varchar(100) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorprofile`
--

LOCK TABLES `vendorprofile` WRITE;
/*!40000 ALTER TABLE `vendorprofile` DISABLE KEYS */;
INSERT INTO `vendorprofile` VALUES (001,'00001',NULL,'DAPL','/','MS.','PARLE AGRO PVT LTD',NULL,'Material Supplier','Dadra and Nagar Haveli',NULL,'PLOT NO.258/, VILLAGE SAYLI','SILVASSA ','IN','DH','396230','','0260-6631101','','info@parleagro.com','26AAACP8416G1ZH',NULL,0.00,'2019-02-05','2019-02-05 05:16:06',NULL,'2019-02-05 05:16:06',NULL,'1','Administrator',''),(002,'00002','177000','DAPL','/','M/S.','PADMAVATHI CORRUGATED CONTAINERS',NULL,'Material Supplier','Andhra Pradesh',NULL,'NARSINGAPURAM','CHANDRAGIRI MANDAL , TIRUPATHI','IN','AP','517102','','0877-2276396','padmavathicc@gmail.com','','37AAGFP6789B1ZW',NULL,0.00,NULL,'2019-02-05 05:18:29',NULL,'2019-02-05 05:18:29',NULL,'1',NULL,NULL);
/*!40000 ALTER TABLE `vendorprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `location_id` varchar(20) NOT NULL,
  `warehousename` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (2,'LOC001','Raw Material Store','Raw Material Store'),(3,'LOC003','Production Center','Production Center'),(4,'LOC004','Export Store','Export Store');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-03 21:10:29
