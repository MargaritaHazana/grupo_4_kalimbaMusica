CREATE DATABASE  IF NOT EXISTS `kalimba_musica` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `kalimba_musica`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: kalimba_musica
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Fender',NULL),(2,'Taylor',NULL),(3,'Yamaha',NULL),(4,'Ibanez',NULL),(5,'Cordoba',NULL),(6,'Marshall',NULL),(7,'Casa nuñez',NULL),(8,'JBL',NULL),(9,'Sony',NULL);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Cuerdas',NULL),(2,'Teclas',NULL),(3,'Percusion',NULL),(4,'Viento',NULL),(5,'Equipamiento',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `deleltedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'Rojo',NULL),(2,'Azul',NULL),(3,'Negro',NULL),(4,'Marrón',NULL),(5,'Blanco',NULL),(6,'Gris',NULL),(7,'Plateado',NULL);
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors_products`
--

DROP TABLE IF EXISTS `colors_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors_products` (
  `productsId` int(11) NOT NULL,
  `colorsId` int(11) NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  KEY `fk_colos_productsId_idx` (`productsId`),
  KEY `fk_products_colorsId_idx` (`colorsId`),
  CONSTRAINT `fk_colos_productsId` FOREIGN KEY (`productsId`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_colorsId` FOREIGN KEY (`colorsId`) REFERENCES `colors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors_products`
--

LOCK TABLES `colors_products` WRITE;
/*!40000 ALTER TABLE `colors_products` DISABLE KEYS */;
INSERT INTO `colors_products` VALUES (3,2,NULL),(3,1,NULL),(4,2,NULL),(4,5,NULL),(5,7,NULL),(5,3,NULL),(6,4,NULL),(6,3,NULL),(7,4,NULL),(8,4,NULL),(8,7,NULL),(9,7,NULL),(9,6,NULL),(10,6,NULL),(10,1,NULL),(11,1,NULL),(11,3,NULL),(12,7,NULL),(19,2,NULL);
/*!40000 ALTER TABLE `colors_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guides`
--

DROP TABLE IF EXISTS `guides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(10000) NOT NULL,
  `subcategoriesId` int(11) NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `types_id_idx` (`subcategoriesId`),
  CONSTRAINT `fk_guides_subcategories_id` FOREIGN KEY (`subcategoriesId`) REFERENCES `subcategories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guides`
--

LOCK TABLES `guides` WRITE;
/*!40000 ALTER TABLE `guides` DISABLE KEYS */;
/*!40000 ALTER TABLE `guides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `productsId` int(11) NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_id_idx` (`productsId`),
  CONSTRAINT `fk_images_products_id` FOREIGN KEY (`productsId`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shippingCity` varchar(100) NOT NULL,
  `shippingPostalcode` int(11) NOT NULL,
  `shippingDate` date DEFAULT NULL,
  `usersId` int(11) NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id_idx` (`usersId`),
  CONSTRAINT `fk_orders_users_id` FOREIGN KEY (`usersId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products` (
  `ordersId` int(11) NOT NULL,
  `productsId` int(11) NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  KEY `products_id_idx` (`productsId`),
  KEY `orders_id_idx` (`ordersId`),
  CONSTRAINT `fk_ordersproducts_orders_id` FOREIGN KEY (`ordersId`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordersproducts_products_id` FOREIGN KEY (`productsId`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` bigint(100) NOT NULL,
  `discount` int(11) DEFAULT 0,
  `stock` tinyint(4) NOT NULL,
  `description` varchar(500) NOT NULL,
  `categoriesId` int(11) NOT NULL,
  `subcategoriesId` int(11) NOT NULL,
  `brandsId` int(11) NOT NULL,
  `typesId` int(11) NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brands_id_idx` (`brandsId`),
  KEY `category_id_idx` (`categoriesId`),
  KEY `types_id_idx` (`subcategoriesId`),
  KEY `fk_products_typesId_idx` (`typesId`),
  CONSTRAINT `fk_products_brands_id` FOREIGN KEY (`brandsId`) REFERENCES `brands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_categories_id` FOREIGN KEY (`categoriesId`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_subcategories_id` FOREIGN KEY (`subcategoriesId`) REFERENCES `subcategories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_typesId` FOREIGN KEY (`typesId`) REFERENCES `types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'Guitarra eléctrica Stratocaster',20000,10,1,'Una guitarra diseñana para diestros, de origen  Mexicano, madera de arce, un color customizable con un acabado brilloso, las comunes 6 cuerdas, 22 trastes y 3 microfonos\n',1,1,1,1,NULL),(4,'Guitarra Eléctrica RGX121Z - Humbucker - HSH',15000,15,1,'Pastillas humbucker cerámicas abiertas para la RGX220DZ/121Z\nLos imanes cerámicos se utilizan por su mayor potencia y su rango tonal más amplio. Estas pastillas producen una distorsión más clara.\n',1,1,3,1,NULL),(5,'Piano Digital P-121 de 73 teclas\n',15000,15,1,'El Yamaha P-121 es un piano digital compacto de 73 teclas que combina una interpretación pianística excelente con un nuevo diseño sencillo y minimalista. Fácilmente transportable y muy accesible; la versatilidad de este instrumento te permite disfrutar de la sensación de tocar un piano, en cualquier lugar.\n',2,8,3,13,NULL),(6,'Piano de cola clásico - Yamaha',50000,20,1,'Un piano de armazon negro y teclas de marfil, con un requerimiento espacial de 3 metros cuadrados, ademas posee 7 octavas y 3 pedales para generar sonidos inolvidables.\nPiano de cola Clasico\n',2,8,3,12,NULL),(7,'Cajon Peruano Leonard Cajpee Guatambu Rustico\n',10000,0,1,'Este instrumento ofrece bellos sonidos de cajón verdaderamente auténticas para satisfacer a los jugadores más exigentes. La construcción de cola de milano de carpintería se utiliza para una mirada tradicional detallada.\n',3,13,7,19,NULL),(8,'Kalimba RXT-300 modelo 1914\n',4000,0,1,'El kalimba consta de 7 piezas metalicas, que resuenan sobre su caja de resonancia, que es similar a un caparazon de tortuga. Cada nota se sostiene permitiendo generar un clima calido y armonico.\n\n',3,18,4,26,NULL),(9,'Armonica Folkmaster En Sol 1072 G\n',2000,0,1,'La armónica Folkmaster 1072 es fácil de tocar y a la vez económica para comprar. Su claridad de sonido excepcional y puesta a punto perfecta es posible gracias a un proceso exclusivo de fabricación láser.\n',4,21,3,32,NULL),(10,'Flauta dulce soprano - YRS312\n',2500,0,1,'Flauta dulce, ideal para tus primeros pasos en la musica, muy popular en instituciones de enseñanza basica. Tiene un sonido muy delicado, y en las manos de un maestro se puede cautivar un publico sin el apoyo de ningun otro instrumento.\n',4,19,3,28,NULL),(11,'Parlante Bluetooth Fender Newport 30 Watts Compacto Portatil\n',3700,0,1,'Nos encontramos ante un altavoz que no solo busca enamorar con su diseño clásico, sino además con su gran reproducción de los graves mediante la implementación de 2 woofers, y la novedosa incorporación de un micrófono para poder atender las llamadas de tu Smartphone.\n',5,27,1,43,NULL),(12,'Afinador RX - Taylor\n',3700,0,1,'Afinador para guitarras, consta de afinaciones estandar y no estandar, con este afinador de tu lado si tus notas suenan mal lamentablemente no es el instrumento sos vos );\n\n',5,28,2,44,NULL),(19,'Parlante inalámbrico JBL',3000,0,1,'Parlante',5,27,1,44,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `categoriesId` int(11) NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  `subcategoriesId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id_idx` (`categoriesId`),
  CONSTRAINT `fk_subcategories_categories_id` FOREIGN KEY (`categoriesId`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'Guitarras',1,NULL,NULL),(2,'Bajos',1,NULL,NULL),(3,'Violines',1,NULL,NULL),(4,'Ukeleles',1,NULL,NULL),(5,'Contrabajo',1,NULL,NULL),(6,'Charangos',1,NULL,NULL),(7,'Arpas',1,NULL,NULL),(8,'Pianos',2,NULL,NULL),(9,'Pianos',2,NULL,NULL),(10,'Teclados',2,NULL,NULL),(11,'Acordeón',2,NULL,NULL),(12,'Baterías',3,NULL,NULL),(13,'Cajones peruanos',3,NULL,NULL),(14,'Bombos',3,NULL,NULL),(15,'Bongos',3,NULL,NULL),(16,'Panderetas',3,NULL,NULL),(17,'Triangulos',3,NULL,NULL),(18,'Kalimbas',3,NULL,NULL),(19,'Flautas',4,NULL,NULL),(20,'Saxos',4,NULL,NULL),(21,'Armonicas',4,NULL,NULL),(22,'Trompetas',4,NULL,NULL),(23,'Trombones',4,NULL,NULL),(24,'Bandoneón',4,NULL,NULL),(25,'Cuerdas',5,NULL,NULL),(26,'Amplificadores',5,NULL,NULL),(27,'Parlantes',5,NULL,NULL),(28,'Afinadores',5,NULL,NULL),(29,'Accesorios',5,NULL,NULL),(30,'Transformadores',5,NULL,NULL),(31,'Cables',5,NULL,NULL),(32,'Placas de sonido',5,NULL,NULL);
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `subcategoriesId` int(11) NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_types_subcategories_id_idx` (`subcategoriesId`),
  CONSTRAINT `fk_types_subcategories_id` FOREIGN KEY (`subcategoriesId`) REFERENCES `subcategories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Eléctricas',1,NULL),(3,'Acústicas',1,NULL),(4,'Eléctricos',2,NULL),(5,'Acústicos',2,NULL),(6,'Clásicos',3,NULL),(7,'Clásicos',4,NULL),(8,'Clásicos',5,NULL),(9,'Changos',6,NULL),(10,'Paraguayas',7,NULL),(11,'Llaneras',7,NULL),(12,'De Cola',8,NULL),(13,'Verticales',8,NULL),(14,'Sintetizadores',10,NULL),(15,'Clásicos',10,NULL),(16,'De Teclas',11,NULL),(17,'De Botones',11,NULL),(18,'Completas',12,NULL),(19,'Clásicos',13,NULL),(20,'De Baterías',14,NULL),(21,'De Madera',15,NULL),(22,'De Cerámica',15,NULL),(23,'Clásicas',16,NULL),(24,'Clásicos',17,NULL),(25,'Rectangulares',18,NULL),(26,'Circulares',18,NULL),(27,'Traversas',19,NULL),(28,'Dulces',19,NULL),(29,'Alto',20,NULL),(30,'Tenor',20,NULL),(31,'De Afinación',21,NULL),(32,'Melódicas',21,NULL),(33,'De Baras',22,NULL),(34,'De Llaves',22,NULL),(35,'Alto',23,NULL),(36,'Soprano',23,NULL),(37,'Clásicos',24,NULL),(38,'De Guitarra',25,NULL),(39,'De Bajo',25,NULL),(40,'Híbridos',26,NULL),(41,'De Válvulas',26,NULL),(42,'De Pie',27,NULL),(43,'Portátiles',27,NULL),(44,'Portátiles',28,NULL),(45,'De Clip',28,NULL),(46,'Fundas',29,NULL),(47,'Soportes',29,NULL),(48,'Elevadores',30,NULL),(49,'Reductores',30,NULL),(50,'USB',31,NULL),(51,'Para Amplificadores',31,NULL),(52,'Conexión USB',32,NULL),(53,'Conexión FireWire',32,NULL);
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `tel` int(11) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Margarita','Hazaña',1134680021,'2000-12-30','margaritahazana@gmail.com','12345678','Avatar.jpg',NULL),(2,2,'Joaquin','Girod',1158365508,'2001-03-14','joacogirodQgmail.com','12345678','Avatar.jpg',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-09 12:45:21
