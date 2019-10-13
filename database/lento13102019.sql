-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: lentochanges
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankdeposit`
--

LOCK TABLES `bankdeposit` WRITE;
/*!40000 ALTER TABLE `bankdeposit` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compbank`
--

LOCK TABLES `compbank` WRITE;
/*!40000 ALTER TABLE `compbank` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprofile`
--

LOCK TABLES `comprofile` WRITE;
/*!40000 ALTER TABLE `comprofile` DISABLE KEYS */;
INSERT INTO `comprofile` VALUES (001,'COMP001','DAPL','','Lento Foods India Pvt Ltd','Lento','1','','1','POTCHAMPALLI','potchampalli','IN','TN','635108','','9677573737','lentofoods@gmail.com','','34433433434','2019-01-31','56656556',0.00,'2019-10-13',1,'upload/lento-logo.png',NULL,'2019-10-13 07:32:44','2019-10-13 07:32:44','2019-10-13 07:32:44','2019-10-13 07:32:44');
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerprofile`
--

LOCK TABLES `customerprofile` WRITE;
/*!40000 ALTER TABLE `customerprofile` DISABLE KEYS */;
INSERT INTO `customerprofile` VALUES (001,'CUST001','260','DAPL','/','M/S.','MAAVIN FOODS',NULL,'Partner','Tamil Nadu',NULL,'no 910, alliance orchid springs , north korattur','chennai','IN','TN','600080','','9677573737','maavin@gmail.com','','8898998898998',NULL,0,0.00,'2019-10-13 07:35:32',NULL,'2019-10-13 07:35:32',NULL,'2019-10-13 07:35:32',NULL,'1',NULL,NULL),(002,'CUST002',NULL,'DAPL','/','Mr.','Saravanakumar',NULL,'Retailer','Tamil Nadu',NULL,'no 910, alliance orchid springs , north korattur','chennai','IN','TN','600080','9791129332','9791129332','asaravanan248@gmail.com','','57346356346224234',NULL,0,0.00,'2019-10-13 07:37:13',NULL,'2019-10-13 07:37:13',NULL,'2019-10-13 07:37:13',NULL,'1',NULL,NULL),(003,'CUST003',NULL,'DAPL','/','M/S.','JUICY JUICY',NULL,'Partner','Tamil Nadu',NULL,'no 910, alliance orchid springs , north korattur','chennai','IN','TN','600080','9791129332','9791129332','asaravanan248@gmail.com','jknnll','876868768',NULL,0,0.00,'2019-10-13 07:38:17',NULL,'2019-10-13 07:38:17',NULL,'2019-10-13 07:38:17',NULL,'1',NULL,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expensenoteslog`
--

