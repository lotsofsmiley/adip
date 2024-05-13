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
DROP DATABASE IF EXISTS `db`;
CREATE DATABASE IF NOT EXISTS `db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `db`;

-- A despejar estrutura para tabela db.appointment
DROP TABLE IF EXISTS `appointment`;
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

-- A despejar dados para tabela db.appointment: ~8 rows (aproximadamente)
DELETE FROM `appointment`;
INSERT INTO `appointment` (`id`, `id_user`, `id_tour`, `start`, `book_date`, `payment_date`, `cancel_date`, `reason`, `discount`, `number_people`) VALUES
	(1, 1, 2, '2023-07-15', '2023-07-14 01:02:40', '2023-07-14 01:02:43', NULL, NULL, NULL, 15),
	(7, 1, 2, '2023-07-19', '2023-07-17 22:46:18', '2023-07-17 22:46:18', NULL, NULL, NULL, 5),
	(4, 1, 2, '2023-07-20', '2023-07-16 23:38:08', '2023-07-16 23:38:08', NULL, NULL, NULL, 3),
	(0, 1, 3, '2023-07-18', '2023-07-16 22:40:08', '2023-07-16 22:40:09', NULL, NULL, NULL, 3),
	(5, 1, 3, '2023-07-19', '2023-07-17 00:01:19', '2023-07-17 00:01:19', NULL, NULL, NULL, 2),
	(6, 1, 3, '2023-07-26', '2023-07-17 09:00:41', '2023-07-17 09:00:41', NULL, NULL, NULL, 3),
	(2, 2, 2, '2023-07-15', '2023-07-14 04:06:00', '2023-07-14 04:06:02', NULL, NULL, NULL, 15),
	(3, 3, 2, '2023-07-16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2023-07-17 08:51:01', '          ', NULL, 30);

-- A despejar estrutura para tabela db.employees
DROP TABLE IF EXISTS `employees`;
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

-- A despejar dados para tabela db.employees: ~24 rows (aproximadamente)
DELETE FROM `employees`;
INSERT INTO `employees` (`id`, `language`, `name`, `phone_number`, `email`, `img`, `text`, `role`, `family_role`) VALUES
	(1, 1, 'Manuel Guimarães', 932275121, NULL, './resources/_images/familia/manuel/manuel1.jpg', 'A alma do Vale do Douro, o patriarca, provavelmente o único ser humano à face da terra que, não têm só uma mas sim duas bocas, pois ouvir não é com ele! Apaixonado e energético, só vai parar quando exceder as tuas espectativas!', 'Fundador', NULL),
	(1, 2, 'Manuel Guimarães', 932275121, NULL, './resources/_images/familia/manuel/manuel1.jpg', 'The Douro Valley\'s soul, the patriarch, probably the only human being that, not only has one but two mouths, because listening isn\'t his thing! Passionate and energetic, he won\'t stop until he exceeds your expectations!', 'Founder', NULL),
	(2, 1, 'Teresa Guimarães', 938458381, 'tmbfsg@hotmail.com', './resources/_images/member_template.jpg', 'Mulher do Manuel, e basicamente a dona disto tudo, porque o Manuel têm sempre que lhe pedir autorização para tudo. É dela que saem os melhores pratos do mundo, sempre cheios, tanto em amor, sabor, e o mais importante, quantidade!  \r\n', 'Chefe', NULL),
	(2, 2, 'Teresa Guimarães', 938458381, 'tmbfsg@hotmail.com', './resources/_images/member_template.jpg', 'Manuel\'s Wife, that basically means she owns everything, because Manuel needs to ask her permissions for everything. Their dishes are the best in the world, always full of, love, flavour and most importantly, quantity!', 'Chef', NULL),
	(3, 1, 'Nuno Guimarães', 916541852, NULL, './resources/_images/familia/nuno/nuno1.jpeg', 'Nuno é o guia mais jovem mas é também o mais bem informado quando o assunto é vinhos. Estuda para ser um sommelier, Nuno é WSET3 e é responsável pela seleção de vinhos das nossas experiências. Carismático, com um humor afiado, garante risos e aulas engraçadas acerca dos vinhos do Douro.', 'Guia Turístico Sénior', 'Filho do Manuel'),
	(3, 2, 'Nuno Guimarães', 916541852, NULL, './resources/_images/familia/nuno/nuno1.jpeg', 'Nuno is the youngest of our guides but is also the most knowledgeable one when the subject is wines. Studying to become a sommelier, Nuno is a WSET3 and is responsible for the wine selection of our tour. Charismatic, with a sharp humour, Nuno will give you good laughs and funny classes on Douro wines.', 'Senior Tour Guide', 'Manuel\'s Son'),
	(4, 1, 'João Guimarães', 917377302, NULL, './resources/_images/familia/joao/joao1.jpg', 'João, ou como lhe chamamos, o <i>pretty face</i> do Douro, cringe moments é com ele, além das melhores fotografias, risos e conhecimentos na base da experiência das melhores francesinhas em Portugal!', 'Guia Turístico Sénior', 'Filho do Manuel'),
	(4, 2, 'João Guimarães', 917377302, NULL, './resources/_images/familia/joao/joao1.jpg', 'João, or as we call him, Douro\'s pretty face, cringe moments are his thing, but if you want the best photos, laughs and experience-based knowledge on the best "francesinhas" in Portugal he is your guy!', 'Senior Tour Guide', 'Manuel\'s Son'),
	(5, 1, 'Paulo Sérgio', NULL, NULL, './resources/_images/familia/sergio/sergio2.jpeg', 'O Sérgio é a cola que mantém toda gente no sítio. Com um grande conhecimento de vinhos e história do Douro, é também a pessoa com o melhor sentido de humor que vais encontrar. Com o "coração na boca", todos adoram a sua autenticidade. Com ele, o teu dia vai ser cheio de risos do ínicio ao fim. É o ícone da moda na nossa família, sempre bem vestido (parece que vai a um casamento todos os dias, é inacreditável!).', 'Guia Turístico Sénior', 'Primo do Manuel'),
	(5, 2, 'Paulo Sérgio', NULL, NULL, './resources/_images/familia/sergio/sergio2.jpeg', 'Sérgio, is the glue that holds everything together. With plenty of wine and history knowledge, is the owner of the best sense of humor you will ever find present in a person. Very honest, direct, and with "the heart very close to his mouth", everyone loves his authenticity. With him, your day will be full of laughs from the start to the end. Leadership and caring for every guest, he is also the fashion icon of our family - all the time with the best presentation ever (looks like he goes to a wedding every day, which is unbelievable!).', 'Senior Tour Guide', 'Manuel\'s Cousin'),
	(6, 1, 'Daniel', NULL, NULL, './resources/_images/member_template.jpg', 'O artista da familia, literalmente! Músico, cineasta, o homem das artes e das histórias, fofinho e bolo fofo. Os teus desejos são tudo para ele, quer seja uma caixa cheia de natinhas de manhã ou 25 copos de vinho. Gang Gang', 'Guia Turístico Sénior', 'Sobrinho do Manuel'),
	(6, 2, 'Daniel', NULL, NULL, './resources/_images/member_template.jpg', 'The artist of the family, literally! Musician, film-maker, the man of the arts and stories, cute and sweet, your desires are everything to him, from a box of "natas" to 25 glasses of wine. Gang Gang', 'Senior Tour Guide', 'Manuel\'s Nephew'),
	(7, 1, 'Jorge', NULL, NULL, './resources/_images/familia/jorge/jorge1_2.jpg', 'Jorge é um dos peritos em vinho na família. Qualquer vinho português, de qualquer região vinícola ele vai conhecer. Também conhecido como o Tom Hanks português, Jorge é uma encicolpédia de vinhos portugueses! Com bastante experiência a trabalhar como sommelier em Londres. No Douro, só vais sentir falta do silêncio porque ele só quer falar.', 'Guia Turístico Sénior', 'Primo do Manuel'),
	(7, 2, 'Jorge', NULL, NULL, './resources/_images/familia/jorge/jorge1_2.jpg', 'Jorge, is one of the wine experts from our family. Whatever Portuguese wine, from whatever wine region, he will know it. Also known as Portuguese Tom Hanks, Jorge is a Portuguese wine encyclopedia! With plenty of experience on working in London as a sommelier, Jorge is a very friendly and helpful guide. When in Douro, the only thing missing will be silence since he talks a lot..\n', 'Senior Tour Guide', 'Manuel\'s Cousin'),
	(8, 1, 'Joca', NULL, NULL, './resources/_images/familia/joca/joca2.jpg', 'Dono de uma playlist musical um tanto quanto duvidosa mas toda a gente adora! É graduado nos cinturões branco, verde, azul, castanho, preto e todas as cores possiveis e imaginárias pois têm uma experiência de 30 anos em Artes Marciais, já na fotografia foi o João que lhe deu umas aulas, por isso irão ser excelentes memorias nos vossos instagrams.', 'Guia Turístico', 'Sogro do Nuno'),
	(8, 2, 'Joca', NULL, NULL, './resources/_images/familia/joca/joca2.jpg', 'Owner of the weirdest playlists that everyone loves! Graduated in white, green, blue, brown, black belts and in every possible and imaginable color because he has over 30 years of experience in martial arts. João gave him some lessons in photograpy to guarantee you have excelent memories for your instagrams.', 'Tour Guide', 'Nuno\'s Father-in-law'),
	(9, 1, 'Luís', NULL, NULL, './resources/_images/familia/luis/luis2.jpg', 'O nosso eterno estudante, proveniente de Coimbra, onde fica uma das mais antigas univerdades no mundo, e com o lema "Scientiae thesaurus mirabilis", será o teu professor mas atenção, nem tudo é perfeito, pois é o que têm o pior gosto futebolistico (ele apoia o Benfica).\n', 'Guia Turístico', NULL),
	(9, 2, 'Luís', NULL, NULL, './resources/_images/familia/luis/luis2.jpg', NULL, 'Tour Guide', NULL),
	(10, 1, 'Jorge', NULL, NULL, './resources/_images/familia/jorge2/jorge2_1.jpg', 'Carinhosamente conhecido como "Jorge The Second" ou "Jorge The King", afirma que tem ligações à mais nobre realeza da cidade invicta. Jorge não é apenas um guia, ele é uma lenda viva, conhecida pelo seu título honorário e pelos seus abdominais "one pack" que são, sem dúvida, uma atração à parte! Adorador de bom vinho e boa comida. Descobre a realeza do Porto com o inigualável "Jorge The King"!', 'Guia Turístico', 'Cunhado do Paulo'),
	(10, 2, 'Jorge', NULL, NULL, './resources/_images/familia/jorge2/jorge2_1.jpg', NULL, 'Tour Guide', 'Paulo\'s Brother-in-law'),
	(11, 1, 'Rúben', NULL, NULL, './resources/_images/member_template.jpg', 'Ruben não é apenas especialista em vinhos, mas é também um organizador de eventos excepcional, com um longo portfólio de festas de música criadas por ele na cidade do Porto. A paixão pela cultura do vinho começou na infância, tornando-se um conhecedor desde pequeno. Sempre acompanhado pela sua boina, um acessório que reflete o seu estilo elegante e clássico.', 'Guia Turístico', NULL),
	(11, 2, 'Rúben', NULL, NULL, './resources/_images/member_template.jpg', NULL, 'Tour Guide', NULL),
	(12, 1, 'Neto', NULL, NULL, './resources/_images/member_template.jpg', 'Basicamente, meteu uma cunha para entrar e após ter aprendido e treinado durante anos com os melhores (Manuel, João e Nuno) tornou-se no segundo melhor, atrás do Daniel, a servir natinhas de manhã.', 'Guia Turístico', NULL),
	(12, 2, 'Neto', NULL, NULL, './resources/_images/member_template.jpg', NULL, 'Tour Guide', NULL);

-- A despejar estrutura para tabela db.faqs
DROP TABLE IF EXISTS `faqs`;
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` tinytext NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com as perguntas feitas regularmente';

