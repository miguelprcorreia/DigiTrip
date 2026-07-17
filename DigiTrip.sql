-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: DigiTrip
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

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
-- Table structure for table `Comentario`
--

DROP TABLE IF EXISTS `Comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comentario` (
  `idComentario` int NOT NULL AUTO_INCREMENT,
  `Texto` text NOT NULL,
  `Avaliacao` decimal(2,1) NOT NULL,
  `DataPublicacao` datetime NOT NULL,
  `idViajante` int NOT NULL,
  `idViagem` int NOT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `idViajante` (`idViajante`),
  KEY `idx_comentario_avaliacao_viagem` (`idViagem`,`Avaliacao`),
  KEY `idx_comentario_avaliacao` (`Avaliacao`),
  KEY `idx_comentario_data` (`DataPublicacao`),
  KEY `idx_comentario_idViagem` (`idViagem`),
  CONSTRAINT `Comentario_ibfk_1` FOREIGN KEY (`idViajante`) REFERENCES `Viajante` (`idViajante`),
  CONSTRAINT `Comentario_ibfk_2` FOREIGN KEY (`idViagem`) REFERENCES `Viagem` (`idViagem`),
  CONSTRAINT `chk_avaliacao` CHECK (((`Avaliacao` >= 0.0) and (`Avaliacao` <= 5.0) and (((`Avaliacao` * 2) % 1) = 0)))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comentario`
--

LOCK TABLES `Comentario` WRITE;
/*!40000 ALTER TABLE `Comentario` DISABLE KEYS */;
INSERT INTO `Comentario` VALUES (1,'Museus e ruas históricas fantásticos!',5.0,'2024-02-06 10:00:00',2,1),(2,'Adorei os detalhes arquitetónicos.',4.5,'2024-02-06 11:00:00',3,1),(3,'Fotografia perfeita, lugares incríveis.',5.0,'2024-02-06 12:00:00',5,1),(4,'Trilhas desafiadoras e paisagens lindas.',4.5,'2024-03-16 09:00:00',2,2),(5,'Caminhada muito bem organizada.',4.0,'2024-03-16 10:00:00',4,2),(6,'Museus incríveis, recomendo a visita.',5.0,'2024-04-06 09:00:00',2,3),(7,'Aprendi muito sobre a cultura portuguesa.',4.5,'2024-04-06 10:00:00',5,3),(8,'Carnaval animadíssimo e divertido!',5.0,'2025-03-08 11:00:00',1,4),(9,'Energia incrível nas ruas do Rio.',4.5,'2025-03-08 12:00:00',3,4),(10,'Praias lindas e água cristalina.',5.0,'2024-06-08 10:00:00',1,5),(11,'Relaxamento total, muito bom!',4.5,'2024-06-08 11:00:00',4,5),(12,'Safari espetacular, animais incríveis!',5.0,'2025-04-21 16:00:00',2,6),(13,'Paisagens naturais maravilhosas.',4.5,'2025-04-21 17:00:00',4,6),(14,'Museus e história locais fascinantes.',4.5,'2024-05-13 10:00:00',1,7),(15,'Aprendi muito sobre a cultura angolana.',4.0,'2024-05-13 11:00:00',5,7),(16,'Castelos lindos e bem preservados.',5.0,'2025-05-16 09:00:00',1,8),(17,'Muito interessante a arquitetura histórica.',4.5,'2025-05-16 10:00:00',3,8),(18,'Parques naturais incríveis e bem cuidados.',4.5,'2024-07-16 12:00:00',2,9),(19,'Trilhas bem sinalizadas e vistas fantásticas.',4.0,'2024-07-16 13:00:00',5,9),(20,'Gastronomia francesa maravilhosa, recomendo!',5.0,'2024-08-06 13:00:00',1,10),(21,'Paris tem pratos incríveis e restaurantes excelentes.',4.5,'2024-08-06 14:00:00',2,10),(22,'Experiência gastronômica incrível.',4.5,'2024-08-06 15:00:00',4,10);
/*!40000 ALTER TABLE `Comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Conteudo`
--

DROP TABLE IF EXISTS `Conteudo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Conteudo` (
  `idConteudo` int NOT NULL AUTO_INCREMENT,
  `Tipo` tinyint NOT NULL,
  `Url` varchar(2048) NOT NULL,
  `Legenda` text,
  `idLocalidade` int NOT NULL,
  `idViagem` int NOT NULL,
  PRIMARY KEY (`idConteudo`),
  KEY `idLocalidade` (`idLocalidade`),
  KEY `idViagem` (`idViagem`),
  CONSTRAINT `Conteudo_ibfk_1` FOREIGN KEY (`idLocalidade`) REFERENCES `Localidade` (`idLocalidade`),
  CONSTRAINT `Conteudo_ibfk_2` FOREIGN KEY (`idViagem`) REFERENCES `Viagem` (`idViagem`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conteudo`
--

LOCK TABLES `Conteudo` WRITE;
/*!40000 ALTER TABLE `Conteudo` DISABLE KEYS */;
INSERT INTO `Conteudo` VALUES (1,0,'https://pics.com/lisboa1.jpg','Vista panorâmica de Lisboa ao pôr do sol.',1,1),(2,1,'https://videos.com/lisboa1.mp4',NULL,1,1),(3,0,'https://pics.com/porto1.jpg',NULL,2,2),(4,0,'https://pics.com/barcelona1.jpg','Arquitetura única em Barcelona.',3,3),(5,1,'https://videos.com/barcelona1.mp4',NULL,3,3),(6,0,'https://pics.com/madrid1.jpg',NULL,4,3),(7,0,'https://pics.com/paris1.jpg','Torre Eiffel iluminada à noite.',5,10),(8,1,'https://videos.com/paris1.mp4',NULL,5,10),(9,0,'https://pics.com/lyon1.jpg',NULL,6,10),(10,0,'https://pics.com/geneva1.jpg','Lago de Genebra com montanhas ao fundo.',7,9),(11,0,'https://pics.com/zurich1.jpg',NULL,8,9),(12,0,'https://pics.com/luanda1.jpg','Praia de Luanda ao amanhecer.',9,7),(13,0,'https://pics.com/benguela1.jpg',NULL,10,6),(14,0,'https://pics.com/rio1.jpg','Cristo Redentor visto do Corcovado.',11,4),(15,1,'https://videos.com/rio1.mp4',NULL,11,4),(16,0,'https://pics.com/saopaulo1.jpg',NULL,12,4),(17,1,'https://videos.com/saopaulo1.mp4',NULL,12,4);
/*!40000 ALTER TABLE `Conteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Idiomas`
--

DROP TABLE IF EXISTS `Idiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Idiomas` (
  `idPais` int NOT NULL,
  `Idioma` varchar(75) NOT NULL,
  PRIMARY KEY (`idPais`,`Idioma`),
  CONSTRAINT `Idiomas_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `Pais` (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Idiomas`
--

LOCK TABLES `Idiomas` WRITE;
/*!40000 ALTER TABLE `Idiomas` DISABLE KEYS */;
INSERT INTO `Idiomas` VALUES (1,'Português'),(2,'Espanhol'),(3,'Francês'),(4,'Alemão'),(4,'Francês'),(4,'Italiano'),(4,'Romanche'),(5,'Português'),(6,'Português');
/*!40000 ALTER TABLE `Idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Localidade`
--

DROP TABLE IF EXISTS `Localidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Localidade` (
  `idLocalidade` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(75) NOT NULL,
  `Descricao` text,
  `idPais` int NOT NULL,
  PRIMARY KEY (`idLocalidade`),
  KEY `idx_localidade_pais` (`idPais`),
  CONSTRAINT `Localidade_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `Pais` (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Localidade`
--

LOCK TABLES `Localidade` WRITE;
/*!40000 ALTER TABLE `Localidade` DISABLE KEYS */;
INSERT INTO `Localidade` VALUES (1,'Lisboa','Capital de Portugal, conhecida pelos seus bairros históricos e cultura vibrante.',1),(2,'Porto',NULL,1),(3,'Barcelona','Cidade espanhola conhecida pela arquitetura de Gaudí e praias.',2),(4,'Madrid',NULL,2),(5,'Paris','Capital da França, famosa pela Torre Eiffel e museus de arte.',3),(6,'Lyon',NULL,3),(7,'Genebra','Cidade suíça com instituições internacionais e belas paisagens.',4),(8,'Zurique',NULL,4),(9,'Luanda','Capital de Angola, com praias e cultura africana.',5),(10,'Benguela',NULL,5),(11,'Rio de Janeiro','Cidade brasileira famosa pelo Carnaval, praias e Cristo Redentor.',6),(12,'São Paulo',NULL,6);
/*!40000 ALTER TABLE `Localidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pais`
--

DROP TABLE IF EXISTS `Pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pais` (
  `idPais` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(75) NOT NULL,
  `Continente` varchar(75) NOT NULL,
  PRIMARY KEY (`idPais`),
  KEY `idx_pais_nome` (`Nome`),
  KEY `idx_pais_continente` (`Continente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;
INSERT INTO `Pais` VALUES (1,'Portugal','Europa'),(2,'Espanha','Europa'),(3,'França','Europa'),(4,'Suiça','Europa'),(5,'Angola','África'),(6,'Brasil','América do Sul');
/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Viagem`
--

DROP TABLE IF EXISTS `Viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Viagem` (
  `idViagem` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(75) NOT NULL,
  `Descricao` text NOT NULL,
  `DataInicio` date NOT NULL,
  `DataFim` date NOT NULL,
  `Motivo` enum('Trabalho','Lazer','Outros') NOT NULL,
  `idViajante` int NOT NULL,
  PRIMARY KEY (`idViagem`),
  KEY `idx_viagem_viajante` (`idViajante`),
  KEY `idx_viagem_dataInicio` (`DataInicio`),
  CONSTRAINT `Viagem_ibfk_1` FOREIGN KEY (`idViajante`) REFERENCES `Viajante` (`idViajante`),
  CONSTRAINT `chk_datas_viagem` CHECK ((`DataInicio` <= `DataFim`))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Viagem`
--

LOCK TABLES `Viagem` WRITE;
/*!40000 ALTER TABLE `Viagem` DISABLE KEYS */;
INSERT INTO `Viagem` VALUES (1,'Fotografia Urbana Lisboa','Explorando as ruas de Lisboa em busca de fotografia de rua.','2024-02-01','2024-02-05','Lazer',1),(2,'Trilhas Montanhosas','Caminhadas e escaladas nas montanhas portuguesas.','2024-03-10','2024-03-15','Outros',1),(3,'Museus e Cultura','Visita aos museus e exposições de arte em Portugal.','2024-04-01','2024-04-05','Trabalho',1),(4,'Carnaval Rio','Participação nas festividades do Carnaval brasileiro.','2025-03-01','2025-03-07','Lazer',2),(5,'Praias Nordeste','Relaxamento nas praias do nordeste brasileiro.','2024-06-01','2024-06-07','Lazer',2),(6,'Safari Angola','Aventura na natureza selvagem de Angola.','2025-04-10','2025-04-20','Outros',3),(7,'Exploração Cultural Angola','Visita a museus e locais históricos angolanos.','2024-05-05','2024-05-12','Trabalho',3),(8,'Rota Castelos Portugal','Visita aos castelos históricos de Portugal.','2025-05-05','2025-05-15','Trabalho',4),(9,'Parques Naturais','Passeio por parques naturais e reservas em Portugal.','2024-07-10','2024-07-15','Outros',4),(10,'Gastronomia Francesa','Exploração da gastronomia francesa em Paris.','2024-08-01','2024-08-05','Outros',5);
/*!40000 ALTER TABLE `Viagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Viajante`
--

DROP TABLE IF EXISTS `Viajante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Viajante` (
  `idViajante` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(75) NOT NULL,
  `Password` varchar(75) NOT NULL,
  `Biografia` text,
  `DataRegisto` date NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `FotoPerfil` varchar(2048) DEFAULT NULL,
  `DataNascimento` date NOT NULL,
  `Nacionalidade` varchar(75) NOT NULL,
  `Pontuacao` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idViajante`),
  UNIQUE KEY `Email` (`Email`),
  KEY `idx_viajante_nacionalidade` (`Nacionalidade`),
  KEY `idx_viajante_pontuacao` (`Pontuacao`),
  CONSTRAINT `chk_pontuacao_viajante` CHECK (((`Pontuacao` % 50) = 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Viajante`
--

LOCK TABLES `Viajante` WRITE;
/*!40000 ALTER TABLE `Viajante` DISABLE KEYS */;
INSERT INTO `Viajante` VALUES (1,'Ana Martins','ana123','Viajante apaixonada por fotografia.','2025-01-10','ana.martins@example.com','+351 967334956',NULL,'2007-04-12','Portuguesa',150),(2,'Bruno Ferreira','bf_pass',NULL,'2025-01-12','bruno.ferreira@example.com',NULL,'https://pics.com/bruno.jpg','2006-09-21','Brasileira',100),(3,'Carla Sousa','carla_pw','Adora aventuras e natureza.','2025-01-15','carla.sousa@example.com',NULL,NULL,'2010-11-03','Angolana',100),(4,'Daniel Rocha','dan12345',NULL,'2025-01-17','daniel.rocha@example.com','+351 967223883','https://pics.com/daniel.png','2009-06-18','Portuguesa',100),(5,'Gabriela Costa','gab12pw','Ama conhecer novas culturas.','2025-01-23','gabriela.costa@example.com','+351 964554987',NULL,'2008-05-29','Portuguesa',50),(6,'Luisa Oliveira','luisa134',NULL,'2025-04-22','luisa.oliveira@example.com',NULL,NULL,'2009-11-23','Angolana',0);
/*!40000 ALTER TABLE `Viajante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visita`
--

DROP TABLE IF EXISTS `Visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Visita` (
  `idLocalidade` int NOT NULL,
  `idViagem` int NOT NULL,
  `Descricao` text,
  `DataInicio` date NOT NULL,
  `DataFim` date NOT NULL,
  PRIMARY KEY (`idLocalidade`,`idViagem`),
  KEY `idx_visita_localidade` (`idLocalidade`),
  KEY `idx_visita_idViagem` (`idViagem`),
  CONSTRAINT `Visita_ibfk_1` FOREIGN KEY (`idLocalidade`) REFERENCES `Localidade` (`idLocalidade`),
  CONSTRAINT `Visita_ibfk_2` FOREIGN KEY (`idViagem`) REFERENCES `Viagem` (`idViagem`),
  CONSTRAINT `chk_datas_visita` CHECK ((`DataInicio` <= `DataFim`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visita`
--

LOCK TABLES `Visita` WRITE;
/*!40000 ALTER TABLE `Visita` DISABLE KEYS */;
INSERT INTO `Visita` VALUES (1,1,'Passeio fotográfico pelos bairros históricos de Lisboa.','2024-02-01','2024-02-05'),(1,3,'Visita a museus e centros culturais de Lisboa.','2024-04-01','2024-04-05'),(1,8,'Roteiro pelos castelos históricos de Portugal.','2025-05-05','2025-05-15'),(2,2,NULL,'2024-03-10','2024-03-15'),(2,9,NULL,'2024-07-10','2024-07-15'),(5,10,'Degustação da gastronomia francesa em Paris.','2024-08-01','2024-08-05'),(9,6,'Safari e vida selvagem.','2025-04-10','2025-04-20'),(10,7,'Visita cultural em museus e centros históricos.','2024-05-05','2024-05-12'),(11,5,NULL,'2024-06-01','2024-06-07'),(12,4,'Carnaval e festas locais.','2025-03-01','2025-03-07');
/*!40000 ALTER TABLE `Visita` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-17 13:54:57
