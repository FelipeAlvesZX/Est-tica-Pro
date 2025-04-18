-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: e_stetica_pro_db
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add categoria',7,'add_categoria'),(26,'Can change categoria',7,'change_categoria'),(27,'Can delete categoria',7,'delete_categoria'),(28,'Can view categoria',7,'view_categoria'),(29,'Can add produto',8,'add_produto'),(30,'Can change produto',8,'change_produto'),(31,'Can delete produto',8,'delete_produto'),(32,'Can view produto',8,'view_produto'),(33,'Can add venda',9,'add_venda'),(34,'Can change venda',9,'change_venda'),(35,'Can delete venda',9,'delete_venda'),(36,'Can view venda',9,'view_venda'),(37,'Can add cliente',10,'add_cliente'),(38,'Can change cliente',10,'change_cliente'),(39,'Can delete cliente',10,'delete_cliente'),(40,'Can view cliente',10,'view_cliente'),(41,'Can add produto',11,'add_produto'),(42,'Can change produto',11,'change_produto'),(43,'Can delete produto',11,'delete_produto'),(44,'Can view produto',11,'view_produto'),(45,'Can add categoria',12,'add_categoria'),(46,'Can change categoria',12,'change_categoria'),(47,'Can delete categoria',12,'delete_categoria'),(48,'Can view categoria',12,'view_categoria'),(49,'Can add cliente',13,'add_cliente'),(50,'Can change cliente',13,'change_cliente'),(51,'Can delete cliente',13,'delete_cliente'),(52,'Can view cliente',13,'view_cliente'),(53,'Can add venda',14,'add_venda'),(54,'Can change venda',14,'change_venda'),(55,'Can delete venda',14,'delete_venda'),(56,'Can view venda',14,'view_venda'),(57,'Can add vendedor',15,'add_vendedor'),(58,'Can change vendedor',15,'change_vendedor'),(59,'Can delete vendedor',15,'delete_vendedor'),(60,'Can view vendedor',15,'view_vendedor'),(61,'Can add venda produto',16,'add_vendaproduto'),(62,'Can change venda produto',16,'change_vendaproduto'),(63,'Can delete venda produto',16,'delete_vendaproduto'),(64,'Can view venda produto',16,'view_vendaproduto'),(65,'Can add categorias',12,'add_categorias'),(66,'Can change categorias',12,'change_categorias'),(67,'Can delete categorias',12,'delete_categorias'),(68,'Can view categorias',12,'view_categorias');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$sYgqnbrDgYG9FaiLv5pc7A$gGsYjyPJ+yYjTMP3Txa6mBq3e6nnUlAvzQb33a5Lwzc=',NULL,1,'Felipezx','','','felipe.unisale@gmail.com',1,1,'2024-11-05 23:14:47.524826'),(2,'pbkdf2_sha256$600000$D6z7DxEkQbB3fsxMnyj0Ux$Y02mEUTCwf+nbHmNVg+YcsT/R/xhcdGzLAHOvD4cxS4=','2024-11-10 23:05:06.390265',0,'Morpheus','','','aassda@gmail.com',0,1,'2024-11-10 22:42:23.050075'),(3,'pbkdf2_sha256$600000$W5eAEJgg5wnMpKDgpfRccx$SfrQbruLG5GdRPS/+CiCR3CL2OtQ+4azInUFMiSP3I0=','2024-11-10 22:55:00.557690',0,'Fabiana','','','fabiana21@gmail.com',0,1,'2024-11-10 22:51:35.318570'),(4,'pbkdf2_sha256$600000$WUtNO70SUXaWVbTBixdFX1$Dd4ovT+hk7BIapYTJaQTb4UejfwvJNsTodKd+FbeB28=','2024-11-11 00:57:37.060008',0,'Morpheus1','','','felipealvessouza318@gmail.com',0,1,'2024-11-10 23:15:46.899603'),(5,'pbkdf2_sha256$600000$5dhXV8IWIqzgbGqWZgXyfK$Pc20jEDnUQMoTQI0YDhqQ6nl4aajbssQIgCMOMDZTQQ=','2024-11-11 00:59:45.896683',0,'Batata','','','felipealvessouza318@gmail.com',0,1,'2024-11-11 00:58:07.897476'),(6,'pbkdf2_sha256$600000$O6DBW5ZNusk7rY0suLaGgz$femyUCFdk9t2+pk6oWceVxESG2GzPVciAPb3h7IslYQ=','2024-11-15 11:31:33.484258',1,'Felipe','','','felipe.unisale@gmail.com',1,1,'2024-11-15 11:31:08.475281');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Skin Care','Produtos para cuidados com a pele','2024-11-20 00:34:10'),(2,'EAU de perfum','Longa duracao','2024-11-20 03:37:07');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Francisco','Francisco@gmail.com','1981316521','2+8415623056','2024-11-20 03:55:51'),(2,'Felipe','a@gmail.com','(18) 99202-6820','481.684.958-60','2024-11-20 04:12:27');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'Sistema','categoria'),(10,'Sistema','cliente'),(8,'Sistema','produto'),(9,'Sistema','venda'),(12,'vendas','categorias'),(13,'vendas','cliente'),(11,'vendas','produto'),(14,'vendas','venda'),(16,'vendas','vendaproduto'),(15,'vendas','vendedor');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-05 23:08:23.142202'),(2,'auth','0001_initial','2024-11-05 23:08:24.098937'),(3,'admin','0001_initial','2024-11-05 23:08:24.297294'),(4,'admin','0002_logentry_remove_auto_add','2024-11-05 23:08:24.308771'),(5,'admin','0003_logentry_add_action_flag_choices','2024-11-05 23:08:24.318371'),(6,'contenttypes','0002_remove_content_type_name','2024-11-05 23:08:24.443451'),(7,'auth','0002_alter_permission_name_max_length','2024-11-05 23:08:24.556797'),(8,'auth','0003_alter_user_email_max_length','2024-11-05 23:08:24.595413'),(9,'auth','0004_alter_user_username_opts','2024-11-05 23:08:24.606029'),(10,'auth','0005_alter_user_last_login_null','2024-11-05 23:08:24.694898'),(11,'auth','0006_require_contenttypes_0002','2024-11-05 23:08:24.699986'),(12,'auth','0007_alter_validators_add_error_messages','2024-11-05 23:08:24.710521'),(13,'auth','0008_alter_user_username_max_length','2024-11-05 23:08:24.797179'),(14,'auth','0009_alter_user_last_name_max_length','2024-11-05 23:08:24.893443'),(15,'auth','0010_alter_group_name_max_length','2024-11-05 23:08:24.923835'),(16,'auth','0011_update_proxy_permissions','2024-11-05 23:08:24.936743'),(17,'auth','0012_alter_user_first_name_max_length','2024-11-05 23:08:25.028128'),(18,'sessions','0001_initial','2024-11-05 23:08:25.090893'),(19,'Sistema','0001_initial','2024-11-09 18:14:16.165525'),(20,'vendas','0001_initial','2024-11-09 18:24:30.846626'),(21,'vendas','0002_alter_cliente_telefone','2024-11-11 00:37:18.440434'),(22,'vendas','0003_vendedor','2024-11-11 01:07:37.287484'),(23,'vendas','0004_vendedor_senha','2024-11-11 01:34:15.770655'),(24,'vendas','0005_alter_venda_status_vendaproduto','2024-11-12 14:50:31.584976'),(25,'vendas','0006_alter_venda_status','2024-11-12 14:52:18.785118'),(26,'vendas','0007_alter_venda_status','2024-11-12 14:53:06.644315'),(27,'vendas','0008_vendaproduto_preco_unitario_vendaproduto_subtotal_and_more','2024-11-15 11:13:24.096407'),(28,'vendas','0009_alter_categoria_descricao_alter_produto_descricao','2024-11-16 13:56:29.227756'),(29,'vendas','0010_vendedor_confsenha','2024-11-16 16:49:34.398135'),(30,'vendas','0011_alter_vendedor_table','2024-11-18 01:29:00.823288'),(31,'vendas','0012_rename_categoria_categorias_and_more','2024-11-20 00:28:13.465060');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('f2t9ecdcnugdk348eolo2it15ugrqfcr','eyJ2ZW5kZWRvcl9pZCI6Mn0:1tG4Ap:MWKYFMmOoOQf_h4bu1HCXm0NCOiFBYVWS7o7sKEXBOs','2024-12-10 22:36:47.007341');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_venda`
--

