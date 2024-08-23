-- --------------------------------------------------------
-- Anfitrião:                    127.0.0.1
-- Versão do servidor:           10.4.21-MariaDB - mariadb.org binary distribution
-- SO do servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- A despejar estrutura da base de dados para main
CREATE DATABASE IF NOT EXISTS `main` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `main`;

-- A despejar estrutura para tabela main.employees
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
  `display` int(11) DEFAULT NULL,
  `disabled` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`language`),
  KEY `FK_employees_language` (`language`),
  CONSTRAINT `FK_employees_language` FOREIGN KEY (`language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela main.employees: ~24 rows (aproximadamente)
DELETE FROM `employees`;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id`, `language`, `name`, `phone_number`, `email`, `img`, `text`, `role`, `family_role`, `display`, `disabled`) VALUES
	(1, 1, 'Manuel Guimarães', 932275121, NULL, './resources/_images/familia/manuel/manuel1.jpg', 'A alma do Vale do Douro, o patriarca, provavelmente o único ser humano à face da terra que, não têm só uma mas sim duas bocas, pois ouvir não é com ele! Apaixonado e energético, só vai parar quando exceder as tuas espectativas!', 'Fundador', NULL, 1, NULL),
	(1, 2, 'Manuel Guimarães', 932275121, NULL, './resources/_images/familia/manuel/manuel1.jpg', 'The Douro Valley\'s soul, the patriarch, probably the only human being that, not only has one but two mouths, because listening isn\'t his thing! Passionate and energetic, he won\'t stop until he exceeds your expectations!', 'Founder', NULL, 1, NULL),
	(2, 1, 'Teresa Guimarães', 938458381, 'tmbfsg@hotmail.com', './resources/_images/member_template.jpg', 'Mulher do Manuel, e basicamente a dona disto tudo, porque o Manuel têm sempre que lhe pedir autorização para tudo. É dela que saem os melhores pratos do mundo, sempre cheios, tanto em amor, sabor, e o mais importante, quantidade!  \r\n', 'Chefe', NULL, NULL, NULL),
	(2, 2, 'Teresa Guimarães', 938458381, 'tmbfsg@hotmail.com', './resources/_images/member_template.jpg', 'Manuel\'s Wife, that basically means she owns everything, because Manuel needs to ask her permissions for everything. Their dishes are the best in the world, always full of, love, flavour and most importantly, quantity!', 'Chef', NULL, NULL, NULL),
	(3, 1, 'Nuno Guimarães', 916541852, NULL, './resources/_images/familia/nuno/nuno1.jpeg', 'Nuno é o guia mais jovem mas é também o mais bem informado quando o assunto é vinhos. Estuda para ser um sommelier, Nuno é WSET3 e é responsável pela seleção de vinhos das nossas experiências. Carismático, com um humor afiado, garante risos e aulas engraçadas acerca dos vinhos do Douro.', 'Guia Turístico Sénior', 'Filho do Manuel', 1, NULL),
	(3, 2, 'Nuno Guimarães', 916541852, NULL, './resources/_images/familia/nuno/nuno1.jpeg', 'Nuno is the youngest of our guides but is also the most knowledgeable one when the subject is wines. Studying to become a sommelier, Nuno is a WSET3 and is responsible for the wine selection of our tour. Charismatic, with a sharp humour, Nuno will give you good laughs and funny classes on Douro wines.', 'Senior Tour Guide', 'Manuel\'s Son', 1, NULL),
	(4, 1, 'João Guimarães', 917377302, NULL, './resources/_images/familia/joao/joao1.jpg', 'João, ou como lhe chamamos, o <i>pretty face</i> do Douro, cringe moments é com ele, além das melhores fotografias, risos e conhecimentos na base da experiência das melhores francesinhas em Portugal!', 'Guia Turístico Sénior', 'Filho do Manuel', 1, NULL),
	(4, 2, 'João Guimarães', 917377302, NULL, './resources/_images/familia/joao/joao1.jpg', 'João, or as we call him, Douro\'s pretty face, cringe moments are his thing, but if you want the best photos, laughs and experience-based knowledge on the best "francesinhas" in Portugal he is your guy!', 'Senior Tour Guide', 'Manuel\'s Son', 1, NULL),
	(5, 1, 'Paulo Sérgio', NULL, NULL, './resources/_images/familia/sergio/sergio2.jpeg', 'O Sérgio é a cola que mantém toda gente no sítio. Com um grande conhecimento de vinhos e história do Douro, é também a pessoa com o melhor sentido de humor que vais encontrar. Com o "coração na boca", todos adoram a sua autenticidade. Com ele, o teu dia vai ser cheio de risos do ínicio ao fim. É o ícone da moda na nossa família, sempre bem vestido (parece que vai a um casamento todos os dias, é inacreditável!).', 'Guia Turístico Sénior', 'Primo do Manuel', 1, NULL),
	(5, 2, 'Paulo Sérgio', NULL, NULL, './resources/_images/familia/sergio/sergio2.jpeg', 'Sérgio, is the glue that holds everything together. With plenty of wine and history knowledge, is the owner of the best sense of humor you will ever find present in a person. Very honest, direct, and with "the heart very close to his mouth", everyone loves his authenticity. With him, your day will be full of laughs from the start to the end. Leadership and caring for every guest, he is also the fashion icon of our family - all the time with the best presentation ever (looks like he goes to a wedding every day, which is unbelievable!).', 'Senior Tour Guide', 'Manuel\'s Cousin', 1, NULL),
	(6, 1, 'Daniel', NULL, NULL, './resources/_images/member_template.jpg', 'O artista da familia, literalmente! Músico, cineasta, o homem das artes e das histórias, fofinho e bolo fofo. Os teus desejos são tudo para ele, quer seja uma caixa cheia de natinhas de manhã ou 25 copos de vinho. Gang Gang', 'Guia Turístico Sénior', 'Sobrinho do Manuel', 0, NULL),
	(6, 2, 'Daniel', NULL, NULL, './resources/_images/member_template.jpg', 'The artist of the family, literally! Musician, film-maker, the man of the arts and stories, cute and sweet, your desires are everything to him, from a box of "natas" to 25 glasses of wine. Gang Gang', 'Senior Tour Guide', 'Manuel\'s Nephew', 0, NULL),
	(7, 1, 'Jorge', NULL, NULL, './resources/_images/familia/jorge/jorge1_2.jpg', 'Jorge é um dos peritos em vinho na família. Qualquer vinho português, de qualquer região vinícola ele vai conhecer. Também conhecido como o Tom Hanks português, Jorge é uma encicolpédia de vinhos portugueses! Com bastante experiência a trabalhar como sommelier em Londres. No Douro, só vais sentir falta do silêncio porque ele só quer falar.', 'Guia Turístico Sénior', 'Primo do Manuel', 1, NULL),
	(7, 2, 'Jorge', NULL, NULL, './resources/_images/familia/jorge/jorge1_2.jpg', 'Jorge, is one of the wine experts from our family. Whatever Portuguese wine, from whatever wine region, he will know it. Also known as Portuguese Tom Hanks, Jorge is a Portuguese wine encyclopedia! With plenty of experience on working in London as a sommelier, Jorge is a very friendly and helpful guide. When in Douro, the only thing missing will be silence since he talks a lot..\n', 'Senior Tour Guide', 'Manuel\'s Cousin', 1, NULL),
	(8, 1, 'Joca', NULL, NULL, './resources/_images/familia/joca/joca2.jpg', 'Dono de uma playlist musical um tanto quanto duvidosa mas toda a gente adora! É graduado nos cinturões branco, verde, azul, castanho, preto e todas as cores possiveis e imaginárias pois têm uma experiência de 30 anos em Artes Marciais, já na fotografia foi o João que lhe deu umas aulas, por isso irão ser excelentes memorias nos vossos instagrams.', 'Guia Turístico', 'Sogro do Nuno', 1, NULL),
	(8, 2, 'Joca', NULL, NULL, './resources/_images/familia/joca/joca2.jpg', 'Owner of the weirdest playlists that everyone loves! Graduated in white, green, blue, brown, black belts and in every possible and imaginable color because he has over 30 years of experience in martial arts. João gave him some lessons in photograpy to guarantee you have excelent memories for your instagrams.', 'Tour Guide', 'Nuno\'s Father-in-law', 1, NULL),
	(9, 1, 'Luís', NULL, NULL, './resources/_images/familia/luis/luis2.jpg', 'O nosso eterno estudante, proveniente de Coimbra, onde fica uma das mais antigas univerdades no mundo, e com o lema "Scientiae thesaurus mirabilis", será o teu professor mas atenção, nem tudo é perfeito, pois é o que têm o pior gosto futebolistico (ele apoia o Benfica).\n', 'Guia Turístico', NULL, 1, NULL),
	(9, 2, 'Luís', NULL, NULL, './resources/_images/familia/luis/luis2.jpg', 'Our eternal student, hailing from Coimbra, where one of the oldest universities in the world is located and with the motto "Scientiae thesaurus mirabilis," will be your teacher. But beware, not everything is perfect, as he has the worst taste in football (he supports Benfica).', 'Tour Guide', NULL, 1, NULL),
	(10, 1, 'Jorge', NULL, NULL, './resources/_images/familia/jorge2/jorge2_1.jpg', 'Carinhosamente conhecido como "Jorge The Second" ou "Jorge The King", afirma que tem ligações à mais nobre realeza da cidade invicta. Jorge não é apenas um guia, ele é uma lenda viva, conhecida pelo seu título honorário e pelos seus abdominais "one pack" que são, sem dúvida, uma atração à parte! Adorador de bom vinho e boa comida. Descobre a realeza do Porto com o inigualável "Jorge The King"!', 'Guia Turístico', 'Cunhado do Paulo', 1, NULL),
	(10, 2, 'Jorge', NULL, NULL, './resources/_images/familia/jorge2/jorge2_1.jpg', 'Affectionately known as "Jorge The Second" or "Jorge The King," he claims to have ties to the most noble royalty of the undefeated city. Jorge is not just a guide; he is a living legend, known for his honorary title and his "one pack" abs, which are undoubtedly an attraction in themselves! A lover of fine wine and good food. Discover the royalty of Porto with the unparalleled "Jorge The King"!', 'Tour Guide', 'Paulo\'s Brother-in-law', 1, NULL),
	(11, 1, 'Rúben', NULL, NULL, './resources/_images/member_template.jpg', 'Ruben não é apenas especialista em vinhos, mas é também um organizador de eventos excepcional, com um longo portfólio de festas de música criadas por ele na cidade do Porto. A paixão pela cultura do vinho começou na infância, tornando-se um conhecedor desde pequeno. Sempre acompanhado pela sua boina, um acessório que reflete o seu estilo elegante e clássico.', 'Guia Turístico', NULL, 0, NULL),
	(11, 2, 'Rúben', NULL, NULL, './resources/_images/member_template.jpg', 'Ruben is not just a wine expert; he is also an exceptional event organizer, with an extensive portfolio of music parties he has created in the city of Porto. His passion for wine culture began in childhood, making him a connoisseur from a young age. He is always accompanied by his beret, an accessory that reflects his elegant and classic style.', 'Tour Guide', NULL, 0, NULL),
	(12, 1, 'Neto', NULL, NULL, './resources/_images/member_template.jpg', 'Basicamente, meteu uma cunha para entrar e após ter aprendido e treinado durante anos com os melhores (Manuel, João e Nuno) tornou-se no segundo melhor, atrás do Daniel, a servir natinhas de manhã.', 'Guia Turístico', NULL, NULL, 1),
	(12, 2, 'Neto', NULL, NULL, './resources/_images/member_template.jpg', 'Basically, he pulled some strings to get in, and after learning and training for years with the best (Manuel, João, and Nuno), he became the second best, just behind Daniel, at serving "natinhas" in the morning.', 'Tour Guide', NULL, NULL, 1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- A despejar estrutura para tabela main.faqs
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` tinytext NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela com as perguntas feitas regularmente';

-- A despejar dados para tabela main.faqs: ~0 rows (aproximadamente)
DELETE FROM `faqs`;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;

-- A despejar estrutura para tabela main.language
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela com as linguagens disponíveis ao utilizador no site.';

-- A despejar dados para tabela main.language: ~2 rows (aproximadamente)
DELETE FROM `language`;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` (`id`, `code`, `description`, `file_name`, `file_image`) VALUES
	(1, 'pt', 'Português', './resources/view/languages/lang_pt.php', './resources/_images/languages/pt.jpg'),
	(2, 'en', 'English', './resources/view/languages/lang_eng.php', './resources/_images/languages/en.jpg');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;

-- A despejar estrutura para tabela main.nav_content
CREATE TABLE IF NOT EXISTS `nav_content` (
  `id` int(11) NOT NULL,
  `language` int(11) NOT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `visible` int(1) DEFAULT 0,
  PRIMARY KEY (`id`,`language`) USING BTREE,
  KEY `FK_nav_content_language` (`language`),
  CONSTRAINT `FK_nav_content_language` FOREIGN KEY (`language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela que respresenta os conteudos da navbar no site.';

-- A despejar dados para tabela main.nav_content: ~0 rows (aproximadamente)
DELETE FROM `nav_content`;
/*!40000 ALTER TABLE `nav_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `nav_content` ENABLE KEYS */;

-- A despejar estrutura para tabela main.social_media
CREATE TABLE IF NOT EXISTS `social_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `icon_class` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela com as redes sociais no footer do site.';

-- A despejar dados para tabela main.social_media: ~6 rows (aproximadamente)
DELETE FROM `social_media`;
/*!40000 ALTER TABLE `social_media` DISABLE KEYS */;
INSERT INTO `social_media` (`id`, `category`, `value`, `icon_class`) VALUES
	(1, 'Facebook', 'https://www.facebook.com/profile.php?id=100092558509457', 'social-platform-icon fa fa-facebook-square'),
	(2, 'Instagram', 'https://www.instagram.com/adayindouro/', 'social-platform-icon fa fa-instagram'),
	(3, 'Twitter', 'https://twitter.com/adayindouro', 'social-platform-icon fa fa-twitter'),
	(4, 'TikTok', 'https://www.tiktok.com/@adayindouro', 'social-platform-icon fa fa-brands fa-tiktok'),
	(5, 'Linkedin', 'https://pt.linkedin.com/company/adayindouro?trk=public_profile_topcard-current-company', 'social-platform-icon fa fa-linkedin'),
	(6, 'Youtube', 'https://www.youtube.com/@adayindouro', 'social-platform-icon fa fa-youtube');
/*!40000 ALTER TABLE `social_media` ENABLE KEYS */;

-- A despejar estrutura para tabela main.tour
CREATE TABLE IF NOT EXISTS `tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `price_unit` int(11) DEFAULT NULL,
  `departure` varchar(50) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `ending` time DEFAULT NULL,
  `tour_limit` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `tour_language` varchar(50) DEFAULT NULL,
  `group_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`,`language`) USING BTREE,
  KEY `FK_tour_language` (`language`),
  CONSTRAINT `FK_tour_language` FOREIGN KEY (`language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela com as várias experiências disponíveis.';

-- A despejar dados para tabela main.tour: ~10 rows (aproximadamente)
DELETE FROM `tour`;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` (`id`, `language`, `name`, `price_unit`, `departure`, `duration`, `ending`, `tour_limit`, `description`, `image`, `tour_language`, `group_type`) VALUES
	(1, 1, 'A experiência Airbnb no Douro mais autêntica de 2019', 145, '8:30/9:00/10:00', NULL, '18:00:00', 35, 'Embarque numa experiência exclusiva e autêntica no Vale do Douro. Desfrute de 11 degustações de vinhos, passeios de barco privativos, visitas a duas vinícolas e um almoço requintado preparado por um renomado chef. Mergulhe na rica cultura da região, conecte-se com os locais carismáticos e aprenda sobre os vinhos de mesa e o famoso vinho do Porto de uma forma divertida e envolvente.  ', './tour/1/tour1.png', 'Inglês', 'Pequenos'),
	(1, 2, 'Airbnb 2019 Douro Most Unique Access Experience', 145, '8:30/9:00/10:00', NULL, '18:00:00', 35, 'Embark on an exclusive and authentic experience in the Douro Valley. Enjoy 11 wine tastings, private boat tours, visits to two wineries, and a gourmet lunch prepared by a renowned chef. Immerse yourself in the rich culture of the region, connect with charismatic locals, and learn about table wines and the famous Port wine in a fun and engaging way.\r\n\r\n\r\n\r\n\r\n', './tour/1/tour1.png', 'English', 'Small'),
	(2, 1, '11 Provas de vinhos, Vinhas, Chef privado, Almoço em um jardim', 115, '8:30/9:00/10:00', NULL, '18:00:00', 30, '\r\nExperimente o Vale do Douro como nunca antes. Desfrute de 11 degustações de vinhos, visitas exclusivas a duas vinícolas com apresentações do enólogo, almoço do chef, passeios de barco privativos e autênticos encontros locais. Sem estresse, 100% de satisfação garantida. Descubra os tesouros escondidos da região e crie memórias inesquecíveis nesta excecional experiência vínica.', './tour/2/tour1.png', 'Inglês', 'Pequenos'),
	(2, 2, 'Eleven Wine Tastings, Wineries, Farm to Table Chef, Garden Lunch', 115, '8:30/9:00/10:00', NULL, '18:00:00', 30, 'Experience the Douro Valley like never before. Enjoy 11 wine tastings, exclusive visits to two wineries with presentations by the winemaker, a chef\'s lunch, private boat tours, and authentic local encounters. Stress-free, 100% satisfaction guaranteed. Discover the hidden treasures of the region and create unforgettable memories in this exceptional wine experience.', './tour/2/tour1.png', 'English', 'Small'),
	(3, 1, 'Realeza do Vale do Douro impulsionado por Mercedes de Luxo', 400, '10:00', 7, '17:00:00', 6, 'Trazemos Dubai para o Vale do Douro em uma experiência completamente privada, apenas para os nossos hóspedes, com carros de luxo e os nossos barcos privados com snacks e bebidas. <br> Alimentada pela Mercedes Benz Classe S e Class E descapotável.', './tour/3/tour.png', 'Inglês', 'Pequenos'),
	(3, 2, 'Royale Douro Valley powered by Luxury Mercedes', 400, '10:00', 7, '17:00:00', 6, 'We bring Dubai to Douro Valley in a completly private experience only for our guests, with luxury cars and our private boats with snacks an drinks. <br> Powered by Mercedes Benz S-class and E-class cabrio.', './tour/3/tour.png', 'English', 'Small'),
	(4, 1, 'Vale do Douro em um Mercedes conversível', 300, '8:30/9:00/10:00', NULL, '18:00:00', 3, 'Experimente a derradeira aventura no Vale do Douro num luxuoso Mercedes E-Class descapotável. Delicie-se com os melhores vinhos, gastronomia e serviço profissional de foto/vídeo. Navegue ao longo do rio, saboreie vinhos do Porto e iguarias locais, visite duas quintas vinícolas locais e saboreie o almoço de um chef do Douro. Opte pela autenticidade e crie memórias inesquecíveis no Douro.', './tour/4/tour.png', 'Inglês', 'Pequenos'),
	(4, 2, 'Douro Valley in a convertible Mercedes', 300, '8:30/9:00/10:00', NULL, '18:00:00', 3, 'Experience the ultimate adventure in the Douro Valley in a luxurious convertible Mercedes E-Class. Indulge in the finest wines, gastronomy, and professional photo/video service. Cruise along the river, savor Port wines and local delicacies, visit two local wineries, and enjoy lunch from a Douro chef. Choose authenticity and create unforgettable memories in the Douro.', './tour/4/tour.png', 'English', 'Small'),
	(5, 1, 'Vinho Verde', NULL, '9:15', NULL, NULL, NULL, NULL, './tour/5/tour.png', 'Inglês', NULL),
	(5, 2, 'Green Wine', NULL, '9:15', NULL, NULL, NULL, NULL, './tour/5/tour.png', 'English', NULL);
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;

-- A despejar estrutura para tabela main.tour_body
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela com o body dos tours no site.';

-- A despejar dados para tabela main.tour_body: ~6 rows (aproximadamente)
DELETE FROM `tour_body`;
/*!40000 ALTER TABLE `tour_body` DISABLE KEYS */;
INSERT INTO `tour_body` (`id`, `language`, `edited_at`, `content`, `title`, `subtitle`) VALUES
	(1, 1, '2023-07-12 21:42:50', 'O Airbnb concedeu este passeio em 2019 como a EXPERIÊNCIA DE ACESSO MAIS EXCLUSIVA ao Douro, com base na escolha dos consumidores de autenticidade, história e feedback dos melhores clientes.\r\nEstamos muito felizes com o retorno dos nossos hóspedes sobre o nosso compromisso e paixão pelo Vale do Douro\r\n<br><br>\r\nEsta experiência tem 11 degustações de vinhos, 2 vinícolas, visita exclusiva com o vinicultor, almoço de chef exclusivo, barcos privados, O QUE MAIS?!!\r\n<br><br>\r\nVamos visitar o Douro menos turístico, para nós o que importa é o povo carismático que você vai conhecer ao longo de toda a experiência. Pessoas autênticas, com muito conhecimento, mas com muito caráter e personalidade.\r\n<br><br>\r\nEsqueça as maiores marcas comerciais, não é para nós...\r\n<br><br>\r\nComigo você vai aprender toda a história do vinho, mas de uma forma divertida não chata, vamos falar sobre vinhos de mesa que bebemos todos os dias, mas também o famoso vinho do Porto\r\n<br><br>\r\nComeçamos com um cruzeiro de barco privado, onde vamos provar iguarias do Douro com bebidas e conhecer os piratas loucos:) para nos contar e explicar todas as histórias autênticas do Vale do Douro\r\n<br><br>\r\nEm seguida, teremos uma visita exclusiva com o enólogo em um pequeno produtor e nos prepararemos para algumas surpresas que você vai adorar... também temos vinhos aqui, é claro\r\n<br><br>\r\nAlmoço em um evento exclusivo da mais alta qualidade com uma degustação de chef de comida do Douro combinada com os vinhos do chef e algumas apresentações mais especiais e únicas dos costumes locais e da cultura vinícola.', 'A experiência Airbnb no Douro mais autêntica de 2019', 'Acesso privilegiado ao Vale do Douro (experiência premiada)'),
	(1, 2, '2024-07-18 16:43:43', 'The Airbnb awarded this tour in 2019 as the MOST EXCLUSIVE ACCESS EXPERIENCE to the Douro, based on consumer choice for authenticity, history, and feedback from the best customers.\r\nWe are very happy with the feedback from our guests about our commitment and passion for the Douro Valley.\r\n<br><br>\r\nThis experience includes 11 wine tastings, 2 wineries, an exclusive visit with the winemaker, an exclusive chef\'s lunch, private boats, WHAT ELSE?!!\r\n<br><br>\r\nWe will visit the less touristy Douro; for us, what matters is the charismatic people you will meet throughout the experience. Authentic people, with a lot of knowledge, but also a lot of character and personality.\r\n<br><br>\r\nForget the biggest commercial brands, it\'s not for us...\r\n<br><br>\r\nWith me, you will learn all the history of wine, but in a fun, not boring way. We will talk about table wines that we drink every day, but also the famous Port wine.\r\n<br><br>\r\nWe start with a private boat cruise, where we will taste Douro delicacies with drinks and meet the crazy pirates :) to tell and explain all the authentic stories of the Douro Valley.\r\n<br><br>\r\nNext, we will have an exclusive visit with the winemaker at a small producer and get ready for some surprises that you will love... we also have wines here, of course.\r\n<br><br>\r\nLunch at an exclusive high-quality event with a chef\'s tasting of Douro food combined with the chef\'s wines and some more special and unique presentations of local customs and wine culture.', 'Airbnb 2019 Douro Most Unique Access Experience', 'Privileged access to the Douro Valley (award-winning experience)'),
	(2, 1, '2023-07-12 21:42:56', '11 Degustações de vinhos, 2 vinícolas, visita exclusiva com o vinicultor, Almoço do Chef no jardim, Barcos Privados, O QUE MAIS?!!\r\n<br><br>\r\nVisitaremos o Vale do Douro como se fosse com um amigo, um dia inesquecível/relaxante, uma experiência inesquecível.\r\nComigo, tudo é feito ao seu próprio ritmo, sem limites de tempo, sem prazos para nada.\r\n<br><br>\r\nNossa palavra-chave e o lema desta experiência são:\r\nSem ESTRESSE, 100% de satisfação garantida\r\n<br><br>\r\nVamos ver o Douro turístico que 99% das pessoas veem, mas quero que vocês sejam os 1% dos turistas que verão o Douro que mais ninguém vê.\r\nVou mostrar-lhe as estradas mais bonitas do Douro menos turístico e os lugares mais autênticos, da população local com seus costumes e suas comidas e vinhos.\r\n<br><br>\r\nTeremos uma visita exclusiva com o enólogo, aprenderemos a cultura vinícola de uma forma divertida, não chata como nas principais marcas comerciais, que você pode ver na cidade do Porto nas adegas.\r\nMostraremos algo diferente, prepare-se para se surpreender.\r\n<br><br>\r\nCruzeiro pelo rio em um barco privado com lanches e bebidas, um dos melhores cruzeiros fluviais da sua vida.\r\n<br><br>\r\nAlmoço do chef com degustação de autêntica comida do Douro combinada com os vinhos do chef, temos várias surpresas que você vai adorar.\r\nUm evento exclusivo da mais alta qualidade, como todos os nossos eventos, apenas para os nossos hóspedes.\r\n<br><br>\r\nVocê nunca vai esquecer essa experiência vinícola...', '11 Provas de vinhos, Vinhas, Chef privado, Almoço em um jardim', 'Onze vinhos, barco privado e almoço orgânico'),
	(2, 2, '2024-07-18 16:45:25', '11 Wine Tastings, 2 Wineries, Exclusive Visit with the Winemaker, Chef\'s Lunch in the Garden, Private Boats, WHAT ELSE?!!\r\n<br><br>\r\nWe will visit the Douro Valley as if with a friend, an unforgettable/relaxing day, an unforgettable experience. With me, everything is done at your own pace, without time limits, without deadlines for anything.\r\n<br><br>\r\nOur keyword and the motto of this experience are:\r\nNo STRESS, 100% satisfaction guaranteed.\r\n<br><br>\r\nWe will see the touristy Douro that 99% of people see, but I want you to be the 1% of tourists who will see the Douro that no one else sees.\r\nI will show you the most beautiful roads of the less touristy Douro and the most authentic places, with the local population, their customs, their food, and their wines.\r\n<br><br>\r\nWe will have an exclusive visit with the winemaker, learn about the wine culture in a fun way, not boring like the major commercial brands that you can see in the city of Porto at the cellars.\r\nWe will show you something different, get ready to be surprised.\r\n<br><br>\r\nRiver cruise on a private boat with snacks and drinks, one of the best river cruises of your life.\r\n<br><br>\r\nChef\'s lunch with a tasting of authentic Douro food paired with the chef\'s wines, we have several surprises that you will love.\r\nAn exclusive high-quality event, like all our events, just for our guests.\r\n<br><br>\r\nYou will never forget this wine experience...', 'Eleven Wine Tastings, Wineries, Farm to Table Chef, Garden Lunch', 'Eleven wines, private boat, and organic lunch'),
	(4, 1, '2023-07-12 21:43:00', 'Esqueça os passeios normais ao Vale do Douro feitos em carrinhas, temos ao seu dispor uma luxuosa Mercedes descapotável Classe E.\r\n<br><br>\r\nEste programa é o melhor de 3 experiências juntas em uma:\r\n\r\n- Melhor passeio em um Mercedes Classe E conversível.\r\n- Melhores vinhos e experiência gastronômica\r\n- O melhor serviço de foto e vídeo PRO para você se lembrar mais tarde em casa.\r\n<br><br>\r\nA minha experiência, que não chamo de tour, só tem eventos privados para os meus convidados, sem se misturar com pessoas de outros tours como fazem outras operadoras, nos barcos, adegas e almoços ...\r\n<br><br>\r\nEste não é um passeio, é um dia diferente e memorável com um amigo que irá mostrar-lhe as vistas deslumbrantes do Vale do Douro, ao volante de um Mercedes descapotável.\r\n<br><br>\r\nNo cruzeiro fluvial a bordo veremos paisagens deslumbrantes e conheceremos a história do Vale do Douro com guias privados ... degustaremos diversos vinhos do Porto juntamente com comidas locais feitas pela população local.\r\n<br><br>\r\nEm seguida iremos visitar a quinta mais antiga do Douro Est.1638 onde teremos uma prova de vinhos comentada exclusiva e teremos contacto direto com as vinhas onde poderá degustar as uvas se desejar.\r\n<br><br>\r\nPara fechar com chave de ouro, iremos visitar a aldeia vinícola mais antiga do douro e almoçar no FARM2TABLE Chef onde iremos provar comidas locais incríveis e 4 vinhos de mesa, incluindo vinhos premiados mundialmente\r\n<br><br>\r\nEsqueça os chefs Michelin, opte pela autenticidade do Douro.', 'Vale do Douro em um Mercedes conversível', 'Vale do Douro em um Mercedes conversível'),
	(4, 2, '2024-07-18 16:45:58', 'Forget the usual tours to the Douro Valley done in vans; we offer you a luxurious Mercedes E-Class convertible.\r\n<br><br>\r\nThis program combines the best of 3 experiences in one:\r\n\r\n- Best tour in a Mercedes E-Class convertible.\r\n- Finest wines and gastronomic experience.\r\n- Top PRO photo and video service for you to remember later at home.\r\n<br><br>\r\nMy experience, which I don’t call a tour, only includes private events for my guests, without mixing with people from other tours like other operators do, in boats, wineries, and lunches...\r\n<br><br>\r\nThis is not a tour; it\'s a different and memorable day with a friend who will show you the stunning views of the Douro Valley, at the wheel of a convertible Mercedes.\r\n<br><br>\r\nOn the river cruise, we will see breathtaking landscapes and learn about the history of the Douro Valley with private guides... we will taste various Port wines along with local foods made by the local population.\r\n<br><br>\r\nNext, we will visit the oldest estate in the Douro, Est. 1638, where we will have an exclusive wine tasting with commentary and have direct contact with the vineyards where you can taste the grapes if you wish.\r\n<br><br>\r\nTo top it off, we will visit the oldest wine village in the Douro and have lunch at FARM2TABLE Chef, where we will taste amazing local foods and 4 table wines, including internationally awarded wines.\r\n<br><br>\r\nForget Michelin chefs; choose the authenticity of the Douro.', 'Douro Valley in a convertible Mercedes', 'Douro Valley in a convertible Mercedes');
/*!40000 ALTER TABLE `tour_body` ENABLE KEYS */;

-- A despejar estrutura para tabela main.tour_extras
CREATE TABLE IF NOT EXISTS `tour_extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tour` int(11) NOT NULL,
  `language` int(11) NOT NULL,
  `location` tinytext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `link` mediumtext DEFAULT NULL,
  `highlight` int(1) DEFAULT NULL,
  `itinerary` int(1) DEFAULT NULL,
  `include` int(1) DEFAULT NULL,
  `important_info` int(1) DEFAULT NULL,
  `impossibility` int(1) DEFAULT NULL,
  `meeting_point` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_tour`,`language`) USING BTREE,
  KEY `FK_tour_itinerary_tour` (`id_tour`),
  KEY `FK_tour_itinerary_language` (`language`),
  CONSTRAINT `FK_tour_itinerary_language` FOREIGN KEY (`language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tour_itinerary_tour` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela main.tour_extras: ~0 rows (aproximadamente)
DELETE FROM `tour_extras`;
/*!40000 ALTER TABLE `tour_extras` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_extras` ENABLE KEYS */;

-- A despejar estrutura para tabela main.tour_highlight
CREATE TABLE IF NOT EXISTS `tour_highlight` (
  `id` int(11) NOT NULL,
  `id_tour` int(11) NOT NULL,
  `language` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`,`id_tour`,`language`),
  KEY `FK__tour` (`id_tour`),
  KEY `FK__language` (`language`),
  CONSTRAINT `FK__language` FOREIGN KEY (`language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__tour` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela main.tour_highlight: ~0 rows (aproximadamente)
DELETE FROM `tour_highlight`;
/*!40000 ALTER TABLE `tour_highlight` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_highlight` ENABLE KEYS */;

-- A despejar estrutura para tabela main.tour_image
CREATE TABLE IF NOT EXISTS `tour_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tour` int(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_tour`),
  KEY `FK_tour_image_tour` (`id_tour`),
  CONSTRAINT `FK_tour_image_tour` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela main.tour_image: ~0 rows (aproximadamente)
DELETE FROM `tour_image`;
/*!40000 ALTER TABLE `tour_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_image` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
