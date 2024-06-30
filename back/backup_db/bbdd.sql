-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: prueba_back
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `platillo_id` int(11) DEFAULT NULL,
  `valoracion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `valoracion_id` (`valoracion_id`),
  KEY `platillo_id` (`platillo_id`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`valoracion_id`) REFERENCES `valoracion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`platillo_id`) REFERENCES `platillo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen`
--

DROP TABLE IF EXISTS `imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platillo_id` int(11) NOT NULL,
  `url_img` varchar(300) DEFAULT NULL,
  `texto_alt` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `platillo_id` (`platillo_id`),
  CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`platillo_id`) REFERENCES `platillo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen`
--

LOCK TABLES `imagen` WRITE;
/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
INSERT INTO `imagen` VALUES (1,1,'./ImgMenu/Pappardelle.jpg','Pappardelle'),(2,2,'./ImgMenu/batatas-Rellenas.jpg','Batatas Rellenas Marroquíes'),(3,3,'./ImgMenu/ceviche-de-lubina.jpg','ceviche de lubina'),(4,4,'./ImgMenu/Roast-Beef-con-Pure.jpg','Roast Beef con Pure'),(5,5,'./ImgMenu/bizcocho-limon-glaseado.jpg','bizcocho limon glaseado'),(6,6,'./ImgMenu/Souffle-de-Mango-y-Coco.jpg','Souffle de Mango y Coco'),(7,7,'./ImgMenu/Mousse-de-Frutas-del-Bosque.jpg','Mousse de Frutas del Bosque'),(8,8,'./ImgMenu/Smoothies-de-Frutas-Exotica.jpg','Smoothies de Frutas Exotica'),(9,9,'./ImgMenu/Mocktails-sin-alcohol.jpg','Cocteles sin alcohol');
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platillo`
--

DROP TABLE IF EXISTS `platillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platillo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plato` varchar(50) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `precio` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platillo`
--

LOCK TABLES `platillo` WRITE;
/*!40000 ALTER TABLE `platillo` DISABLE KEYS */;
INSERT INTO `platillo` VALUES (1,'Pappardelle','Permíteme presentarte nuestro exquisito Pappardelle, una pasta italiana que te transportará a la Toscana con cada bocado. El Pappardelle es más que un simple plato; es una obra maestra de la gastronomía italiana. Nuestra pasta Pappardelle es perfecta para absorber salsas espesas y sustanciosas. Servimos nuestro Pappardelle en platos amplios y elegantes, donde las cintas anchas se entrelazan, creando una presentación visualmente impactante. En nuestro restaurante, el Pappardelle es más que un plato. Es un viaje a la Italia más auténtica',0),(2,'Batatas Rellenas Marroquíes','En nuestro restaurante, las Batatas Rellenas Marroquíes se sirven en un plato de cerámica artesanal, acompañadas de un trozo de pan recién horneado. El aroma a especias llenará el aire mientras el cliente se prepara para sumergirse en esta experiencia culinaria única. Las batatas, tiernas y caramelizadas, se deshacen en la boca, y el contraste entre el dulzor y el picante es simplemente irresistible.',0),(3,'Ceviche de Lubina','En nuestro restaurante, servimos el Ceviche de Lubina en un plato blanco, resaltando los colores vibrantes de los ingredientes. Las láminas de cebolla roja se entrelazan con los cubos de lubina, y el aroma del cilantro fresco te invita a probar cada bocado. Los patacones crujientes se sirven al lado, listos para acompañar este festín de sabores.',0),(4,'Roast Beef con Puré de Papas','En nuestro restaurante, servimos el Roast Beef con Puré de Papas en un plato de porcelana blanca. El roast beef se corta en rodajas generosas y se coloca sobre una cama de puré de papas. La salsa de carne se vierte con elegancia, y las verduras asadas se disponen alrededor del plato. El aroma a hierbas frescas y la textura suave del puré te invitarán a disfrutar cada bocado.',0),(5,'Bizcocho con Glaseado de Limón','Para los amantes del clásico con un toque cítrico, presentamos nuestro Bizcocho con Glaseado de Limón. En un plato blanco, el bizcocho esponjoso se adorna con una capa brillante de glaseado de limón. Cada bocado es una explosión de sabor: dulzura equilibrada con la frescura del limón. Perfecto para acompañar un café o té. ¡Déjate tentar por esta delicia!',0),(6,'Soufflé de Mango y Coco','¿Listo para un viaje tropical? Nuestro Soufflé de Mango y Coco es una explosión de sabores exóticos. En un plato elegante, presentamos un soufflé dorado y esponjoso, con trozos jugosos de mango y un toque de coco rallado. El dulzor natural del mango se combina con la textura crujiente del coco. ¡Una delicia que te transportará a playas paradisíacas.',0),(7,'Mousse de Frutas del Bosque','Sumérgete en la frescura de nuestro Mousse de Frutas del Bosque. En un elegante vasito, servimos una mousse suave y aireada, coronada con frutos rojos frescos. Cada cucharada es un viaje a los bosques silvestres, donde los sabores naturales se mezclan en armonía. Ideal para aquellos que buscan un postre ligero y lleno de autenticidad. ¡Disfruta de la naturaleza en cada bocado!',0),(8,'Smoothies de Frutas Exótica','Descubre la magia de las Bebidas de Frutas Exóticas. Cada sorbo es un viaje a tierras lejanas y sabores únicos. Nuestros mixólogos han creado combinaciones vibrantes que te transportarán a playas tropicales y mercados coloridos. Desde el primer trago, sentirás la frescura de la piña, la dulzura del mango y la exuberancia de la guanábana. ¡Sumérgete en la experiencia y déjate llevar por la naturaleza!',0),(9,'Mocktails sin alcohol','Nuestros Mocktails Creativos son la prueba de que la diversión no necesita ron ni vodka. Desde el Virgin Mojito con su frescura a base de menta y lima, hasta el intrigante Spritz sin Alcohol con su burbujeante Aperol sin vino. Cada sorbo es una celebración de la creatividad y el sabor. Así que, ¿por qué no brindar con algo diferente? ¡Salud!',0);
/*!40000 ALTER TABLE `platillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoracion`
--

DROP TABLE IF EXISTS `valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platillo_id` int(11) NOT NULL,
  `comentario` varchar(200) DEFAULT NULL,
  `valoracion` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `platillo_id` (`platillo_id`),
  CONSTRAINT `valoracion_ibfk_1` FOREIGN KEY (`platillo_id`) REFERENCES `platillo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoracion`
--

LOCK TABLES `valoracion` WRITE;
/*!40000 ALTER TABLE `valoracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `valoracion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-30 17:47:12