DROP TABLE IF EXISTS `itens_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_venda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `venda_id` int DEFAULT NULL,
  `produto_id` int DEFAULT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venda_id` (`venda_id`),
  KEY `produto_id` (`produto_id`),
  CONSTRAINT `itens_venda_ibfk_1` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`),
  CONSTRAINT `itens_venda_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_venda`
--

LOCK TABLES `itens_venda` WRITE;
/*!40000 ALTER TABLE `itens_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `itens_venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_item_venda_insert` BEFORE INSERT ON `itens_venda` FOR EACH ROW BEGIN
    SET NEW.subtotal = NEW.quantidade * NEW.preco_unitario;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_item_venda_update` AFTER INSERT ON `itens_venda` FOR EACH ROW BEGIN
    UPDATE vendas 
    SET valor_total = (
        SELECT SUM(subtotal) 
        FROM itens_venda 
        WHERE venda_id = NEW.venda_id
    )
    WHERE id = NEW.venda_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_item_venda_insert` AFTER INSERT ON `itens_venda` FOR EACH ROW BEGIN
    UPDATE vendas 
    SET valor_total = (
        SELECT SUM(subtotal) 
        FROM itens_venda 
        WHERE venda_id = NEW.venda_id
    )
    WHERE id = NEW.venda_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `preco` decimal(10,2) NOT NULL,
  `quantidade_estoque` int NOT NULL,
  `categoria_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'teste','teste',1.00,47,1,'2024-11-20 00:54:29'),(2,'Eua de Perfum','longa',59.90,50,2,'2024-11-26 22:36:46');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_categoria`