LOCK TABLES `expensenoteslog` WRITE;
/*!40000 ALTER TABLE `expensenoteslog` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grn_notes`
--

LOCK TABLES `grn_notes` WRITE;
/*!40000 ALTER TABLE `grn_notes` DISABLE KEYS */;
INSERT INTO `grn_notes` VALUES (1,'GRN-000001','COMP001','Lento','','2000.00','00001',NULL,'1','','ssfasdf','amsdmaldf','2000.00','2019-10-13',NULL,'Unpaid','invoice13123','2019-12-04','2019-10-13',NULL,'Recorded','note','[{\"itemdetails\":\"[LEN-01] Inward Self Item one \",\"itemcode\":\"1\",\"rwqty\":\"20\",\"tax_val\":\"28.00\",\"tax_id\":\"6\",\"tax_type\":\"split\",\"tax_method\":\"1\",\"rwprice\":\"100.00\",\"rwprice_org\":\"100.00\",\"rwamt\":\"2000\",\"podiscount\":\"0\",\"poadjustmentval\":\"\",\"podiscount_method\":\"flat\",\"uom\":\"KGS\"}]');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,'INV-00001-10/2019','Credit Invoice','Lento','CUST001','COMP001',NULL,'so98799',NULL,'2019-10-13','2019-10-13',NULL,NULL,NULL,'1',NULL,NULL,'PB',NULL,'Approved',NULL,'no 910, alliance orchid springs , north korattur','chennai','TN','IN','600080','9677573737','8898998898998','no 910, alliance orchid springs , north korattur','chennai','TN','IN','600080','9677573737','8898998898998','260.00','260.00','Unpaid',NULL,'otes','[{\"itemdetails\":\"[1] outward self item 1\",\"itemcode\":\"1\",\"hsncode\":\"hsn383309\",\"rwqty\":\"1\",\"tax_val\":\"5.00\",\"tax_id\":\"3\",\"tax_type\":\"split\",\"tax_method\":\"1\",\"rwprice\":\"120\",\"rwprice_org\":\"120\",\"rwamt\":\"120\",\"podiscount\":\"0\",\"poadjustmentval\":\"20\",\"podiscount_method\":\"flat\",\"uom\":\"BAG\"},{\"itemdetails\":\"[1] outward self item 1\",\"itemcode\":\"1\",\"hsncode\":\"hsn383309\",\"rwqty\":\"1\",\"tax_val\":\"5.00\",\"tax_id\":\"3\",\"tax_type\":\"split\",\"tax_method\":\"1\",\"rwprice\":\"120\",\"rwprice_org\":\"120\",\"rwamt\":\"120\",\"podiscount\":\"0\",\"poadjustmentval\":\"20\",\"podiscount_method\":\"flat\",\"uom\":\"BAG\"}]','90','kjnk'),(2,'INV-00002-10/2019','Credit Invoice','Lento','CUST001','COMP001',NULL,'s0hbbj',NULL,'2019-10-13','2019-10-13',NULL,NULL,NULL,'1',NULL,NULL,'AP',NULL,'Created',NULL,'no 910, alliance orchid springs , north korattur','chennai','TN','IN','600080','9677573737','8898998898998','no 910, alliance orchid springs , north korattur','chennai','TN','IN','600080','9677573737','8898998898998','1050.00','1050.00','Unpaid',NULL,'ojo','[{\"itemdetails\":\"[4] outward outsourced maavin item\",\"itemcode\":\"4\",\"hsncode\":\"jsksk\",\"rwqty\":\"10\",\"tax_val\":\"5.00\",\"tax_id\":\"3\",\"tax_type\":\"split\",\"tax_method\":\"0\",\"rwprice\":\"100\",\"rwprice_org\":\"100\",\"rwamt\":\"1000\",\"podiscount\":0,\"poadjustmentval\":\"\",\"podiscount_method\":\"flat\",\"uom\":\"BAG\"}]','y989','fjvj'),(3,'INV-00003-10/2019','Credit Invoice','Lento','CUST002','COMP001',NULL,'so9879879',NULL,'2019-10-13','2019-10-13',NULL,NULL,NULL,'1',NULL,NULL,'AP',NULL,'Created',NULL,'no 910, alliance orchid springs , north korattur','chennai','TN','IN','600080','9791129332','57346356346224234','no 910, alliance orchid springs , north korattur','chennai','TN','IN','600080','9791129332','57346356346224234','240.00','240.00','Unpaid',NULL,'asdasd','[{\"itemdetails\":\"[1] outward self item 1\",\"itemcode\":\"1\",\"hsncode\":\"hsn383309\",\"rwqty\":\"2\",\"tax_val\":\"5.00\",\"tax_id\":\"3\",\"tax_type\":\"split\",\"tax_method\":\"1\",\"rwprice\":\"120\",\"rwprice_org\":\"120\",\"rwamt\":\"240\",\"podiscount\":0,\"poadjustmentval\":\"\",\"podiscount_method\":\"flat\",\"uom\":\"BAG\"}]','6373','3737');
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
-- Table structure for table `partnerentries`
--