-- A despejar dados para tabela db.faqs: ~0 rows (aproximadamente)
DELETE FROM `faqs`;

-- A despejar estrutura para tabela db.gender
DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com os géneros dos utilizadores.';

-- A despejar dados para tabela db.gender: ~3 rows (aproximadamente)
DELETE FROM `gender`;
INSERT INTO `gender` (`id`, `description`) VALUES
	(1, 'Não definido'),
	(13, 'Feminino'),
	(14, 'Masculino');

-- A despejar estrutura para tabela db.language
DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com as linguagens disponíveis ao utilizador no site.';

-- A despejar dados para tabela db.language: ~2 rows (aproximadamente)
DELETE FROM `language`;
INSERT INTO `language` (`id`, `code`, `description`, `file_name`, `file_image`) VALUES
	(1, 'pt', 'Português', './resources/view/languages/lang_pt.php', './resources/_images/languages/pt.jpg'),
	(2, 'en', 'English', './resources/view/languages/lang_eng.php', './resources/_images/languages/en.jpg');

-- A despejar estrutura para tabela db.nav_content
DROP TABLE IF EXISTS `nav_content`;
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

-- A despejar dados para tabela db.nav_content: ~0 rows (aproximadamente)
DELETE FROM `nav_content`;

-- A despejar estrutura para tabela db.permission
DROP TABLE IF EXISTS `permission`;
CREATE TABLE IF NOT EXISTS `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com as permissões das roles.';

-- A despejar dados para tabela db.permission: ~5 rows (aproximadamente)
DELETE FROM `permission`;
INSERT INTO `permission` (`id`, `tag`, `description`) VALUES
	(1, 'BACKOFFICE_ACCESS', 'Acesso ao backoffice'),
	(2, 'USER_TABLE_ACCESS', 'Acesso à tabela utilizador'),
	(3, 'USER_INSERT', 'Permite ao utilizador inserir outro utilizador'),
	(4, 'USER_UPDATE', 'Permite ao utilizador editar outro utilizador'),
	(5, 'USER_DELETE', 'Permite ao utilizador apagar outro utilizador');

-- A despejar estrutura para tabela db.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com as roles disponíveis ao utilizador.';

-- A despejar dados para tabela db.role: ~2 rows (aproximadamente)
DELETE FROM `role`;
INSERT INTO `role` (`id`, `name`) VALUES
	(1, 'Utilizador'),
	(10, 'Administrador');

-- A despejar estrutura para tabela db.role_permission
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE IF NOT EXISTS `role_permission` (
  `role` int(1) NOT NULL,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`role`,`permission`),
  KEY `FK_role_permission_permission` (`permission`),
  CONSTRAINT `FK_role_permission_permission` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_role_permission_role` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela que indica as permissões que cada role tem atribuida.';

