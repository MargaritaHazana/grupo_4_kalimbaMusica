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
  `deletedAt` datetime(6) DEFAULT NULL,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors_products`
--

LOCK TABLES `colors_products` WRITE;
/*!40000 ALTER TABLE `colors_products` DISABLE KEYS */;
INSERT INTO `colors_products` VALUES (86,3,NULL,19);
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
  `title` varchar(100) NOT NULL DEFAULT 'Guía',
  `subcategoriesId` int(11) NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  `text1` varchar(1000) NOT NULL,
  `text2` varchar(1000) NOT NULL,
  `text3` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_guides_subcategories_idx` (`subcategoriesId`),
  CONSTRAINT `fk_guides_subcategories` FOREIGN KEY (`subcategoriesId`) REFERENCES `subcategories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guides`
--

LOCK TABLES `guides` WRITE;
/*!40000 ALTER TABLE `guides` DISABLE KEYS */;
INSERT INTO `guides` VALUES (1,'Platillos de batería, ¿Cual sería tu elección ideal?',12,NULL,'Los platillos son una parte importante de cualquier kit de batería, si tocas Jazz, Reggae y Rock ‘n’ Roll. Sin embargo, antes de profundizar en sus usos en la música popular, nos gustaría mencionar brevemente sus usos en orquestas y bandas de música. La mayoría de las empresas ofrecen platillos diseñados específicamente para éstas últimas. Estos platillos se dividen en dos grupos principales.','El borde de un platillo es su parte más fina y más sensible, por lo tanto, uno debe pensar en el ángulo y la fuerza con que se golpea. La inclinación de un platillo crash reduce el impacto de la baqueta. Además, tocar los platillos crash ‘de refilón’ en los que la baqueta hace un breve contacto angular con el platillo, en lugar de tocar de lleno, puede proteger los platillos de posibles daños. Los baterístas que tocan sus platillos montados muy alto y en plano, tienden a agrietarse y, finalmente, romperse. Sin embargo, si el platillo está en un ángulo demasiado pronunciado, será difícil conseguir un buen rebote del plato y será fatigoso de tocar.','Elegir el platillo adecuado para tu estilo de interpretación es muy importante. Los baterístas que tocan música Heavy y golpean fuertemente con baquetas más grandes, no deben elegir los platillos más finos, ya que no proyectarán suficiente sonido para cortar la música, o no soportarán un estilo agres'),(2,'Las mejores 5 guitarras acústicas del 2019',1,NULL,'Al contrario que en las guitarras acústicas, los mástiles de las guitarras clásicas no incorporan alma para ajustar las desviaciones del mismo. Esto se debe esencialmente a dos motivos: 1°, las guitarras clásicas no montan cuerdas de acero, de modo que las tensiones de las cuerdas son menores, y 2°, el mástil es más ancho y grueso.','El mástil más ancho y la menor tensión de las cuerdas favorecen supuestamente al principiante. Pero como hemos comentado arriba, la mano que trabaja en el mástil tiene que superar también una mayor distancia. De todo ello resulta una postura diferente de la que se adopta para tocar la guitarra acústica. El guitarrista educado en clásica, sitúa el dedo pulgar detrás del mástil de forma no visible para el espectador, compensando así las mayores dimensiones del mástil de estos instrumentos. Esta técnica amplía enormemente el alcance de la mano para poner acordes.\nMientras que por otro lado, y al contrario que con la guitarra clásica, en los mástiles más delgados de las guitarras acústicas se puede atacar la cuerda Mi superior mucho mejor desde delante. Por este motivo también se pueden interpretar más fácilmente temas de Rock o de Pop con una guitarra acústica que con una guitarra clásica.','El que toma una guitarra de concierto, debe renunciar completamente a cualquier Show extrovertido. Porque para tocar una guitarra de concierto, normalmente el músico permanece sentado lo más pegado al borde de la silla, y apoya la pierna izquierda sobre un alzapié. La guitarra se posiciona sobre el muslo izquierdo con el mástil alzado. Por este motivo, la guitarra de concierto tampoco posee un “pin“ de enganche para correas, de manera que el tocar de pie solo es posible tras haber adaptado la guitarra en este sentido, o bien por medio de una correa especialmente diseñada para estos instrumentos.'),(3,'Descubrí tu teclado musical ideal',10,NULL,'Los Teclados digitales han mejorado a lo largo de los años, y los mejores de hoy en día son teclados eléctricos de alta calidad con teclas ponderadas y un audio de buen sonido con un sonido realista como el de un teclado o piano acústico.','Por supuesto nada reemplaza el característico sonido de un piano clásico pero en términos de funcionalidad y comodidad el teclado digital tiene fuertes ventajas.','Desde el punto de vista funcional, un teclado electrónico nos permitirá combinar los sonidos de un piano clásico, un órgano de tubos, una batería, nos será posible grabar nuestras pistas para escucharlas o seguir un el ritmo de alguna género musical establecido que nuestro teclado tenga pre-configurado.'),(4,'Como elegir tu ukelele',4,NULL,'¿Qué árbol suena mejor?\nPara el fondo y los aros fundamentalmente se recomienda una madera dura maciza. Para la tapa se puede tomar una madera de mayor o menor dureza dependiendo del sonido deseado. Los ukeleles terminados en Hawaii son la mayoría de madera maciza de Koa o caoba.','Koa es una madera típica en los ukeleles que crece en Hawai.\nEste tipo de madera es conocido por su sonido fino, cálido y abierto. Los instrumentos suenan muy suave y, con buena calidad, diferenciados y claros. La acacia pertenece también a este tipo de árbol y tiene, tras un mismo tratamiento, unas propiedades sonoras similares. La Koa y la acacia se emplean para la tapa y el cuerpo.','La caoba es una madera muy apreciada y empleada frecuentemente. Es una madera tropical muy dura, que por ejemplo el fabricante americano Martin & Co emplea principalmente. Actualmente cualquier ukelele de Koa y caoba macizas como maderas principales es una buena oferta. El sonido de la buena caoba es también cálido y claro como el de la Koa. En comparación la caoba es más directa y centrada. De forma similar suenan también las maderas de Nato y Sapele, de la misma familia de maderas tropicales.'),(5,'Grabación con sonsolas de sonido: TIPS',32,NULL,'os mezcladores están disponibles en una gran cantidad de formatos y tamaños, y aunque la mayoría comparten los mismos fundamentos, hay muchas variantes y opciones para elegir. Dado que un mezclador será probablemente una de las mayores compras individuales que puedas hacer para tu configuración, es de gran importancia saber sus requisitos antes de comprarlo.','Se encuentran generalmente en la parte superior del canal. Un filtro paso alto es una herramienta invaluable, permitiendo la atenuación de frecuencias graves, que de otro modo podrían estorbar encima de tu mezcla. Son particularmente útiles para eliminar retumbes captados por los micrófonos, ya sea de baja frecuencia en el escenario, con fuentes tales como pantallas para bajos y bombos, o los pasos transmitidos a través de los soportes de micrófono. La mayoría de filtros paso alto se fijan a una frecuencia específica, normalmente alrededor de 100Hz, aunque algunos ofrecen control separado sobre éste.','Las salidas directas suelen configurarse con pre-EQ (aunque esto a veces se puede cambiar) y se encuentran normalmente en todos los canales de los mezcladores que las tienen. Al conectar la señal directamente a un grabador multipista o DAW, permiten que la señal básica de cada canal sea grabada sin procesamiento -ésta puede ser devuelta a la mesa de mezclas más adelante para la mezcla. Las salidas directas también pueden tener un buen uso en entornos en vivo, para realizar grabaciones susceptibles de ser mezcladas en una fecha posterior.');
/*!40000 ALTER TABLE `guides` ENABLE KEYS */;
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
  `image` varchar(100) NOT NULL DEFAULT 'error.png',
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'Guitarra eléctrica Stratocaster ',20000,10,1,' Una guitarra diseñana para diestros, de origen  Mexicano, madera de arce, un color customizable con un acabado brilloso, las comunes 6 cuerdas, 22 trastes y 3 microfonos\r\n ','image-1594845141220.jpg',1,1,1,1,NULL),(4,'Guitarra Eléctrica RGX121Z - Humbucker - HSH ',15000,15,1,' Pastillas humbucker cerámicas abiertas para la RGX220DZ/121Z\r\nLos imanes cerámicos se utilizan por su mayor potencia y su rango tonal más amplio. Estas pastillas producen una distorsión más clara.\r\n ','image-1594845155543.jpg',1,1,3,1,NULL),(5,'Piano Digital P-121 de 73 teclas ',15000,15,1,' El Yamaha P-121 es un piano digital compacto de 73 teclas que combina una interpretación pianística excelente con un nuevo diseño sencillo y minimalista. Fácilmente transportable y muy accesible; la versatilidad de este instrumento te permite disfrutar de la sensación de tocar un piano, en cualquier lugar.\r\n ','image-1594845170931.jpg',2,8,3,13,NULL),(6,'Piano de cola clásico - Yamaha ',50000,20,1,' Un piano de armazon negro y teclas de marfil, con un requerimiento espacial de 3 metros cuadrados, ademas posee 7 octavas y 3 pedales para generar sonidos inolvidables.\r\nPiano de cola Clasico\r\n ','image-1594845185571.jpg',2,8,3,12,NULL),(7,'Cajon Peruano Leonard Cajpee Guatambu Rustico ',10000,0,1,' Este instrumento ofrece bellos sonidos de cajón verdaderamente auténticas para satisfacer a los jugadores más exigentes. La construcción de cola de milano de carpintería se utiliza para una mirada tradicional detallada.\r\n ','image-1594845201614.jpg',3,13,7,19,NULL),(8,'Kalimba RXT-300 modelo 1914 ',4000,0,1,' El kalimba consta de 7 piezas metalicas, que resuenan sobre su caja de resonancia, que es similar a un caparazon de tortuga. Cada nota se sostiene permitiendo generar un clima calido y armonico.\r\n\r\n ','image-1594845212316.jpg',3,18,4,26,NULL),(9,'Armonica Folkmaster En Sol 1072 G  ',2000,0,1,'  La armónica Folkmaster 1072 es fácil de tocar y a la vez económica para comprar. Su claridad de sonido excepcional y puesta a punto perfecta es posible gracias a un proceso exclusivo de fabricación láser.\r\n  ','image-1594845223863.jpg',4,21,3,32,NULL),(10,'Flauta dulce soprano - YRS312 ',2500,0,1,' Flauta dulce, ideal para tus primeros pasos en la musica, muy popular en instituciones de enseñanza basica. Tiene un sonido muy delicado, y en las manos de un maestro se puede cautivar un publico sin el apoyo de ningun otro instrumento.\r\n ','image-1594845238159.jpg',4,19,3,28,NULL),(11,'Parlante Bluetooth Fender Newport 30 Watts Compacto Portatil ',3700,0,1,' Nos encontramos ante un altavoz que no solo busca enamorar con su diseño clásico, sino además con su gran reproducción de los graves mediante la implementación de 2 woofers, y la novedosa incorporación de un micrófono para poder atender las llamadas de tu Smartphone.\r\n ','image-1594845263962.jpg',5,27,1,43,NULL),(12,'Afinador RX - Taylor ',3700,0,1,' Afinador para guitarras, consta de afinaciones estandar y no estandar, con este afinador de tu lado si tus notas suenan mal lamentablemente no es el instrumento sos vos );\r\n\r\n ','image-1594845276177.jpg',5,28,2,44,NULL),(52,'Violin 4/4 Tallado A Mano Cuello Y Scroll Sv-130 ',12000,10,1,' Tallado a mano, tapa de pícea sólida de arce macizo cuello y scroll.Filetes incrustados.Nuevo translúcido, cálido color marrón.Accesorios de ébano y VP-61 cordal de aleación con (4) integrado finetuners puente VP-202 CremonaArco de Deluxe de tienda con forma de lazo con crin de caballo genuina sin blanquear color blanco ligero y duradero para violín ajustable. ','image-1594824155533.jpg',1,3,5,6,NULL),(53,'Flauta Traversa YFL211 ',12000,10,1,' Con un diseño y fabricación de la misma calidad que los modelos de las series 300 y 400, las flautas de la serie 200 están fabricadas en resistente níquel plata con un atractivo acabado de baño de plata. Se caracterizan por ofrecer una respuesta y una entonación excelentes.\r\n ','image-1594824171466.jpg',4,19,3,27,NULL),(54,'Ukelele Tamaño Concierto Fender ',5000,5,1,' Bautizado con la palabra hawaiana \"sonrisa\", el Mino\'Aka es un ukelele de tamaño concierto que seguro te hará sonreír. Se trata de un \"uke\" realizado en caoba, con una acertada estética y gran calidez de sonido, que resulta ideal para distintos estilos musicales, desde los sonidos tradicionales de las islas hasta el pop actual. Incluso con su precio asequible, este alegre ukelele presenta diapasón y puente de palosanto, cejilla y selleta de hueso para un mayor equilibrio de sonido y sustain, y ','image-1594824190329.jpg',1,4,1,7,NULL),(55,'Saxófon Alto YAS-875EX ',12000,30,1,' El nuevo saxofón alto Yamaha YAS-875EX Custom EX marca un gran paso adelante para el diseño del saxofón. Ofreciendo a los jugadores una gran cantidad de nuevas posibilidades musicales, el nuevo Custom EX ha sido diseñado en colaboración con algunos de los saxofonistas más talentosos del mundo, incluidos Nobuya Sugawa, Jean-Yves Fourmeau y Otis Murphy. Su inestimable aportación ha significado que Yamaha ha podido crear un instrumento que suena muy bien, es cómodo de tocar y que evoluciona consta','image-1594824207827.jpg',4,20,3,29,NULL),(56,'Contrabajo Yamaha Slb100   ',80000,40,1,'  El SLB100 permite interpretar tonos adecuados para una gran variedad de instrumentos musicales. Los bajistas sabrán apreciar la posibilidad de ensayar en silencio, mientras escuchan toda su tonalidad a través de auriculares.   ','image-1594824031008.jpg',1,5,3,7,NULL),(57,'SELMER PARIS - SERIE III Saxofón Tenor Plata Maciza ',20000,10,1,' Abrazadera Selmer metálica grabada. Apoyapulgar metálico (orientable). Boquilla Selmer S 80C*. Boquillero Selmer metálico grabado. Cordón colgador Selmer al cuello. Estuche Selmer modelo Ligth. Gamuza interior pañuelo con contrapeso. Gamuza limpieza especial para lacados. Grasa para corchos. Llaves de latón grabado. Muelles de aguja en acero inoxidable. Zapatillas de cuero con resonadores matálicos. ','image-1594824230607.jpg',4,20,4,30,NULL),(58,'Charango Madera Pino Coro Artesanias Nylon Musicapilar ',2000,0,1,' Charango Luthier Nacional. Material De madera. Pino Amarillo Macizo. Sobretapa de cedro. Excelente Sonido. Hecho a mano. ','image-1594824253670.jpg',1,6,7,9,NULL),(59,'Rocket Music BH01C - Armónica en Do Mayor ',2000,0,1,' 10 azules armónica del agujero con 20 tonos, pura y brillante precioso y sonido fuerte, cubierta metálica exterior y acabado en plata. ','image-1594824269591.jpg',4,21,6,32,NULL),(60,'Arpa Profesional 19 Cuerdas Nylon Madera  ',70000,20,1,' Arpa de 19 cuerdas color madera natural necee and body mahogany (caoba) top maple (arce) cuerdas standard medidas 745 x 405 x 209. ','image-1594824284290.jpg',1,7,4,10,NULL),(61,'Tuyama tst-171 Slide trompeta (soprano trombón) ',30000,5,1,' Trompeta de Latón con un, slide exterior de níquel chapado en plata y un slide interior de cromo duro, posee un Calibre: 11,5 mm; Bell Diámetro: 120 mm.  ','image-1594824300441.jpg',4,22,5,33,NULL),(62,'Teclado Estudio 5 Octavas 61 Teclas Sensitivo  ',15000,0,1,' 54 teclas. 6 canciones de demostración16 tonos. 10 ritmos. 8 efectos de percusión.4,5 Octavas. Chord / Fill-in. Control de volumen y tiempo. Display LCD. Microfono incluido. ','image-1594824319711.jpg',2,10,3,15,NULL),(63,'Trompeta Knight Jbtr-300 ',35000,10,1,' Excelente trompeta, con un excelente mecanismo y de gran duración, se presenta con un estuche rígido, que da gran protección al instrumento.La máquina de pistones está fabricada en CUPRONICKEL, lo que otorga un sonido pocas veces escuchado en este rango de precios. ','image-1594824339760.jpg',4,22,5,34,NULL),(64,'Acordeón de teclas  ',12000,0,1,' El acordeón ha sido el instrumento preferido de muchos músicos lo largo de generaciones. Su sonido único diseño y la calidad de la firma hace que para la gran música, horas de baile enérgico, y un tiempo de todo-en torno maravilloso.Tiene 8 Bajos, 22 Teclas chicas. Color azul con correa y estuche incluido. ','image-1594824358048.jpg',2,11,6,16,NULL),(65,'Trombon Alto Benson Ftc151 ',45000,15,1,' Trombón alto en Mib 3049 B&S 11,2-11,7mm dual bore 170mm campana en gold brass Acabado lacado Incluye estuche original y accesorios.Trombón alto en Mib 3049 B&S 11,2-11,7mm dual bore 170mm campana en gold brass Acabado lacado Incluye estuche original y accesorios. ','image-1594824373271.jpg',4,23,2,29,NULL),(66,'Bateria 5 cuerpos 10009VL  ',100000,50,1,' Bateria 5 cuerpos que incluye fierros,  pedal y banque. Diámetro del bombo 18in. Madera birch.  ','image-1594824395380.jpg',3,12,3,18,NULL),(67,'Trombon Thomann SL 5 Soprano  ',60000,20,1,' Excelente Trombón a Vara Tenor en bronce, construcción de primera con un gran sonido, además incluye el estuche rígido reforzado.  ','image-1594824413079.jpg',4,23,6,36,NULL),(68,'Bombo De Batería 16x18  ',2000,0,1,' El casco es de Araucaria 1ra selección,en 6mm y 9 en los bordes. Incluye elevador y se entrega armado completo. ','image-1594824432222.jpg',3,14,3,20,NULL),(69,'Bandoneon Clasico Doble A ',40000,10,1,' Un excelente bandoneon doble AA en muy buen estado, tocado y evaluado por bandoneonistas profesionales, contruido para producir las mejores lineas melodicas. Peines de zinc. ','image-1594824450187.jpg',4,24,7,37,NULL),(70,'Bongo Profesional Superior 6x7 ',2000,0,1,' Madera Genuina. Parches de cuero. Afinación mediante tensores. Laqueados. Medidas 6,5\" y 7,5\" pulgadas. Incluye llave para afinación. Acabado en color natural laqueado. Herrajes Black. ','image-1594824472182.jpg',3,15,4,21,NULL),(71,'Cuerdas de Guitarra ',1200,0,1,' Encordado Gauchita Guitarra Clasica Criolla\r\n6 cuerdas de nailon con media tension ','image-1594824499005.jpg',5,25,2,38,NULL),(72,'Pandereta Aro Media Luna Reforzado ',3500,0,1,' Pandereta Aro Media Luna Reforzado. 20 CM de diametro,  32 sonajas. ','image-1594824577988.jpg',3,16,3,23,NULL),(73,'Cuerdas de Bajo ',1200,0,1,' Encordado Orphee Vx120 Niquel\r\n4 cuerdas chinas de niquel . ','image-1594824594179.jpg',5,25,1,39,NULL),(74,'Triangulo Percusion Metalico 17cm ',3000,0,1,' Material Metal. Mide 17 cm cada lado. Incluye  Triangulo, Golpeador y Colgante. Excelente instrumento de percusión tanto para chicos como adultos. ','image-1594824613306.jpg',3,17,1,24,NULL),(75,'Amplificador VOX VTX Series VT20X Valvular 20W ',50000,10,1,' Cuenta con 4 canales, conectores de entrada tipo Normal Jack, Aux Jack, Footswitch Jack, USB, conectores de salida tipo Headphone Jack., potencia de salida de 20W y un peso de 7.3kg. ','image-1594824628952.jpg',5,26,6,40,NULL),(76,'Kalimba Acústica 7 Notas ',3500,5,1,' Kalimba de coco de 7 notas. Importada de Indonesia. Excelente terminación y calidad de sonido. ','image-1594824646451.jpg',3,18,5,26,NULL),(77,'Amplificador VOX Hand-Wired Series AC30HWH Valvular 30W ',50000,15,1,' Conectores de entrada tipo Normal high Jack, Normal low Jack, Top boost high Jack, Top boost low Jack, Footswitch Jack, conectores de salida tipo External speaker Jack, potencia de salida de 30W y un peso de 20.3kg. ','image-1594824662955.jpg',5,26,9,41,NULL),(78,'Placa de sonido audio 1 sonido usb ',30000,0,1,' 2 entradas: 1 entrada XLR de micrófono con alimentación phantom, 1 entrada de jack con control individual de ganancia. Salida RCA estéreo. Vúmetro para ajustar los niveles. Monitorización directa para incluir la reproducción de audio mientras se graba. Gran dial de volumen. Salida de auriculares con señal de alta potencia y control de volumen. ','image-1594824677708.jpg',5,32,9,52,NULL),(79,'Parlante Tedge 8\" portátil inalámbrico   ',30000,0,1,' Formato caja con frecuencia mínima de 50Hz y máxima de 20kHz, posee Bluetooth, incluye control remoto y micrófono.   ','image-1594824694890.jpg',5,27,9,43,NULL),(80,'Cable USB a Tipo C 2 amper 2 Metros  ',1000,0,1,' Cable de 2 metros de Longitud. Apto para Carga y Datos. Usb 2.0. 2 Amper. ','image-1594824710433.jpg',5,31,9,50,NULL),(81,'Afinador Tipo Clip Pinza Alabama Tc-101 - Oddity  ',1200,0,1,'  El ALABAMA TC-101 es un afinador de pinza cromático para guitarra, bajo, ukelele, violin, etc. Su clip articulado permite una movilidad total de la pantalla. Incluye batería.  ','image-1594824725891.jpg',5,28,9,44,NULL),(82,'Transformador Electronico 220/110v 2000w   ',2200,0,1,'  Transformador reductor. Entrada Ac.220v. Salidad Ac.110v. Potencia 2,000watt. Dimensiones 7.5x5.5x5 cm.\r\n  ','image-1594824745546.jpg',5,30,9,49,NULL),(83,'Funda de guitarra  ',2200,0,1,' Fundas para guitarras, con dos cierres y bolsillos para tus puas y accesorios. ','image-1594824758205.jpg',5,29,7,46,NULL),(84,'Transformador Elevador Convertidor 12v A 24v 10a  ',2000,0,1,' Eficiencia de 94% (media carga), 92% (carga completa), tensión de salida: 24VCC, corriente de salida: 10A, potencia nominal de salida: 240W, pico de potencia de salida: 255W, regulación de voltaje: <1%, ripple de <100mv ','image-1594824771273.jpg',5,30,9,48,NULL),(85,'Piano eléctrico digital P45 de 7 octavas ',60000,10,1,' Piano Digital de Escenario\r\nTeclas con peso tipo martillo para una experiencia única.\r\nLa acción de martillo contrapesada (Graded Hammer Standard) de Yamaha ofrece la misma sensación que se experimenta en un piano acústico.\r\nUn sonido sorprendentemente natural y preciso.\r\nEl sonido del P-45B ha sido posible gracias a la utilización de tecnología digital para grabar el timbre de un piano acústico. El AWM Stereo Sampling consigue un sonido más profundo, rico y espacioso empleando pares de ondas (','image-1594825122668.jpg',2,9,3,13,NULL);
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colorsId` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_productsId_users_idx` (`productsId`),
  KEY `fk_usersId_products_idx` (`usersId`),
  CONSTRAINT `fk_productsId_users` FOREIGN KEY (`productsId`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usersId_products` FOREIGN KEY (`usersId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_users`
--

LOCK TABLES `products_users` WRITE;
/*!40000 ALTER TABLE `products_users` DISABLE KEYS */;
INSERT INTO `products_users` VALUES (76,4,NULL,3,0,1),(64,4,NULL,4,0,1),(80,4,NULL,7,0,1),(77,4,NULL,13,0,1),(73,4,NULL,18,0,1),(83,4,NULL,19,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,2,'Joaquin','Girod',1158365508,'2001-03-14','joacogirodQgmail.com','12345678','Avatar.jpg',NULL),(3,2,'Mar','H',2147483647,'2000-04-05','sol_delia@hotmail.com','$2a$10$Tr3TfVwrA4ptUqJDaXMwv.cvRWYSe7yPg0/ylgRRC8NCNvlGT3D.C','image-1594322819136.jpg',NULL),(4,1,'Margarita','Hazaña',1134680021,'2000-12-30','margaritahazana@gmail.com','$2a$10$9sOLgMmdUuLGs.08p3/nd.kQwqNSdCVIvcvWuTg7c3l6lQAeTqo7G','image-1594421264925.jpg',NULL),(6,2,'Margarita','Hazaña',2147483647,'3444-02-23','sol_delia@hotmail.com','$2a$10$iITPWBEe6K/hFV1yEO0g2.7Xy6OcjudHIcSjEmWGvlgaVPZ0FtnbO','image-1594422031122.jpg',NULL),(8,2,'Pepe','Pepe',1234567890,'2000-12-23','tcheng0@vimeo.com','$2a$10$pFejv5B6UHsjcylKduzpXubPBiGwpjXDW0nL/YCYwF53EFyDsE.fS','image-1594682347181.jpg',NULL),(9,2,'Sofia','Pepe',2147483647,'1111-11-11','sofiabaya@gmail.com','$2a$10$V.FGoER3nv4UFYUj6xaChuW9U7B20KQ3HhHME5weJAEM508HL8Yfa','image-1594835429434.jpg',NULL),(10,1,'Margarita','Pepe',2147483647,'3333-11-22','joaquin@gmail.com','$2a$10$KWJKdc.kSkbveo9fCoYsS.G3QIQrjf/zvvY2eo0/NpnUWQgFQmND6','image-1594835511469.jpg',NULL);
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

-- Dump completed on 2020-07-15 17:55:30