DROP TABLE IF EXISTS `partnerentries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partnerentries` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pe_code` varchar(10) NOT NULL,
  `pe_orgid` varchar(10) NOT NULL,
  `entrytype` varchar(20) NOT NULL DEFAULT 'outsourced',
  `pe_items` text NOT NULL,
  `pe_updatedon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pe_handler` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partnerentries`
--

LOCK TABLES `partnerentries` WRITE;
/*!40000 ALTER TABLE `partnerentries` DISABLE KEYS */;
INSERT INTO `partnerentries` VALUES (1,'MAAPE-001','CUST001','outsourced','[{\"item\":\"MAA-02\",\"itemname\":\"MAA-02-inward outsourced item one maavin\",\"uom\":\"BND\",\"qty\":\"20\"}]','2019-10-13 08:05:59','Lento'),(2,'JUIPE-002','CUST003','outsourced','[{\"item\":\"JUI-03\",\"itemname\":\"JUI-03-inward outsourced item two juicy\",\"uom\":\"M\",\"qty\":\"100\"}]','2019-10-13 08:07:28','Lento');
/*!40000 ALTER TABLE `partnerentries` ENABLE KEYS */;
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
-- Table structure for table `productionlist`
--

DROP TABLE IF EXISTS `productionlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productionlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entrytype` varchar(20) DEFAULT NULL,
  `orgid` varchar(10) DEFAULT NULL,
  `prod_code` varchar(20) DEFAULT NULL,
  `prod_handler` varchar(100) DEFAULT NULL,
  `prod_company` varchar(100) DEFAULT NULL,
  `prod_item` varchar(10) DEFAULT NULL,
  `prod_qty` int(10) DEFAULT NULL,
  `prod_uom` varchar(50) DEFAULT NULL,
  `prod_date` varchar(12) DEFAULT NULL,
  `prod_status` varchar(15) DEFAULT NULL,
  `prod_raw_items` text,
  `prod_notes` varchar(355) DEFAULT NULL,
  `prod_edit` int(1) DEFAULT NULL,
  `prod_created_date` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productionlist`
--

LOCK TABLES `productionlist` WRITE;
/*!40000 ALTER TABLE `productionlist` DISABLE KEYS */;
INSERT INTO `productionlist` VALUES (1,'self','COMP001','LENPRD-01','Lento','COMP001','LEN-01',12,'BKT','2019-10-13','Completed','[{\"item\":\"LEN-01\",\"uom\":\"BAG\",\"qty\":\"10\"}]','nr',NULL,'2019-10-13'),(2,'outsourced','CUST001','MAAPRD-02','Lento','CUST001','MAA-04',10,'BKT','2019-10-13','Completed','[{\"item\":\"MAA-02\",\"uom\":\"BND\",\"qty\":\"22\"}]','maavin',NULL,'2019-10-13');
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
  `entrytype` varchar(50) DEFAULT NULL,
  `orgid` varchar(50) DEFAULT NULL,
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
  `scrapqty` int(5) NOT NULL,
  `scrapinuom` varchar(10) NOT NULL,
  `lowstockalert` varchar(50) NOT NULL,
  `stockasofdate` date DEFAULT NULL,
  `usageunit` varchar(30) DEFAULT NULL,
  `handler` varchar(30) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `updatedon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseitemaster`
--

LOCK TABLES `purchaseitemaster` WRITE;
/*!40000 ALTER TABLE `purchaseitemaster` DISABLE KEYS */;
INSERT INTO `purchaseitemaster` VALUES (1,'self','COMP001','LEN-01','Inward Self Item one ','CAT001',NULL,'00001','hsn34444sss','1',100.00,NULL,'KGS','1','1000',0.00,'split','6',0.00,72.00,100.00,'2019-10-13',30.00,'KGS',1,'BAG','5','2019-10-13',NULL,'Lento','notes','2019-10-13 02:14:39',NULL),(2,'outsourced','CUST001','MAA-02','inward outsourced item one maavin','CAT001',NULL,'00001','hsn399939393','1',0.00,NULL,'BAG','Select Tax Method','',0.00,'','0',0.00,0.00,0.00,'2019-10-13',98.00,'BND',1,'BAG','5','2019-10-13',NULL,'Lento','nonond','2019-10-13 02:19:43',NULL),(3,'outsourced','CUST003','JUI-03','inward outsourced item two juicy','CAT001',NULL,'00001','hsn38339','1',0.00,NULL,'0','Select Tax Method','',0.00,'','0',0.00,0.00,0.00,'2019-10-13',100.00,'0',1,'BAG','5','2019-10-13',NULL,'Lento','ASDasdqD','2019-10-13 02:22:04',NULL);
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
  `entrytype` varchar(20) DEFAULT NULL,
  `orgid` varchar(50) DEFAULT NULL,
  `itemcode` varchar(50) NOT NULL,
  `itemname` varchar(100) NOT NULL,
  `qtyonhand` decimal(10,2) DEFAULT NULL,
  `newqty` decimal(10,2) DEFAULT NULL,
  `qtyadjusted` decimal(10,2) DEFAULT '0.00',
  `uom` varchar(100) DEFAULT NULL,
  `adjustedon` datetime DEFAULT CURRENT_TIMESTAMP,
  `handler` varchar(100) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseitemlog`
