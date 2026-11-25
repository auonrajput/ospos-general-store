/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ospos
-- ------------------------------------------------------
-- Server version	10.5.29-MariaDB-ubu2004

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
-- Table structure for table `ospos_activity_logs`
--

DROP TABLE IF EXISTS `ospos_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_activity_logs` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_time` datetime NOT NULL,
  `person_id` int(10) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `ref_id` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_time` (`log_time`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_activity_logs`
--

LOCK TABLES `ospos_activity_logs` WRITE;
/*!40000 ALTER TABLE `ospos_activity_logs` DISABLE KEYS */;
INSERT INTO `ospos_activity_logs` VALUES (1,'2026-07-17 22:11:52',1,'system','login','employees','1','User logged in'),(2,'2026-07-18 10:19:32',1,'system','login','employees','1','User logged in'),(3,'2026-07-18 13:11:14',1,'system','login','employees','1','User logged in'),(4,'2026-07-18 13:16:52',1,'system','login','employees','1','User logged in'),(5,'2026-07-18 13:20:12',1,'system','login','employees','1','User logged in'),(6,'2026-07-18 13:27:07',1,'system','login','employees','1','User logged in'),(7,'2026-07-18 13:31:10',1,'system','login','employees','1','User logged in'),(8,'2026-07-18 13:35:56',1,'system','login','employees','1','User logged in'),(9,'2026-07-18 13:38:36',1,'system','login','employees','1','User logged in'),(10,'2026-07-19 08:39:03',1,'system','login','employees','1','User logged in'),(11,'2026-07-19 09:07:33',1,'system','login','employees','1','User logged in'),(12,'2026-07-19 09:08:00',1,'system','login','employees','1','User logged in'),(13,'2026-07-19 09:14:15',1,'system','login','employees','1','User logged in'),(14,'2026-07-19 09:17:33',1,'system','login','employees','1','User logged in'),(15,'2026-07-19 10:48:04',1,'system','sale_saved','sales','9','Sale #9 saved (status: 1)'),(16,'2026-07-19 11:16:35',1,'system','sale_saved','sales','10','Sale #10 saved (status: 1)'),(17,'2026-07-19 11:41:58',1,'system','sale_saved','sales','11','Sale #11 saved (status: 1)'),(18,'2026-07-19 12:34:14',1,'system','sale_saved','sales','12','Sale #12 saved (status: 1)'),(19,'2026-07-20 09:26:00',1,'system','login','employees','1','User logged in'),(20,'2026-07-20 10:28:21',1,'system','sale_saved','sales','13','Sale #13 saved (status: 0)'),(21,'2026-07-20 12:22:52',1,'system','sale_saved','sales','14','Sale #14 saved (status: 0)'),(22,'2026-07-20 15:40:27',1,'system','login','employees','1','User logged in'),(23,'2026-07-21 10:40:52',1,'system','login','employees','1','User logged in'),(24,'2026-07-21 12:35:47',1,'system','login','employees','1','User logged in'),(25,'2026-07-21 12:46:15',1,'system','login','employees','1','User logged in'),(26,'2026-07-23 09:28:07',1,'system','login','employees','1','User logged in'),(27,'2026-07-23 09:59:39',1,'system','login','employees','1','User logged in'),(28,'2026-07-23 10:14:32',1,'system','login','employees','1','User logged in'),(29,'2026-07-23 17:13:58',1,'system','login','employees','1','User logged in'),(30,'2026-07-24 10:18:44',1,'system','login','employees','1','User logged in'),(31,'2026-07-24 12:19:11',1,'system','login','employees','1','User logged in'),(32,'2026-07-25 17:48:26',1,'system','login','employees','1','User logged in'),(33,'2026-07-25 17:53:01',1,'system','login','employees','1','User logged in'),(34,'2026-07-25 17:58:13',1,'system','login','employees','1','User logged in'),(35,'2026-07-27 09:11:45',1,'system','login','employees','1','User logged in'),(36,'2026-07-27 09:13:31',1,'system','sale_saved','sales','15','Sale #15 saved (status: 0)'),(37,'2026-07-27 09:16:14',1,'system','sale_saved','sales','16','Sale #16 saved (status: 0)'),(38,'2026-07-27 10:31:41',4,'system','login','employees','4','User logged in'),(39,'2026-07-27 10:32:23',1,'system','login','employees','1','User logged in'),(40,'2026-07-27 10:33:34',1,'system','login','employees','1','User logged in'),(41,'2026-07-27 11:00:17',1,'system','login','employees','1','User logged in'),(42,'2026-07-27 11:02:51',1,'system','sale_saved','sales','17','Sale #17 saved (status: 0)'),(43,'2026-07-27 11:50:00',1,'system','login','employees','1','User logged in'),(44,'2026-07-27 17:52:21',1,'system','login','employees','1','User logged in'),(45,'2026-07-27 17:53:07',1,'system','sale_saved','sales','18','Sale #18 saved (status: 0)'),(46,'2026-07-27 17:54:22',1,'system','login','employees','1','User logged in'),(47,'2026-07-27 17:57:06',1,'system','login','employees','1','User logged in'),(48,'2026-07-27 17:57:50',1,'system','sale_saved','sales','19','Sale #19 saved (status: 0)'),(49,'2026-07-28 09:29:36',1,'system','login','employees','1','User logged in'),(50,'2026-07-28 12:45:04',1,'system','login','employees','1','User logged in'),(51,'2026-07-28 14:16:40',1,'system','login','employees','1','User logged in'),(52,'2026-07-28 14:18:00',1,'system','login','employees','1','User logged in'),(53,'2026-07-28 16:00:33',1,'system','login','employees','1','User logged in'),(54,'2026-07-28 16:23:59',1,'system','sale_saved','sales','20','Sale #20 saved (status: 0)'),(55,'2026-07-28 16:26:25',1,'system','sale_saved','sales','21','Sale #21 saved (status: 0)'),(56,'2026-07-28 16:42:30',1,'system','sale_saved','sales','22','Sale #22 saved (status: 0)'),(57,'2026-07-29 09:28:05',1,'system','login','employees','1','User logged in'),(58,'2026-07-29 13:27:39',1,'system','login','employees','1','User logged in'),(59,'2026-07-29 15:52:27',1,'system','login','employees','1','User logged in'),(60,'2026-07-29 19:37:20',1,'system','login','employees','1','User logged in'),(61,'2026-07-29 23:38:22',1,'system','login','employees','1','User logged in'),(62,'2026-07-30 09:25:46',1,'system','login','employees','1','User logged in'),(63,'2026-07-30 11:18:10',1,'system','sale_saved','sales','23','Sale #23 saved (status: 0)'),(64,'2026-07-30 11:19:44',1,'system','sale_saved','sales','24','Sale #24 saved (status: 0)'),(65,'2026-07-30 11:37:09',1,'system','sale_saved','sales','25','Sale #25 saved (status: 0)'),(66,'2026-07-30 12:32:40',1,'system','sale_saved','sales','26','Sale #26 saved (status: 0)'),(67,'2026-07-30 12:48:43',1,'system','sale_saved','sales','27','Sale #27 saved (status: 0)'),(68,'2026-07-31 09:20:50',1,'system','login','employees','1','User logged in'),(69,'2026-07-31 10:30:42',1,'system','sale_saved','sales','28','Sale #28 saved (status: 0)'),(70,'2026-07-31 10:39:27',1,'system','sale_saved','sales','29','Sale #29 saved (status: 0)'),(71,'2026-07-31 14:59:53',1,'system','login','employees','1','User logged in'),(72,'2026-07-31 15:00:20',1,'system','sale_saved','sales','30','Sale #30 saved (status: 0)'),(73,'2026-08-01 09:19:24',1,'system','login','employees','1','User logged in'),(74,'2026-08-01 13:19:15',1,'system','sale_saved','sales','31','Sale #31 saved (status: 0)'),(75,'2026-08-01 13:24:37',1,'system','sale_saved','sales','32','Sale #32 saved (status: 0)'),(76,'2026-08-01 17:48:00',1,'system','sale_saved','sales','33','Sale #33 saved (status: 0)'),(77,'2026-08-02 09:51:12',1,'system','login','employees','1','User logged in'),(78,'2026-08-07 09:50:01',1,'system','login','employees','1','User logged in'),(79,'2026-08-07 11:32:07',1,'system','sale_saved','sales','34','Sale #34 saved (status: 0)'),(80,'2026-08-07 12:04:45',1,'system','sale_saved','sales','35','Sale #35 saved (status: 0)'),(81,'2026-08-07 12:15:14',1,'system','sale_saved','sales','36','Sale #36 saved (status: 0)'),(82,'2026-08-08 12:15:56',1,'system','login','employees','1','User logged in'),(83,'2026-08-08 12:35:38',1,'system','sale_saved','sales','39','Sale #39 saved (status: 0)');
/*!40000 ALTER TABLE `ospos_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_app_config`
--

DROP TABLE IF EXISTS `ospos_app_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_app_config` (
  `key` varchar(50) NOT NULL,
  `value` varchar(500) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_app_config`
--

LOCK TABLES `ospos_app_config` WRITE;
/*!40000 ALTER TABLE `ospos_app_config` DISABLE KEYS */;
INSERT INTO `ospos_app_config` VALUES ('account_number',''),('address','Shop #123 Saddar Market , Saddar, Karachi'),('allow_duplicate_barcodes','0'),('barcode_content','id'),('barcode_first_row','category'),('barcode_font','Arial'),('barcode_font_size','10'),('barcode_formats','[]'),('barcode_generate_if_empty','0'),('barcode_height','50'),('barcode_num_in_row','2'),('barcode_page_cellspacing','20'),('barcode_page_width','100'),('barcode_second_row','item_code'),('barcode_third_row','unit_price'),('barcode_type','C39'),('barcode_width','250'),('cash_decimals','2'),('cash_rounding_code','1'),('category_dropdown','0'),('company','AR Mobile Shop'),('company_logo','ChatGPT Image Jul 1, 2026, 01_08_39 PM.jpg'),('country_codes','pk'),('currency_code','PKR'),('currency_decimals','2'),('currency_symbol','Rs'),('customer_reward_enable','0'),('dateformat','d/m/Y'),('date_or_time_format','0'),('default_receivings_discount','0'),('default_receivings_discount_type','0'),('default_register_mode','sale'),('default_sales_discount','0'),('default_sales_discount_type','0'),('default_tax_1_name','GST'),('default_tax_1_rate','17'),('default_tax_2_name',''),('default_tax_2_rate',''),('default_tax_category',''),('default_tax_code',''),('default_tax_jurisdiction',''),('default_tax_rate','8'),('derive_sale_quantity','0'),('dinner_table_enable','0'),('email','changeme@example.com'),('email_receipt_check_behaviour','last'),('enforce_privacy','0'),('fax',''),('financial_year','1'),('gcaptcha_enable','0'),('gcaptcha_secret_key',''),('gcaptcha_site_key',''),('giftcard_number','series'),('image_allowed_types','jpg,gif,webp,png'),('image_max_height','1000'),('image_max_size','500'),('image_max_width','1000'),('include_hsn','0'),('invoice_default_comments','This is a default comment'),('invoice_email_message','Dear {CU}, In attachment the receipt for sale {ISEQ}'),('invoice_enable','1'),('invoice_type','invoice'),('key_amount','53 | ALT + 5'),('key_cancel','27 | ESC'),('key_complete','55 | ALT + 7'),('key_customers','50 | ALT + 2'),('key_finish','56 | ALT + 8'),('key_help','57 | ALT + 9'),('key_items','49 | ALT + 1'),('key_payment','54 | ALT + 6'),('key_suspend','51 | ALT + 3'),('key_suspended','52 | ALT + 4'),('language','english'),('language_code','en'),('last_used_invoice_number','0'),('last_used_quote_number','0'),('last_used_work_order_number','0'),('lines_per_page','25'),('line_sequence','0'),('login_form','input_groups'),('mailpath','/usr/sbin/sendmail'),('msg_msg',''),('msg_pwd',''),('msg_src',''),('msg_uid',''),('multi_pack_enabled','0'),('notify_horizontal_position','center'),('notify_vertical_position','bottom'),('number_locale','en_US'),('payment_message',''),('payment_options_order','cashdebitcredit'),('phone','03171234567'),('print_bottom_margin',''),('print_delay_autoreturn','0'),('print_footer','0'),('print_header','0'),('print_left_margin',''),('print_receipt_check_behaviour','last'),('print_right_margin',''),('print_silently','0'),('print_top_margin',''),('protocol','mail'),('quantity_decimals','0'),('quote_default_comments','This is a default quote comment'),('receipt_font_size','12'),('receipt_show_company_name','1'),('receipt_show_description','1'),('receipt_show_serialnumber','1'),('receipt_show_taxes','0'),('receipt_show_tax_ind','0'),('receipt_show_total_discount','1'),('receipt_template','receipt_default'),('receiving_calculate_average_price','0'),('recv_invoice_format','{CO}'),('return_policy','Test'),('sales_invoice_format','{CO}'),('sales_quote_format','Q%y{QSEQ:6}'),('smtp_crypto','ssl'),('smtp_host',''),('smtp_pass',''),('smtp_port','465'),('smtp_timeout','5'),('smtp_user',''),('statistics','1'),('suggestions_first_column','name'),('suggestions_second_column',''),('suggestions_third_column',''),('tax_decimals','2'),('tax_id',''),('tax_included','0'),('theme','darkly'),('thousands_separator','1'),('timeformat','H:i:s'),('timezone','Asia/Karachi'),('use_destination_based_tax','0'),('website',''),('work_order_enable','0'),('work_order_format','W%y{WSEQ:6}');
/*!40000 ALTER TABLE `ospos_app_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_attribute_definitions`
--

DROP TABLE IF EXISTS `ospos_attribute_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_attribute_definitions` (
  `definition_id` int(10) NOT NULL AUTO_INCREMENT,
  `definition_name` varchar(255) NOT NULL,
  `definition_type` varchar(45) NOT NULL,
  `definition_unit` varchar(16) DEFAULT NULL,
  `definition_flags` tinyint(1) NOT NULL,
  `definition_fk` int(10) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`definition_id`),
  KEY `definition_fk` (`definition_fk`),
  KEY `definition_name` (`definition_name`),
  KEY `definition_type` (`definition_type`),
  CONSTRAINT `fk_ospos_attribute_definitions_ibfk_1` FOREIGN KEY (`definition_fk`) REFERENCES `ospos_attribute_definitions` (`definition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_attribute_definitions`
--

LOCK TABLES `ospos_attribute_definitions` WRITE;
/*!40000 ALTER TABLE `ospos_attribute_definitions` DISABLE KEYS */;
INSERT INTO `ospos_attribute_definitions` VALUES (1,'RAM','DROPDOWN',NULL,7,NULL,0),(2,'Storage','DROPDOWN',NULL,7,NULL,0),(3,'Color','DROPDOWN',NULL,7,NULL,0),(4,'Battery Health','DROPDOWN',NULL,7,NULL,0);
/*!40000 ALTER TABLE `ospos_attribute_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_attribute_links`
--

DROP TABLE IF EXISTS `ospos_attribute_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_attribute_links` (
  `attribute_id` int(11) DEFAULT NULL,
  `definition_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `receiving_id` int(11) DEFAULT NULL,
  `generated_unique_column` varchar(255) GENERATED ALWAYS AS (case when `sale_id` is null and `receiving_id` is null and `item_id` is not null then concat(`definition_id`,'-',`item_id`) else NULL end) STORED,
  UNIQUE KEY `attribute_links_uq1` (`attribute_id`,`definition_id`,`item_id`,`sale_id`,`receiving_id`),
  UNIQUE KEY `attribute_links_uq2` (`item_id`,`receiving_id`,`sale_id`,`definition_id`,`attribute_id`),
  UNIQUE KEY `attribute_links_uq3` (`generated_unique_column`),
  KEY `attribute_id` (`attribute_id`),
  KEY `definition_id` (`definition_id`),
  KEY `item_id` (`item_id`),
  KEY `sale_id` (`sale_id`),
  KEY `receiving_id` (`receiving_id`),
  CONSTRAINT `ospos_attribute_links_ibfk_1` FOREIGN KEY (`definition_id`) REFERENCES `ospos_attribute_definitions` (`definition_id`),
  CONSTRAINT `ospos_attribute_links_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `ospos_attribute_values` (`attribute_id`),
  CONSTRAINT `ospos_attribute_links_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_attribute_links_ibfk_4` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`),
  CONSTRAINT `ospos_attribute_links_ibfk_5` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_attribute_links`
--

LOCK TABLES `ospos_attribute_links` WRITE;
/*!40000 ALTER TABLE `ospos_attribute_links` DISABLE KEYS */;
INSERT INTO `ospos_attribute_links` VALUES (6,2,NULL,NULL,NULL,NULL),(7,2,NULL,NULL,NULL,NULL),(8,2,NULL,NULL,NULL,NULL),(9,2,NULL,NULL,NULL,NULL),(10,2,NULL,NULL,NULL,NULL),(11,3,NULL,NULL,NULL,NULL),(12,3,NULL,NULL,NULL,NULL),(13,3,NULL,NULL,NULL,NULL),(14,3,NULL,NULL,NULL,NULL),(15,3,NULL,NULL,NULL,NULL),(16,3,NULL,NULL,NULL,NULL),(17,4,NULL,NULL,NULL,NULL),(18,4,NULL,NULL,NULL,NULL),(19,4,NULL,NULL,NULL,NULL),(20,4,NULL,NULL,NULL,NULL),(21,4,NULL,NULL,NULL,NULL),(22,4,NULL,NULL,NULL,NULL),(23,1,NULL,NULL,NULL,NULL),(24,1,NULL,NULL,NULL,NULL),(25,1,NULL,NULL,NULL,NULL),(26,1,NULL,NULL,NULL,NULL),(27,1,NULL,NULL,NULL,NULL),(8,2,2,5,NULL,NULL),(13,3,2,5,NULL,NULL),(17,4,2,5,NULL,NULL),(8,2,2,11,NULL,NULL),(13,3,2,11,NULL,NULL),(17,4,2,11,NULL,NULL),(8,2,2,12,NULL,NULL),(13,3,2,12,NULL,NULL),(17,4,2,12,NULL,NULL),(8,2,2,18,NULL,NULL),(13,3,2,18,NULL,NULL),(17,4,2,18,NULL,NULL),(8,2,2,19,NULL,NULL),(13,3,2,19,NULL,NULL),(17,4,2,19,NULL,NULL),(8,2,2,29,NULL,NULL),(13,3,2,29,NULL,NULL),(17,4,2,29,NULL,NULL),(17,4,2,NULL,NULL,'4-2'),(13,3,2,NULL,NULL,'3-2'),(8,2,2,NULL,NULL,'2-2');
/*!40000 ALTER TABLE `ospos_attribute_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_attribute_values`
--

DROP TABLE IF EXISTS `ospos_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_attribute_values` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_value` varchar(255) DEFAULT NULL,
  `attribute_date` date DEFAULT NULL,
  `attribute_decimal` decimal(7,3) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `attribute_value` (`attribute_value`),
  UNIQUE KEY `attribute_date` (`attribute_date`),
  UNIQUE KEY `attribute_decimal` (`attribute_decimal`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_attribute_values`
--

LOCK TABLES `ospos_attribute_values` WRITE;
/*!40000 ALTER TABLE `ospos_attribute_values` DISABLE KEYS */;
INSERT INTO `ospos_attribute_values` VALUES (6,'32GB',NULL,NULL),(7,'64GB',NULL,NULL),(8,'128GB',NULL,NULL),(9,'256GB',NULL,NULL),(10,'512GB',NULL,NULL),(11,'Black',NULL,NULL),(12,'White',NULL,NULL),(13,'Blue',NULL,NULL),(14,'Gold',NULL,NULL),(15,'Silver',NULL,NULL),(16,'Green',NULL,NULL),(17,'100%',NULL,NULL),(18,'95%+',NULL,NULL),(19,'90%+',NULL,NULL),(20,'85%+',NULL,NULL),(21,'80%+',NULL,NULL),(22,'Below 80%',NULL,NULL),(23,'02GB',NULL,NULL),(24,'04GB',NULL,NULL),(25,'06GB',NULL,NULL),(26,'08GB',NULL,NULL),(27,'12GB',NULL,NULL);
/*!40000 ALTER TABLE `ospos_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_cash_up`
--

DROP TABLE IF EXISTS `ospos_cash_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_cash_up` (
  `cashup_id` int(10) NOT NULL AUTO_INCREMENT,
  `open_date` timestamp NULL DEFAULT current_timestamp(),
  `close_date` timestamp NULL DEFAULT NULL,
  `open_amount_cash` decimal(15,2) NOT NULL,
  `transfer_amount_cash` decimal(15,2) NOT NULL,
  `note` tinyint(4) NOT NULL DEFAULT 0,
  `closed_amount_cash` decimal(15,2) NOT NULL,
  `closed_amount_card` decimal(15,2) NOT NULL,
  `closed_amount_check` decimal(15,2) NOT NULL,
  `closed_amount_total` decimal(15,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `open_employee_id` int(10) NOT NULL,
  `close_employee_id` int(10) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `closed_amount_due` decimal(15,2) NOT NULL,
  PRIMARY KEY (`cashup_id`),
  KEY `open_employee_id` (`open_employee_id`),
  KEY `close_employee_id` (`close_employee_id`),
  CONSTRAINT `ospos_cash_up_ibfk_1` FOREIGN KEY (`open_employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_cash_up_ibfk_2` FOREIGN KEY (`close_employee_id`) REFERENCES `ospos_employees` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_cash_up`
--

LOCK TABLES `ospos_cash_up` WRITE;
/*!40000 ALTER TABLE `ospos_cash_up` DISABLE KEYS */;
INSERT INTO `ospos_cash_up` VALUES (1,'2026-06-28 12:37:33','2026-06-28 13:13:01',5000.00,0.00,0,42674.00,0.00,0.00,37674.00,'',1,1,0,0.00);
/*!40000 ALTER TABLE `ospos_cash_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_customer_payments`
--

DROP TABLE IF EXISTS `ospos_customer_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_customer_payments` (
  `payment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `sale_id` int(10) DEFAULT NULL,
  `payment_date` datetime NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(50) DEFAULT NULL,
  `employee_id` int(10) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `customer_id` (`customer_id`),
  KEY `sale_id` (`sale_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `ospos_customer_payments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`),
  CONSTRAINT `ospos_customer_payments_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_customer_payments_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_customer_payments`
--

LOCK TABLES `ospos_customer_payments` WRITE;
/*!40000 ALTER TABLE `ospos_customer_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_customer_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_customers`
--

DROP TABLE IF EXISTS `ospos_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_customers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `customer_type` varchar(50) DEFAULT NULL,
  `credit_limit` decimal(15,2) DEFAULT 0.00,
  `date_of_birth` date DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` tinyint(1) NOT NULL DEFAULT 1,
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `sales_tax_code_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount_type` tinyint(1) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `employee_id` int(10) NOT NULL,
  `consent` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`person_id`),
  KEY `package_id` (`package_id`),
  KEY `sales_tax_code_id` (`sales_tax_code_id`),
  KEY `account_number` (`account_number`),
  KEY `company_name` (`company_name`),
  CONSTRAINT `ospos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`),
  CONSTRAINT `ospos_customers_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`),
  CONSTRAINT `ospos_customers_ibfk_3` FOREIGN KEY (`sales_tax_code_id`) REFERENCES `ospos_tax_codes` (`tax_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_customers`
--

LOCK TABLES `ospos_customers` WRITE;
/*!40000 ALTER TABLE `ospos_customers` DISABLE KEYS */;
INSERT INTO `ospos_customers` VALUES (2,NULL,NULL,0.00,NULL,NULL,0,'',NULL,NULL,NULL,0,0.00,0,'2026-06-28 11:40:51',1,1),(6,NULL,NULL,5000.00,NULL,NULL,1,'',NULL,NULL,NULL,0,0.00,0,'2026-07-28 14:24:32',1,1),(7,NULL,NULL,15000.00,NULL,NULL,0,'',NULL,NULL,NULL,0,0.00,0,'2026-08-01 17:42:40',1,1);
/*!40000 ALTER TABLE `ospos_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_customers_packages`
--

DROP TABLE IF EXISTS `ospos_customers_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_customers_packages` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) DEFAULT NULL,
  `points_percent` float NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_customers_packages`
--

LOCK TABLES `ospos_customers_packages` WRITE;
/*!40000 ALTER TABLE `ospos_customers_packages` DISABLE KEYS */;
INSERT INTO `ospos_customers_packages` VALUES (1,'Default',0,0),(2,'Bronze',10,0),(3,'Silver',20,0),(4,'Gold',30,0),(5,'Premium',50,0);
/*!40000 ALTER TABLE `ospos_customers_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_customers_points`
--

DROP TABLE IF EXISTS `ospos_customers_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_customers_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `points_earned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  KEY `package_id` (`package_id`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `ospos_customers_points_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_customers` (`person_id`),
  CONSTRAINT `ospos_customers_points_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`),
  CONSTRAINT `ospos_customers_points_ibfk_3` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_customers_points`
--

LOCK TABLES `ospos_customers_points` WRITE;
/*!40000 ALTER TABLE `ospos_customers_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_customers_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_dinner_tables`
--

DROP TABLE IF EXISTS `ospos_dinner_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_dinner_tables` (
  `dinner_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`dinner_table_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_dinner_tables`
--

LOCK TABLES `ospos_dinner_tables` WRITE;
/*!40000 ALTER TABLE `ospos_dinner_tables` DISABLE KEYS */;
INSERT INTO `ospos_dinner_tables` VALUES (1,'Delivery',0,0),(2,'Take Away',0,0);
/*!40000 ALTER TABLE `ospos_dinner_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_employees`
--

DROP TABLE IF EXISTS `ospos_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `hash_version` tinyint(1) NOT NULL DEFAULT 2,
  `language` varchar(48) DEFAULT NULL,
  `language_code` varchar(8) DEFAULT NULL,
  `role` enum('admin','technician') NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `ospos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_employees`
--

LOCK TABLES `ospos_employees` WRITE;
/*!40000 ALTER TABLE `ospos_employees` DISABLE KEYS */;
INSERT INTO `ospos_employees` VALUES ('admin','$2y$10$vJBSMlD02EC7ENSrKfVQXuvq9tNRHMtcOA8MSK2NYS748HHWm.gcG',1,0,2,'','','admin'),('Ahmad ','$2y$10$H6tV/kxvXsiJimrCAsGEzOqMIeL2Wty0pQImOPo/ZEspG0PLxR0m2',4,0,2,'','','technician'),('sultan','$2y$10$xVs.AyAT/Ww3Z/R8bPyVF.in.0u2n68Z3BLn6iN4hgFmczwCJCp8a',5,0,2,'','','technician');
/*!40000 ALTER TABLE `ospos_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_expense_categories`
--

DROP TABLE IF EXISTS `ospos_expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_expense_categories` (
  `expense_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`expense_category_id`),
  UNIQUE KEY `category_name` (`category_name`),
  KEY `category_description` (`category_description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_expense_categories`
--

LOCK TABLES `ospos_expense_categories` WRITE;
/*!40000 ALTER TABLE `ospos_expense_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_expenses`
--

DROP TABLE IF EXISTS `ospos_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_expenses` (
  `expense_id` int(10) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `amount` decimal(15,2) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `supplier_tax_code` varchar(255) DEFAULT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `supplier_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `expense_category_id` (`expense_category_id`),
  KEY `employee_id` (`employee_id`),
  KEY `date` (`date`),
  KEY `payment_type` (`payment_type`),
  KEY `amount` (`amount`),
  KEY `ospos_expenses_ibfk_3` (`supplier_id`),
  CONSTRAINT `ospos_expenses_ibfk_1` FOREIGN KEY (`expense_category_id`) REFERENCES `ospos_expense_categories` (`expense_category_id`),
  CONSTRAINT `ospos_expenses_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_expenses_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_expenses`
--

LOCK TABLES `ospos_expenses` WRITE;
/*!40000 ALTER TABLE `ospos_expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_giftcards`
--

DROP TABLE IF EXISTS `ospos_giftcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_giftcards` (
  `record_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `giftcard_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftcard_number` varchar(255) DEFAULT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `person_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`giftcard_id`),
  UNIQUE KEY `giftcard_number` (`giftcard_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_giftcards`
--

LOCK TABLES `ospos_giftcards` WRITE;
/*!40000 ALTER TABLE `ospos_giftcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_giftcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_grants`
--

DROP TABLE IF EXISTS `ospos_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `menu_group` varchar(32) DEFAULT 'home',
  PRIMARY KEY (`permission_id`,`person_id`),
  KEY `ospos_grants_ibfk_2` (`person_id`),
  CONSTRAINT `ospos_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `ospos_permissions` (`permission_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_grants`
--

LOCK TABLES `ospos_grants` WRITE;
/*!40000 ALTER TABLE `ospos_grants` DISABLE KEYS */;
INSERT INTO `ospos_grants` VALUES ('activity_logs',1,'home'),('attributes',1,'office'),('buy_used_phone',1,'home'),('cashups',1,'home'),('config',1,'office'),('customers',1,'home'),('employees',1,'office'),('expenses',1,'home'),('expenses_categories',1,'office'),('giftcards',1,'home'),('home',1,'office'),('home',4,'home'),('imei_lookup',1,'home'),('installments',1,'home'),('items',1,'home'),('items_stock',1,'--'),('item_kits',1,'home'),('messages',1,'home'),('office',1,'home'),('receivings',1,'home'),('receivings_stock',1,'--'),('repairs',1,'home'),('repairs',4,'home'),('repairs',5,'home'),('reports',1,'home'),('reports_categories',1,'--'),('reports_customers',1,'--'),('reports_discounts',1,'--'),('reports_employees',1,'--'),('reports_expenses_categories',1,'--'),('reports_inventory',1,'--'),('reports_items',1,'--'),('reports_payments',1,'--'),('reports_receivings',1,'--'),('reports_sales',1,'--'),('reports_sales_taxes',1,'--'),('reports_suppliers',1,'--'),('reports_taxes',1,'--'),('sales',1,'home'),('sales_change_price',1,'--'),('sales_delete',1,'--'),('sales_stock',1,'--'),('search',1,'home'),('stock_history',1,'home'),('suppliers',1,'home');
/*!40000 ALTER TABLE `ospos_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_installment_payments`
--

DROP TABLE IF EXISTS `ospos_installment_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_installment_payments` (
  `installment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `installment_number` int(5) NOT NULL,
  `due_date` date NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `paid_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `paid_date` datetime DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`installment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_installment_payments`
--

LOCK TABLES `ospos_installment_payments` WRITE;
/*!40000 ALTER TABLE `ospos_installment_payments` DISABLE KEYS */;
INSERT INTO `ospos_installment_payments` VALUES (5,2,1,'2026-08-15',2500.00,5000.00,'2026-07-16 18:28:46','Paid'),(6,2,2,'2026-09-14',2500.00,2500.00,'2026-07-16 18:28:46','Paid'),(7,2,3,'2026-10-14',2500.00,0.00,NULL,'Pending'),(8,2,4,'2026-11-13',2500.00,0.00,NULL,'Pending'),(9,3,1,'2026-08-15',5000.00,0.00,NULL,'Pending'),(10,3,2,'2026-09-14',5000.00,0.00,NULL,'Pending');
/*!40000 ALTER TABLE `ospos_installment_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_installment_plans`
--

DROP TABLE IF EXISTS `ospos_installment_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_installment_plans` (
  `plan_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) NOT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `down_payment` decimal(15,2) NOT NULL DEFAULT 0.00,
  `down_payment_method` varchar(50) DEFAULT NULL,
  `num_installments` int(5) NOT NULL,
  `frequency` varchar(20) NOT NULL DEFAULT 'Monthly',
  `financed_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` varchar(20) NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_installment_plans`
--

LOCK TABLES `ospos_installment_plans` WRITE;
/*!40000 ALTER TABLE `ospos_installment_plans` DISABLE KEYS */;
INSERT INTO `ospos_installment_plans` VALUES (2,1,1,1500.00,NULL,4,'Monthly',10000.00,'Active','2026-07-16 18:28:24'),(3,2,2,1500.00,NULL,2,'Monthly',10000.00,'Active','2026-07-16 18:30:18');
/*!40000 ALTER TABLE `ospos_installment_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_inventory`
--

DROP TABLE IF EXISTS `ospos_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_inventory` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_items` int(11) NOT NULL DEFAULT 0,
  `trans_user` int(11) NOT NULL DEFAULT 0,
  `trans_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `trans_comment` text NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` decimal(15,3) NOT NULL DEFAULT 0.000,
  PRIMARY KEY (`trans_id`),
  KEY `trans_items` (`trans_items`),
  KEY `trans_user` (`trans_user`),
  KEY `trans_location` (`trans_location`),
  KEY `trans_date` (`trans_date`),
  KEY `trans_items_trans_date` (`trans_items`,`trans_date`),
  CONSTRAINT `ospos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_inventory`
--

LOCK TABLES `ospos_inventory` WRITE;
/*!40000 ALTER TABLE `ospos_inventory` DISABLE KEYS */;
INSERT INTO `ospos_inventory` VALUES (1,1,1,'2026-06-28 11:23:02','Manual Edit of Quantity',1,10.000),(2,2,1,'2026-06-28 11:27:41','Manual Edit of Quantity',1,0.000),(3,3,1,'2026-06-28 11:29:00','Manual Edit of Quantity',1,15.000),(4,4,1,'2026-06-28 11:31:40','Manual Edit of Quantity',1,15.000),(5,2,1,'2026-06-28 11:32:31','Manual Edit of Quantity',1,5.000),(6,5,1,'2026-06-28 11:33:20','Manual Edit of Quantity',1,50.000),(7,6,1,'2026-06-28 11:34:47','Manual Edit of Quantity',1,100.000),(8,7,1,'2026-06-28 11:36:04','Manual Edit of Quantity',1,80.000),(9,8,1,'2026-06-28 11:36:56','Manual Edit of Quantity',1,25.000),(10,9,1,'2026-06-28 11:37:35','Manual Edit of Quantity',1,20.000),(11,1,1,'2026-06-28 12:02:53','POS 1',1,-1.000),(12,6,1,'2026-06-28 12:02:53','POS 1',1,-1.000),(13,10,1,'2026-07-01 12:35:46','Manual Edit of Quantity',1,0.000),(14,11,1,'2026-07-01 12:37:22','Manual Edit of Quantity',1,0.000),(15,12,1,'2026-07-01 12:38:32','Manual Edit of Quantity',1,0.000),(16,13,1,'2026-07-01 12:39:04','Manual Edit of Quantity',1,0.000),(17,14,1,'2026-07-01 12:39:31','Manual Edit of Quantity',1,0.000),(18,15,1,'2026-07-01 15:42:21','Manual Edit of Quantity',1,10.000),(19,15,1,'2026-07-01 15:56:27','POS 2',1,-1.000),(20,16,1,'2026-07-01 16:48:52','Manual Edit of Quantity',1,10.000),(21,17,1,'2026-07-01 16:52:59','Manual Edit of Quantity',1,10.000),(22,18,1,'2026-07-01 16:56:10','Manual Edit of Quantity',1,10.000),(23,1,1,'2026-07-09 11:12:26','POS 3',1,-1.000),(24,1,1,'2026-07-09 11:35:33','POS 4',1,-1.000),(25,2,1,'2026-07-09 11:53:49','POS 5',1,-1.000),(26,1,1,'2026-07-09 12:07:23','POS 6',1,-1.000),(27,1,1,'2026-07-09 12:20:10','POS 7',1,-1.000),(28,1,1,'2026-07-09 12:23:27','POS 8',1,-1.000),(29,4,1,'2026-07-20 10:28:21','POS 13',1,-2.000),(30,16,1,'2026-07-20 10:28:21','POS 13',1,-3.000),(31,18,1,'2026-07-20 12:22:52','POS 14',1,-3.000),(32,8,1,'2026-07-20 12:22:52','POS 14',1,-2.000),(33,18,1,'2026-07-27 09:13:31','POS 15',1,-2.000),(34,10,1,'2026-07-27 09:57:18','RECV 1',1,10.000),(35,15,1,'2026-07-27 09:57:18','RECV 1',1,10.000),(36,1,1,'2026-07-27 11:02:51','POS 17',1,-1.000),(37,1,1,'2026-07-27 17:53:07','POS 18',1,-3.000),(38,2,1,'2026-07-27 17:53:07','POS 18',1,-2.000),(39,1,1,'2026-07-27 17:57:50','POS 19',1,-1.000),(40,2,1,'2026-07-27 17:57:50','POS 19',1,-2.000),(41,8,1,'2026-07-28 16:23:58','POS 20',1,-1.000),(42,18,1,'2026-07-28 16:26:25','POS 21',1,-1.000),(43,4,1,'2026-07-28 16:26:25','POS 21',1,-1.000),(44,4,1,'2026-07-28 16:42:30','POS 22',1,-1.000),(45,18,1,'2026-07-30 11:18:10','POS 23',1,-1.000),(46,4,1,'2026-07-30 11:18:10','POS 23',1,-1.000),(47,18,1,'2026-07-30 11:19:44','POS 24',1,-1.000),(48,18,1,'2026-07-30 11:37:09','POS 25',1,-2.000),(49,8,1,'2026-07-30 11:37:09','POS 25',1,-2.000),(50,5,1,'2026-07-30 12:48:43','POS 27',1,-1.000),(51,16,1,'2026-07-30 12:48:43','POS 27',1,-1.000),(52,18,1,'2026-07-31 10:30:42','POS 28',1,-1.000),(53,18,1,'2026-07-31 10:39:27','POS 29',1,-1.000),(54,4,1,'2026-07-31 10:39:27','POS 29',1,-1.000),(55,2,1,'2026-07-31 10:39:27','POS 29',1,-1.000),(56,18,1,'2026-07-31 15:00:20','POS 30',1,-1.000),(57,4,1,'2026-07-31 15:00:20','POS 30',1,-1.000),(58,17,1,'2026-08-01 13:19:15','POS 31',1,-1.000),(59,18,1,'2026-08-01 13:24:37','POS 32',1,-1.000),(60,4,1,'2026-08-01 17:48:00','POS 33',1,-1.000),(61,1,1,'2026-08-07 10:30:58','Manual Edit of Quantity',1,11.000),(62,2,1,'2026-08-07 10:41:33','Manual Edit of Quantity',1,11.000),(63,18,1,'2026-08-07 10:42:17','Manual Edit of Quantity',1,56.000),(64,1,1,'2026-08-07 11:09:14','RECV 2',1,1.000),(65,1,1,'2026-08-07 11:12:09','RECV 3',1,5.000),(66,4,1,'2026-08-07 11:32:07','POS 34',1,-8.000),(67,4,1,'2026-08-07 11:35:16','RECV 4',1,10.000),(68,16,1,'2026-08-07 12:04:45','POS 35',1,-4.000),(69,16,1,'2026-08-07 12:15:14','POS 36',1,-3.000),(70,16,1,'2026-08-08 12:16:43','Manual Edit of Quantity',1,7.000),(71,16,1,'2026-08-08 12:35:38','POS 39',1,-3.000);
/*!40000 ALTER TABLE `ospos_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_item_kit_items`
--

DROP TABLE IF EXISTS `ospos_item_kit_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL,
  `kit_sequence` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  KEY `ospos_item_kit_items_ibfk_2` (`item_id`),
  CONSTRAINT `ospos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `ospos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_item_kit_items`
--

LOCK TABLES `ospos_item_kit_items` WRITE;
/*!40000 ALTER TABLE `ospos_item_kit_items` DISABLE KEYS */;
INSERT INTO `ospos_item_kit_items` VALUES (1,10,1.000,0),(1,15,1.000,0),(2,11,1.000,0),(2,16,1.000,0),(3,13,1.000,0),(3,17,1.000,0),(4,14,1.000,0),(4,18,1.000,0);
/*!40000 ALTER TABLE `ospos_item_kit_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_item_kits`
--

DROP TABLE IF EXISTS `ospos_item_kits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_item_kits` (
  `item_kit_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_kit_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `item_id` int(10) NOT NULL DEFAULT 0,
  `kit_discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `kit_discount_type` tinyint(1) NOT NULL DEFAULT 0,
  `price_option` tinyint(1) NOT NULL DEFAULT 0,
  `print_option` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`item_kit_id`),
  KEY `item_kit_number` (`item_kit_number`),
  KEY `name` (`name`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_item_kits`
--

LOCK TABLES `ospos_item_kits` WRITE;
/*!40000 ALTER TABLE `ospos_item_kits` DISABLE KEYS */;
INSERT INTO `ospos_item_kits` VALUES (1,'','Screen Replacement - iPhone 15','Screen replacement service including part and labor',0,0.00,0,0,0),(2,'','Battery Replacement - Mobile','Battery replacement service including part and labor',0,0.00,0,0,0),(3,'','Charging Port Repair - Mobile','Charging port repair including part and labor',0,0.00,0,0,0),(4,'','Camera Repair - Mobile','Camera repair including part and labor',0,0.00,0,0,0);
/*!40000 ALTER TABLE `ospos_item_kits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_item_quantities`
--

DROP TABLE IF EXISTS `ospos_item_quantities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT 0.000,
  PRIMARY KEY (`item_id`,`location_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `ospos_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_item_quantities`
--

LOCK TABLES `ospos_item_quantities` WRITE;
/*!40000 ALTER TABLE `ospos_item_quantities` DISABLE KEYS */;
INSERT INTO `ospos_item_quantities` VALUES (1,1,16.000),(2,1,10.000),(3,1,15.000),(4,1,9.000),(5,1,49.000),(6,1,99.000),(7,1,80.000),(8,1,20.000),(9,1,20.000),(10,1,10.000),(11,1,0.000),(12,1,0.000),(13,1,0.000),(14,1,0.000),(15,1,17.000),(16,1,2.000),(17,1,7.000),(18,1,50.000);
/*!40000 ALTER TABLE `ospos_item_quantities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_items`
--

DROP TABLE IF EXISTS `ospos_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `storage` varchar(20) DEFAULT NULL,
  `item_condition` varchar(20) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `reorder_level` decimal(15,3) NOT NULL DEFAULT 0.000,
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT 1.000,
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `pic_filename` varchar(255) DEFAULT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `stock_type` tinyint(1) NOT NULL DEFAULT 0,
  `item_type` tinyint(1) NOT NULL DEFAULT 0,
  `tax_category_id` int(11) DEFAULT NULL,
  `qty_per_pack` decimal(15,3) NOT NULL DEFAULT 1.000,
  `pack_name` varchar(8) DEFAULT 'Each',
  `low_sell_item_id` int(10) DEFAULT 0,
  `hsn_code` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `items_uq1` (`supplier_id`,`item_id`,`deleted`,`item_type`),
  KEY `supplier_id` (`supplier_id`),
  KEY `item_number` (`item_number`),
  KEY `deleted` (`deleted`,`item_type`),
  KEY `item_id` (`item_id`,`deleted`),
  CONSTRAINT `ospos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_items`
--

LOCK TABLES `ospos_items` WRITE;
/*!40000 ALTER TABLE `ospos_items` DISABLE KEYS */;
INSERT INTO `ospos_items` VALUES ('Samsung A15','Mobile Phones','','','','',NULL,NULL,'',28000.00,32000.00,1.000,1.000,1,NULL,0,0,0,0,0,NULL,1.000,'Each',1,''),('iPhone 13','Mobile Phones','','','','',NULL,NULL,'',95000.00,105000.00,1.000,10.000,2,NULL,0,0,0,0,0,NULL,1.000,'Each',2,''),('iPhone 13','Mobile Phones',NULL,NULL,NULL,NULL,NULL,NULL,'',22000.00,25500.00,1.000,1.000,3,NULL,0,0,1,0,0,NULL,1.000,'Each',3,''),('Infinix Hot 40','Mobile Phones',NULL,NULL,NULL,NULL,NULL,NULL,'',22000.00,25500.00,1.000,1.000,4,NULL,0,0,0,0,0,NULL,1.000,'Each',4,''),('Mobile Charger Type-C','Accessories',NULL,NULL,NULL,NULL,NULL,NULL,'',250.00,450.00,1.000,1.000,5,NULL,0,0,0,0,0,NULL,1.000,'Each',5,''),('Tempered Glass','Accessories',NULL,NULL,NULL,NULL,NULL,NULL,'',80.00,200.00,1.000,1.000,6,NULL,0,0,0,0,0,NULL,1.000,'Each',6,''),('Mobile Back Cover','Accessories',NULL,NULL,NULL,NULL,NULL,NULL,'',100.00,250.00,1.000,1.000,7,NULL,0,0,0,0,0,NULL,1.000,'Each',7,''),('Bluetooth Earbuds','Accessories',NULL,NULL,NULL,NULL,NULL,NULL,'',1200.00,2000.00,1.000,1.000,8,NULL,0,0,0,0,0,NULL,1.000,'Each',8,''),('Power Bank 10000mAh','Accessories',NULL,NULL,NULL,NULL,NULL,NULL,'',1800.00,2800.00,1.000,1.000,9,NULL,0,0,0,0,0,NULL,1.000,'Each',9,''),('Screen Replacement Service','Screen Repair',NULL,NULL,NULL,NULL,NULL,NULL,'Screen replacement labor charge - part cost extra',0.00,1500.00,1.000,1.000,10,NULL,0,0,0,1,0,NULL,1.000,'Each',10,''),('Battery Replacement Service','Battery Repair',NULL,NULL,NULL,NULL,NULL,NULL,'',0.00,1200.00,1.000,1.000,11,NULL,0,0,0,1,0,NULL,1.000,'Each',11,''),('Software/Unlock Service',' Repair Services',NULL,NULL,NULL,NULL,NULL,NULL,'',0.00,800.00,1.000,1.000,12,NULL,0,0,0,1,0,NULL,1.000,'Each',12,''),('Charging Port Repair','Charging Port Repair',NULL,NULL,NULL,NULL,NULL,NULL,'',0.00,1000.00,1.000,1.000,13,NULL,0,0,0,1,0,NULL,1.000,'Each',13,''),('Camera Repair Service ','Camera Repair',NULL,NULL,NULL,NULL,NULL,NULL,'',0.00,2000.00,1.000,1.000,14,NULL,0,0,0,1,0,NULL,1.000,'Each',14,''),('iPhone 15 Screen Panel','Repair Parts',NULL,NULL,NULL,NULL,NULL,NULL,'',3000.00,4000.00,2.000,1.000,15,NULL,0,0,0,0,0,NULL,1.000,'Each',15,''),('Mobile Battery','Repair Parts','','','','',NULL,NULL,'',1500.00,2000.00,2.000,1.000,16,NULL,0,0,0,0,0,NULL,1.000,'Each',16,''),('Charging Port Flex','Repair Parts',NULL,NULL,NULL,NULL,NULL,NULL,'',800.00,1200.00,2.000,1.000,17,NULL,0,0,0,0,0,NULL,1.000,'Each',17,''),('Camera Module','Repair Parts','','','','',NULL,NULL,'',2500.00,3500.00,2.000,10.000,18,NULL,0,0,0,0,0,NULL,1.000,'Each',18,'');
/*!40000 ALTER TABLE `ospos_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_items_taxes`
--

DROP TABLE IF EXISTS `ospos_items_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  PRIMARY KEY (`item_id`,`name`,`percent`),
  CONSTRAINT `ospos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_items_taxes`
--

LOCK TABLES `ospos_items_taxes` WRITE;
/*!40000 ALTER TABLE `ospos_items_taxes` DISABLE KEYS */;
INSERT INTO `ospos_items_taxes` VALUES (1,'GST',17.000),(2,'GST',17.000),(3,'GST',17.000),(4,'GST',17.000),(5,'GST',17.000),(6,'GST',17.000),(7,'GST',17.000),(8,'GST',17.000),(9,'GST',17.000),(10,'GST',17.000),(11,'GST',17.000),(12,'GST',17.000),(13,'GST',17.000),(14,'GST',17.000),(15,'GST',17.000),(16,'GST',17.000),(17,'GST',17.000),(18,'GST',17.000);
/*!40000 ALTER TABLE `ospos_items_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_migrations`
--

DROP TABLE IF EXISTS `ospos_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_migrations`
--

LOCK TABLES `ospos_migrations` WRITE;
/*!40000 ALTER TABLE `ospos_migrations` DISABLE KEYS */;
INSERT INTO `ospos_migrations` VALUES (1,'20170501000000','App\\Database\\Migrations\\Migration_Initial_Schema','default','App',1782566014,1),(2,'20170501150000','App\\Database\\Migrations\\Migration_Upgrade_To_3_1_1','default','App',1782566020,1),(3,'20170502221506','App\\Database\\Migrations\\Migration_Sales_Tax_Data','default','App',1782566020,1),(4,'20180225100000','App\\Database\\Migrations\\Migration_Upgrade_To_3_2_0','default','App',1782566021,1),(5,'20180501100000','App\\Database\\Migrations\\Migration_Upgrade_To_3_2_1','default','App',1782566021,1),(6,'20181015100000','App\\Database\\Migrations\\Migration_Attributes','default','App',1782566022,1),(7,'20190111270000','App\\Database\\Migrations\\Migration_Upgrade_To_3_3_0','default','App',1782566022,1),(8,'20190129212600','App\\Database\\Migrations\\Migration_IndiaGST','default','App',1782566023,1),(9,'20190213210000','App\\Database\\Migrations\\Migration_IndiaGST1','default','App',1782566023,1),(10,'20190220210000','App\\Database\\Migrations\\Migration_IndiaGST2','default','App',1782566023,1),(11,'20190301124900','App\\Database\\Migrations\\Migration_decimal_attribute_type','default','App',1782566023,1),(12,'20190317102600','App\\Database\\Migrations\\Migration_add_iso_4217','default','App',1782566023,1),(13,'20190427100000','App\\Database\\Migrations\\Migration_PaymentTracking','default','App',1782566023,1),(14,'20190502100000','App\\Database\\Migrations\\Migration_RefundTracking','default','App',1782566023,1),(15,'20190612100000','App\\Database\\Migrations\\Migration_DBFix','default','App',1782566024,1),(16,'20190615100000','App\\Database\\Migrations\\Migration_fix_attribute_datetime','default','App',1782566024,1),(17,'20190712150200','App\\Database\\Migrations\\Migration_fix_empty_reports','default','App',1782566024,1),(18,'20191008100000','App\\Database\\Migrations\\Migration_receipttaxindicator','default','App',1782566024,1),(19,'20191231100000','App\\Database\\Migrations\\Migration_PaymentDateFix','default','App',1782566024,1),(20,'20200125100000','App\\Database\\Migrations\\Migration_SalesChangePrice','default','App',1782566024,1),(21,'20200202000000','App\\Database\\Migrations\\Migration_TaxAmount','default','App',1782566024,1),(22,'20200215100000','App\\Database\\Migrations\\Migration_taxgroupconstraint','default','App',1782566024,1),(23,'20200508000000','App\\Database\\Migrations\\Migration_image_upload_defaults','default','App',1782566024,1),(24,'20200819000000','App\\Database\\Migrations\\Migration_modify_attr_links_constraint','default','App',1782566024,1),(25,'20201108100000','App\\Database\\Migrations\\Migration_cashrounding','default','App',1782566025,1),(26,'20201110000000','App\\Database\\Migrations\\Migration_add_item_kit_number','default','App',1782566025,1),(27,'20210103000000','App\\Database\\Migrations\\Migration_modify_session_datatype','default','App',1782566025,1),(28,'20210422000000','App\\Database\\Migrations\\Migration_database_optimizations','default','App',1782566030,1),(29,'20210422000001','App\\Database\\Migrations\\Migration_remove_duplicate_links','default','App',1782566030,1),(30,'20210714140000','App\\Database\\Migrations\\Migration_move_expenses_categories','default','App',1782566030,1),(31,'20220127000000','App\\Database\\Migrations\\Convert_to_ci4','default','App',1782566030,1),(32,'20230307000000','App\\Database\\Migrations\\IntToTinyint','default','App',1782566031,1),(33,'20230412000000','App\\Database\\Migrations\\Migration_add_missing_config','default','App',1782566031,1),(34,'20230412000001','App\\Database\\Migrations\\Migration_drop_account_number_index','default','App',1782566031,1),(35,'20240319000000','App\\Database\\Migrations\\Migration_Convert_Barcode_Types','default','App',1782566031,1),(36,'20240630000001','App\\Database\\Migrations\\Migration_fix_keys_for_db_upgrade','default','App',1782566031,1),(37,'20240826000000','App\\Database\\Migrations\\fix_duplicate_attributes','default','App',1782566032,1),(38,'20250213000000','App\\Database\\Migrations\\Migration_Attributes_fix_cascading_delete','default','App',1782566032,1),(39,'20250425000000','App\\Database\\Migrations\\Migration_sessions_migration','default','App',1782566033,1),(40,'20250519000000','App\\Database\\Migrations\\MigrationOptimizationIndices','default','App',1782566033,1),(41,'20250521000000','App\\Database\\Migrations\\FixImageFilenameSpaces','default','App',1782566033,1),(42,'20250522000000','App\\Database\\Migrations\\AttributeLinksUniqueConstraint','default','App',1782566033,1),(43,'20250716170000','App\\Database\\Migrations\\Migration_MissingConfigKeys','default','App',1782566033,1),(44,'20250729170000','App\\Database\\Migrations\\Migration_NullableTaxCategoryId','default','App',1782566033,1),(45,'20260506000000','App\\Database\\Migrations\\AddShortcutKeys','default','App',1782566033,1),(47,'20260716000000','App\\Database\\Migrations\\CreateUsedPhonePurchases','development','App',1784112711,2),(48,'20260716010000','App\\Database\\Migrations\\AddCustomerExtraFields','default','App',1784177528,3),(49,'20260716020000','App\\Database\\Migrations\\AddSupplierExtraFields','default','App',1784195849,4),(50,'20260716030000','App\\Database\\Migrations\\CreateInstallmentTables','default','App',1784197898,5),(51,'20260717000000','App\\Database\\Migrations\\CreateActivityLogs','default','App',1784271288,6),(52,'20260731000000','App\\Database\\Migrations\\CreateCreditSalesDatabase','development','App',1785486332,7);
/*!40000 ALTER TABLE `ospos_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_modules`
--

DROP TABLE IF EXISTS `ospos_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_modules`
--

LOCK TABLES `ospos_modules` WRITE;
/*!40000 ALTER TABLE `ospos_modules` DISABLE KEYS */;
INSERT INTO `ospos_modules` VALUES ('activity_logs','activity_logs_desc',48,'activity_logs'),('module_attributes','module_attributes_desc',107,'attributes'),('buy_used_phone','buy_used_phone_desc',46,'buy_used_phone'),('module_cashups','module_cashups_desc',110,'cashups'),('module_config','module_config_desc',900,'config'),('module_customers','module_customers_desc',10,'customers'),('module_employees','module_employees_desc',80,'employees'),('module_expenses','module_expenses_desc',108,'expenses'),('module_expenses_categories','module_expenses_categories_desc',109,'expenses_categories'),('module_giftcards','module_giftcards_desc',90,'giftcards'),('module_home','module_home_desc',1,'home'),('imei_lookup','imei_lookup_desc',47,'imei_lookup'),('installments','installments_desc',62,'installments'),('module_items','module_items_desc',20,'items'),('module_item_kits','module_item_kits_desc',30,'item_kits'),('module_messages','module_messages_desc',98,'messages'),('module_office','module_office_desc',999,'office'),('module_receivings','module_receivings_desc',60,'receivings'),('Repairing','Mobile Repair Job Management',45,'repairs'),('module_reports','module_reports_desc',50,'reports'),('module_sales','module_sales_desc',70,'sales'),('Search','Universal Search',0,'search'),('stock_history','stock_history_desc',61,'stock_history'),('module_suppliers','module_suppliers_desc',40,'suppliers'),('module_taxes','module_taxes_desc',105,'taxes');
/*!40000 ALTER TABLE `ospos_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_people`
--

DROP TABLE IF EXISTS `ospos_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`person_id`),
  KEY `email` (`email`),
  KEY `first_name` (`first_name`,`last_name`,`email`,`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_people`
--

LOCK TABLES `ospos_people` WRITE;
/*!40000 ALTER TABLE `ospos_people` DISABLE KEYS */;
INSERT INTO `ospos_people` VALUES ('Zaviyar','Ali',1,'03171234567','zaviali@example.com','Address 1','','','','','','',1),('Ahmed','Khan',1,'03001234567','','','','','','','','',2),('Bilal','Ahmed',1,'03171234567','','','','','','','','',3),('Ahmad ','Sarfraz',1,'','','','','','','','','',4),('Sultan ','Ali ',1,'','','','','','','','','',5),('Abid','Khan',NULL,'','','','','','','','','',6),('Faraz','Ahmed',1,'03123456785','','','','Karachi ','Sindh ','','Pakistan','',7),('Samsung ','Supplier ',NULL,'','','','','','','','','',8);
/*!40000 ALTER TABLE `ospos_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_permissions`
--

DROP TABLE IF EXISTS `ospos_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `module_id` (`module_id`),
  KEY `ospos_permissions_ibfk_2` (`location_id`),
  CONSTRAINT `ospos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ospos_modules` (`module_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_permissions`
--

LOCK TABLES `ospos_permissions` WRITE;
/*!40000 ALTER TABLE `ospos_permissions` DISABLE KEYS */;
INSERT INTO `ospos_permissions` VALUES ('activity_logs','activity_logs',NULL),('attributes','attributes',NULL),('buy_used_phone','buy_used_phone',NULL),('cashups','cashups',NULL),('config','config',NULL),('customers','customers',NULL),('employees','employees',NULL),('expenses','expenses',NULL),('expenses_categories','expenses_categories',NULL),('giftcards','giftcards',NULL),('home','home',NULL),('imei_lookup','imei_lookup',NULL),('installments','installments',NULL),('items','items',NULL),('items_stock','items',1),('item_kits','item_kits',NULL),('messages','messages',NULL),('office','office',NULL),('receivings','receivings',NULL),('receivings_stock','receivings',1),('repairs','repairs',NULL),('reports','reports',NULL),('reports_categories','reports',NULL),('reports_customers','reports',NULL),('reports_discounts','reports',NULL),('reports_employees','reports',NULL),('reports_expenses_categories','reports',NULL),('reports_inventory','reports',NULL),('reports_items','reports',NULL),('reports_payments','reports',NULL),('reports_receivings','reports',NULL),('reports_sales','reports',NULL),('reports_sales_taxes','reports',NULL),('reports_suppliers','reports',NULL),('reports_taxes','reports',NULL),('sales','sales',NULL),('sales_change_price','sales',NULL),('sales_delete','sales',NULL),('sales_stock','sales',1),('search','search',NULL),('stock_history','stock_history',NULL),('suppliers','suppliers',NULL),('taxes','taxes',NULL);
/*!40000 ALTER TABLE `ospos_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_receivings`
--

DROP TABLE IF EXISTS `ospos_receivings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) DEFAULT NULL,
  `reference` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`receiving_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `employee_id` (`employee_id`),
  KEY `reference` (`reference`),
  KEY `receiving_time` (`receiving_time`),
  CONSTRAINT `ospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_receivings`
--

LOCK TABLES `ospos_receivings` WRITE;
/*!40000 ALTER TABLE `ospos_receivings` DISABLE KEYS */;
INSERT INTO `ospos_receivings` VALUES ('2026-07-27 09:57:18',NULL,1,'',1,'Cash',''),('2026-08-07 11:09:14',8,1,'',2,'Cash',''),('2026-08-07 11:12:09',8,1,'',3,'Cash',''),('2026-08-07 11:35:16',NULL,1,'',4,'Cash','');
/*!40000 ALTER TABLE `ospos_receivings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_receivings_items`
--

DROP TABLE IF EXISTS `ospos_receivings_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT 0,
  `item_id` int(10) NOT NULL DEFAULT 0,
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT 0.000,
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount_type` tinyint(1) NOT NULL DEFAULT 0,
  `item_location` int(11) NOT NULL,
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT 1.000,
  PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ospos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_receivings_items`
--

LOCK TABLES `ospos_receivings_items` WRITE;
/*!40000 ALTER TABLE `ospos_receivings_items` DISABLE KEYS */;
INSERT INTO `ospos_receivings_items` VALUES (1,10,'Screen replacement labor charg','',1,10.000,0.00,0.00,0.00,0,1,1.000),(1,15,'','',2,10.000,3000.00,3000.00,0.00,0,1,1.000),(2,1,'','',1,1.000,28000.00,28000.00,0.00,0,1,1.000),(3,1,'','',1,5.000,28000.00,28000.00,0.00,0,1,1.000),(4,4,'','',1,10.000,22000.00,22000.00,0.00,0,1,1.000);
/*!40000 ALTER TABLE `ospos_receivings_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_repair_jobs`
--

DROP TABLE IF EXISTS `ospos_repair_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_repair_jobs` (
  `repair_job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_number` varchar(20) NOT NULL,
  `date_received` date NOT NULL,
  `arrival_time` time NOT NULL,
  `expected_return_date` date DEFAULT NULL,
  `expected_return_time` time DEFAULT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_mobile` varchar(20) NOT NULL,
  `alternative_number` varchar(20) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `imei` varchar(50) DEFAULT NULL,
  `password_pattern` varchar(50) DEFAULT NULL,
  `fault_description` text DEFAULT NULL,
  `body_condition` varchar(100) DEFAULT NULL,
  `display_condition` varchar(100) DEFAULT NULL,
  `camera_condition` varchar(100) DEFAULT NULL,
  `battery_condition` varchar(100) DEFAULT NULL,
  `condition_photos` text DEFAULT NULL,
  `water_damage` tinyint(1) DEFAULT 0,
  `opened_before` tinyint(1) DEFAULT 0,
  `accessory_charger` tinyint(1) DEFAULT 0,
  `accessory_cable` tinyint(1) DEFAULT 0,
  `accessory_cover` tinyint(1) DEFAULT 0,
  `accessory_sim` tinyint(1) DEFAULT 0,
  `accessory_memory_card` tinyint(1) DEFAULT 0,
  `estimated_charges` decimal(10,2) DEFAULT 0.00,
  `advance_payment` decimal(10,2) DEFAULT 0.00,
  `remaining_amount` decimal(10,2) DEFAULT 0.00,
  `warranty_days` int(11) DEFAULT 0,
  `technician_name` varchar(100) DEFAULT NULL,
  `item_kit_id` varchar(255) DEFAULT NULL,
  `stock_deducted` tinyint(1) DEFAULT 0,
  `special_note` text DEFAULT NULL,
  `repair_status` varchar(30) NOT NULL DEFAULT 'Received',
  `delivery_date` date DEFAULT NULL,
  `delivery_time` time DEFAULT NULL,
  `remaining_payment_collected` decimal(10,2) DEFAULT 0.00,
  `customer_signature_confirmed` tinyint(1) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`repair_job_id`),
  UNIQUE KEY `job_number` (`job_number`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_repair_jobs`
--

LOCK TABLES `ospos_repair_jobs` WRITE;
/*!40000 ALTER TABLE `ospos_repair_jobs` DISABLE KEYS */;
INSERT INTO `ospos_repair_jobs` VALUES (1,'','2026-07-02','00:00:00','0000-00-00','00:00:00','test ','03001234567','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0,'',NULL,0,'','Delivered','2026-07-08','12:57:00',0.00,1,NULL,'2026-07-02 05:11:29','2026-07-08 07:57:29'),(2,'RJ-0002','2026-07-02','00:00:00','0000-00-00','00:00:00','test ','03001234567','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0,'',NULL,0,'','Delivered','2026-07-02','14:35:00',500.00,1,NULL,'2026-07-02 06:03:34','2026-07-04 07:19:56'),(3,'RJ-0003','2026-07-02','00:00:00','0000-00-00','00:00:00','Test Kit','03009999999','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,0,'Zaviyar Ali','2',1,'','Delivered','2026-07-08','12:57:00',0.00,1,NULL,'2026-07-02 09:13:07','2026-07-08 07:57:24'),(5,'RJ-0004','2026-07-08','11:03:00','0000-00-00','00:00:00','test 5','03001234678',NULL,NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,'',0,0,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,NULL,'Zaviyar Ali',NULL,1,'','Delivered','2026-07-08','12:57:00',0.00,1,NULL,'2026-07-08 06:03:55','2026-07-08 07:57:27'),(6,'RJ-0006','2026-07-08','11:04:00','0000-00-00','00:00:00','test 6','030012345789',NULL,NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,'',0,0,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,NULL,'Ahmad  Sarfraz','2,4,3,1',1,'','Delivered','2026-07-08','13:36:00',0.00,1,NULL,'2026-07-08 06:04:23','2026-07-08 08:36:02'),(7,'RJ-0007','2026-07-08','12:57:00','0000-00-00','00:00:00','haidar','03132456789',NULL,NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,'',0,0,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,NULL,'Ahmad  Sarfraz',NULL,0,'','Delivered','2026-07-08','19:56:00',0.00,1,NULL,'2026-07-08 07:58:11','2026-07-08 14:56:50'),(9,'RJ-0008','2026-07-09','10:02:00','0000-00-00','00:00:00','arif','03124567898',NULL,NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,'',0,0,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,NULL,'Sultan  Ali',NULL,0,'','Delivered','2026-07-14','17:38:00',0.00,1,NULL,'2026-07-09 05:03:03','2026-07-14 12:38:07'),(10,'RJ-0010','2026-07-09','10:03:00','0000-00-00','00:00:00','jaffae','0312147473',NULL,NULL,NULL,'',NULL,'',NULL,NULL,NULL,NULL,'',0,0,NULL,NULL,NULL,NULL,NULL,1000.00,500.00,500.00,NULL,'Ahmad  Sarfraz',NULL,0,'','Delivered','2026-07-14','17:38:00',500.00,1,NULL,'2026-07-09 05:03:25','2026-07-14 12:38:04'),(11,'RJ-0011','2026-07-27','10:32:00','0000-00-00','00:00:00','jabbir','03124567894',NULL,NULL,NULL,'316756789878123',NULL,'',NULL,NULL,NULL,NULL,'',0,0,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,NULL,'',NULL,0,'','Delivered','2026-07-27','11:07:00',0.00,1,NULL,'2026-07-27 05:33:23','2026-07-27 06:07:20'),(12,'RJ-0012','2026-07-27','11:07:00','0000-00-00','00:00:00','test 9','03001234567',NULL,NULL,NULL,'316756789878123',NULL,'Samsung A15',NULL,NULL,NULL,NULL,'',0,0,NULL,NULL,NULL,NULL,NULL,0.00,0.00,0.00,NULL,'',NULL,0,'','Delivered','2026-07-27','18:02:00',0.00,1,NULL,'2026-07-27 06:08:00','2026-07-27 13:02:36'),(13,'RJ-0013','2026-07-27','11:23:00','0000-00-00','00:00:00','test ','03001234567',NULL,'Apple','iPhone 13','12345',NULL,'',NULL,NULL,NULL,NULL,'',0,0,NULL,NULL,NULL,NULL,NULL,2000.00,1000.00,1000.00,NULL,'',NULL,0,'','Received',NULL,NULL,0.00,0,NULL,'2026-07-27 06:25:02','2026-07-27 07:08:28'),(14,'RJ-0014','2026-07-27','12:09:00','0000-00-00','00:00:00','Test Kit','03009999999',NULL,'Samsung','A52','316756789878123',NULL,'',NULL,NULL,NULL,NULL,'',0,0,NULL,NULL,NULL,NULL,NULL,2000.00,1000.00,1000.00,NULL,'Sultan  Ali',NULL,0,'','Received',NULL,NULL,0.00,0,NULL,'2026-07-27 07:09:19','2026-07-27 07:17:19');
/*!40000 ALTER TABLE `ospos_repair_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_repair_status_history`
--

DROP TABLE IF EXISTS `ospos_repair_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_repair_status_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `repair_job_id` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `changed_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`history_id`),
  KEY `repair_job_id` (`repair_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_repair_status_history`
--

LOCK TABLES `ospos_repair_status_history` WRITE;
/*!40000 ALTER TABLE `ospos_repair_status_history` DISABLE KEYS */;
INSERT INTO `ospos_repair_status_history` VALUES (1,2,'Received',1,'2026-07-02 06:16:22'),(2,2,'Checking',1,'2026-07-02 06:16:29'),(3,2,'Delivered',1,'2026-07-02 07:25:05'),(4,3,'Received',1,'2026-07-02 09:13:07'),(5,4,'Received',1,'2026-07-02 10:08:44'),(6,3,'Delivered',1,'2026-07-02 10:23:46'),(7,1,'Delivered',1,'2026-07-02 11:36:03'),(8,3,'Checking',1,'2026-07-04 06:50:27'),(9,3,'Received',1,'2026-07-04 06:50:31'),(10,3,'Checking',1,'2026-07-04 06:50:34'),(11,2,'Received',1,'2026-07-04 06:50:34'),(12,1,'Received',1,'2026-07-04 06:50:36'),(13,3,'Repairing',1,'2026-07-04 06:51:26'),(14,5,'Received',1,'2026-07-08 06:03:55'),(15,6,'Received',1,'2026-07-08 06:04:23'),(16,3,'Delivered',1,'2026-07-08 07:57:24'),(17,5,'Delivered',1,'2026-07-08 07:57:27'),(18,1,'Delivered',1,'2026-07-08 07:57:29'),(19,7,'Received',1,'2026-07-08 07:58:11'),(20,6,'Delivered',1,'2026-07-08 08:36:02'),(21,8,'Received',1,'2026-07-08 08:48:08'),(22,7,'Delivered',1,'2026-07-08 14:56:50'),(23,9,'Received',5,'2026-07-09 05:03:03'),(24,10,'Received',5,'2026-07-09 05:03:25'),(25,10,'Delivered',1,'2026-07-14 12:38:04'),(26,9,'Delivered',1,'2026-07-14 12:38:07'),(27,11,'Received',1,'2026-07-27 05:33:23'),(28,11,'Delivered',1,'2026-07-27 06:07:20'),(29,12,'Received',1,'2026-07-27 06:08:00'),(30,13,'Received',1,'2026-07-27 06:25:02'),(31,14,'Received',1,'2026-07-27 07:09:19'),(32,12,'Delivered',1,'2026-07-27 13:02:37');
/*!40000 ALTER TABLE `ospos_repair_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales`
--

DROP TABLE IF EXISTS `ospos_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `invoice_number` varchar(32) DEFAULT NULL,
  `dinner_table_id` int(11) DEFAULT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  `quote_number` varchar(32) DEFAULT NULL,
  `sale_status` tinyint(1) NOT NULL DEFAULT 0,
  `work_order_number` varchar(32) DEFAULT NULL,
  `sale_type` tinyint(1) NOT NULL DEFAULT 0,
  `is_credit` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `total_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `sale_time` (`sale_time`),
  KEY `dinner_table_id` (`dinner_table_id`),
  CONSTRAINT `ospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`),
  CONSTRAINT `ospos_sales_ibfk_3` FOREIGN KEY (`dinner_table_id`) REFERENCES `ospos_dinner_tables` (`dinner_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales`
--

LOCK TABLES `ospos_sales` WRITE;
/*!40000 ALTER TABLE `ospos_sales` DISABLE KEYS */;
INSERT INTO `ospos_sales` VALUES ('2026-06-28 12:02:53',NULL,1,'',NULL,NULL,1,NULL,0,NULL,0,0,0.00),('2026-07-01 15:56:27',NULL,1,'Technician: Huzaifa',NULL,NULL,2,NULL,0,NULL,0,0,0.00),('2026-07-09 11:12:26',NULL,1,'',NULL,NULL,3,NULL,0,NULL,0,0,0.00),('2026-07-09 11:35:33',NULL,1,'',NULL,NULL,4,NULL,0,NULL,0,0,0.00),('2026-07-09 11:53:49',2,1,'',NULL,NULL,5,NULL,0,NULL,0,0,0.00),('2026-07-09 12:07:23',2,1,'',NULL,NULL,6,NULL,0,NULL,0,0,0.00),('2026-07-09 12:20:10',NULL,1,'',NULL,NULL,7,NULL,0,NULL,0,0,0.00),('2026-07-09 12:23:26',2,1,'',NULL,NULL,8,NULL,0,NULL,0,0,0.00),('2026-07-19 10:48:04',NULL,1,'',NULL,NULL,9,NULL,1,NULL,0,0,0.00),('2026-07-19 11:16:35',NULL,1,'',NULL,NULL,10,NULL,1,NULL,0,0,0.00),('2026-07-19 11:41:58',NULL,1,'',NULL,NULL,11,NULL,1,NULL,0,0,0.00),('2026-07-19 12:34:14',NULL,1,'',NULL,NULL,12,NULL,1,NULL,0,0,0.00),('2026-07-20 10:28:21',NULL,1,'',NULL,NULL,13,NULL,0,NULL,0,0,0.00),('2026-07-20 12:22:52',NULL,1,'',NULL,NULL,14,NULL,0,NULL,0,0,0.00),('2026-07-27 09:13:31',NULL,1,'',NULL,NULL,15,NULL,0,NULL,0,0,0.00),('2026-07-27 09:16:14',NULL,1,'',NULL,NULL,16,NULL,0,NULL,0,0,0.00),('2026-07-27 11:02:51',NULL,1,'',NULL,NULL,17,NULL,0,NULL,0,0,0.00),('2026-07-27 17:53:07',NULL,1,'',NULL,NULL,18,NULL,0,NULL,0,0,0.00),('2026-07-27 17:57:50',NULL,1,'',NULL,NULL,19,NULL,0,NULL,0,0,0.00),('2026-07-28 16:23:58',2,1,'','0',NULL,20,NULL,0,NULL,1,0,0.00),('2026-07-28 16:26:25',2,1,'','1',NULL,21,NULL,0,NULL,1,0,0.00),('2026-07-28 16:42:30',6,1,'',NULL,NULL,22,NULL,0,NULL,0,0,0.00),('2026-07-30 11:18:10',6,1,'',NULL,NULL,23,NULL,0,NULL,0,0,0.00),('2026-07-30 11:19:43',6,1,'',NULL,NULL,24,NULL,0,NULL,0,0,0.00),('2026-07-30 11:37:09',NULL,1,'',NULL,NULL,25,NULL,0,NULL,0,0,0.00),('2026-07-30 12:32:39',NULL,1,'',NULL,NULL,26,NULL,0,NULL,0,0,0.00),('2026-07-30 12:48:43',NULL,1,'',NULL,NULL,27,NULL,0,NULL,0,0,0.00),('2026-07-31 10:30:42',2,1,'',NULL,NULL,28,NULL,0,NULL,0,0,0.00),('2026-07-31 10:39:27',NULL,1,'',NULL,NULL,29,NULL,0,NULL,0,0,0.00),('2026-07-31 15:00:20',6,1,'',NULL,NULL,30,NULL,0,NULL,0,0,33930.00),('2026-08-01 13:19:15',2,1,'',NULL,NULL,31,NULL,0,NULL,0,1,1200.00),('2026-08-01 13:24:37',NULL,1,'',NULL,NULL,32,NULL,0,NULL,0,0,6435.00),('2026-08-01 17:48:00',7,1,'',NULL,NULL,33,NULL,0,NULL,0,1,25500.00),('2026-08-07 11:32:07',6,1,'',NULL,NULL,34,NULL,0,NULL,0,0,238680.00),('2026-08-07 12:04:45',NULL,1,'',NULL,NULL,35,NULL,0,NULL,0,0,0.00),('2026-08-07 12:15:14',NULL,1,'',NULL,NULL,36,NULL,0,NULL,0,0,0.00),('2026-08-08 12:35:38',NULL,1,'',NULL,NULL,39,NULL,0,NULL,0,0,0.00);
/*!40000 ALTER TABLE `ospos_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_items`
--

DROP TABLE IF EXISTS `ospos_sales_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT 0,
  `item_id` int(10) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT 0,
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT 0.000,
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount_type` tinyint(1) NOT NULL DEFAULT 0,
  `item_location` int(11) NOT NULL,
  `print_option` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  KEY `item_location` (`item_location`),
  CONSTRAINT `ospos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`),
  CONSTRAINT `ospos_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_items`
--

LOCK TABLES `ospos_sales_items` WRITE;
/*!40000 ALTER TABLE `ospos_sales_items` DISABLE KEYS */;
INSERT INTO `ospos_sales_items` VALUES (1,1,'','',1,1.000,28000.00,32000.00,0.00,0,1,0),(1,6,'','',2,1.000,80.00,200.00,0.00,0,1,0),(2,10,'Screen replacement labor charge - part cost extra','',1,1.000,0.00,1500.00,0.00,0,1,0),(2,15,'','',2,1.000,3000.00,4000.00,0.00,0,1,0),(3,1,'','',1,1.000,28000.00,32000.00,0.00,0,1,0),(4,1,'','',1,1.000,28000.00,32000.00,0.00,0,1,0),(5,2,'','',1,1.000,95000.00,105000.00,0.00,0,1,0),(6,1,'','',1,1.000,28000.00,32000.00,0.00,0,1,0),(7,1,'','',1,1.000,28000.00,32000.00,0.00,0,1,0),(8,1,'','',1,1.000,28000.00,32000.00,0.00,0,1,0),(9,1,'','',2,1.000,28000.00,32000.00,0.00,0,1,0),(9,8,'','',1,1.000,1200.00,2000.00,0.00,0,1,0),(10,4,'','',3,1.000,22000.00,25500.00,0.00,0,1,0),(10,8,'','',1,1.000,1200.00,2000.00,0.00,0,1,0),(10,11,'','',2,1.000,0.00,1200.00,0.00,0,1,0),(11,2,'','',1,1.000,95000.00,105000.00,0.00,0,1,0),(12,2,'','',1,1.000,95000.00,105000.00,0.00,0,1,0),(13,4,'','',1,2.000,22000.00,25500.00,0.00,0,1,0),(13,16,'','',2,3.000,1500.00,2000.00,0.00,0,1,0),(14,8,'','',2,2.000,1200.00,2000.00,0.00,0,1,0),(14,18,'','',1,3.000,2500.00,3500.00,0.00,0,1,0),(15,11,'','',1,2.000,0.00,1200.00,0.00,0,1,0),(15,18,'','',2,2.000,2500.00,3500.00,0.00,0,1,0),(16,11,'','',1,1.000,0.00,1200.00,0.00,0,1,0),(17,1,'','',1,1.000,28000.00,32000.00,0.00,0,1,0),(18,1,'','',1,3.000,28000.00,32000.00,0.00,0,1,0),(18,2,'','',2,2.000,95000.00,105000.00,0.00,0,1,0),(19,1,'','',1,1.000,28000.00,32000.00,0.00,0,1,0),(19,2,'','',2,2.000,95000.00,105000.00,0.00,0,1,0),(20,8,'','',1,1.000,1200.00,2000.00,0.00,0,1,0),(21,4,'','',2,1.000,22000.00,25500.00,0.00,0,1,0),(21,18,'','',1,1.000,2500.00,3500.00,0.00,0,1,0),(22,4,'','',1,1.000,22000.00,25500.00,0.00,0,1,0),(23,4,'','',3,1.000,22000.00,25500.00,0.00,0,1,0),(23,14,'','',2,1.000,0.00,2000.00,0.00,0,1,0),(23,18,'','',1,1.000,2500.00,3500.00,0.00,0,1,0),(24,14,'','',2,1.000,0.00,2000.00,0.00,0,1,0),(24,18,'','',1,1.000,2500.00,3500.00,0.00,0,1,0),(25,8,'','',3,2.000,1200.00,2000.00,0.00,0,1,0),(25,11,'','',4,3.000,0.00,1200.00,0.00,0,1,0),(25,14,'','',1,1.000,0.00,2000.00,0.00,0,1,0),(25,18,'','',2,2.000,2500.00,3500.00,0.00,0,1,0),(26,10,'Screen replacement labor charge - part cost extra','',8,1.000,0.00,1500.00,0.00,0,1,0),(27,5,'','',5,1.000,250.00,450.00,0.00,0,1,0),(27,16,'','',6,1.000,1500.00,2000.00,0.00,0,1,0),(28,14,'','',1,1.000,0.00,2000.00,0.00,0,1,0),(28,18,'','',2,1.000,2500.00,3500.00,0.00,0,1,0),(29,2,'','',3,1.000,95000.00,105000.00,0.00,0,1,0),(29,4,'','',2,1.000,22000.00,25500.00,0.00,0,1,0),(29,18,'','',1,1.000,2500.00,3500.00,0.00,0,1,0),(30,4,'','',2,1.000,22000.00,25500.00,0.00,0,1,0),(30,18,'','',1,1.000,2500.00,3500.00,0.00,0,1,0),(31,17,'','',1,1.000,800.00,1200.00,0.00,0,1,0),(32,14,'','',1,1.000,0.00,2000.00,0.00,0,1,0),(32,18,'','',2,1.000,2500.00,3500.00,0.00,0,1,0),(33,4,'','',1,1.000,22000.00,25500.00,0.00,0,1,0),(34,4,'','',1,8.000,22000.00,25500.00,0.00,0,1,0),(35,16,'','',1,4.000,1500.00,2000.00,0.00,0,1,0),(36,16,'','',1,3.000,1500.00,2000.00,0.00,0,1,0),(39,16,'','',1,3.000,1500.00,2000.00,0.00,0,1,0);
/*!40000 ALTER TABLE `ospos_sales_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_items_taxes`
--

DROP TABLE IF EXISTS `ospos_sales_items_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `tax_type` tinyint(1) NOT NULL DEFAULT 0,
  `rounding_code` tinyint(1) NOT NULL DEFAULT 0,
  `cascade_sequence` tinyint(1) NOT NULL DEFAULT 0,
  `item_tax_amount` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `sales_tax_code_id` int(11) DEFAULT NULL,
  `jurisdiction_id` int(11) DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`, `item_id`, `line`) REFERENCES `ospos_sales_items` (`sale_id`, `item_id`, `line`),
  CONSTRAINT `ospos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_items_taxes`
--

LOCK TABLES `ospos_sales_items_taxes` WRITE;
/*!40000 ALTER TABLE `ospos_sales_items_taxes` DISABLE KEYS */;
INSERT INTO `ospos_sales_items_taxes` VALUES (1,1,1,'GST',17.0000,1,1,0,5440.0000,NULL,NULL,NULL),(1,6,2,'GST',17.0000,1,1,0,34.0000,NULL,NULL,NULL),(2,10,1,'GST',17.0000,1,1,0,255.0000,NULL,NULL,NULL),(2,15,2,'GST',17.0000,1,1,0,680.0000,NULL,NULL,NULL),(3,1,1,'GST',17.0000,1,1,0,5440.0000,NULL,NULL,NULL),(4,1,1,'GST',17.0000,1,1,0,5440.0000,NULL,NULL,NULL),(7,1,1,'GST',17.0000,1,1,0,5440.0000,NULL,NULL,NULL),(13,4,1,'GST',17.0000,1,1,0,8670.0000,NULL,NULL,NULL),(13,16,2,'GST',17.0000,1,1,0,1020.0000,NULL,NULL,NULL),(14,8,2,'GST',17.0000,1,1,0,680.0000,NULL,NULL,NULL),(14,18,1,'GST',17.0000,1,1,0,1785.0000,NULL,NULL,NULL),(15,11,1,'GST',17.0000,1,1,0,408.0000,NULL,NULL,NULL),(15,18,2,'GST',17.0000,1,1,0,1190.0000,NULL,NULL,NULL),(16,11,1,'GST',17.0000,1,1,0,204.0000,NULL,NULL,NULL),(17,1,1,'GST',17.0000,1,1,0,5440.0000,NULL,NULL,NULL),(18,1,1,'GST',17.0000,1,1,0,16320.0000,NULL,NULL,NULL),(18,2,2,'GST',17.0000,1,1,0,35700.0000,NULL,NULL,NULL),(19,1,1,'GST',17.0000,1,1,0,5440.0000,NULL,NULL,NULL),(19,2,2,'GST',17.0000,1,1,0,35700.0000,NULL,NULL,NULL),(20,8,1,'GST',17.0000,1,1,0,340.0000,NULL,NULL,NULL),(22,4,1,'GST',17.0000,1,1,0,4335.0000,NULL,NULL,NULL),(23,4,3,'GST',17.0000,1,1,0,4335.0000,NULL,NULL,NULL),(23,14,2,'GST',17.0000,1,1,0,340.0000,NULL,NULL,NULL),(23,18,1,'GST',17.0000,1,1,0,595.0000,NULL,NULL,NULL),(24,14,2,'GST',17.0000,1,1,0,340.0000,NULL,NULL,NULL),(24,18,1,'GST',17.0000,1,1,0,595.0000,NULL,NULL,NULL),(25,8,3,'GST',17.0000,1,1,0,680.0000,NULL,NULL,NULL),(25,11,4,'GST',17.0000,1,1,0,612.0000,NULL,NULL,NULL),(25,14,1,'GST',17.0000,1,1,0,340.0000,NULL,NULL,NULL),(25,18,2,'GST',17.0000,1,1,0,1190.0000,NULL,NULL,NULL),(26,10,8,'GST',17.0000,1,1,0,255.0000,NULL,NULL,NULL),(27,5,5,'GST',17.0000,1,1,0,76.5000,NULL,NULL,NULL),(27,16,6,'GST',17.0000,1,1,0,340.0000,NULL,NULL,NULL),(29,2,3,'GST',17.0000,1,1,0,17850.0000,NULL,NULL,NULL),(29,4,2,'GST',17.0000,1,1,0,4335.0000,NULL,NULL,NULL),(29,18,1,'GST',17.0000,1,1,0,595.0000,NULL,NULL,NULL),(30,4,2,'GST',17.0000,1,1,0,4335.0000,NULL,NULL,NULL),(30,18,1,'GST',17.0000,1,1,0,595.0000,NULL,NULL,NULL),(32,14,1,'GST',17.0000,1,1,0,340.0000,NULL,NULL,NULL),(32,18,2,'GST',17.0000,1,1,0,595.0000,NULL,NULL,NULL),(34,4,1,'GST',17.0000,1,1,0,34680.0000,NULL,NULL,NULL),(35,16,1,'GST',17.0000,1,1,0,1360.0000,NULL,NULL,NULL),(36,16,1,'GST',17.0000,1,1,0,1020.0000,NULL,NULL,NULL),(39,16,1,'GST',17.0000,1,1,0,1020.0000,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ospos_sales_items_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_payments`
--

DROP TABLE IF EXISTS `ospos_sales_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_sales_payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  `cash_refund` decimal(15,2) NOT NULL DEFAULT 0.00,
  `cash_adjustment` tinyint(4) NOT NULL DEFAULT 0,
  `employee_id` int(11) DEFAULT NULL,
  `payment_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_code` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`payment_id`),
  KEY `payment_sale` (`sale_id`,`payment_type`),
  KEY `employee_id` (`employee_id`),
  KEY `payment_time` (`payment_time`),
  CONSTRAINT `ospos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`),
  CONSTRAINT `ospos_sales_payments_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_payments`
--

LOCK TABLES `ospos_sales_payments` WRITE;
/*!40000 ALTER TABLE `ospos_sales_payments` DISABLE KEYS */;
INSERT INTO `ospos_sales_payments` VALUES (1,1,'Cash',37674.00,0.00,0,1,'2026-06-28 07:02:53',''),(2,2,'Cash',6435.00,0.00,0,1,'2026-07-01 10:56:27',''),(3,3,'Cash',37440.00,0.00,0,1,'2026-07-09 06:12:26',''),(4,4,'Cash',37440.00,0.00,0,1,'2026-07-09 06:35:33',''),(5,5,'Cash',105000.00,0.00,0,1,'2026-07-09 06:53:49',''),(6,6,'Cash',32000.00,0.00,0,1,'2026-07-09 07:07:23',''),(7,7,'Cash',37440.00,0.00,0,1,'2026-07-09 07:20:10',''),(8,8,'Cash',32000.00,0.00,0,1,'2026-07-09 07:23:26',''),(9,9,'Cash',4680.00,0.00,0,1,'2026-07-19 05:48:04',''),(10,10,'Cash',28700.00,0.00,0,1,'2026-07-19 06:16:35',''),(11,13,'Cash',66690.00,0.00,0,1,'2026-07-20 05:28:21',''),(12,14,'Cash',16965.00,0.00,0,1,'2026-07-20 07:22:52',''),(13,15,'Cash',10998.00,0.00,0,1,'2026-07-27 04:13:31',''),(14,16,'Cash',1404.00,0.00,0,1,'2026-07-27 04:16:14',''),(15,17,'Cash',37440.00,0.00,0,1,'2026-07-27 06:02:51',''),(16,18,'Cash',358020.00,0.00,0,1,'2026-07-27 12:53:07',''),(17,19,'Cash',283140.00,0.00,0,1,'2026-07-27 12:57:50',''),(18,21,'Cash',25000.00,0.00,0,1,'2026-07-28 11:37:13',''),(19,20,'Cash',2000.00,0.00,0,1,'2026-07-28 11:41:00',''),(20,22,'Cash',29835.00,0.00,0,1,'2026-07-28 11:42:30',''),(21,23,'Cash',36270.00,0.00,0,1,'2026-07-30 06:18:10',''),(22,24,'Cash',6435.00,0.00,0,1,'2026-07-30 06:19:44',''),(23,28,'Cash',6435.00,935.00,0,1,'2026-07-31 05:30:42',''),(24,29,'Cash',156780.00,0.00,0,1,'2026-07-31 05:39:27',''),(25,30,'Cash',33930.00,0.00,0,1,'2026-07-31 10:00:20',''),(26,31,'Due',1200.00,0.00,0,1,'2026-08-01 08:19:15',''),(27,32,'Cash',6435.00,0.00,0,1,'2026-08-01 08:24:37',''),(28,34,'Cash',238680.00,0.00,0,1,'2026-08-07 06:32:07',''),(29,35,'Cash',9360.00,0.00,0,1,'2026-08-07 07:04:45',''),(30,36,'Cash',7020.00,0.00,0,1,'2026-08-07 07:15:14',''),(33,39,'Cash',7020.00,0.00,0,1,'2026-08-08 07:35:38','');
/*!40000 ALTER TABLE `ospos_sales_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_reward_points`
--

DROP TABLE IF EXISTS `ospos_sales_reward_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_sales_reward_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `earned` float NOT NULL,
  `used` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `ospos_sales_reward_points_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_reward_points`
--

LOCK TABLES `ospos_sales_reward_points` WRITE;
/*!40000 ALTER TABLE `ospos_sales_reward_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_reward_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_taxes`
--

DROP TABLE IF EXISTS `ospos_sales_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_sales_taxes` (
  `sales_taxes_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) NOT NULL,
  `jurisdiction_id` int(11) DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  `tax_type` smallint(2) NOT NULL,
  `tax_group` varchar(32) NOT NULL,
  `sale_tax_basis` decimal(15,4) NOT NULL,
  `sale_tax_amount` decimal(15,4) NOT NULL,
  `print_sequence` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL,
  `sales_tax_code_id` int(11) DEFAULT NULL,
  `rounding_code` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sales_taxes_id`),
  KEY `print_sequence` (`sale_id`,`print_sequence`,`tax_group`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_taxes`
--

LOCK TABLES `ospos_sales_taxes` WRITE;
/*!40000 ALTER TABLE `ospos_sales_taxes` DISABLE KEYS */;
INSERT INTO `ospos_sales_taxes` VALUES (1,1,NULL,NULL,1,'GST',32200.0000,5474.0000,1,'GST',17.0000,NULL,1),(2,2,NULL,NULL,1,'GST',5500.0000,935.0000,1,'GST',17.0000,NULL,1),(3,3,NULL,NULL,1,'GST',32000.0000,5440.0000,1,'GST',17.0000,NULL,1),(4,4,NULL,NULL,1,'GST',32000.0000,5440.0000,1,'GST',17.0000,NULL,1),(5,7,NULL,NULL,1,'GST',32000.0000,5440.0000,1,'GST',17.0000,NULL,1),(6,13,NULL,NULL,1,'GST',57000.0000,9690.0000,1,'GST',17.0000,NULL,1),(7,14,NULL,NULL,1,'GST',14500.0000,2465.0000,1,'GST',17.0000,NULL,1),(8,15,NULL,NULL,1,'GST',9400.0000,1598.0000,1,'GST',17.0000,NULL,1),(9,16,NULL,NULL,1,'GST',1200.0000,204.0000,1,'GST',17.0000,NULL,1),(10,17,NULL,NULL,1,'GST',32000.0000,5440.0000,1,'GST',17.0000,NULL,1),(11,18,NULL,NULL,1,'GST',306000.0000,52020.0000,1,'GST',17.0000,NULL,1),(12,19,NULL,NULL,1,'GST',242000.0000,41140.0000,1,'GST',17.0000,NULL,1),(13,20,NULL,NULL,1,'GST',2000.0000,340.0000,1,'GST',17.0000,NULL,1),(14,22,NULL,NULL,1,'GST',25500.0000,4335.0000,1,'GST',17.0000,NULL,1),(15,23,NULL,NULL,1,'GST',31000.0000,5270.0000,1,'GST',17.0000,NULL,1),(16,24,NULL,NULL,1,'GST',5500.0000,935.0000,1,'GST',17.0000,NULL,1),(17,25,NULL,NULL,1,'GST',16600.0000,2822.0000,1,'GST',17.0000,NULL,1),(18,26,NULL,NULL,1,'GST',1500.0000,255.0000,1,'GST',17.0000,NULL,1),(19,27,NULL,NULL,1,'GST',2450.0000,416.5000,1,'GST',17.0000,NULL,1),(20,29,NULL,NULL,1,'GST',134000.0000,22780.0000,1,'GST',17.0000,NULL,1),(21,30,NULL,NULL,1,'GST',29000.0000,4930.0000,1,'GST',17.0000,NULL,1),(22,32,NULL,NULL,1,'GST',5500.0000,935.0000,1,'GST',17.0000,NULL,1),(23,34,NULL,NULL,1,'GST',204000.0000,34680.0000,1,'GST',17.0000,NULL,1),(24,35,NULL,NULL,1,'GST',8000.0000,1360.0000,1,'GST',17.0000,NULL,1),(25,36,NULL,NULL,1,'GST',6000.0000,1020.0000,1,'GST',17.0000,NULL,1),(26,39,NULL,NULL,1,'GST',6000.0000,1020.0000,1,'GST',17.0000,NULL,1);
/*!40000 ALTER TABLE `ospos_sales_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sessions`
--

DROP TABLE IF EXISTS `ospos_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `data` blob NOT NULL,
  PRIMARY KEY (`id`,`ip_address`),
  KEY `ospos_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sessions`
--

LOCK TABLES `ospos_sessions` WRITE;
/*!40000 ALTER TABLE `ospos_sessions` DISABLE KEYS */;
INSERT INTO `ospos_sessions` VALUES ('ospos_session:82cb777b585233dc6284a50482e92f49','172.18.0.1','2026-08-07 07:15:48','__ci_last_regenerate|i:1786086695;csrf_ospos_v4|s:32:\"921f832db2c45e9c540d440cf71a9531\";_ci_previous_url|s:22:\"http://localhost/items\";person_id|s:1:\"1\";user_role|s:5:\"admin\";menu_group|s:4:\"home\";allow_temp_items|i:0;sale_id|i:-1;sales_location|i:1;item_location|s:1:\"1\";recv_stock_source|i:1;'),('ospos_session:ce4a7ae09b6ef98553bebbbea66dee2d','172.18.0.1','2026-08-08 07:37:26','__ci_last_regenerate|i:1786174501;csrf_ospos_v4|s:32:\"51bc272a245538c0b90d0867356f3940\";_ci_previous_url|s:22:\"http://localhost/items\";person_id|s:1:\"1\";user_role|s:5:\"admin\";menu_group|s:4:\"home\";allow_temp_items|i:0;sale_id|i:-1;sales_location|i:1;item_location|s:1:\"1\";cash_rounding|i:0;cash_mode|i:0;sales_cart|a:0:{}sales_customer|i:-1;sales_mode|s:4:\"sale\";sales_payments|a:0:{}');
/*!40000 ALTER TABLE `ospos_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_stock_locations`
--

DROP TABLE IF EXISTS `ospos_stock_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_stock_locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_stock_locations`
--

LOCK TABLES `ospos_stock_locations` WRITE;
/*!40000 ALTER TABLE `ospos_stock_locations` DISABLE KEYS */;
INSERT INTO `ospos_stock_locations` VALUES (1,'stock',0);
/*!40000 ALTER TABLE `ospos_stock_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_suppliers`
--

DROP TABLE IF EXISTS `ospos_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `agency_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `tax_id` varchar(32) NOT NULL DEFAULT '',
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `category` tinyint(1) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `payment_terms` varchar(100) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_account` varchar(100) DEFAULT NULL,
  `opening_balance` decimal(15,2) DEFAULT 0.00,
  `status` varchar(20) DEFAULT 'Active',
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `category` (`category`),
  KEY `company_name` (`company_name`,`deleted`),
  CONSTRAINT `ospos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_suppliers`
--

LOCK TABLES `ospos_suppliers` WRITE;
/*!40000 ALTER TABLE `ospos_suppliers` DISABLE KEYS */;
INSERT INTO `ospos_suppliers` VALUES (3,'Mobile Distributors Karachi','',NULL,'',0,0,NULL,NULL,NULL,NULL,0.00,'Active'),(8,'Samsung','',NULL,'',0,0,'','','','',0.00,'Active');
/*!40000 ALTER TABLE `ospos_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_tax_categories`
--

DROP TABLE IF EXISTS `ospos_tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_tax_categories` (
  `tax_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `tax_category` varchar(32) NOT NULL,
  `tax_group_sequence` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tax_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_tax_categories`
--

LOCK TABLES `ospos_tax_categories` WRITE;
/*!40000 ALTER TABLE `ospos_tax_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_tax_codes`
--

DROP TABLE IF EXISTS `ospos_tax_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_tax_codes` (
  `tax_code_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_code` varchar(32) NOT NULL,
  `tax_code_name` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tax_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_tax_codes`
--

LOCK TABLES `ospos_tax_codes` WRITE;
/*!40000 ALTER TABLE `ospos_tax_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_tax_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_tax_jurisdictions`
--

DROP TABLE IF EXISTS `ospos_tax_jurisdictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_tax_jurisdictions` (
  `jurisdiction_id` int(11) NOT NULL AUTO_INCREMENT,
  `jurisdiction_name` varchar(255) DEFAULT NULL,
  `tax_group` varchar(32) NOT NULL,
  `tax_type` smallint(2) NOT NULL,
  `reporting_authority` varchar(255) DEFAULT NULL,
  `tax_group_sequence` tinyint(1) NOT NULL DEFAULT 0,
  `cascade_sequence` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`jurisdiction_id`),
  UNIQUE KEY `tax_jurisdictions_uq1` (`tax_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_tax_jurisdictions`
--

LOCK TABLES `ospos_tax_jurisdictions` WRITE;
/*!40000 ALTER TABLE `ospos_tax_jurisdictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_tax_jurisdictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_tax_rates`
--

DROP TABLE IF EXISTS `ospos_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_tax_rates` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `rate_tax_code_id` int(11) NOT NULL,
  `rate_tax_category_id` int(10) NOT NULL,
  `rate_jurisdiction_id` int(11) NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `tax_rounding_code` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tax_rate_id`),
  KEY `rate_tax_category_id` (`rate_tax_category_id`),
  KEY `rate_tax_code_id` (`rate_tax_code_id`),
  KEY `rate_jurisdiction_id` (`rate_jurisdiction_id`),
  CONSTRAINT `ospos_tax_rates_ibfk_1` FOREIGN KEY (`rate_tax_category_id`) REFERENCES `ospos_tax_categories` (`tax_category_id`),
  CONSTRAINT `ospos_tax_rates_ibfk_2` FOREIGN KEY (`rate_tax_code_id`) REFERENCES `ospos_tax_codes` (`tax_code_id`),
  CONSTRAINT `ospos_tax_rates_ibfk_3` FOREIGN KEY (`rate_jurisdiction_id`) REFERENCES `ospos_tax_jurisdictions` (`jurisdiction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_tax_rates`
--

LOCK TABLES `ospos_tax_rates` WRITE;
/*!40000 ALTER TABLE `ospos_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_used_phone_purchases`
--

DROP TABLE IF EXISTS `ospos_used_phone_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ospos_used_phone_purchases` (
  `purchase_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `seller_name` varchar(255) DEFAULT NULL,
  `seller_mobile` varchar(50) DEFAULT NULL,
  `device` varchar(255) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `storage` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `imei` varchar(50) DEFAULT NULL,
  `id_type` varchar(50) DEFAULT NULL,
  `id_number` varchar(100) DEFAULT NULL,
  `id_card_image` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `resale_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `condition_rating` varchar(50) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `battery_health` int(3) DEFAULT NULL,
  `warranty_days` int(5) NOT NULL DEFAULT 0,
  `screen_condition` varchar(10) DEFAULT NULL,
  `battery_grade` varchar(10) DEFAULT NULL,
  `body_condition` varchar(10) DEFAULT NULL,
  `base_market_value` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` varchar(50) NOT NULL DEFAULT 'In Stock',
  `accessories` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_used_phone_purchases`
--

LOCK TABLES `ospos_used_phone_purchases` WRITE;
/*!40000 ALTER TABLE `ospos_used_phone_purchases` DISABLE KEYS */;
INSERT INTO `ospos_used_phone_purchases` VALUES (1,'Ahmed Khan','03001234567',' iPhone 12','Apple','A2172','128GB','Black','356789104567890','','',NULL,45000.00,55000.00,'Good','A',88,29,'','','',0.00,'In Stock','','','2026-07-15 16:09:31'),(3,'sufiyan','03001234568',' iPhone 12','Apple','iPhone 13','128GB','Black','356789104567881','CNIC','4535363788767',NULL,45000.00,55000.00,'Good','B',88,0,'A','B','B',0.00,'In Stock','','','2026-07-27 14:48:23');
/*!40000 ALTER TABLE `ospos_used_phone_purchases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-08  9:51:23