-- A despejar dados para tabela db.role_permission: ~5 rows (aproximadamente)
DELETE FROM `role_permission`;
INSERT INTO `role_permission` (`role`, `permission`) VALUES
	(10, 1),
	(10, 2),
	(10, 3),
	(10, 4),
	(10, 5);

-- A despejar estrutura para tabela db.social_media
DROP TABLE IF EXISTS `social_media`;
CREATE TABLE IF NOT EXISTS `social_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `icon_class` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela com as redes sociais no footer do site.';

-- A despejar dados para tabela db.social_media: ~6 rows (aproximadamente)
DELETE FROM `social_media`;
INSERT INTO `social_media` (`id`, `category`, `value`, `icon_class`) VALUES
	(1, 'Facebook', 'https://www.facebook.com/profile.php?id=100092558509457', 'social-platform-icon fa fa-facebook-square'),
	(2, 'Instagram', 'https://www.instagram.com/adayindouro/', 'social-platform-icon fa fa-instagram'),
	(3, 'Twitter', 'https://twitter.com/adayindouro', 'social-platform-icon fa fa-twitter'),
	(4, 'TikTok', 'https://www.tiktok.com/@adayindouro', 'social-platform-icon fa fa-brands fa-tiktok'),
	(5, 'Linkedin', 'https://pt.linkedin.com/company/adayindouro?trk=public_profile_topcard-current-company', 'social-platform-icon fa fa-linkedin'),
	(6, 'Youtube', 'https://www.youtube.com/@adayindouro', 'social-platform-icon fa fa-youtube');

-- A despejar estrutura para tabela db.tour
DROP TABLE IF EXISTS `tour`;
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

-- A despejar dados para tabela db.tour: ~6 rows (aproximadamente)
DELETE FROM `tour`;
INSERT INTO `tour` (`id`, `language`, `name`, `price_unit`, `ending`, `tour_limit`, `description`, `image`) VALUES
	(1, 1, 'A experiência Airbnb no Douro mais autêntica de 2019', 145, '18:00:00', 35, 'Embarque numa experiência exclusiva e autêntica no Vale do Douro. Desfrute de 11 degustações de vinhos, passeios de barco privativos, visitas a duas vinícolas e um almoço requintado preparado por um renomado chef. Mergulhe na rica cultura da região, conecte-se com os locais carismáticos e aprenda sobre os vinhos de mesa e o famoso vinho do Porto de uma forma divertida e envolvente.  ', 'tour1.png'),
	(1, 2, 'Airbnb 2019 Douro Most Unique Access Experience', 145, '18:00:00', 35, 'Embark on an exclusive and authentic experience in the Douro Valley. Enjoy 11 wine tastings, private boat tours, visits to two wineries, and a gourmet lunch prepared by a renowned chef. Immerse yourself in the rich culture of the region, connect with charismatic locals, and learn about table wines and the famous Port wine in a fun and engaging way.\r\n\r\n\r\n\r\n\r\n', 'tour1.png'),
	(2, 1, '11 Provas de vinhos, Vinhas, Chef privado, Almoço em um jardim', 115, '18:00:00', 30, '\r\nExperimente o Vale do Douro como nunca antes. Desfrute de 11 degustações de vinhos, visitas exclusivas a duas vinícolas com apresentações do enólogo, almoço do chef, passeios de barco privativos e autênticos encontros locais. Sem estresse, 100% de satisfação garantida. Descubra os tesouros escondidos da região e crie memórias inesquecíveis nesta excecional experiência vínica.', 'tour2.png'),
	(2, 2, 'Eleven Wine Tastings, Wineries, Farm to Table Chef, Garden Lunch', 115, '18:00:00', 30, 'Experience the Douro Valley like never before. Enjoy 11 wine tastings, exclusive visits to two wineries with presentations by the winemaker, a chef\'s lunch, private boat tours, and authentic local encounters. Stress-free, 100% satisfaction guaranteed. Discover the hidden treasures of the region and create unforgettable memories in this exceptional wine experience.', 'tour2.png'),
	(3, 1, 'Vale do Douro em um Mercedes conversível', 300, '18:00:00', 3, 'Experimente a derradeira aventura no Vale do Douro num luxuoso Mercedes E-Class descapotável. Delicie-se com os melhores vinhos, gastronomia e serviço profissional de foto/vídeo. Navegue ao longo do rio, saboreie vinhos do Porto e iguarias locais, visite duas quintas vinícolas locais e saboreie o almoço de um chef do Douro. Opte pela autenticidade e crie memórias inesquecíveis no Douro.', 'tour3.png'),
	(3, 2, 'Douro Valley in a convertible Mercedes', 300, '18:00:00', 3, 'Experience the ultimate adventure in the Douro Valley in a luxurious convertible Mercedes E-Class. Indulge in the finest wines, gastronomy, and professional photo/video service. Cruise along the river, savor Port wines and local delicacies, visit two local wineries, and enjoy lunch from a Douro chef. Choose authenticity and create unforgettable memories in the Douro.', 'tour3.png');

-- A despejar estrutura para tabela db.tour_body
DROP TABLE IF EXISTS `tour_body`;
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

-- A despejar dados para tabela db.tour_body: ~3 rows (aproximadamente)
DELETE FROM `tour_body`;
INSERT INTO `tour_body` (`id`, `language`, `edited_at`, `content`, `title`, `subtitle`) VALUES
	(1, 1, '2023-07-12 21:42:50', 'O Airbnb concedeu este passeio em 2019 como a EXPERIÊNCIA DE ACESSO MAIS EXCLUSIVA ao Douro, com base na escolha dos consumidores de autenticidade, história e feedback dos melhores clientes.\r\nEstamos muito felizes com o retorno dos nossos hóspedes sobre o nosso compromisso e paixão pelo Vale do Douro\r\n<br><br>\r\nEsta experiência tem 11 degustações de vinhos, 2 vinícolas, visita exclusiva com o vinicultor, almoço de chef exclusivo, barcos privados, O QUE MAIS?!!\r\n<br><br>\r\nVamos visitar o Douro menos turístico, para nós o que importa é o povo carismático que você vai conhecer ao longo de toda a experiência. Pessoas autênticas, com muito conhecimento, mas com muito caráter e personalidade.\r\n<br><br>\r\nEsqueça as maiores marcas comerciais, não é para nós...\r\n<br><br>\r\nComigo você vai aprender toda a história do vinho, mas de uma forma divertida não chata, vamos falar sobre vinhos de mesa que bebemos todos os dias, mas também o famoso vinho do Porto\r\n<br><br>\r\nComeçamos com um cruzeiro de barco privado, onde vamos provar iguarias do Douro com bebidas e conhecer os piratas loucos:) para nos contar e explicar todas as histórias autênticas do Vale do Douro\r\n<br><br>\r\nEm seguida, teremos uma visita exclusiva com o enólogo em um pequeno produtor e nos prepararemos para algumas surpresas que você vai adorar... também temos vinhos aqui, é claro\r\n<br><br>\r\nAlmoço em um evento exclusivo da mais alta qualidade com uma degustação de chef de comida do Douro combinada com os vinhos do chef e algumas apresentações mais especiais e únicas dos costumes locais e da cultura vinícola.', '', 'Acesso privilegiado ao Vale do Douro (experiência premiada)'),
	(2, 1, '2023-07-12 21:42:56', '11 Degustações de vinhos, 2 vinícolas, visita exclusiva com o vinicultor, Almoço do Chef no jardim, Barcos Privados, O QUE MAIS?!!\r\n<br><br>\r\nVisitaremos o Vale do Douro como se fosse com um amigo, um dia inesquecível/relaxante, uma experiência inesquecível.\r\nComigo, tudo é feito ao seu próprio ritmo, sem limites de tempo, sem prazos para nada.\r\n<br><br>\r\nNossa palavra-chave e o lema desta experiência são:\r\nSem ESTRESSE, 100% de satisfação garantida\r\n<br><br>\r\nVamos ver o Douro turístico que 99% das pessoas veem, mas quero que vocês sejam os 1% dos turistas que verão o Douro que mais ninguém vê.\r\nVou mostrar-lhe as estradas mais bonitas do Douro menos turístico e os lugares mais autênticos, da população local com seus costumes e suas comidas e vinhos.\r\n<br><br>\r\nTeremos uma visita exclusiva com o enólogo, aprenderemos a cultura vinícola de uma forma divertida, não chata como nas principais marcas comerciais, que você pode ver na cidade do Porto nas adegas.\r\nMostraremos algo diferente, prepare-se para se surpreender.\r\n<br><br>\r\nCruzeiro pelo rio em um barco privado com lanches e bebidas, um dos melhores cruzeiros fluviais da sua vida.\r\n<br><br>\r\nAlmoço do chef com degustação de autêntica comida do Douro combinada com os vinhos do chef, temos várias surpresas que você vai adorar.\r\nUm evento exclusivo da mais alta qualidade, como todos os nossos eventos, apenas para os nossos hóspedes.\r\n<br><br>\r\nVocê nunca vai esquecer essa experiência vinícola...', '', 'Onze vinhos, barco privado e almoço orgânico'),
	(3, 1, '2023-07-12 21:43:00', 'Esqueça os passeios normais ao Vale do Douro feitos em carrinhas, temos ao seu dispor uma luxuosa Mercedes descapotável Classe E.\r\n<br><br>\r\nEste programa é o melhor de 3 experiências juntas em uma:\r\n\r\n- Melhor passeio em um Mercedes Classe E conversível.\r\n- Melhores vinhos e experiência gastronômica\r\n- O melhor serviço de foto e vídeo PRO para você se lembrar mais tarde em casa.\r\n<br><br>\r\nA minha experiência, que não chamo de tour, só tem eventos privados para os meus convidados, sem se misturar com pessoas de outros tours como fazem outras operadoras, nos barcos, adegas e almoços ...\r\n<br><br>\r\nEste não é um passeio, é um dia diferente e memorável com um amigo que irá mostrar-lhe as vistas deslumbrantes do Vale do Douro, ao volante de um Mercedes descapotável.\r\n<br><br>\r\nNo cruzeiro fluvial a bordo veremos paisagens deslumbrantes e conheceremos a história do Vale do Douro com guias privados ... degustaremos diversos vinhos do Porto juntamente com comidas locais feitas pela população local.\r\n<br><br>\r\nEm seguida iremos visitar a quinta mais antiga do Douro Est.1638 onde teremos uma prova de vinhos comentada exclusiva e teremos contacto direto com as vinhas onde poderá degustar as uvas se desejar.\r\n<br><br>\r\nPara fechar com chave de ouro, iremos visitar a aldeia vinícola mais antiga do douro e almoçar no FARM2TABLE Chef onde iremos provar comidas locais incríveis e 4 vinhos de mesa, incluindo vinhos premiados mundialmente\r\n<br><br>\r\nEsqueça os chefs Michelin, opte pela autenticidade do Douro.', '', 'Vale do Douro em um Mercedes conversível');

-- A despejar estrutura para tabela db.user
DROP TABLE IF EXISTS `user`;
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

-- A despejar dados para tabela db.user: ~5 rows (aproximadamente)
DELETE FROM `user`;
INSERT INTO `user` (`id`, `name`, `email`, `phone_number`, `nacionality`, `birthdate`, `creation_date`, `profile_image`, `verified`, `display_language`, `gender`, `role`, `password`) VALUES
	(1, 'Filipe Guimarães', 'manolipas@hotmail.com', '916543260', 'Espanhol', '2000-10-27', '2023-07-14 00:38:23', NULL, 1, 1, 14, 10, 'c510cd8607f92e1e09fd0b0d0d035c16d2428fa4'),
	(2, 'João Maria', 'joaomaria@hotmail.com', '911114534', 'Português', '2017-07-15', '2023-07-14 04:05:36', NULL, 1, 1, 14, 1, '8cb2237d0679ca88db6464eac60da96345513964'),
	(3, 'Miguel Faria', 'faria@yahoo.pt', '918734741', 'Jordanês', '2007-02-06', '2023-07-14 04:24:23', NULL, 1, 1, 13, 1, '8cb2237d0679ca88db6464eac60da96345513964'),
	(15, 'Roberto Leandro', 'manolipas69@gmail.com', '917264121', 'Macau', '2004-07-21', '2023-07-17 04:46:31', NULL, 0, 1, 14, 1, 'c510cd8607f92e1e09fd0b0d0d035c16d2428fa4'),
	(27, 'Teresa', 'tmbfsg@hotmail.com', '938458381', 'Português', '2023-07-03', '2023-07-17 05:44:31', 'O-Dazai-de-Bungou-Stray-Dogs-foi-inspirado-no-No.jpg', 1, 1, 13, 10, 'c510cd8607f92e1e09fd0b0d0d035c16d2428fa4');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
