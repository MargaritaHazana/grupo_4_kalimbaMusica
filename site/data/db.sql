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
INSERT INTO `colors_products` VALUES (3,2,NULL),(3,1,NULL),(4,2,NULL),(4,5,NULL),(5,7,NULL),(5,3,NULL),(6,4,NULL),(6,3,NULL),(7,4,NULL),(8,4,NULL),(8,7,NULL),(9,7,NULL),(9,6,NULL),(10,6,NULL),(10,1,NULL),(11,1,NULL),(11,3,NULL),(12,7,NULL),(52,4,NULL),(53,7,NULL),(54,1,NULL),(54,2,NULL),(54,4,NULL),(55,7,NULL),(56,3,NULL),(56,4,NULL),(57,7,NULL),(58,3,NULL),(58,4,NULL),(59,2,NULL),(59,3,NULL),(59,7,NULL),(60,4,NULL),(60,6,NULL),(61,7,NULL),(62,3,NULL),(63,7,NULL),(64,1,NULL),(64,3,NULL),(65,7,NULL),(67,7,NULL),(68,3,NULL),(68,4,NULL),(69,3,NULL),(70,1,NULL),(70,3,NULL),(70,4,NULL),(71,7,NULL),(72,2,NULL),(72,3,NULL),(73,7,NULL),(74,7,NULL),(75,3,NULL),(75,4,NULL),(76,1,NULL),(76,4,NULL),(77,2,NULL),(77,3,NULL),(78,1,NULL),(78,6,NULL),(80,3,NULL),(80,5,NULL),(84,3,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (3,'image-1594667398771.jpg',53,NULL),(4,'image-1594667515672.jpg',54,NULL),(5,'image-1594667673621.jpg',55,NULL),(6,'image-1594667781065.jpg',56,NULL),(7,'image-1594667917597.jpg',57,NULL),(8,'image-1594668052485.jpg',58,NULL),(9,'image-1594668217884.jpg',59,NULL),(10,'image-1594668330543.jpg',60,NULL),(11,'image-1594668464604.jpg',61,NULL),(12,'image-1594668586996.jpg',62,NULL),(13,'image-1594668691040.jpg',63,NULL),(14,'image-1594668822000.jpg',64,NULL),(15,'image-1594668925001.jpg',65,NULL),(16,'image-1594669161150.jpg',67,NULL),(17,'image-1594669238278.jpg',68,NULL),(18,'image-1594669382955.jpg',69,NULL),(19,'image-1594669466051.jpg',70,NULL),(20,'image-1594669581865.jpg',71,NULL),(21,'image-1594669684175.jpg',72,NULL),(22,'image-1594669793041.jpg',73,NULL),(23,'image-1594669890048.jpg',74,NULL),(24,'image-1594670003887.jpg',75,NULL),(25,'image-1594670142391.jpg',76,NULL),(26,'image-1594670288196.jpg',77,NULL),(27,'image-1594670407638.jpg',78,NULL),(28,'image-1594670776687.jpg',80,NULL),(29,'image-1594671054833.jpg',83,NULL),(30,'image-1594671853212.jpg',84,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'Guitarra eléctrica Stratocaster',20000,10,1,'Una guitarra diseñana para diestros, de origen  Mexicano, madera de arce, un color customizable con un acabado brilloso, las comunes 6 cuerdas, 22 trastes y 3 microfonos\n',1,1,1,1,NULL),(4,'Guitarra Eléctrica RGX121Z - Humbucker - HSH',15000,15,1,'Pastillas humbucker cerámicas abiertas para la RGX220DZ/121Z\nLos imanes cerámicos se utilizan por su mayor potencia y su rango tonal más amplio. Estas pastillas producen una distorsión más clara.\n',1,1,3,1,NULL),(5,'Piano Digital P-121 de 73 teclas\n',15000,15,1,'El Yamaha P-121 es un piano digital compacto de 73 teclas que combina una interpretación pianística excelente con un nuevo diseño sencillo y minimalista. Fácilmente transportable y muy accesible; la versatilidad de este instrumento te permite disfrutar de la sensación de tocar un piano, en cualquier lugar.\n',2,8,3,13,NULL),(6,'Piano de cola clásico - Yamaha',50000,20,1,'Un piano de armazon negro y teclas de marfil, con un requerimiento espacial de 3 metros cuadrados, ademas posee 7 octavas y 3 pedales para generar sonidos inolvidables.\nPiano de cola Clasico\n',2,8,3,12,NULL),(7,'Cajon Peruano Leonard Cajpee Guatambu Rustico\n',10000,0,1,'Este instrumento ofrece bellos sonidos de cajón verdaderamente auténticas para satisfacer a los jugadores más exigentes. La construcción de cola de milano de carpintería se utiliza para una mirada tradicional detallada.\n',3,13,7,19,NULL),(8,'Kalimba RXT-300 modelo 1914\n',4000,0,1,'El kalimba consta de 7 piezas metalicas, que resuenan sobre su caja de resonancia, que es similar a un caparazon de tortuga. Cada nota se sostiene permitiendo generar un clima calido y armonico.\n\n',3,18,4,26,NULL),(9,'Armonica Folkmaster En Sol 1072 G\n',2000,0,1,'La armónica Folkmaster 1072 es fácil de tocar y a la vez económica para comprar. Su claridad de sonido excepcional y puesta a punto perfecta es posible gracias a un proceso exclusivo de fabricación láser.\n',4,21,3,32,NULL),(10,'Flauta dulce soprano - YRS312\n',2500,0,1,'Flauta dulce, ideal para tus primeros pasos en la musica, muy popular en instituciones de enseñanza basica. Tiene un sonido muy delicado, y en las manos de un maestro se puede cautivar un publico sin el apoyo de ningun otro instrumento.\n',4,19,3,28,NULL),(11,'Parlante Bluetooth Fender Newport 30 Watts Compacto Portatil\n',3700,0,1,'Nos encontramos ante un altavoz que no solo busca enamorar con su diseño clásico, sino además con su gran reproducción de los graves mediante la implementación de 2 woofers, y la novedosa incorporación de un micrófono para poder atender las llamadas de tu Smartphone.\n',5,27,1,43,NULL),(12,'Afinador RX - Taylor\n',3700,0,1,'Afinador para guitarras, consta de afinaciones estandar y no estandar, con este afinador de tu lado si tus notas suenan mal lamentablemente no es el instrumento sos vos );\n\n',5,28,2,44,NULL),(52,'Violin 4/4 Tallado A Mano Cuello Y Scroll Sv-130',12000,10,1,'Tallado a mano, tapa de pícea sólida de arce macizo cuello y scroll.Filetes incrustados.Nuevo translúcido, cálido color marrón.Accesorios de ébano y VP-61 cordal de aleación con (4) integrado finetuners puente VP-202 CremonaArco de Deluxe de tienda con forma de lazo con crin de caballo genuina sin blanquear color blanco ligero y duradero para violín ajustable.',1,3,5,6,NULL),(53,'Flauta Traversa YFL211',12000,10,1,'Con un diseño y fabricación de la misma calidad que los modelos de las series 300 y 400, las flautas de la serie 200 están fabricadas en resistente níquel plata con un atractivo acabado de baño de plata. Se caracterizan por ofrecer una respuesta y una entonación excelentes.\r\n',4,19,3,27,NULL),(54,'Ukelele Tamaño Concierto Fender',5000,5,1,'Bautizado con la palabra hawaiana \"sonrisa\", el Mino\'Aka es un ukelele de tamaño concierto que seguro te hará sonreír. Se trata de un \"uke\" realizado en caoba, con una acertada estética y gran calidez de sonido, que resulta ideal para distintos estilos musicales, desde los sonidos tradicionales de las islas hasta el pop actual. Incluso con su precio asequible, este alegre ukelele presenta diapasón y puente de palosanto, cejilla y selleta de hueso para un mayor equilibrio de sonido y sustain, y u',1,4,1,7,NULL),(55,'Saxófon Alto YAS-875EX',12000,30,1,'El nuevo saxofón alto Yamaha YAS-875EX Custom EX marca un gran paso adelante para el diseño del saxofón. Ofreciendo a los jugadores una gran cantidad de nuevas posibilidades musicales, el nuevo Custom EX ha sido diseñado en colaboración con algunos de los saxofonistas más talentosos del mundo, incluidos Nobuya Sugawa, Jean-Yves Fourmeau y Otis Murphy. Su inestimable aportación ha significado que Yamaha ha podido crear un instrumento que suena muy bien, es cómodo de tocar y que evoluciona constan',4,20,3,29,NULL),(56,'Contrabajo Yamaha Slb100',80000,40,1,'El SLB100 permite interpretar tonos adecuados para una gran variedad de instrumentos musicales. Los bajistas sabrán apreciar la posibilidad de ensayar en silencio, mientras escuchan toda su tonalidad a través de auriculares.',1,5,3,7,NULL),(57,'SELMER PARIS - SERIE III Saxofón Tenor Plata Maciza',20000,10,1,'Abrazadera Selmer metálica grabada. Apoyapulgar metálico (orientable). Boquilla Selmer S 80C*. Boquillero Selmer metálico grabado. Cordón colgador Selmer al cuello. Estuche Selmer modelo Ligth. Gamuza interior pañuelo con contrapeso. Gamuza limpieza especial para lacados. Grasa para corchos. Llaves de latón grabado. Muelles de aguja en acero inoxidable. Zapatillas de cuero con resonadores matálicos.',4,20,4,30,NULL),(58,'Charango Madera Pino Coro Artesanias Nylon Musicapilar',2000,0,1,'Charango Luthier Nacional. Material De madera. Pino Amarillo Macizo. Sobretapa de cedro. Excelente Sonido. Hecho a mano.',1,6,7,9,NULL),(59,'Rocket Music BH01C - Armónica en Do Mayor',2000,0,1,'10 azules armónica del agujero con 20 tonos, pura y brillante precioso y sonido fuerte, cubierta metálica exterior y acabado en plata.',4,21,6,32,NULL),(60,'Arpa Profesional 19 Cuerdas Nylon Madera ',70000,20,1,'Arpa de 19 cuerdas color madera natural necee and body mahogany (caoba) top maple (arce) cuerdas standard medidas 745 x 405 x 209.',1,7,4,10,NULL),(61,'Tuyama tst-171 Slide trompeta (soprano trombón)',30000,5,1,'Trompeta de Latón con un, slide exterior de níquel chapado en plata y un slide interior de cromo duro, posee un Calibre: 11,5 mm; Bell Diámetro: 120 mm. ',4,22,5,33,NULL),(62,'Teclado Estudio 5 Octavas 61 Teclas Sensitivo ',15000,0,1,'54 teclas. 6 canciones de demostración16 tonos. 10 ritmos. 8 efectos de percusión.4,5 Octavas. Chord / Fill-in. Control de volumen y tiempo. Display LCD. Microfono incluido.',2,10,3,15,NULL),(63,'Trompeta Knight Jbtr-300',35000,10,1,'Excelente trompeta, con un excelente mecanismo y de gran duración, se presenta con un estuche rígido, que da gran protección al instrumento.La máquina de pistones está fabricada en CUPRONICKEL, lo que otorga un sonido pocas veces escuchado en este rango de precios.',4,22,5,34,NULL),(64,'Acordeón de teclas ',12000,0,1,'El acordeón ha sido el instrumento preferido de muchos músicos lo largo de generaciones. Su sonido único diseño y la calidad de la firma hace que para la gran música, horas de baile enérgico, y un tiempo de todo-en torno maravilloso.Tiene 8 Bajos, 22 Teclas chicas. Color azul con correa y estuche incluido.',2,11,6,16,NULL),(65,'Trombon Alto Benson Ftc151',45000,15,1,'Trombón alto en Mib 3049 B&S 11,2-11,7mm dual bore 170mm campana en gold brass Acabado lacado Incluye estuche original y accesorios.Trombón alto en Mib 3049 B&S 11,2-11,7mm dual bore 170mm campana en gold brass Acabado lacado Incluye estuche original y accesorios.',4,23,2,29,NULL),(66,'Bateria 5 cuerpos 10009VL ',100000,50,1,'Bateria 5 cuerpos que incluye fierros,  pedal y banque. Diámetro del bombo 18in. Madera birch. ',3,12,3,18,NULL),(67,'Trombon Thomann SL 5 Soprano',60000,20,1,'Excelente Trombón a Vara Tenor en bronce, construcción de primera con un gran sonido, además incluye el estuche rígido reforzado.',4,23,6,36,NULL),(68,'Bombo De Batería 16x18 ',2000,0,1,'El casco es de Araucaria 1ra selección,en 6mm y 9 en los bordes. Incluye elevador y se entrega armado completo.',3,14,3,20,NULL),(69,'Bandoneon Clasico Doble A',40000,10,1,'Un excelente bandoneon doble AA en muy buen estado, tocado y evaluado por bandoneonistas profesionales, contruido para producir las mejores lineas melodicas. Peines de zinc.',4,24,7,37,NULL),(70,'Bongo Profesional Superior 6x7',2000,0,1,'Madera Genuina. Parches de cuero. Afinación mediante tensores. Laqueados. Medidas 6,5\" y 7,5\" pulgadas. Incluye llave para afinación. Acabado en color natural laqueado. Herrajes Black.',3,15,4,21,NULL),(71,'Cuerdas de Guitarra',1200,0,1,'Encordado Gauchita Guitarra Clasica Criolla\r\n6 cuerdas de nailon con media tension',5,25,2,38,NULL),(72,'Pandereta Aro Media Luna Reforzado',3500,0,1,'Pandereta Aro Media Luna Reforzado. 20 CM de diametro,  32 sonajas.',3,16,3,1,NULL),(73,'Cuerdas de Bajo',1200,0,1,'Encordado Orphee Vx120 Niquel\r\n4 cuerdas chinas de niquel .',5,25,1,39,NULL),(74,'Triangulo Percusion Metalico 17cm',3000,0,1,'Material Metal. Mide 17 cm cada lado. Incluye  Triangulo, Golpeador y Colgante. Excelente instrumento de percusión tanto para chicos como adultos.',3,17,1,24,NULL),(75,'Amplificador VOX VTX Series VT20X Valvular 20W',50000,10,1,'Cuenta con 4 canales, conectores de entrada tipo Normal Jack, Aux Jack, Footswitch Jack, USB, conectores de salida tipo Headphone Jack., potencia de salida de 20W y un peso de 7.3kg.',5,26,6,40,NULL),(76,'Kalimba Acústica 7 Notas',3500,5,1,'Kalimba de coco de 7 notas. Importada de Indonesia. Excelente terminación y calidad de sonido.',3,18,5,26,NULL),(77,'Amplificador VOX Hand-Wired Series AC30HWH Valvular 30W',50000,15,1,'Conectores de entrada tipo Normal high Jack, Normal low Jack, Top boost high Jack, Top boost low Jack, Footswitch Jack, conectores de salida tipo External speaker Jack, potencia de salida de 30W y un peso de 20.3kg.',5,26,9,41,NULL),(78,'Placa de sonido audio 1 sonido usb',30000,0,1,'2 entradas: 1 entrada XLR de micrófono con alimentación phantom, 1 entrada de jack con control individual de ganancia. Salida RCA estéreo. Vúmetro para ajustar los niveles. Monitorización directa para incluir la reproducción de audio mientras se graba. Gran dial de volumen. Salida de auriculares con señal de alta potencia y control de volumen.',5,32,9,52,NULL),(79,'Parlante Tedge 8\" portátil inalámbrico  ',30000,0,1,'Formato caja con frecuencia mínima de 50Hz y máxima de 20kHz, posee Bluetooth, incluye control remoto y micrófono.  ',5,27,9,43,NULL),(80,'Cable USB a Tipo C 2 amper 2 Metros ',1000,0,1,'Cable de 2 metros de Longitud. Apto para Carga y Datos. Usb 2.0. 2 Amper.',5,31,9,50,NULL),(81,'Afinador Tipo Clip Pinza Alabama Tc-101 - Oddity ',1200,0,1,' El ALABAMA TC-101 es un afinador de pinza cromático para guitarra, bajo, ukelele, violin, etc. Su clip articulado permite una movilidad total de la pantalla. Incluye batería. ',5,28,9,44,NULL),(82,'Transformador Electronico 220/110v 2000w  ',2200,0,1,' Transformador reductor. Entrada Ac.220v. Salidad Ac.110v. Potencia 2,000watt. Dimensiones 7.5x5.5x5 cm.\r\n ',5,30,9,49,NULL),(83,'Funda de guitarra ',2200,0,1,'Fundas para guitarras, con dos cierres y bolsillos para tus puas y accesorios.',5,29,7,46,NULL),(84,'Transformador Elevador Convertidor 12v A 24v 10a ',2000,0,1,'Eficiencia de 94% (media carga), 92% (carga completa), tensión de salida: 24VCC, corriente de salida: 10A, potencia nominal de salida: 240W, pico de potencia de salida: 255W, regulación de voltaje: <1%, ripple de <100mv',5,30,9,48,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_users`
--

DROP TABLE IF EXISTS `products_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_users` (
  `productsId` int(11) NOT NULL,
  `usersId` int(11) NOT NULL,
  `deletedAt` varchar(45) DEFAULT NULL,
  KEY `fk_productsId_users_idx` (`productsId`),
  KEY `fk_usersId_products_idx` (`usersId`),
  CONSTRAINT `fk_productsId_users` FOREIGN KEY (`productsId`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usersId_products` FOREIGN KEY (`usersId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_users`
--

LOCK TABLES `products_users` WRITE;
/*!40000 ALTER TABLE `products_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_users` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,2,'Joaquin','Girod',1158365508,'2001-03-14','joacogirodQgmail.com','12345678','Avatar.jpg',NULL),(3,2,'Mar','H',2147483647,'2000-04-05','sol_delia@hotmail.com','$2a$10$Tr3TfVwrA4ptUqJDaXMwv.cvRWYSe7yPg0/ylgRRC8NCNvlGT3D.C','image-1594322819136.jpg',NULL),(4,1,'Margarita','Hazaña',1134680021,'2000-12-30','margaritahazana@gmail.com','$2a$10$9sOLgMmdUuLGs.08p3/nd.kQwqNSdCVIvcvWuTg7c3l6lQAeTqo7G','image-1594421264925.jpg',NULL),(5,2,'Margarita','Hazaña',1223344554,'2000-12-30','margaritahazana@gmail.com','$2a$10$QdsLyfeRMBXNtoDScbdHDOu32QHq6dYixeai4hy6e7g7sW5rDevje','image-1594421670726.jpg',NULL),(6,2,'Margarita','Hazaña',2147483647,'3444-02-23','sol_delia@hotmail.com','$2a$10$iITPWBEe6K/hFV1yEO0g2.7Xy6OcjudHIcSjEmWGvlgaVPZ0FtnbO','image-1594422031122.jpg',NULL),(7,2,'Mar','H',2147483647,'1111-11-11','margaritahazana@gmail.com','$2a$10$fRI2tlqwwRCSStULnKGZPuRJpq8u1iHUqfCzPdQFdaPTNjGfFDHcm','image-1594571719346.JPG',NULL);
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

-- Dump completed on 2020-07-13 20:04:25
