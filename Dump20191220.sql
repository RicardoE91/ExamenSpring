CREATE DATABASE  IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema`;

DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `nationality`;
CREATE TABLE `nationality` (
  `nationality_id` varchar(3) NOT NULL,
  `description` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`nationality_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `director`;
CREATE TABLE `director` (
  `director_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `nationality_id` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`director_id`),
  UNIQUE KEY `idDirector_UNIQUE` (`director_id`),
  KEY `fk_nationality_id_idx` (`nationality_id`),
  CONSTRAINT `fk_nationality_id` FOREIGN KEY (`nationality_id`) REFERENCES `nationality` (`nationality_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_genre_id_idx` (`genre_id`),
  KEY `fk_director_id_idx` (`director_id`),
  CONSTRAINT `fk_director_id` FOREIGN KEY (`director_id`) REFERENCES `director` (`director_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `nationality` WRITE;
INSERT INTO `nationality` VALUES ('BRA','Brazil'),('GBR','United Kingdom of Great Britain'),('MEX','Mexico'),('USA','United States of America');
UNLOCK TABLES;

LOCK TABLES `genre` WRITE;
INSERT INTO `genre` VALUES (1,'Drama'),(2,'Fantasy'),(3,'Action'),(4,'Science Fiction'),(5,'Horror');
UNLOCK TABLES;

LOCK TABLES `director` WRITE;
INSERT INTO `director` VALUES (3,'Steven Spielberg','USA'),(5,'Guillermo del Toro','MEX');
UNLOCK TABLES;

LOCK TABLES `movie` WRITE;
INSERT INTO `movie` VALUES (1,'El Laberinto del Fauno',2,2006,5,10),(2,'The Shape of Water',2,2017,5,10),(3,'Jaws',3,1975,3,10),(4,'War of the Worlds',4,2005,3,7);
UNLOCK TABLES;