--

DROP TABLE IF EXISTS `sistema_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sistema_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` longtext,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_categoria`
--

LOCK TABLES `sistema_categoria` WRITE;
/*!40000 ALTER TABLE `sistema_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `sistema_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_cliente`
--

DROP TABLE IF EXISTS `sistema_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sistema_cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_cliente`
--

LOCK TABLES `sistema_cliente` WRITE;
/*!40000 ALTER TABLE `sistema_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `sistema_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_produto`
--

DROP TABLE IF EXISTS `sistema_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sistema_produto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` longtext,
  `preco` decimal(10,2) NOT NULL,
  `quantidade_estoque` int NOT NULL,
  `categoria_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Sistema_produto_categoria_id_72f4c45d_fk_Sistema_categoria_id` (`categoria_id`),
  CONSTRAINT `Sistema_produto_categoria_id_72f4c45d_fk_Sistema_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `sistema_categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_produto`
--

LOCK TABLES `sistema_produto` WRITE;
/*!40000 ALTER TABLE `sistema_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `sistema_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema_venda`
--

DROP TABLE IF EXISTS `sistema_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sistema_venda` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_venda` datetime(6) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `cliente_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Sistema_venda_cliente_id_f8d5fb39_fk_Sistema_cliente_id` (`cliente_id`),
  CONSTRAINT `Sistema_venda_cliente_id_f8d5fb39_fk_Sistema_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `sistema_cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_venda`
--

LOCK TABLES `sistema_venda` WRITE;
/*!40000 ALTER TABLE `sistema_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `sistema_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `vendedor_id` int DEFAULT NULL,
  `data_venda` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pendente',
  `produto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `vendedor_id` (`vendedor_id`),
  CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas_categorias`
--

DROP TABLE IF EXISTS `vendas_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas_categorias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas_categorias`
--

LOCK TABLES `vendas_categorias` WRITE;
/*!40000 ALTER TABLE `vendas_categorias` DISABLE KEYS */;
INSERT INTO `vendas_categorias` VALUES (1,'PerfumeAfro','Noturno','2024-11-11 00:15:44.886263'),(2,'Desodorante','blabla','2024-11-15 11:14:35.904640'),(3,'Arabe','Importados arabe','2024-11-20 00:33:22.589678');
/*!40000 ALTER TABLE `vendas_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas_cliente`
--

DROP TABLE IF EXISTS `vendas_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas_cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas_cliente`
--

LOCK TABLES `vendas_cliente` WRITE;
/*!40000 ALTER TABLE `vendas_cliente` DISABLE KEYS */;
INSERT INTO `vendas_cliente` VALUES (1,'Abobora','SDA@GMAIL.COM','13413','12321321','2024-11-11 00:49:20.352848'),(2,'felipe','felipealvessouza318@gmail.com','13413','312312312','2024-11-11 00:53:48.542207'),(3,'Maria','maria@example.com','123456789','98765432100','2024-11-11 01:51:45.133707'),(4,'Pedro','pedro123@gmail.com','18990088865','98765432125','2024-11-17 22:06:25.210415');
/*!40000 ALTER TABLE `vendas_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas_produto`
--

DROP TABLE IF EXISTS `vendas_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas_produto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade_estoque` int NOT NULL,
  `categorias_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vendas_produto_categorias_id_ff6e3e0c_fk_vendas_categorias_id` (`categorias_id`),
  CONSTRAINT `vendas_produto_categorias_id_ff6e3e0c_fk_vendas_categorias_id` FOREIGN KEY (`categorias_id`) REFERENCES `vendas_categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas_produto`
--

LOCK TABLES `vendas_produto` WRITE;
/*!40000 ALTER TABLE `vendas_produto` DISABLE KEYS */;
INSERT INTO `vendas_produto` VALUES (1,'Body splash','1132131',50.00,38,1),(3,'EAU de Parfum',NULL,199.90,111,1),(9,'deo colonia','efeitos rapidos',35.50,15,1);
/*!40000 ALTER TABLE `vendas_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas_venda`
--

DROP TABLE IF EXISTS `vendas_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas_venda` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_venda` datetime(6) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `cliente_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vendas_venda_cliente_id_da4b9f2b_fk_vendas_cliente_id` (`cliente_id`),
  CONSTRAINT `vendas_venda_cliente_id_da4b9f2b_fk_vendas_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `vendas_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas_venda`
--

LOCK TABLES `vendas_venda` WRITE;
/*!40000 ALTER TABLE `vendas_venda` DISABLE KEYS */;
INSERT INTO `vendas_venda` VALUES (10,'2024-11-16 15:23:39.955692',2798.60,'Parcelado',3),(11,'2024-11-17 21:57:56.950861',279.70,'Agendado Pagamento',2),(12,'2024-11-17 22:07:07.368098',1154.20,'Não Pago',4),(13,'2024-11-19 22:15:39.519973',799.90,'Agendado Pagamento',1),(14,'2024-11-26 22:36:12.560394',2.00,'Agendado Pagamento',1);
/*!40000 ALTER TABLE `vendas_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas_vendaproduto`
--

DROP TABLE IF EXISTS `vendas_vendaproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas_vendaproduto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantidade` int unsigned NOT NULL,
  `produto_id` bigint NOT NULL,
  `venda_id` bigint NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendas_vendaproduto_produto_id_d924622c_fk_vendas_produto_id` (`produto_id`),
  KEY `vendas_vendaproduto_venda_id_b200ccf5_fk_vendas_venda_id` (`venda_id`),
  CONSTRAINT `vendas_vendaproduto_produto_id_d924622c_fk_vendas_produto_id` FOREIGN KEY (`produto_id`) REFERENCES `vendas_produto` (`id`),
  CONSTRAINT `vendas_vendaproduto_venda_id_b200ccf5_fk_vendas_venda_id` FOREIGN KEY (`venda_id`) REFERENCES `vendas_venda` (`id`),
  CONSTRAINT `vendas_vendaproduto_chk_1` CHECK ((`quantidade` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas_vendaproduto`
--

LOCK TABLES `vendas_vendaproduto` WRITE;
/*!40000 ALTER TABLE `vendas_vendaproduto` DISABLE KEYS */;
INSERT INTO `vendas_vendaproduto` VALUES (20,1,3,10,199.90,NULL),(21,13,3,10,199.90,NULL),(22,1,3,11,199.90,NULL),(23,2,1,11,39.90,NULL),(30,5,1,12,39.90,NULL),(31,3,3,12,199.90,NULL),(32,10,9,12,35.50,NULL),(33,12,1,13,50.00,NULL),(34,1,3,13,199.90,NULL),(38,2,1,14,1.00,NULL);
/*!40000 ALTER TABLE `vendas_vendaproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `comissao_percentual` decimal(5,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `confSenha` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'Felps',5.00,'2024-11-11 01:34:25.556444',NULL,NULL,NULL),(2,'Felipe1',5.00,'2024-11-11 01:38:32.766299',NULL,NULL,NULL),(3,'felipe12',5.00,'2024-11-11 02:03:40.224383',NULL,NULL,NULL),(4,'felipe1',5.00,'2024-11-11 02:10:20.262026',NULL,NULL,NULL),(5,'Felipe',5.00,'2024-11-11 02:22:02.153411',NULL,NULL,NULL),(6,'Felipe',5.00,'2024-11-11 02:23:02.794378',NULL,NULL,NULL),(7,'Felipe1',5.00,'2024-11-11 02:26:57.677955',NULL,NULL,NULL),(8,'Felipe',5.00,'2024-11-11 02:45:30.291445',NULL,NULL,NULL),(9,'Felipe231',5.00,'2024-11-11 02:46:17.748495',NULL,NULL,NULL),(10,'Felipe213',5.00,'2024-11-11 02:48:01.460282',NULL,NULL,NULL),(11,'Felipe123',5.00,'2024-11-11 02:51:28.747010',NULL,NULL,NULL),(12,'Felps',5.00,'2024-11-11 03:03:23.516104',NULL,NULL,NULL),(13,'Evandro',5.00,'2024-11-11 22:22:13.177275',NULL,NULL,NULL),(14,'tete',5.00,'2024-11-11 22:59:52.060801',NULL,NULL,NULL),(15,'felipe',5.00,'2024-11-11 23:09:19.570951',NULL,NULL,NULL),(16,'felipe',5.00,'2024-11-11 23:10:23.080912',NULL,NULL,NULL),(17,'Teste',5.00,'2024-11-12 22:17:10.789389',NULL,NULL,NULL),(18,'Alvaro',5.00,'2024-11-15 11:43:55.355353',NULL,NULL,NULL),(19,'Andre',5.00,'2024-11-16 16:50:56.565353',NULL,NULL,NULL),(20,'teste',5.00,'2024-11-16 17:49:59.018380',NULL,NULL,NULL),(21,'Felipe',5.00,'2024-11-16 18:01:35.840817',NULL,NULL,NULL),(22,'Teste',5.00,'2024-11-18 01:43:04.114282','a@gmail.com','pbkdf2_sha256$600000$Ml9MMfa0qIegu5CKmZiNOW$foTzWYEdij/3ALhQujKyvPowfFj9GF5hqxaP6e7XTDk=','123'),(23,'teste',5.00,'2024-11-18 01:44:06.117868','b@gmail.com','pbkdf2_sha256$600000$VQ6MNovdzruZcrtG5ufiPF$Y7nc4YPfyq+XeYlWD4Z1NE+wSAlXrq8hvHnpZg+sp+Y=','123'),(24,'Felipe',5.00,'2024-11-19 22:06:50.677990','felipe@gmail.com','pbkdf2_sha256$600000$aXMvolZDgEoVNHffcVxTDR$VxeUNsM+FPrrgl4YdJgcxI46fD8zkZLrk6M7+mHBKhU=','123'),(25,'Felipe',5.00,'2024-11-19 22:09:12.839281','felipea@gmail.com','pbkdf2_sha256$600000$ddNNtk5BQqRL12gK5sm4qE$bMx27/KqoqIz6houCIOhLtFT/9PwxLLW6lHSdMnh/Wg=','123'),(26,'felipe',5.00,'2024-11-19 22:12:53.948244','felipeal@gmail.com','pbkdf2_sha256$600000$LfgFxT2i6g2jvF3SiEu14c$39OuegQqMDIh5OkrBQC0HvN/SNUeQLVl+zGn9+apHlc=','123');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `comissao_percentual` decimal(5,2) DEFAULT '5.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `senha` varchar(100) DEFAULT NULL,
  `confSenha` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'evandro','ev@gmail.com',5.00,'2024-11-20 03:43:51','pbkdf2_sha256$600000$rEBljsgB86j0jlblGaRwZx$Klxt6S/Yrgng6IWMzytCZ3ySg5D9NDYqOFZZAoTCi6I=','123'),(2,'Felipe','felipealvessouza111@gmail.com',5.00,'2024-11-27 01:05:35','pbkdf2_sha256$600000$a0ymqxRh8EO3hdqQV0hdKi$bMrshmCocJyYs4EXS9GbXvxmq/LXUaV0vWXHmVVaDjc=','123');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_produtos_mais_vendidos`
--

DROP TABLE IF EXISTS `vw_produtos_mais_vendidos`;
/*!50001 DROP VIEW IF EXISTS `vw_produtos_mais_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_produtos_mais_vendidos` AS SELECT 
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `quantidade_vendida`,
 1 AS `valor_total_vendas`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_resumo_vendas`
--

DROP TABLE IF EXISTS `vw_resumo_vendas`;
/*!50001 DROP VIEW IF EXISTS `vw_resumo_vendas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_resumo_vendas` AS SELECT 
 1 AS `venda_id`,
 1 AS `data_venda`,
 1 AS `cliente`,
 1 AS `vendedor`,
 1 AS `valor_total`,
 1 AS `status`,
 1 AS `comissao_vendedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'e_stetica_pro_db'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_comissao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_comissao`(
    p_venda_id INT
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE v_valor_total DECIMAL(10,2);
    DECLARE v_comissao_percentual DECIMAL(5,2);
    DECLARE v_comissao DECIMAL(10,2);
    
    SELECT v.valor_total, vend.comissao_percentual
    INTO v_valor_total, v_comissao_percentual
    FROM vendas v
    JOIN vendedores vend ON v.vendedor_id = vend.id
    WHERE v.id = p_venda_id;
    
    SET v_comissao = v_valor_total * (v_comissao_percentual / 100);
    
    RETURN v_comissao;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `adicionar_item_venda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `adicionar_item_venda`(
    IN p_venda_id INT,
    IN p_produto_id INT,
    IN p_quantidade INT
)
BEGIN
    DECLARE v_preco DECIMAL(10,2);
    
    SELECT preco INTO v_preco FROM produtos WHERE id = p_produto_id;
    
    INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario)
    VALUES (p_venda_id, p_produto_id, p_quantidade, v_preco);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_venda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_venda`(
    IN p_cliente_id INT,
    IN p_vendedor_id INT,
    OUT p_venda_id INT
)
BEGIN
    INSERT INTO vendas (cliente_id, vendedor_id, status)
    VALUES (p_cliente_id, p_vendedor_id, 'Pendente');
    
    SET p_venda_id = LAST_INSERT_ID();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_produtos_mais_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_produtos_mais_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_produtos_mais_vendidos` AS select `p`.`nome` AS `produto`,`cat`.`nome` AS `categoria`,sum(`iv`.`quantidade`) AS `quantidade_vendida`,sum(`iv`.`subtotal`) AS `valor_total_vendas` from ((`produtos` `p` join `categorias` `cat` on((`p`.`categoria_id` = `cat`.`id`))) join `itens_venda` `iv` on((`p`.`id` = `iv`.`produto_id`))) group by `p`.`id`,`p`.`nome`,`cat`.`nome` order by `quantidade_vendida` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_resumo_vendas`
--

/*!50001 DROP VIEW IF EXISTS `vw_resumo_vendas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_resumo_vendas` AS select `v`.`id` AS `venda_id`,`v`.`data_venda` AS `data_venda`,`c`.`nome` AS `cliente`,`vend`.`nome` AS `vendedor`,`v`.`valor_total` AS `valor_total`,`v`.`status` AS `status`,`calcular_comissao`(`v`.`id`) AS `comissao_vendedor` from ((`vendas` `v` join `clientes` `c` on((`v`.`cliente_id` = `c`.`id`))) join `vendedores` `vend` on((`v`.`vendedor_id` = `vend`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-26 21:12:10
