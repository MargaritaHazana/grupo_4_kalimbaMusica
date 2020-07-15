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
INSERT INTO `colors_products` VALUES (3,2,NULL),(3,1,NULL),(4,2,NULL),(4,5,NULL),(5,7,NULL),(5,3,NULL),(6,4,NULL),(6,3,NULL),(7,4,NULL),(8,4,NULL),(8,7,NULL),(9,7,NULL),(9,6,NULL),(10,6,NULL),(10,1,NULL),(11,1,NULL),(11,3,NULL),(12,7,NULL);
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
  `content` varchar(10000) NOT NULL,
  `subcategoriesId` int(11) NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `types_id_idx` (`subcategoriesId`),
  CONSTRAINT `fk_guides_subcategories_id` FOREIGN KEY (`subcategoriesId`) REFERENCES `subcategories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guides`
--

LOCK TABLES `guides` WRITE;
/*!40000 ALTER TABLE `guides` DISABLE KEYS */;
INSERT INTO `guides` VALUES (1,'Platillos de batería, ¿Cual sería tu elección ideal?','Platillos de concierto\nLos platillos son una parte importante de cualquier kit de batería, si tocas Jazz, Reggae y Rock ‘n’ Roll. Sin embargo, antes de profundizar en sus usos en la música popular, nos gustaría mencionar brevemente sus usos en orquestas y bandas de música. La mayoría de las empresas ofrecen platillos diseñados específicamente para éstas últimas. Estos platillos se dividen en dos grupos principales.\n\nPlatillos Crash\nAunque los platillos no se usan con frecuencia, son una parte importante de todas las orquestas. Su función principal es hacer hincapié en el ritmo, así como producir otros efectos inusuales y espectaculares. Los platillos también se pueden utilizar para añadir un toque militar a la música, y se usan comúnmente en las marchas si se tocan en un entorno de orquesta o banda de música. En la música para cine, los platillos a menudo se utilizan para expresar sentimientos de tensión, rabia o en los momentos culminantes para expresar liberación y alegría.\nLos crash de conciertos se utilizan en parejas y son sujetados por unas correas, que pasan a través del orificio en el centro del plato; los platillos se sujetan, tocan y controlan con la correa. Los platillos crash pueden ser golpeados fuertemente, para una dramática explosión de sonido, o frotarse ligeramente entre sí, para efectos más suaves y sutiles. Por lo general, se golpean entre sí en un ligero ángulo para evitar la creación de un breve vacío o cámara de aire entre los platos, que pueden ‘robarles’ volumen. Los intérpretes pueden usar su torso para amortiguar el sonido y controlar su decay, lo que permite fuertes pero cortos crashes staccato. En bandas de música, las correas se utilizan a menudo para girar y rotar los platillos, creando efectos visuales emocionantes y, a veces, se sujetan horizontalmente, de modo que aquellos que toquen la caja, puedan tocarlos con sus baquetas. Los platillos crash suelen ir acompañados de un bombo al unísono para aumentar su impacto. Los bateristas también suelen duplicar sus platillos crash con el bombo. En una partitura, las notas de platillos suelen ser escritas con una cabeza de nota en forma de x.\n\nPlatillos de batería\nPlatillo Ride\nLos platillos ride se tocan generalmente en un ritmo repetitivo, para transmitir la sensación de base y la subdivisión rítmica de la música. Los platillos ride vienen en diferentes tamaños, desde 18 pulgadas hasta 24 pulgadas de diámetro, y ofrecen una amplia gama de propiedades tonales, al igual que todos los platillos. Al elegir un platillo ride, hay diferentes aspectos de su sonido que se deben considerar.\n\nEl Sonido: El ‘ping’ es el sonido brillante del impacto de la baqueta y lo que proporciona una definición a tus ritmos. El ‘wash’ es el rugido subyacente más oscuro, que se acumula mientras tocas un platillo ride. La cantidad de ping y de wash debe ser proporcional la una con la otra, para los estilos de la música que toques. Si hay demasiado wash, tus ritmos de platillos carecerán de definición, especialmente a volúmenes y tiempos altos, pero si hay demasiado poco wash, el platillo sonará ‘seco’, o carecerá del sustain que proporciona, por lo general, un platillo ride. Hay muchos factores que afectan al sonido de un platillo, pero el grosor es la variable crucial. Los bateristas de Heavy Metal suelen elegir platillos ride más gruesos, con una gran cantidad de ping, con los que puedan ‘cortar’ la música a todo volumen, mientras que los bateristas de jazz prefieren platillos ride más delgados con más wash, que suenan mejor cuando se tocan a volúmenes más bajos. No te olvides de comprobar la campana del ride. La mayoría de los platillos ride tienen una zona elevada y más gruesa en su centro llamada campana, que al ser golpeada produce un sonido brillante y penetrante, a menudo más definido, que puede cortar fácilmente la música a alto volumen. Los bateristas de kits suelen utilizar la campana para imitar el sonido de un patrón de cencerro, para los estilos de música latina. Al evaluar los platillos, hazte algunas preguntas. ¿Es fácil conseguir un sonido claro de campana del platillo? ¿Qué tipo de música tocas principalmente? ¿El sonido de platillos suena bien a los niveles de volumen que necesitas? ¿Hay suficiente ping en el sonido y/o puedes controlar el wash? ¿Cómo suenan cuando haces un crescendo? ¿El tono del plato es demasiado alto o demasiado bajo para tus necesidades? Al seleccionar los platillos, puede ser muy útil que un amigo toque el platillo mientras te pones de pie a cierta distancia de él, para tener una mejor idea de cómo va a sonar desde la perspectiva del público.\n\nPlatillos Crash\nLos platillos crash se utilizan a menudo al final de redobles de batería, para reproducir los patrones de acento o para perfilar las transiciones de forma en una canción, por ejemplo, al pasar de la estrofa al estribillo. En estilos de música heavy, incluso se puede tocar como un platillo ride para añadir volumen y energía. Los platillos crash pueden variar desde 14 pulgadas a 20 pulgadas de diámetro.\n\nEl Sonido: Dado que los platillos crash se utilizan principalmente para los acentos, comprueba si el platillo puede tocarse lo suficientemente fuerte para tu estilo de música, y si también se puede tocar tan suavemente como sea necesario. ¿Durante cuánto tiempo se sostiene el crash? ¿Cuál es el tono del crash? ¿Oyes cómo el diámetro del platillo de una línea de modelo afecta a su tono? Ten en cuenta que los platillos con un tono elevado y más gruesos, tienden a ‘cortar’ mejor la música más fuerte, y que los crash más delgados reaccionan más rápidamente.\n\nPlatillos Hi-Hat\nEl Hi-Hat se utiliza de una forma similar a un plato ride, manteniendo el tempo e indicando el pulso subyacente de una canción. Se venden en pares y se corresponden en diámetro. Los platillos hi-hat se montan en un soporte específico, que utiliza un pedal que mueve el plato superior hacia arriba y hacia abajo. Al tocar ritmos sobre los hi-hats y variar la posición del pedal, puedes crear una amplia variedad de sonidos. También pueden tocarse sólo con el pedal, ya sea para crear un sonido ‘chick’ o un sonido ‘splash’. Los bateristas a menudo tocan ritmos de apoyo con el pedal hi-hat, mientras tocan su platillo ride. Los platillos Hi-Hat comúnmente tienen un rango de 10 pulgadas a 15 pulgadas de diámetro.\n\nEl Sonido: los hit-hats deben tener un sonido chick claramente definido, cuando se tocan con el pedal. Debes elegir un par de hi-hats que complementen el tono de tu ride. Los hi-hats de 14 pulgadas de diámetro son el tamaño más común, pero los hi-hats más pequeños (13 pulgadas y menos) también están disponibles y tienden a tener un tono más alto, responden más rápido y producen un menor volumen que los hi-hats de mayor tamaño. Asegúrate de verificar que los platillos funcionan bien dentro del rango de volumen de tu forma de tocar.\n\nPlatillos Splash\nLos platillos Splash son versiones más pequeñas de los platillos crash, con un sustain más corto. Puesto que son pequeños, se pueden utilizar para reproducir patrones acentuados rápidos. Se utilizan con frecuencia en el jazz Dixieland y muchos otros estilos de música y, por lo general, van desde 6 a 12 pulgadas de diámetro.\n\nEl Sonido: los platillos Splash ofrecen breves estallidos de sonido agudo, con muy poco sustain y menor volumen que los platillos crash. ¿El tono y matices de los platillos splash se corresponde con tus otros platillos? Si el sustain y el volumen son más largos y más fuertes, deberías considerar un modelo más delgado o más pequeño. Por el contrario, si el platillo tiene demasiado poco sustain, explora modelos más gruesos o más grandes.\n\nAplicación\nHerrajes\nNecesitarás herrajes (soportes) para montar platillos alrededor de tu batería. Una buena selección de soportes, sin duda puede hacer que llegues a tus platillos y los toques más cómodamente, y conocer el uso adecuado de los soportes puede ayudar a que tus platillos duren más tiempo y ofrezcan un sonido más musical. Los herrajes deben ser fáciles de ajustar y posicionar, a la vez que ofrezcan una estabilidad suficiente para tu estilo de interpretación. Un baterísta de jazz ligero, no requiere los herrajes de alta resistencia de alguien que toque Metal contundente. Siempre debes asegurarte de que los soportes de platillos tengan arandelas encima y debajo del plato, y un casquillo de plástico para evitar el contacto de metal con metal entre el platillo y el soporte. Dado que el soporte está hecho de acero y el platillo está hecho de materiales más blandos, el contacto de metal con metal puede causar un daño gradual en el platillo. Con el tiempo, la abrasión del metal puede hacer que el agujero del centro del platillo se haga ovalado (en forma de ojo de cerradura) y, finalmente, se agriete y se rompa. Tus platillos deben ser capaces de moverse libremente entre los fieltros de los platillos y el tornillo de mariposa no debe sujetar el plato con fuerza, ya que esto puede causar daños en tu plato y alterar su tono.\n\nTécnica de Interpretación Adecuada\nEl borde de un platillo es su parte más fina y más sensible, por lo tanto, uno debe pensar en el ángulo y la fuerza con que se golpea. La inclinación de un platillo crash reduce el impacto de la baqueta. Además, tocar los platillos crash ‘de refilón’ en los que la baqueta hace un breve contacto angular con el platillo, en lugar de tocar de lleno, puede proteger los platillos de posibles daños. Los baterístas que tocan sus platillos montados muy alto y en plano, tienden a agrietarse y, finalmente, romperse. Sin embargo, si el platillo está en un ángulo demasiado pronunciado, será difícil conseguir un buen rebote del plato y será fatigoso de tocar.\n\nElegir el platillo adecuado para tu estilo de interpretación es muy importante. Los baterístas que tocan música Heavy y golpean fuertemente con baquetas más grandes, no deben elegir los platillos más finos, ya que no proyectarán suficiente sonido para cortar la música, o no soportarán un estilo agres',12,NULL),(2,'Las mejores 5 guitarras acústicas del 2019','En este artículo podrás conseguir las mejores guitarras acústicas del 2019. Desde bandas de rock hasta una orquesta, cuando se trata de crear música verdadera, los músicos no se comprometerán. ¡Es la calidad de sonido perfecta, una afinación increíble, una durabilidad fabulosa o nada en absoluto!\n\nYa sea principiante o haya estado en la industria durante mucho tiempo, entendemos exactamente lo importante que es para usted elegir la mejor guitarra que no solo se adapte a todas sus necesidades, sino que también pueda ser la combinación perfecta para su billetera. Si está buscando una guitarra más fuerte, consulte nuestra lista de las 10 mejores acústicas o electroacústicas.\n\nLas guitarras acústicas han sido un favorito personal de la mayoría de los músicos, cantantes e intérpretes. Te traemos algunas guitarras seleccionadas que son las mejores disponibles.\n\nNo solo son las mejores guitarras recomendadas por profesionales, sino que también ayudan a alentar a los principiantes a seguir sus sueños de tocar la guitarra sin tener que romper sus bancos. Encontrará una amplia gama de combinaciones, desde eficiente ergonomía, diseño lujoso y clásico , hasta la perfección de vanguardia, todo incluido en la lista a continuación, diseñada para satisfacer las necesidades de cada guitarrista.\n\nLAS MEJORES GUITARRAS ACÚSTICAS DE 2019\n1. Guitarra acústica Yamaha FG800 Solid Top Negra\nUn diseño estándar y un aspecto tradicional se unen en una de las guitarras acústicas mejor calificadas que está disponible a un precio muy asequible. El Yamaha FG800 le brinda comodidad en sintonía con sus necesidades. Esta es otra adición a la estimada serie FG de Yamaha. El objetivo siempre fue producir un instrumento musical de alta calidad con una interpretación explícita y una afinación sobresaliente sin hacer un agujero en su billetera.\n\nLa serie FG siempre se ha considerado una opción clásica entre millones de guitarristas durante los últimos 50 años. El FG800 es una continuación de la serie y ofrece una jugabilidad aún más refinada junto con características que son una clase aparte. Siempre ha sido un símbolo de seguridad para los profesionales y nunca ha fallado en alcanzar el tono perfecto de expectativa con los músicos contemporáneos.\n\n2. Guitarra Acustica Fender Paramount PM-1 Standard Dreadnought Con Estuche Rigido\nUna expansión de las guitarras acústicas de la serie Paramount, el PM-1 Dreadnought NE, All-Mahogany, Natural combina un estilo simple con un acabado orgánico para crear un instrumento altamente sensible. Diseñado cuidadosamente para un tono superior, un alto rendimiento y un atractivo visual terroso, este instrumento premium satisfará a todos los jugadores que busquen una guitarra inspiradora.\n\nLa parte superior de caoba de poro abierto es extremadamente vivaz, con una voz exuberante y cálida y un rango dinámico mejorado que responde a todos los matices de su interpretación, sin importar cuán fuerte o rápido toque y toque. Las abrazaderas X festoneadas se colocan cuidadosamente para una definición detallada de la nota, trabajando en armonía con la parte superior para la cantidad perfecta de sonido de llamada. La parte posterior y los lados de caoba, totalmente sólidos y ricos, trabajan con la parte superior para obtener un tono equilibrado, terroso y orgánico. El mástil de caoba con forma de “C” y el diapasón de ovangkol de rápida ejecución están cuidadosamente diseñados para adaptarse a cualquier estilo de juego y ofrecen un rendimiento cómodo en cualquier parte del cuello. El puente de ébano duradero y el sillín de hueso compensado agregan una nota rica a la voz cálida de la guitarra y crean una entonación precisa, además de ser elegantes toques estéticos, al igual que los pines del puente de ébano.\n\nEl acabado de poro abierto permite que la guitarra resuene libremente, lo que lo convierte en un instrumento extremadamente liviano que respira con un tono dinámico. Incluye estuche rígido de lujo y humidificador.\n\n3. Guitarra Electro Acústica De Viaje Taylor Bt2-e Con Funda\nLa versión superior de caoba del Baby Taylor producirá un tono ligeramente más oscuro y terroso que su hermano superior de abeto. El Dreadnought del tamaño de una pinta se inspiró originalmente en el deseo de proporcionar una guitarra más pequeña y de tamaño inicial para niños y un compañero musical legítimo para los viajeros, pero desde entonces los músicos la han adaptado a sus necesidades en todo tipo de formas creativas, desde cuerdas altas con una configuración para mayor proyección, y también para adoptar afinaciones alternativas que agregan sabores acústicos únicos a las grabaciones. Este modelo también viene equipado con la pastilla Expression System Baby ™ (ES-B), que incorpora elementos de diseño piezoeléctrico del Taylor ES2. La pastilla funciona con un preamplificador incorporado con un sintonizador cromático digital incorporado. La unidad de preamplificador / sintonizador cuenta con una pantalla LED para sintonización e indicación de batería baja, junto con controles de tono y volumen.\n\n4. Guitarra Electroacústica Prs A40ena Con Corte Maciza Estuche\nLa A60E es el anfitrión del perfil de cuello ancho y gordo de PRS. Con un poco menos de 43 mm en la tuerca, esta forma no es realmente tan ancha y tampoco es tan gordita como su nombre lo sugiere. A juzgar por la cantidad satisfactoria de carne golpeada en nuestra palma, marcaremos esta forma hasta una C. completa. Una acción baja y cuerdas de calibre de 0.012 a 0.053 con sensatez ayudan a lograr una puntuación máxima para la jugabilidad en ambos SE.\n\nAl ser un recién nacido, esta guitarra tendrá un poco de aliento antes de llegar a la adolescencia tonal. Dicho esto, el uso de los refuerzos superiores híbridos X / Classical no le ha dado la mitad de un gran comienzo en la vida. Esta configuración ofrece la resistencia a la tensión de las cuerdas de los refuerzos X tradicionales, el formato que encontraría, por ejemplo, en un acorazado, con la flexibilidad de una tapa de guitarra clásica. Cuanto más vibra la parte superior, mayor es la dulzura tonal y la producción.\n\n5. Guitarra Transacustica Yamaha Lltabs Sunburst Amplificada\nHay algo incontrolable que induce a la sonrisa al tocar una guitarra acústica de clase mundial a través de un amplificador de alta calidad con una reverberación cálida y detallada. Pero el hecho de inducir una sonrisa se convierte en asombroso cuando experimenta el mismo tono increíble sin un amplificador o pedal de efectos en cualquier lugar para ser visto.\n\nBienvenidos a TransAcoustic. No hay altavoz en una guitarra transacústica. En su lugar, un actuador altamente diseñado y controlado con precisión se conecta a la superficie interior de la madera de tono de la guitarra, transmitiendo vibraciones en respuesta a las de las cuerdas. Desde el actuador, hasta la madera tonal, hasta el aire dentro y alrededor de la guitarra; Las vibraciones crean auténticos sonidos de reverberación y coro desde la propia guitarra.\n\nBrindar la ayuda necesaria para conseguir esa Guitarra que siempre quisiste, la que te puede ofrecer y saciar todos tus gustos, y a su vez ser tu acompañante en tantos momentos y creaciones.\nTe ofrecemos todas las alternativas necesarias para que consigas tu instrumento soñado, útil e ideal.\n\n¡Que no se apague la Música!',1,NULL),(3,'Descubrí tu teclado musical ideal','Los Teclados digitales han mejorado a lo largo de los años, y los mejores de hoy en día son teclados eléctricos de alta calidad con teclas ponderadas y un audio de buen sonido con un sonido realista como el de un teclado o piano acústico.\n\nPor supuesto nada reemplaza el característico sonido de un piano clásico pero en términos de funcionalidad y comodidad el teclado digital tiene fuertes ventajas.\n\nDesde el punto de vista funcional, un teclado electrónico nos permitirá combinar los sonidos de un piano clásico, un órgano de tubos, una batería, nos será posible grabar nuestras pistas para escucharlas o seguir un el ritmo de alguna género musical establecido que nuestro teclado tenga pre-configurado.\n\nAunque los pianos acústicos suenan muy bien, son caros y lo que podría ser una mejor opción que optar por el mejor piano digital…\n\nLo más probable es que esté buscando el mejor piano digital portátil con un excelente sonido perfecto para uso doméstico y en el escenario O simplemente necesita un buen teclado eléctrico con 88 teclas ponderadas para principiantes y expertos por igual, pero no sabe qué teclado digital elegir.\n\nEl objetivo de este artículo es ayudar a todos aquellos que quieran emprender la aventura de comprar un teclado musical, bien sea para aprender o para mejorar el que ya tienen, siempre es difícil tomar esta decisión dada la gran cantidad de opciones que existen en el mercado.\n\nDE ACUERDO AL NÚMERO DE OCTAVAS, TACTO DE TECLAS Y DISEÑO\nTenemos en el mercado teclados que van desde las 25 teclas, 49, 61, 76 y 88… (comunmente se le nombra por el número de octavas como 2, 4, 5, 6 ó 8 octavas) si bien esto los describe de forma imprecisa (88 teclas no son 8 octavas). Las octavas son grupos de 12 notas. Normalmente saber la cantidad de teclas que queremos tener no nos resuelve la duda de que teclado comprar pero ayuda bastante.\n\nAparte del número de teclas que tenga el teclado, estas también pueden ser de tipo normal o miniteclas, si bien este es un segmento más reducido.\n\n25 TECLAS\n\nSon los teclados más pequeños, permiten tocar practicamente con una sola mano y son útiles para el directo en el que solo necesitamos un pequeño apoyo o disparo de secuencias o muestras mediante teclas. Son fáciles de transportar y económicos por su menor cantidad de teclas, aunque no tanto como se podría pensar en comparación con los de 49 ó 61 teclas, pues la parte de control suele ser común a los diversos modelos de una gama o marca y las teclas son el componente más económico.\n\nEste tipo de teclado corto suele ser muy usado en teclados controladores MIDI (ausentes de sonidos internos) o en sintenizadores analógicos auténticos o sus simulaciones digitales, dado que este tipo de sonidos analógicos se aplican comunmente a la creación de líneas de bajo y tocarlas solo con la mano izquierda mientras se usa la derecha para otro teclado es práctica común.\n\n49 Ó 61 TECLAS\nPermiten tocar con las dos manos y la diferencia de una octava más en el 61 es definitivamente algo que quien sabe tocar el piano valorará, pues le permitirá realizar fraseos más largos. Las teclas extra pueden ser utilizadas también como teclas de control o ajuste de articulaciones, lo cual es útil cuando disparamos desde el teclado determinados sonidos cargados en samplers software como Kontakt.\n\nMientras que los teclados de 49 teclas suelen ser casi siempre de tecla blanda, en la gama de los de 61 teclas encontramos marcas que ofrecen doble o triple elección, teclas blanda (softkey), semilastradas (semi weigthed), o contrapesadas al estilo piano acústico (fully weighted).\n\n76 Y 88 TECLAS\nSon definitivamente una opción profesional, dado que es raro que un principante compre un teclado de estas características a no ser que se plantee muy seriamente el inicio de estudios de piano reglados, para los cuales sin duda es necesario uno de estos teclados; no solo por la cantidad de octavas disponibles, correspondientes a las de un piano acústico clásico, lo que permitirá practicar e interpretar con él obras de música clásica o blues-jazz, sino por que normalmente son teclados de tacto contrapesado, también llamados «fully weigthed» en inglés o de acción martillo «hammer action».\nEsto quiere decir que las teclas tendrán bastente peso y simulan el rebote de los martillos de los pianos contra las cuerdas tensadas lo que produce un catacterístico efecto de rebote sin el que los músicos clásicos no pueden interpretar bien. Su mayor peso y tamaño los convierten opciones para situar en el estudio o para profesionales del directo que los lleven bien protegidos  dentro de buenos fligthcases.\n\nLas 88 teclas suelen ser el formato usado en pianos digitales de mueble, dado que estos van destinados al estudio de piano clásico, aunque también es usado en muchos teclados controladores MIDI dado que el piano establece una relación de largo plazo con el pianista al acostumbrarse este completamente a su tacto, por lo que es habitual que no se preste mucha atención a la parte sonora (sintetizador) del teclado ya que se prefiere que esta sea externa para poder cambiarla a lo largo del tiempo adquiriéndose diferentes módulos de sonidos externos mientras que se conserva el mismo teclado durante muchos años, cuando no toda la vida.\n\nHabiendo visto y analizado toda esta información…\n\nAntes de comprar  dedica suficiente tiempo a probar bien el teclado o si compras vía online, investiga muy bien lo que sea necesario, para satisfacer todas tus necesidades y conseguir el sonido que te gusta, pide que te lo enciendan y lo conecten a un equipo de suficiente potencia, como lo que se suele usar de monitor de escenario, toca y siente cada tecla, su peso y tócalo despacio y luego con más fuerza para evaluar su dinámica, sube el volumen al máximo sin tocar nada y asegúrate de que no suenan ruidos de fondo como soplidos.\n\nTe recomendamos comprar una buena funda o flighcase para el teclado, bien acolchado o con espuma amortiguadora, con aseguramiento para las teclas y sin holguras que permitan vibraciones o golpes al transportarlo, es recomendable para asegurar completamente tu teclado.\n\nEsperamos te haya sido de bastante ayuda este artículo, en nuestos locales, puedes probar una amplia variedad en Teclados, Pianos y Sintetizadores. Puedes visitarnos en nuestra Web o visitar nuestro Showroom.\n\n¡Que no se apague la Música!',10,NULL),(4,'Como elegir tu ukelele','¿CÓMO SABER CUAL ES TU UKELELE IDEAL? \n– Historia\nEl ukelele se relaciona a menudo con sol, playa y humor distendido. La historia nos muestra el porqué de esta circunstancia.\n\nEste pequeño instrumento tiene un largo camino detrás de sí, y se desarrolló desde el Cavaquinho portugués, un instrumento punteado tradicional de allí.\n\nEn el año 1879 el barco inglés Ravescraag trajo el Cavaquinho de Madeira a Hawaii.\n\nCuando aquellos emigrantes portugueses arribaron por fin a Honolulu tras muchas semanas de viaje, bailaron plenos de alegría acompañados por bailes e instrumentos de punteo de la familia del Cavaquinho.\n\nLos Hawaianos quedaron sorprendidos y curiosos por este pequeño instrumento en el que los dedos se movían rápidamente. Y probablemente de ahí surgió el nombre del ukelele, que significa algo así como “pulga saltarina“.\n\nPoco tiempo después empezaron a construirse los primeros ukeleles con la madera autóctona del lugar, la Koa.\n\nSoldados americanos trajeron el ukelele a tierra firme. Desde San Francisco se extendió aquella alegre cultura musical hasta Inglaterra. En esos tiempos el interés aumentó hasta tal punto que también importantes firmas como Martin & Co, Gibson y National produjeron ukeleles. En aquellos días los ukeleles se empleaban en estilos musicales como Jazz, Swing y Skiffle principalmente.\n\nDurante la década de los 60 continuó extendiéndose esa onda, sobre todo a través de la televisión, en Inglaterra con George Formby, como también con Marylin Monroe en 1959 como la ukelelista Sugar en el clásico de Hollywood “Some like it hot“ (con faldas y a lo loco). Y naturalmente también por medio de famosos artistas como los Beatles, a los que les gustaba tocar el ukelele en sus ratos libres.\n\nA partir de 1990 este instrumento de punteo también causó mayor atención en Alemania. Finalmente el ukelele se deshizo de su imagen de “instrumento de juguete“, y es un instrumento que incluso un principiante es capaz de afinar a los pocos minutos.\n\nImportantes maestros del ukelele han sido Roy Smeck, Eddie Kamae, Cliff Edwards, Bill Tapia, Herb Ohta y posteriormente “The Ukulele Orchestra of Great Britain”, Jake Shimabukuro, Julia Nunes, Stefan Raab, Taimane Gardner y Israel Kamakawiwoole, todos ellos contribuyeron a su medida para extender su popularidad.\n\n– CONSTRUCCIÓN DEL UKELELE\nBastidor\n\nUn bastidor fuerte absorbe menos vibraciones y proporciona con ello un mayor Sustain y un sonido más abierto. Por eso se recomienda emplear para el fondo y los aros una madera maciza o un laminado muy sólido.\n\nMadera de tapa\n\nPara la tapa se usan más bien y en general maderas macizas, aunque también los laminados de alta calidad que, en cualquier caso, están ganando cada vez mayor popularidad por su estructura tan especial.\n\nProblemática de entonación\n\nDebido a la corta medida, y sobre todo en los modelos Sopranino y Soprano en los registros altos, se pueden sufrir fácilmente irregularidades en la octavación. Esto se debe a su misma naturaleza, ya que al tocar en las zonas altas, el resto de cuerda es sencillamente muy corto. Aquí las técnicas de digitación se llevan al milímetro.\n\nPosición del puente\n\nPara permitir la entonación, también en ukeleles de muy corta escala, esta medida es alargada por muchos fabricantes en 2-3 mm. De esta forma se compensa la octavación a lo largo de todo el diapasón.\n\nAdemás la posición exacta del puente tiene una influencia notable en el sonido. Si se emplaza en la zona más ancha del cuerpo, la tapa es solo mínimamente afectada en su oscilación, lo que resulta en un mayor Sustain y volumen.\n\nVariantes\n\nHay 5 diferentes tamaños a elegir: Sopranino, Soprano, Concierto, Tenor y barítono, aunque las versiones más comunes se limitan a los modelos Soprano, Concierto y Tenor.\n\n¿Qué tamaño? y ¿Cuando? \n¡Soprano, concierto o tenor, todos los ukeleles aportan diversión!\n\nCon seguridad el toque con el ukelele soprano es algo más difícil debido a la posición algo más estrecha de sus trastes. Pero como instrumento solista es el que mejor transmite el tradicional Hawaii-Feeling, y tanto para músicos ambiciosos que ya han acumulado experiencia con instrumentos de cuerda como para no iniciados, no hay nada en contra en esta variante.\n\nEl tamaño concierto deja algo más de margen de toque para acordes, y es algo más fuerte en volumen que el soprano. Un buen compromiso entre los tamaños actuales y con ello el „dorado intermedio“.\n\nLos ukeleles tenores tienen un sonido voluminoso y son más fáciles de aprender por su medida algo más larga. Pero por eso digitaciones con grandes separaciones de intervalos son difíciles de realizar en este tamaño.\n\n– MATERIALES Y SONIDO\n¿Qué es importante para que un ukelele suene bien?\n\n¿En qué clase de precios hay que moverse para hacerse con un buen instrumento?\n\nSon preguntas que muchos se hacen antes de comprar un ukelele. Lo decisivo aquí son las maderas empleadas, la calidad de los materiales aplicados y cómo ha sido trabajado el instrumento.\n\nEl tipo de madera y construcción otorga el carácter.\n\nLos ukeleles pueden presentar diferentes medidas de rosetas o bocas, o distintos encolados o grosores de material, como también puede variar el tamaño a la profundidad del cuerpo. Todas estas características influyen en el sonido de un ukelele.\n\n¿Laminado o macizo?\n\nEncontramos ukeleles de maderas laminadas o macizas. Los modelos económicos son en su mayoría de laminados que a menudo suenan imprecisos, débiles y faltos de vida. Por eso algunos conocidos fabricantes de ukeleles emplean para sus líneas de modelos económicas laminados de alta calidad, que por su estructura especial ofrecen una mejor imagen sonora. Son recomendables las tapas de madera maciza y un cuerpo robusto. Un bastidor fuerte absorbe menos vibraciones y proporciona con ello mayor Sustain y un sonido más abierto al instrumento. Lo mejor naturalmente son los instrumentos completamente macizos. Las maderas de las tapas tienen en su mayoría un grosor aproximado de unos 1,8mm. Mejor al mismo precio es el veteado de las maderas flameadas, por ejemplo de arce (flamed maple) o Curly Koa. Esta óptica se clasifica en diferentes niveles de calidad, como son A, AA, AAA, AAAA, AAAAA.\n\nsí, claro, la óptica no tiene nada que ver con el sonido, ¡mucho más importante es material macizo!\nsi no se indica claramente madera maciza, se entiende que la terminación es de material laminado.\n\n¿Qué árbol suena mejor?\n\nPara el fondo y los aros fundamentalmente se recomienda una madera dura maciza. Para la tapa se puede tomar una madera de mayor o menor dureza dependiendo del sonido deseado. Los ukeleles terminados en Hawaii son la mayoría de madera maciza de Koa o caoba.\n\nKoa es una madera típica en los ukeleles que crece en Hawai.\nEste tipo de madera es conocido por su sonido fino, cálido y abierto. Los instrumentos suenan muy suave y, con buena calidad, diferenciados y claros. La acacia pertenece también a este tipo de árbol y tiene, tras un mismo tratamiento, unas propiedades sonoras similares. La Koa y la acacia se emplean para la tapa y el cuerpo.\n\nLa caoba es una madera muy apreciada y empleada frecuentemente. Es una madera tropical muy dura, que por ejemplo el fabricante americano Martin & Co emplea principalmente. Actualmente cualquier ukelele de Koa y caoba macizas como maderas principales es una buena oferta. El sonido de la buena caoba es también cálido y claro como el de la Koa. En comparación la caoba es más directa y centrada. De forma similar suenan también las maderas de Nato y Sapele, de la misma familia de maderas tropicales\n\nLa pícea se emplea a menudo en la construcción de instrumentos, y es una buena madera para las tapas de guitarras acústicas y ukeleles. Las tapas de pícea destacan por su sonido chispeante, brillante y\n\nOtras maderas como Bocote, Padauk, Pacific Walnut y Bubinga se ofertan a menudo como maderas exóticas, pero en su mayoría se trata solo de laminados\n\n¿Mate o brillante?\n\nEl lacado de alto brillo a menudo es claramente más grueso que el mate, y atenúa así la ondulación de la tapa. Las maderas lacadas en mate no merman el sonido.\n\nUn buen sonido con un lacado brillante solo se obtiene en instrumentos de alto valor, porque la terminación es muy costosa.\n\n– CUERDAS Y AFINACIÓN\n¿Cómo afino mi ukelele?\n\nLa afinación estándar (afinación hawaiana) es g’c’e’a’ y se puede emplear para instrumentos soprano, concierto y tenor.\n\nPero también hay afinaciones alternativas para los diferentes tamaños:\n\nDiferentes afinaciones:\n\nSopranino ( d’ g’ h’ e’ )\nSoprano ( g’ c’ e’ a’ ) o bien ( a’ d’ f#’ h’ )\nConcierto ( g’ c’ e’ a’ )\nTenor ( g’ c’ e’ a’ ) o bien ( c’ a’ c#’ f#’ )\nBarítono ( d’ g’ h’ e’ )\nBajo ( E A D G )\nEn la afinación GCEA se da un acorde C6 abierto, de esta manera se consigue el típico sonido del ukelele. Esta afinación se conoce también como “High G“. La cuarta cuerda se afina en alto y proporciona así el llamado „close voicing“.\n\nPor otra parte tenemos también la variante “Low G”, que se aplica especialmente en el toque solo. Esta afinación se emplea sobre todo en el ukelele tenor, y únicamente se puede tocar con cuerdas especiales “Low G”. El cambio de alto a bajo puede obligar a una adaptación de la cejuela, porque la cuerda superior es mucho más gruesa.\n\n– CONSEJOS Y TRUCOS\nTécnicas de toque:\n\nEl ukelele se puede tocar de pie o sentado, según vaya mejor con la canción. En largos ensayos naturalmente es más cómodo tocar sentado, y es mejor sujetar ligeramente el ukelele entre el brazo derecho y sobre la cadera y el tórax.\n\nComo en cualquier otro instrumento, el agarre debe ser cómodo y relajado. Tan pronto se adquiere seguridad y soltura en el toque del ukelele se puede empezar a probar a tocar de pie. La mano izquierda digita suavemente diferentes acordes y tonos individuales, mientras la mano derecha rasga o pulsa las cuerdas. Es importante el juego de muñeca y, practicando regularmente, también se pueden realizar filigranas con los dedos.\n\nCuidados:\n\nHay que prestar especial atención con el ukelel',4,NULL),(5,'Grabación con sonsolas de sonido: TIPS','Los mezcladores están disponibles en una gran cantidad de formatos y tamaños, y aunque la mayoría comparten los mismos fundamentos, hay muchas variantes y opciones para elegir. Dado que un mezclador será probablemente una de las mayores compras individuales que puedas hacer para tu configuración, es de gran importancia saber sus requisitos antes de comprarlo.\n\nHistóricamente, los mezcladores fueron diseñados específicamente para su uso tanto en configuraciones en vivo como en estudio, mientras que hoy en día, los productos de gama baja y gama media, incorporan en su diseño la flexibilidad que hace que el mismo mezclador se pueda utilizar en cualquier entorno. Si tienes la intención de utilizar la mesa de mezclas en un estudio, en un escenario, o como mezclador de monitorización, siempre deberás considerar las diferentes situaciones que pueden surgir en el futuro. Un número limitado de entradas, salidas y envíos auxiliares son las deficiencias más comunes de los mezcladores, así que es una buena idea tener unos cuantos extra, ya que a menudo te encontrarás con que los necesitarás en una fecha posterior.\n\nConsola de Mezcla Analógica Yamaha MGP24X 24 canales con FX DSP\nAunque incluso los mezcladores más básicos pueden parecer desalentadores para los no iniciados, una vez que entiendas un único canal de entrada y la sección de salida principal, tendrás más que suficiente -en última instancia, todo se divide en entradas o salidas. La sección de entrada del mezclador suele tener entradas de micrófono con conectores XLR balanceados, entradas de línea no balanceadas con conectores jack, o a menudo una combinación de ambos. Cada canal de entrada tendrá una selección de procesamiento de señales, tales como los controles de ganancia, ecualización, panorama y envíos auxiliares. La sección de salida agrupa todas las entradas juntas, listas para cualquier procesamiento final, antes de ser enviadas a la salida principal estéreo. En algunos casos, encontrarás ‘grupos’ o ‘buses’, donde se pueden agrupar una colección de canales individuales, para formar una sub-mezcla, permitiendo a todos ser controlados por un solo fader, antes de que su propia salida de grupo se encamine a la sección principal. Vamos a ver cada una de estas funciones un poco más de cerca en la sección ‘características’.\n\nEcualización (EQ)\nLa ecualización se utiliza para aumentar o reducir frecuencias específicas de sonido. Aunque el término fue pensado originalmente para describir la rectificación o la ‘igualación’ de un sonido, ahora es utilizado a menudo como una forma para mejorar la señal. Hay un número de diferentes tipos de EQ, pero los mezcladores siempre ofrecen algún tipo de EQ ‘paramétrico’ en los canales de grabación, y a veces un ecualizador ‘gráfico’ en la sección master. Un ecualizador paramétrico ofrece hasta tres potenciómetros de control por banda -ganancia (lo que se conoce como ‘corte’ en sus fases negativas), la frecuencia central y el ancho de banda o ‘Q’, que determina la distancia alrededor de la frecuencia central sobre la que el control de ganancia es eficaz. Ten en cuenta que cualquier aumento o corte aplicado tendrá forma de ‘campana’ en torno a la frecuencia central. Los ecualizadores con estos tres controles por banda son conocidos como ‘totalmente paramétricos’; los que tienen sólo la ganancia y la frecuencia, como ‘semi-paramétricos’; y aquellos que operan a frecuencias fijas, no son realmente paramétricos en absoluto, pero poseen controles de tono ‘glorificados’ que todavía pueden ser muy útiles. Los ecualizadores gráficos funcionan a una serie de frecuencias fijas, cada una controlada por su propio regulador.\n\nFiltro Paso Alto (HPF)\nTambién se encuentran generalmente en la parte superior del canal. Un filtro paso alto es una herramienta invaluable, permitiendo la atenuación de frecuencias graves, que de otro modo podrían estorbar encima de tu mezcla. Son particularmente útiles para eliminar retumbes captados por los micrófonos, ya sea de baja frecuencia en el escenario, con fuentes tales como pantallas para bajos y bombos, o los pasos transmitidos a través de los soportes de micrófono. La mayoría de filtros paso alto se fijan a una frecuencia específica, normalmente alrededor de 100Hz, aunque algunos ofrecen control separado sobre éste.\n\nSalidas Directas\nLas salidas directas suelen configurarse con pre-EQ (aunque esto a veces se puede cambiar) y se encuentran normalmente en todos los canales de los mezcladores que las tienen. Al conectar la señal directamente a un grabador multipista o DAW, permiten que la señal básica de cada canal sea grabada sin procesamiento -ésta puede ser devuelta a la mesa de mezclas más adelante para la mezcla. Las salidas directas también pueden tener un buen uso en entornos en vivo, para realizar grabaciones susceptibles de ser mezcladas en una fecha posterior.\n\nPuntos de Inserción\nLas conexiones de inserción proporcionan tanto una entrada como una salida, por lo general en un solo conector Jack TRS (punta-anillo-lateral). Por lo general, están situadas junto a las conexiones de entrada y son específicas para el canal asociado. A medida que envían toda la señal, normalmente se utilizan para la conexión de procesadores de dinámica tales como compresores y puertas de ruido.\n\nAuxiliares\nLos auxiliares o ‘aux’ son el punto habitual en el que conectar procesadores de efectos externos, y se utilizan para enviar una copia de una señal a partir de uno o más canales, a un dispositivo externo tal como una unidad de reverberación. El nivel de la copia de cada canal, está controlado por su propio potenciómetro -el canal de ‘aux send’ (envío auxiliar). Una consola, por lo general, tiene un control maestro sobre la mezcla de los envíos auxiliares de todos los canales. Un retorno auxiliar es una entrada estéreo, diseñada para la señal de retorno de una unidad de efectos y normalmente alimenta directamente al bus de mezcla. Las consolas más grandes tienen varios buses auxiliares para su uso con múltiples unidades de efectos. Otro uso común para los envíos auxiliares es proporcionar mezclas de auriculares independientes en el estudio, o mezclas foldback en el escenario, en un entorno en vivo. Para este tipo de uso, es importante la utilización de canales auxiliares ‘pre-fader’ -mira la sección ‘Términos importantes’ para obtener una explicación.\n\nPanorama\nLos controles PAN (abreviatura de ‘panorama’), controlan el equilibrio de la señal de cada canal que se envía a las salidas izquierda y derecha -una posición central envía cantidades iguales a ambos, lo que resulta en que el sonido parezca venir del centro del campo estéreo.\n\nMuteo\nEs un botón que silencia el canal seleccionado(s) independientemente de la posición del fader. Después de silenciarlo, el usuario puede volver rápidamente el canal a su estado anterior, sin tener que reajustar el nivel de nuevo, como así sería en el caso de utilizar el deslizador para silenciarlo.\n\nFader\nEn la parte inferior de cada canal de grabación, hay un atenuador o un potenciómetro para controlar el nivel de la señal enviada a la salida principal –los productos de gama alta tienden a tener faders de largo recorrido con una resolución más alta.\n\nTÉRMINOS IMPORTANTES\nPre/Post Fade\nEs un término utilizado para describir la ruta de la señal de audio dentro de una mesa de mezclas, más comúnmente aplicado a los envíos auxiliares. Pre-fade significa que el envío auxiliar no se ve afectado por el nivel de fader principal, (y a veces también la EQ) -Esto se utiliza generalmente para la monitorización y las mezclas de auriculares, dando al artista una mezcla que es independiente de la mezcla principal. Como alternativa, las señales post-fade se ven afectadas por el nivel de fader, y se utilizan normalmente para envíos de efectos donde el nivel del efecto o la señal ‘húmeda’, por lo tanto, sigue el nivel de la señal no tratada o ‘seca’.\n\nBalanceada o No Balanceada\nDescribe la forma de transferencia de la señal desde la fuente al destino. Las señales balanceadas requieren una salida equilibrada en un extremo y una entrada equilibrada en el otro extremo, a fin de entregar sus ventajas, que es la reducción sustancial de cualquier ruido inducido por el cable. Esto se logra mediante el envío de la señal de audio a dos núcleos separados del cable, uno de los cuales tiene su fase invertida. En el otro extremo, la señal invertida se re-invierte y se combina con la señal sin tratar, momento en el cual cualquier interferencia que se haya captado por el cable será cancelada, dejando la señal original en fase, con el doble de fuerza y sin ninguna interferencia. Las conexiones balanceadas suelen realizarse a través de XLR o conexiones jack Tip-Ring-Sleeve (TRS). Una conexión jack TRS balanceada tendrá dos anillos en el conector, al revés de una no balanceada que tiene sólo uno. Los Jack TRS se conocen a veces como jacks ‘estéreo’, ya que también se pueden utilizar para transmitir una señal estéreo no balanceada. El principal problema cuando se utilizan conexiones no balanceadas, es el de la lucha contra las interferencias, y aunque es un problema menor en las aplicaciones más pequeñas, los cables no balanceados utilizados en entornos que requieran de tiradas más largas de cable, pueden sufrir de zumbidos no deseados. Casi todos los micrófonos y entradas de micrófono son balanceados, a pesar de que las entradas y salidas de nivel de línea pueden variar.\n\nCONCLUSIÓN\nLos mezcladores realmente vienen en una amplia gama de configuraciones, y varían mucho en calidad. Se debe tener cuidado al seleccionar el mezclador adecuado para tus necesidades, y deberías considerar hacer un poco de previsión para necesidades futuras. Esperamos que esta Guía Online te haya ayudado a comprender mejor los mezcladores y su terminología asociada, y te hayamos dado más confianza para tu próxima compra.\n\nKalimba Música te puede ofrecer las mejores Consolas, en sus diversos tipos. ¡Te esperamos!',32,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (3,'Guitarra eléctrica Stratocaster',20000,10,1,'Una guitarra diseñana para diestros, de origen  Mexicano, madera de arce, un color customizable con un acabado brilloso, las comunes 6 cuerdas, 22 trastes y 3 microfonos\n','error.jpg',1,1,1,1,NULL),(4,'Guitarra Eléctrica RGX121Z - Humbucker - HSH',15000,15,1,'Pastillas humbucker cerámicas abiertas para la RGX220DZ/121Z\nLos imanes cerámicos se utilizan por su mayor potencia y su rango tonal más amplio. Estas pastillas producen una distorsión más clara.\n','error.jpg',1,1,3,1,NULL),(5,'Piano Digital P-121 de 73 teclas\n',15000,15,1,'El Yamaha P-121 es un piano digital compacto de 73 teclas que combina una interpretación pianística excelente con un nuevo diseño sencillo y minimalista. Fácilmente transportable y muy accesible; la versatilidad de este instrumento te permite disfrutar de la sensación de tocar un piano, en cualquier lugar.\n','error.jpg',2,8,3,13,NULL),(6,'Piano de cola clásico - Yamaha',50000,20,1,'Un piano de armazon negro y teclas de marfil, con un requerimiento espacial de 3 metros cuadrados, ademas posee 7 octavas y 3 pedales para generar sonidos inolvidables.\nPiano de cola Clasico\n','error.jpg',2,8,3,12,NULL),(7,'Cajon Peruano Leonard Cajpee Guatambu Rustico\n',10000,0,1,'Este instrumento ofrece bellos sonidos de cajón verdaderamente auténticas para satisfacer a los jugadores más exigentes. La construcción de cola de milano de carpintería se utiliza para una mirada tradicional detallada.\n','error.jpg',3,13,7,19,NULL),(8,'Kalimba RXT-300 modelo 1914\n',4000,0,1,'El kalimba consta de 7 piezas metalicas, que resuenan sobre su caja de resonancia, que es similar a un caparazon de tortuga. Cada nota se sostiene permitiendo generar un clima calido y armonico.\n\n','error.jpg',3,18,4,26,NULL),(9,'Armonica Folkmaster En Sol 1072 G\n',2000,0,1,'La armónica Folkmaster 1072 es fácil de tocar y a la vez económica para comprar. Su claridad de sonido excepcional y puesta a punto perfecta es posible gracias a un proceso exclusivo de fabricación láser.\n','error.jpg',4,21,3,32,NULL),(10,'Flauta dulce soprano - YRS312\n',2500,0,1,'Flauta dulce, ideal para tus primeros pasos en la musica, muy popular en instituciones de enseñanza basica. Tiene un sonido muy delicado, y en las manos de un maestro se puede cautivar un publico sin el apoyo de ningun otro instrumento.\n','error.jpg',4,19,3,28,NULL),(11,'Parlante Bluetooth Fender Newport 30 Watts Compacto Portatil\n',3700,0,1,'Nos encontramos ante un altavoz que no solo busca enamorar con su diseño clásico, sino además con su gran reproducción de los graves mediante la implementación de 2 woofers, y la novedosa incorporación de un micrófono para poder atender las llamadas de tu Smartphone.\n','error.jpg',5,27,1,43,NULL),(12,'Afinador RX - Taylor\n',3700,0,1,'Afinador para guitarras, consta de afinaciones estandar y no estandar, con este afinador de tu lado si tus notas suenan mal lamentablemente no es el instrumento sos vos );\n\n','error.jpg',5,28,2,44,NULL),(52,'Violin 4/4 Tallado A Mano Cuello Y Scroll Sv-130 ',12000,10,1,' Tallado a mano, tapa de pícea sólida de arce macizo cuello y scroll.Filetes incrustados.Nuevo translúcido, cálido color marrón.Accesorios de ébano y VP-61 cordal de aleación con (4) integrado finetuners puente VP-202 CremonaArco de Deluxe de tienda con forma de lazo con crin de caballo genuina sin blanquear color blanco ligero y duradero para violín ajustable. ','image-1594824155533.jpg',1,3,5,6,NULL),(53,'Flauta Traversa YFL211 ',12000,10,1,' Con un diseño y fabricación de la misma calidad que los modelos de las series 300 y 400, las flautas de la serie 200 están fabricadas en resistente níquel plata con un atractivo acabado de baño de plata. Se caracterizan por ofrecer una respuesta y una entonación excelentes.\r\n ','image-1594824171466.jpg',4,19,3,27,NULL),(54,'Ukelele Tamaño Concierto Fender ',5000,5,1,' Bautizado con la palabra hawaiana \"sonrisa\", el Mino\'Aka es un ukelele de tamaño concierto que seguro te hará sonreír. Se trata de un \"uke\" realizado en caoba, con una acertada estética y gran calidez de sonido, que resulta ideal para distintos estilos musicales, desde los sonidos tradicionales de las islas hasta el pop actual. Incluso con su precio asequible, este alegre ukelele presenta diapasón y puente de palosanto, cejilla y selleta de hueso para un mayor equilibrio de sonido y sustain, y ','image-1594824190329.jpg',1,4,1,7,NULL),(55,'Saxófon Alto YAS-875EX ',12000,30,1,' El nuevo saxofón alto Yamaha YAS-875EX Custom EX marca un gran paso adelante para el diseño del saxofón. Ofreciendo a los jugadores una gran cantidad de nuevas posibilidades musicales, el nuevo Custom EX ha sido diseñado en colaboración con algunos de los saxofonistas más talentosos del mundo, incluidos Nobuya Sugawa, Jean-Yves Fourmeau y Otis Murphy. Su inestimable aportación ha significado que Yamaha ha podido crear un instrumento que suena muy bien, es cómodo de tocar y que evoluciona consta','image-1594824207827.jpg',4,20,3,29,NULL),(56,'Contrabajo Yamaha Slb100   ',80000,40,1,'  El SLB100 permite interpretar tonos adecuados para una gran variedad de instrumentos musicales. Los bajistas sabrán apreciar la posibilidad de ensayar en silencio, mientras escuchan toda su tonalidad a través de auriculares.   ','image-1594824031008.jpg',1,5,3,7,NULL),(57,'SELMER PARIS - SERIE III Saxofón Tenor Plata Maciza ',20000,10,1,' Abrazadera Selmer metálica grabada. Apoyapulgar metálico (orientable). Boquilla Selmer S 80C*. Boquillero Selmer metálico grabado. Cordón colgador Selmer al cuello. Estuche Selmer modelo Ligth. Gamuza interior pañuelo con contrapeso. Gamuza limpieza especial para lacados. Grasa para corchos. Llaves de latón grabado. Muelles de aguja en acero inoxidable. Zapatillas de cuero con resonadores matálicos. ','image-1594824230607.jpg',4,20,4,30,NULL),(58,'Charango Madera Pino Coro Artesanias Nylon Musicapilar ',2000,0,1,' Charango Luthier Nacional. Material De madera. Pino Amarillo Macizo. Sobretapa de cedro. Excelente Sonido. Hecho a mano. ','image-1594824253670.jpg',1,6,7,9,NULL),(59,'Rocket Music BH01C - Armónica en Do Mayor ',2000,0,1,' 10 azules armónica del agujero con 20 tonos, pura y brillante precioso y sonido fuerte, cubierta metálica exterior y acabado en plata. ','image-1594824269591.jpg',4,21,6,32,NULL),(60,'Arpa Profesional 19 Cuerdas Nylon Madera  ',70000,20,1,' Arpa de 19 cuerdas color madera natural necee and body mahogany (caoba) top maple (arce) cuerdas standard medidas 745 x 405 x 209. ','image-1594824284290.jpg',1,7,4,10,NULL),(61,'Tuyama tst-171 Slide trompeta (soprano trombón) ',30000,5,1,' Trompeta de Latón con un, slide exterior de níquel chapado en plata y un slide interior de cromo duro, posee un Calibre: 11,5 mm; Bell Diámetro: 120 mm.  ','image-1594824300441.jpg',4,22,5,33,NULL),(62,'Teclado Estudio 5 Octavas 61 Teclas Sensitivo  ',15000,0,1,' 54 teclas. 6 canciones de demostración16 tonos. 10 ritmos. 8 efectos de percusión.4,5 Octavas. Chord / Fill-in. Control de volumen y tiempo. Display LCD. Microfono incluido. ','image-1594824319711.jpg',2,10,3,15,NULL),(63,'Trompeta Knight Jbtr-300 ',35000,10,1,' Excelente trompeta, con un excelente mecanismo y de gran duración, se presenta con un estuche rígido, que da gran protección al instrumento.La máquina de pistones está fabricada en CUPRONICKEL, lo que otorga un sonido pocas veces escuchado en este rango de precios. ','image-1594824339760.jpg',4,22,5,34,NULL),(64,'Acordeón de teclas  ',12000,0,1,' El acordeón ha sido el instrumento preferido de muchos músicos lo largo de generaciones. Su sonido único diseño y la calidad de la firma hace que para la gran música, horas de baile enérgico, y un tiempo de todo-en torno maravilloso.Tiene 8 Bajos, 22 Teclas chicas. Color azul con correa y estuche incluido. ','image-1594824358048.jpg',2,11,6,16,NULL),(65,'Trombon Alto Benson Ftc151 ',45000,15,1,' Trombón alto en Mib 3049 B&S 11,2-11,7mm dual bore 170mm campana en gold brass Acabado lacado Incluye estuche original y accesorios.Trombón alto en Mib 3049 B&S 11,2-11,7mm dual bore 170mm campana en gold brass Acabado lacado Incluye estuche original y accesorios. ','image-1594824373271.jpg',4,23,2,29,NULL),(66,'Bateria 5 cuerpos 10009VL  ',100000,50,1,' Bateria 5 cuerpos que incluye fierros,  pedal y banque. Diámetro del bombo 18in. Madera birch.  ','image-1594824395380.jpg',3,12,3,18,NULL),(67,'Trombon Thomann SL 5 Soprano  ',60000,20,1,' Excelente Trombón a Vara Tenor en bronce, construcción de primera con un gran sonido, además incluye el estuche rígido reforzado.  ','image-1594824413079.jpg',4,23,6,36,NULL),(68,'Bombo De Batería 16x18  ',2000,0,1,' El casco es de Araucaria 1ra selección,en 6mm y 9 en los bordes. Incluye elevador y se entrega armado completo. ','image-1594824432222.jpg',3,14,3,20,NULL),(69,'Bandoneon Clasico Doble A ',40000,10,1,' Un excelente bandoneon doble AA en muy buen estado, tocado y evaluado por bandoneonistas profesionales, contruido para producir las mejores lineas melodicas. Peines de zinc. ','image-1594824450187.jpg',4,24,7,37,NULL),(70,'Bongo Profesional Superior 6x7 ',2000,0,1,' Madera Genuina. Parches de cuero. Afinación mediante tensores. Laqueados. Medidas 6,5\" y 7,5\" pulgadas. Incluye llave para afinación. Acabado en color natural laqueado. Herrajes Black. ','image-1594824472182.jpg',3,15,4,21,NULL),(71,'Cuerdas de Guitarra ',1200,0,1,' Encordado Gauchita Guitarra Clasica Criolla\r\n6 cuerdas de nailon con media tension ','image-1594824499005.jpg',5,25,2,38,NULL),(72,'Pandereta Aro Media Luna Reforzado ',3500,0,1,' Pandereta Aro Media Luna Reforzado. 20 CM de diametro,  32 sonajas. ','image-1594824577988.jpg',3,16,3,23,NULL),(73,'Cuerdas de Bajo ',1200,0,1,' Encordado Orphee Vx120 Niquel\r\n4 cuerdas chinas de niquel . ','image-1594824594179.jpg',5,25,1,39,NULL),(74,'Triangulo Percusion Metalico 17cm ',3000,0,1,' Material Metal. Mide 17 cm cada lado. Incluye  Triangulo, Golpeador y Colgante. Excelente instrumento de percusión tanto para chicos como adultos. ','image-1594824613306.jpg',3,17,1,24,NULL),(75,'Amplificador VOX VTX Series VT20X Valvular 20W ',50000,10,1,' Cuenta con 4 canales, conectores de entrada tipo Normal Jack, Aux Jack, Footswitch Jack, USB, conectores de salida tipo Headphone Jack., potencia de salida de 20W y un peso de 7.3kg. ','image-1594824628952.jpg',5,26,6,40,NULL),(76,'Kalimba Acústica 7 Notas ',3500,5,1,' Kalimba de coco de 7 notas. Importada de Indonesia. Excelente terminación y calidad de sonido. ','image-1594824646451.jpg',3,18,5,26,NULL),(77,'Amplificador VOX Hand-Wired Series AC30HWH Valvular 30W ',50000,15,1,' Conectores de entrada tipo Normal high Jack, Normal low Jack, Top boost high Jack, Top boost low Jack, Footswitch Jack, conectores de salida tipo External speaker Jack, potencia de salida de 30W y un peso de 20.3kg. ','image-1594824662955.jpg',5,26,9,41,NULL),(78,'Placa de sonido audio 1 sonido usb ',30000,0,1,' 2 entradas: 1 entrada XLR de micrófono con alimentación phantom, 1 entrada de jack con control individual de ganancia. Salida RCA estéreo. Vúmetro para ajustar los niveles. Monitorización directa para incluir la reproducción de audio mientras se graba. Gran dial de volumen. Salida de auriculares con señal de alta potencia y control de volumen. ','image-1594824677708.jpg',5,32,9,52,NULL),(79,'Parlante Tedge 8\" portátil inalámbrico   ',30000,0,1,' Formato caja con frecuencia mínima de 50Hz y máxima de 20kHz, posee Bluetooth, incluye control remoto y micrófono.   ','image-1594824694890.jpg',5,27,9,43,NULL),(80,'Cable USB a Tipo C 2 amper 2 Metros  ',1000,0,1,' Cable de 2 metros de Longitud. Apto para Carga y Datos. Usb 2.0. 2 Amper. ','image-1594824710433.jpg',5,31,9,50,NULL),(81,'Afinador Tipo Clip Pinza Alabama Tc-101 - Oddity  ',1200,0,1,'  El ALABAMA TC-101 es un afinador de pinza cromático para guitarra, bajo, ukelele, violin, etc. Su clip articulado permite una movilidad total de la pantalla. Incluye batería.  ','image-1594824725891.jpg',5,28,9,44,NULL),(82,'Transformador Electronico 220/110v 2000w   ',2200,0,1,'  Transformador reductor. Entrada Ac.220v. Salidad Ac.110v. Potencia 2,000watt. Dimensiones 7.5x5.5x5 cm.\r\n  ','image-1594824745546.jpg',5,30,9,49,NULL),(83,'Funda de guitarra  ',2200,0,1,' Fundas para guitarras, con dos cierres y bolsillos para tus puas y accesorios. ','image-1594824758205.jpg',5,29,7,46,NULL),(84,'Transformador Elevador Convertidor 12v A 24v 10a  ',2000,0,1,' Eficiencia de 94% (media carga), 92% (carga completa), tensión de salida: 24VCC, corriente de salida: 10A, potencia nominal de salida: 240W, pico de potencia de salida: 255W, regulación de voltaje: <1%, ripple de <100mv ','image-1594824771273.jpg',5,30,9,48,NULL),(85,'Piano eléctrico digital P45 de 7 octavas ',60000,10,1,' Piano Digital de Escenario\r\nTeclas con peso tipo martillo para una experiencia única.\r\nLa acción de martillo contrapesada (Graded Hammer Standard) de Yamaha ofrece la misma sensación que se experimenta en un piano acústico.\r\nUn sonido sorprendentemente natural y preciso.\r\nEl sonido del P-45B ha sido posible gracias a la utilización de tecnología digital para grabar el timbre de un piano acústico. El AWM Stereo Sampling consigue un sonido más profundo, rico y espacioso empleando pares de ondas (','image-1594825122668.jpg',2,9,3,13,NULL);
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
INSERT INTO `products_users` VALUES (76,4,NULL,3),(64,4,NULL,4),(80,4,NULL,7),(77,4,NULL,13),(73,4,NULL,18),(83,4,NULL,19);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,2,'Joaquin','Girod',1158365508,'2001-03-14','joacogirodQgmail.com','12345678','Avatar.jpg',NULL),(3,2,'Mar','H',2147483647,'2000-04-05','sol_delia@hotmail.com','$2a$10$Tr3TfVwrA4ptUqJDaXMwv.cvRWYSe7yPg0/ylgRRC8NCNvlGT3D.C','image-1594322819136.jpg',NULL),(4,1,'Margarita','Hazaña',1134680021,'2000-12-30','margaritahazana@gmail.com','$2a$10$9sOLgMmdUuLGs.08p3/nd.kQwqNSdCVIvcvWuTg7c3l6lQAeTqo7G','image-1594421264925.jpg',NULL),(5,2,'Margarita','Hazaña',1223344554,'2000-12-30','margaritahazana@gmail.com','$2a$10$QdsLyfeRMBXNtoDScbdHDOu32QHq6dYixeai4hy6e7g7sW5rDevje','image-1594421670726.jpg',NULL),(6,2,'Margarita','Hazaña',2147483647,'3444-02-23','sol_delia@hotmail.com','$2a$10$iITPWBEe6K/hFV1yEO0g2.7Xy6OcjudHIcSjEmWGvlgaVPZ0FtnbO','image-1594422031122.jpg',NULL),(7,2,'Mar','H',2147483647,'1111-11-11','margaritahazana@gmail.com','$2a$10$fRI2tlqwwRCSStULnKGZPuRJpq8u1iHUqfCzPdQFdaPTNjGfFDHcm','image-1594571719346.JPG',NULL),(8,2,'Pepe','Pepe',1234567890,'2000-12-23','tcheng0@vimeo.com','$2a$10$pFejv5B6UHsjcylKduzpXubPBiGwpjXDW0nL/YCYwF53EFyDsE.fS','image-1594682347181.jpg',NULL);
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

-- Dump completed on 2020-07-15 12:23:47
