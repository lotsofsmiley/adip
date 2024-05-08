-- --------------------------------------------------------
-- Anfitrião:                    127.0.0.1
-- Versão do servidor:           10.4.28-MariaDB - mariadb.org binary distribution
-- SO do servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- A despejar estrutura da base de dados para db
CREATE DATABASE IF NOT EXISTS `db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `db`;

-- A despejar estrutura para tabela db.appointment
CREATE TABLE IF NOT EXISTS `appointment` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_tour` int(11) NOT NULL,
  `start` date NOT NULL COMMENT 'Dia da marcação.',
  `book_date` datetime DEFAULT current_timestamp() COMMENT 'Data em q foi feita a marcação',
  `payment_date` datetime DEFAULT current_timestamp() COMMENT 'Data em q foi realizado o pagamento.',
  `cancel_date` datetime DEFAULT NULL COMMENT 'Data em q foi cancelado ( se for )',
  `reason` varchar(255) DEFAULT NULL COMMENT 'Motivo do cancelamento',
  `discount` int(11) DEFAULT NULL,
  `number_people` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`,`id_tour`,`start`,`id`),
  KEY `FK_marcacao_tour` (`id_tour`),
  CONSTRAINT `FK_marcacao_tour` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_marcacao_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com as marcações feitas pelos clientes.';

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela db.comment_tour
CREATE TABLE IF NOT EXISTS `comment_tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tour` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `post_date` date NOT NULL DEFAULT current_timestamp(),
  `description` text NOT NULL,
  `classification` int(1) NOT NULL,
  PRIMARY KEY (`id_tour`,`id_user`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_comment_tour_user` (`id_user`),
  CONSTRAINT `FK_comment_tour_tour` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_comment_tour_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com comentários feitos por clientes nos tours';

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela db.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `family_role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`,`language`),
  KEY `FK_employees_language` (`language`),
  CONSTRAINT `FK_employees_language` FOREIGN KEY (`language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela db.faqs
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` tinytext NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com as perguntas feitas regularmente';

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela db.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com os géneros dos utilizadores.';

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela db.language
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com as linguagens disponíveis ao utilizador no site.';

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela db.nav_content
CREATE TABLE IF NOT EXISTS `nav_content` (
  `id` int(11) NOT NULL,
  `language` int(11) NOT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `visible` int(1) DEFAULT 0,
  PRIMARY KEY (`id`,`language`) USING BTREE,
  KEY `FK_nav_content_language` (`language`),
  CONSTRAINT `FK_nav_content_language` FOREIGN KEY (`language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela que respresenta os conteudos da navbar no site.';

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela db.permission
CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com as permissões das roles.';

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela db.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com as roles disponíveis ao utilizador.';

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela db.role_permission
CREATE TABLE IF NOT EXISTS `role_permission` (
  `role` int(1) NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`role`,`permission`),
  KEY `FK_role_permission_permission` (`permission`),
  CONSTRAINT `FK_role_permission_permission` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_role_permission_role` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela que indica as permissões que cada role tem atribuida.';

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela db.social_media
CREATE TABLE IF NOT EXISTS `social_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `icon_class` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com as redes sociais no footer do site.';

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela db.tour
CREATE TABLE IF NOT EXISTS `tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `price_unit` int(11) DEFAULT NULL,
  `ending` time DEFAULT NULL,
  `tour_limit` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`,`language`) USING BTREE,
  KEY `FK_tour_language` (`language`),
  CONSTRAINT `FK_tour_language` FOREIGN KEY (`language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com as várias experiências disponíveis.';

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela db.tour_body
CREATE TABLE IF NOT EXISTS `tour_body` (
  `id` int(11) NOT NULL,
  `language` int(11) NOT NULL,
  `edited_at` datetime DEFAULT current_timestamp(),
  `content` longtext DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `subtitle` longtext DEFAULT NULL,
  PRIMARY KEY (`id`,`language`) USING BTREE,
  KEY `FK_tour_body_language` (`language`),
  CONSTRAINT `FK_tour_body_language` FOREIGN KEY (`language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tour_body_tour` FOREIGN KEY (`id`) REFERENCES `tour` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com o body dos tours no site.';

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela db.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `nacionality` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `creation_date` datetime DEFAULT current_timestamp(),
  `profile_image` varchar(100) DEFAULT NULL,
  `verified` int(1) DEFAULT NULL,
  `display_language` int(3) DEFAULT 1,
  `gender` int(1) DEFAULT NULL,
  `role` int(1) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`,`email`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `FK_user_sex` (`gender`) USING BTREE,
  KEY `FK_user_role` (`role`),
  KEY `FK_user_language` (`display_language`),
  CONSTRAINT `FK_user_gender` FOREIGN KEY (`gender`) REFERENCES `gender` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_user_language` FOREIGN KEY (`display_language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_user_role` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com os vários utilizadores.';

-- Exportação de dados não seleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