--

LOCK TABLES `purchaseitemlog` WRITE;
/*!40000 ALTER TABLE `purchaseitemlog` DISABLE KEYS */;
INSERT INTO `purchaseitemlog` VALUES (0001,'self','COMP001','LEN-01','Inward Self Item one ',0.00,20.00,20.00,'KGS','2019-10-13 00:00:00','Lento','notes'),(0002,'self','COMP001','LEN-01','Inward Self Item one ',0.00,20.00,20.00,'KGS','2019-10-13 00:00:00','Lento','notes'),(0003,'outsourced','CUST001','MAA-02','inward outsourced item one maavin',100.00,100.00,0.00,'BND','2019-10-13 00:00:00','Lento','nonond'),(0004,'outsourced','CUST003','JUI-03','inward outsourced item two juicy',0.00,0.00,0.00,'0','2019-10-13 00:00:00','Lento','ASDasdqD'),(0005,NULL,NULL,'DAPL001',' Inward Self Item one ',30.00,NULL,10.00,'KGS','2019-10-13 00:00:00','Lento','GRN-000001'),(0006,NULL,NULL,'DAPL001',' Inward Self Item one ',40.00,NULL,10.00,'KGS','2019-10-13 00:00:00','Lento','GRN-000001'),(0007,NULL,NULL,'DAPL001',' Inward Self Item one ',40.00,NULL,10.00,'KGS','2019-10-13 00:00:00','Lento','GRN-000001'),(0008,NULL,NULL,'DAPL001',' Inward Self Item one ',40.00,NULL,10.00,'KGS','2019-10-13 00:00:00','Lento','GRN-000001'),(0009,'self','COMP001','LEN-01','Inward Self Item one ',40.00,30.00,10.00,'KGS','2019-10-13 08:23:19','Lento',NULL),(0010,'outsourced','CUST001','MAA-02','inward outsourced item one maavin',120.00,98.00,22.00,'BND','2019-10-13 08:26:34','Lento',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purpricemaster`
--

LOCK TABLES `purpricemaster` WRITE;
/*!40000 ALTER TABLE `purpricemaster` DISABLE KEYS */;
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
  `rw_code` varchar(10) NOT NULL,
  `orgid` varchar(10) DEFAULT NULL,
  `proditemcode` varchar(100) DEFAULT NULL,
  `raw_items` text,
  `handler` varchar(255) DEFAULT NULL,
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdby` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawitemaster`
--

LOCK TABLES `rawitemaster` WRITE;
/*!40000 ALTER TABLE `rawitemaster` DISABLE KEYS */;
INSERT INTO `rawitemaster` VALUES (1,'self','RM-001','COMP001','LEN-01','[{\"item\":\"LEN-01\",\"itemname\":\"LEN-01-Inward Self Item one \",\"uom\":\"BAG\",\"qty\":\"10\"}]','Lento','2019-10-13 08:18:14',NULL),(2,'outsourced','RM-002','CUST001','MAA-04','[{\"item\":\"MAA-02\",\"itemname\":\"MAA-02-inward outsourced item one maavin\",\"uom\":\"BND\",\"qty\":\"22\"}]','Lento','2019-10-13 08:19:51',NULL);
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
-- Table structure for table `salesitemaster2`
--

DROP TABLE IF EXISTS `salesitemaster2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesitemaster2` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `entrytype` varchar(20) DEFAULT NULL,
  `itemcode` varchar(100) DEFAULT NULL,
  `orgid` varchar(10) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesitemaster2`
--

LOCK TABLES `salesitemaster2` WRITE;
/*!40000 ALTER TABLE `salesitemaster2` DISABLE KEYS */;
INSERT INTO `salesitemaster2` VALUES (1,'self','LEN-01','COMP001','outward self item 1','CAT001',NULL,'00001','hsn383309','120','','BAG','0','1','','5%GST','','5.00','0','split','','6.00','0.00','3','0','114',NULL,'2019-10-13','2019-10-13',8.00,'2019-10-13',NULL,'5',NULL,NULL,'Lento','notes','2019-10-13 02:40:02',NULL),(3,'outsourced','JUI-03','CUST003','outward outsourced item juicy','CAT001',NULL,'00001','hsn6368382','10','','BAG','0','0','','18%(IGST)','','18.00','0','single','','1.80','0.00','5','0','10',NULL,'2019-10-13','2019-10-13',0.00,'2019-10-13',NULL,'5',NULL,NULL,'Lento','notes','2019-10-13 02:41:38',NULL),(4,'outsourced','MAA-04','CUST001','outward outsourced maavin item','CAT001',NULL,'00001','jsksk','100','','BAG','0','0','','5%GST','','5.00','0','split','','5.00','0.00','3','0','100',NULL,'2019-10-13','2019-10-13',100.00,'2019-10-13',NULL,'5',NULL,NULL,'Lento','otes','2019-10-13 02:46:58',NULL);
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
  `custid` varchar(10) DEFAULT NULL,
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
  `entrytype` varchar(20) DEFAULT NULL,
  `orgid` varchar(10) DEFAULT NULL,
  `itemcode` varchar(50) NOT NULL,
  `itemname` varchar(100) DEFAULT NULL,
  `qtyonhand` decimal(10,2) DEFAULT NULL,
  `newqty` decimal(10,2) DEFAULT NULL,
  `qtyadjusted` decimal(10,2) DEFAULT '0.00',
  `uom` varchar(100) DEFAULT NULL,
  `adjustedon` datetime DEFAULT CURRENT_TIMESTAMP,
  `handler` varchar(100) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesitemlognew`
--

LOCK TABLES `salesitemlognew` WRITE;
/*!40000 ALTER TABLE `salesitemlognew` DISABLE KEYS */;
INSERT INTO `salesitemlognew` VALUES (1,'self','COMP001','LEN-01','outward self item 1',0.00,0.00,0.00,'BAG','2019-10-13 00:00:00','Lento','notes'),(2,'outsourced','CUST001','MAA-02','outward outsourced item 1 ',0.00,0.00,0.00,'BAG','2019-10-13 00:00:00','Lento','notes'),(3,'outsourced','CUST003','JUI-03','outward outsourced item juicy',0.00,0.00,0.00,'BAG','2019-10-13 00:00:00','Lento','notes'),(4,'outsourced','COMP001','MAA-02','outward outsourced item 1 ',0.00,10.00,10.00,'BAG','2019-10-13 00:00:00','Lento','notes'),(5,'outsourced','CUST001','MAA-04','outward outsourced maavin item',100.00,100.00,0.00,'BAG','2019-10-13 00:00:00','Lento','otes'),(6,'self','COMP001','LEN-01','outward self item 1',0.00,12.00,12.00,'BAG','2019-10-13 08:23:19','Lento',NULL),(7,'outsourced','CUST001','MAA-04','outward outsourced maavin item',100.00,110.00,10.00,'BAG','2019-10-13 08:26:35','Lento',NULL),(8,NULL,NULL,'000004',' outward outsourced maavin item',109.00,NULL,-1.00,'BAG','2019-10-13 00:00:00','Lento','INV-00001-10/2019'),(9,NULL,NULL,'00000',' outward self item 1',0.00,NULL,-1.00,'BAG','2019-10-13 00:00:00','Lento','INV-00001-10/2019'),(10,NULL,NULL,'000001',' outward self item 1',11.00,NULL,-1.00,'BAG','2019-10-13 00:00:00','Lento','INV-00001-10/2019'),(11,NULL,NULL,'000004',' outward outsourced maavin item',100.00,NULL,-10.00,'BAG','2019-10-13 00:00:00','Lento','INV-00002-10/2019'),(12,NULL,NULL,'000001',' outward self item 1',8.00,NULL,-2.00,'BAG','2019-10-13 00:00:00','Lento','INV-00003-10/2019');
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
INSERT INTO `uom_lookups` VALUES (1,'BAG','Bag'),(2,'BKT','Bucket'),(3,'BND','Bundle'),(4,'BOWL','Bowl'),(5,'BX','Box'),(6,'CRD','Card'),(7,'CAN','Cans'),(8,'CM','Centimeters'),(9,'CS','Case'),(10,'CTN','Carton'),(11,'DZ','Dozen'),(12,'DRM','Drums'),(13,'EA','Each'),(14,'FT','Foot'),(15,'GAL','Gallon'),(16,'GROSS','Gross'),(17,'IN','Inches'),(18,'KIT','Kit'),(19,'LOT','Lot'),(20,'M','Meter'),(21,'MM','Millimeter'),(22,'PC','Piece'),(23,'PK','Pack'),(24,'PK100','Pack 100'),(25,'PK50','Pack 50'),(26,'PR','Pair'),(27,'RACK','Rack'),(28,'RL','Roll'),(29,'SET','Set'),(30,'SET3','Set of 3'),(31,'SET4','Set of 4'),(32,'SET5','Set of 5'),(33,'SGL','Single'),(34,'SHT','Sheet'),(35,'SQFT','Square ft'),(36,'TUBE','Tube'),(37,'YD','Yard'),(38,'KGS','Kiliograms'),(39,'KLR','Kilolitter'),(40,'NOS','Numbers'),(41,'TON ','Tonnes'),(42,'TUB ','Tubes'),(43,'BTL','Bottles'),(44,'UNT','Units'),(45,'OTH','Others'),(1,'BAG','Bag'),(2,'BKT','Bucket'),(3,'BND','Bundle'),(4,'BOWL','Bowl'),(5,'BX','Box'),(6,'CRD','Card'),(7,'CAN','Cans'),(8,'CM','Centimeters'),(9,'CS','Case'),(10,'CTN','Carton'),(11,'DZ','Dozen'),(12,'DRM','Drums'),(13,'EA','Each'),(14,'FT','Foot'),(15,'GAL','Gallon'),(16,'GROSS','Gross'),(17,'IN','Inches'),(18,'KIT','Kit'),(19,'LOT','Lot'),(20,'M','Meter'),(21,'MM','Millimeter'),(22,'PC','Piece'),(23,'PK','Pack'),(24,'PK100','Pack 100'),(25,'PK50','Pack 50'),(26,'PR','Pair'),(27,'RACK','Rack'),(28,'RL','Roll'),(29,'SET','Set'),(30,'SET3','Set of 3'),(31,'SET4','Set of 4'),(32,'SET5','Set of 5'),(33,'SGL','Single'),(34,'SHT','Sheet'),(35,'SQFT','Square ft'),(36,'TUBE','Tube'),(37,'YD','Yard'),(38,'KGS','Kiliograms'),(39,'KLR','Kilolitter'),(40,'NOS','Numbers'),(41,'TON ','Tonnes'),(42,'TUB ','Tubes'),(43,'BTL','Bottles'),(44,'UNT','Units'),(45,'OTH','Others'),(1,'BAG','Bag'),(2,'BKT','Bucket'),(3,'BND','Bundle'),(4,'BOWL','Bowl'),(5,'BX','Box'),(6,'CRD','Card'),(7,'CAN','Cans'),(8,'CM','Centimeters'),(9,'CS','Case'),(10,'CTN','Carton'),(11,'DZ','Dozen'),(12,'DRM','Drums'),(13,'EA','Each'),(14,'FT','Foot'),(15,'GAL','Gallon'),(16,'GROSS','Gross'),(17,'IN','Inches'),(18,'KIT','Kit'),(19,'LOT','Lot'),(20,'M','Meter'),(21,'MM','Millimeter'),(22,'PC','Piece'),(23,'PK','Pack'),(24,'PK100','Pack 100'),(25,'PK50','Pack 50'),(26,'PR','Pair'),(27,'RACK','Rack'),(28,'RL','Roll'),(29,'SET','Set'),(30,'SET3','Set of 3'),(31,'SET4','Set of 4'),(32,'SET5','Set of 5'),(33,'SGL','Single'),(34,'SHT','Sheet'),(35,'SQFT','Square ft'),(36,'TUBE','Tube'),(37,'YD','Yard'),(38,'KGS','Kiliograms'),(39,'KLR','Kilolitter'),(40,'NOS','Numbers'),(41,'TON ','Tonnes'),(42,'TUB ','Tubes'),(43,'BTL','Bottles'),(44,'UNT','Units'),(45,'OTH','Others'),(0,'CVR','COVER'),(46,'CVR','COVER'),(46,'CVR','COVER'),(0,'CVR','COVER'),(0,'ML','Milliliters');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofile`
--

LOCK TABLES `userprofile` WRITE;
/*!40000 ALTER TABLE `userprofile` DISABLE KEYS */;
INSERT INTO `userprofile` VALUES (1,'L001','Lento','Lento Agro India Pvt ','Ltd','Administrator','1','lento@gmail.com','Lento@2019','Lento@2019','9750996500','Pochampalli','Executive','COMP001','1','upload/lento-logo.png',NULL,'0','2019-09-14 06:07:13',NULL,'2019-09-14 06:07:13'),(2,'L002','Saravanakumar','Saravana','Kumar','Manager','1','saravanas.office@gmail.com','Demo@2019','Demo@2019','9677573737','bargur','Admin','001','1','upload/download.jpg',NULL,'0','2019-10-06 12:37:28',NULL,'2019-10-06 12:37:28');
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
INSERT INTO `vendorprofile` VALUES (001,'00001','0','DAPL','/','MS.','PARLE AGRO PVT LTD',NULL,'Material Supplier','Dadra and Nagar Haveli',NULL,'PLOT NO.258/, VILLAGE SAYLI','SILVASSA ','IN','DH','396230','','0260-6631101','','info@parleagro.com','26AAACP8416G1ZH',NULL,0.00,'2019-02-05','2019-02-05 05:16:06',NULL,'2019-02-05 05:16:06',NULL,'1','Administrator',''),(002,'00002','177000','DAPL','/','M/S.','PADMAVATHI CORRUGATED CONTAINERS',NULL,'Material Supplier','Andhra Pradesh',NULL,'NARSINGAPURAM','CHANDRAGIRI MANDAL , TIRUPATHI','IN','AP','517102','','0877-2276396','padmavathicc@gmail.com','','37AAGFP6789B1ZW',NULL,0.00,NULL,'2019-02-05 05:18:29',NULL,'2019-02-05 05:18:29',NULL,'1',NULL,NULL);
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

-- Dump completed on 2019-10-13  8:57:01
