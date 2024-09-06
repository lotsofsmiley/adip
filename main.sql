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


-- A despejar estrutura da base de dados para u188898724_main
CREATE DATABASE IF NOT EXISTS `u188898724_main` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `u188898724_main`;

-- A despejar estrutura para tabela u188898724_main.employees
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
  `display` int(11) DEFAULT 1,
  `disabled` int(11) DEFAULT 0,
  PRIMARY KEY (`id`,`language`),
  KEY `FK_employees_language` (`language`),
  CONSTRAINT `FK_employees_language` FOREIGN KEY (`language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela u188898724_main.employees: ~24 rows (aproximadamente)
DELETE FROM `employees`;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id`, `language`, `name`, `phone_number`, `email`, `img`, `text`, `role`, `family_role`, `display`, `disabled`) VALUES
	(1, 1, 'Manuel Guimarães', 932275121, NULL, './resources/_images/familia/manuel/manuel1.JPG', 'A alma do Vale do Douro, o patriarca, provavelmente o único ser humano à face da terra que, não têm só uma mas sim duas bocas, pois ouvir não é com ele! Apaixonado e energético, só vai parar quando exceder as tuas espectativas!', 'Fundador', NULL, 1, 0),
	(1, 2, 'Manuel Guimarães', 932275121, NULL, './resources/_images/familia/manuel/manuel1.JPG', 'The Douro Valley\'s soul, the patriarch, probably the only human being that, not only has one but two mouths, because listening isn\'t his thing! Passionate and energetic, he won\'t stop until he exceeds your expectations!', 'Founder', NULL, 1, 0),
	(2, 1, 'Teresa Guimarães', 938458381, 'tmbfsg@hotmail.com', './resources/_images/member_template.JPG', 'Mulher do Manuel, e basicamente a dona disto tudo, porque o Manuel têm sempre que lhe pedir autorização para tudo. É dela que saem os melhores pratos do mundo, sempre cheios, tanto em amor, sabor, e o mais importante, quantidade!  \r\n', 'Chefe', NULL, 0, 0),
	(2, 2, 'Teresa Guimarães', 938458381, 'tmbfsg@hotmail.com', './resources/_images/member_template.JPG', 'Manuel\'s Wife, that basically means she owns everything, because Manuel needs to ask her permissions for everything. Their dishes are the best in the world, always full of, love, flavour and most importantly, quantity!', 'Chef', NULL, 0, 0),
	(3, 1, 'Nuno Guimarães', 916541852, NULL, './resources/_images/familia/nuno/nuno1.jpeg', 'Nuno é um dos guias mais jovens mas é também o mais bem informado quando o assunto é vinhos. Estuda para ser um sommelier, Nuno é WSET3 e é responsável pela seleção de vinhos das nossas experiências. Carismático, com um humor afiado, garante risos e aulas engraçadas acerca dos vinhos do Douro.', 'Guia Turístico Sénior', 'Filho do Manuel', 1, 0),
	(3, 2, 'Nuno Guimarães', 916541852, NULL, './resources/_images/familia/nuno/nuno1.jpeg', 'Nuno is younger than most of our guides but is also the most knowledgeable one when the subject is wines. Studying to become a sommelier, Nuno is a WSET3 and is responsible for the wine selection of our tour. Charismatic, with a sharp humour, Nuno will give you good laughs and funny classes on Douro wines.', 'Senior Tour Guide', 'Manuel\'s Son', 1, 0),
	(4, 1, 'João Guimarães', 917377302, NULL, './resources/_images/familia/joao/joao1.JPG', 'João, ou como lhe chamamos, o <i>pretty face</i> do Douro, cringe moments é com ele, além das melhores fotografias, risos e conhecimentos na base da experiência das melhores francesinhas em Portugal!', 'Guia Turístico Sénior', 'Filho do Manuel', 1, 0),
	(4, 2, 'João Guimarães', 917377302, NULL, './resources/_images/familia/joao/joao1.JPG', 'João, or as we call him, Douro\'s pretty face, cringe moments are his thing, but if you want the best photos, laughs and experience-based knowledge on the best "francesinhas" in Portugal he is your guy!', 'Senior Tour Guide', 'Manuel\'s Son', 1, 0),
	(5, 1, 'Paulo Sérgio', NULL, NULL, './resources/_images/familia/sergio/sergio2.jpeg', 'O Sérgio é a cola que mantém toda gente no sítio. Com um grande conhecimento de vinhos e história do Douro, é também a pessoa com o melhor sentido de humor que vais encontrar. Com o "coração na boca", todos adoram a sua autenticidade. Com ele, o teu dia vai ser cheio de risos do ínicio ao fim. É o ícone da moda na nossa família, sempre bem vestido (parece que vai a um casamento todos os dias, é inacreditável!).', 'Guia Turístico Sénior', 'Primo do Manuel', 1, 0),
	(5, 2, 'Paulo Sérgio', NULL, NULL, './resources/_images/familia/sergio/sergio2.jpeg', 'Sérgio, is the glue that holds everything together. With plenty of wine and history knowledge, is the owner of the best sense of humor you will ever find present in a person. Very honest, direct, and with "the heart very close to his mouth", everyone loves his authenticity. With him, your day will be full of laughs from the start to the end. Leadership and caring for every guest, he is also the fashion icon of our family - all the time with the best presentation ever (looks like he goes to a wedding every day, which is unbelievable!).', 'Senior Tour Guide', 'Manuel\'s Cousin', 1, 0),
	(6, 1, 'Daniel', NULL, NULL, './resources/_images/member_template.JPG', 'O artista da familia, literalmente! Músico, cineasta, o homem das artes e das histórias, fofinho e bolo fofo. Os teus desejos são tudo para ele, quer seja uma caixa cheia de natinhas de manhã ou 25 copos de vinho. Gang Gang', 'Guia Turístico Sénior', 'Sobrinho do Manuel', 0, 0),
	(6, 2, 'Daniel', NULL, NULL, './resources/_images/member_template.JPG', 'The artist of the family, literally! Musician, film-maker, the man of the arts and stories, cute and sweet, your desires are everything to him, from a box of "natas" to 25 glasses of wine. Gang Gang', 'Senior Tour Guide', 'Manuel\'s Nephew', 0, 0),
	(7, 1, 'Jorge', NULL, NULL, './resources/_images/familia/jorge/jorge1_2.JPG', 'Jorge é um dos peritos em vinho na família. Qualquer vinho português, de qualquer região vinícola ele vai conhecer. Também conhecido como o Tom Hanks português, Jorge é uma encicolpédia de vinhos portugueses! Com bastante experiência a trabalhar como sommelier em Londres. No Douro, só vais sentir falta do silêncio porque ele só quer falar.', 'Guia Turístico Sénior', 'Primo do Manuel', 1, 0),
	(7, 2, 'Jorge', NULL, NULL, './resources/_images/familia/jorge/jorge1_2.JPG', 'Jorge, is one of the wine experts from our family. Whatever Portuguese wine, from whatever wine region, he will know it. Also known as Portuguese Tom Hanks, Jorge is a Portuguese wine encyclopedia! With plenty of experience on working in London as a sommelier, Jorge is a very friendly and helpful guide. When in Douro, the only thing missing will be silence since he talks a lot..\n', 'Senior Tour Guide', 'Manuel\'s Cousin', 1, 0),
	(8, 1, 'Joca', NULL, NULL, './resources/_images/familia/joca/joca2.JPG', 'Dono de uma playlist musical um tanto quanto duvidosa mas toda a gente adora! É graduado nos cinturões branco, verde, azul, castanho, preto e todas as cores possiveis e imaginárias pois têm uma experiência de 30 anos em Artes Marciais, já na fotografia foi o João que lhe deu umas aulas, por isso irão ser excelentes memorias nos vossos instagrams.', 'Guia Turístico', 'Sogro do Nuno', 1, 0),
	(8, 2, 'Joca', NULL, NULL, './resources/_images/familia/joca/joca2.JPG', 'Owner of the weirdest playlists that everyone loves! Graduated in white, green, blue, brown, black belts and in every possible and imaginable color because he has over 30 years of experience in martial arts. João gave him some lessons in photograpy to guarantee you have excelent memories for your instagrams.', 'Tour Guide', 'Nuno\'s Father-in-law', 1, 0),
	(9, 1, 'Luís', NULL, NULL, './resources/_images/familia/luis/luis2.JPG', 'O nosso eterno estudante, proveniente de Coimbra, onde fica uma das mais antigas univerdades no mundo, e com o lema "Scientiae thesaurus mirabilis", será o teu professor mas atenção, nem tudo é perfeito, pois é o que têm o pior gosto futebolistico (ele apoia o Benfica).\n', 'Guia Turístico', NULL, 1, 0),
	(9, 2, 'Luís', NULL, NULL, './resources/_images/familia/luis/luis2.JPG', 'Our eternal student, hailing from Coimbra, where one of the oldest universities in the world is located and with the motto "Scientiae thesaurus mirabilis," will be your teacher. But beware, not everything is perfect, as he has the worst taste in football (he supports Benfica).', 'Tour Guide', NULL, 1, 0),
	(10, 1, 'Jorge', NULL, NULL, './resources/_images/familia/jorge2/jorge2_1.JPG', 'Carinhosamente conhecido como "Jorge The Second" ou "Jorge The King", afirma que tem ligações à mais nobre realeza da cidade invicta. Jorge não é apenas um guia, ele é uma lenda viva, conhecida pelo seu título honorário e pelos seus abdominais "one pack" que são, sem dúvida, uma atração à parte! Adorador de bom vinho e boa comida. Descobre a realeza do Porto com o inigualável "Jorge The King"!', 'Guia Turístico', 'Cunhado do Paulo', 1, 0),
	(10, 2, 'Jorge', NULL, NULL, './resources/_images/familia/jorge2/jorge2_1.JPG', 'Affectionately known as "Jorge The Second" or "Jorge The King," he claims to have ties to the most noble royalty of the undefeated city. Jorge is not just a guide; he is a living legend, known for his honorary title and his "one pack" abs, which are undoubtedly an attraction in themselves! A lover of fine wine and good food. Discover the royalty of Porto with the unparalleled "Jorge The King"!', 'Tour Guide', 'Paulo\'s Brother-in-law', 1, 0),
	(11, 1, 'Rúben', NULL, NULL, './resources/_images/member_template.JPG', 'Ruben não é apenas especialista em vinhos, mas é também um organizador de eventos excepcional, com um longo portfólio de festas de música criadas por ele na cidade do Porto. A paixão pela cultura do vinho começou na infância, tornando-se um conhecedor desde pequeno. Sempre acompanhado pela sua boina, um acessório que reflete o seu estilo elegante e clássico.', 'Guia Turístico', NULL, 0, 0),
	(11, 2, 'Rúben', NULL, NULL, './resources/_images/member_template.JPG', 'Ruben is not just a wine expert; he is also an exceptional event organizer, with an extensive portfolio of music parties he has created in the city of Porto. His passion for wine culture began in childhood, making him a connoisseur from a young age. He is always accompanied by his beret, an accessory that reflects his elegant and classic style.', 'Tour Guide', NULL, 0, 0),
	(12, 1, 'Neto', NULL, NULL, './resources/_images/member_template.JPG', 'Basicamente, meteu uma cunha para entrar e após ter aprendido e treinado durante anos com os melhores (Manuel, João e Nuno) tornou-se no segundo melhor, atrás do Daniel, a servir natinhas de manhã.', 'Guia Turístico', NULL, 0, 1),
	(12, 2, 'Neto', NULL, NULL, './resources/_images/member_template.JPG', 'Basically, he pulled some strings to get in, and after learning and training for years with the best (Manuel, João, and Nuno), he became the second best, just behind Daniel, at serving "natinhas" in the morning.', 'Tour Guide', NULL, 0, 1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- A despejar estrutura para tabela u188898724_main.faqs
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` tinytext NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela com as perguntas feitas regularmente';

-- A despejar dados para tabela u188898724_main.faqs: ~0 rows (aproximadamente)
DELETE FROM `faqs`;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;

-- A despejar estrutura para tabela u188898724_main.language
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela com as linguagens disponíveis ao utilizador no site.';

-- A despejar dados para tabela u188898724_main.language: ~2 rows (aproximadamente)
DELETE FROM `language`;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` (`id`, `code`, `description`, `file_name`, `file_image`) VALUES
	(1, 'pt', 'Português', './resources/view/languages/lang_pt.php', './resources/_images/languages/pt.jpg'),
	(2, 'en', 'English', './resources/view/languages/lang_eng.php', './resources/_images/languages/en.jpg');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;

-- A despejar estrutura para tabela u188898724_main.nav_content
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

-- A despejar dados para tabela u188898724_main.nav_content: ~0 rows (aproximadamente)
DELETE FROM `nav_content`;
/*!40000 ALTER TABLE `nav_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `nav_content` ENABLE KEYS */;

-- A despejar estrutura para tabela u188898724_main.social_media
CREATE TABLE IF NOT EXISTS `social_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `icon_class` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela com as redes sociais no footer do site.';

-- A despejar dados para tabela u188898724_main.social_media: ~6 rows (aproximadamente)
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

-- A despejar estrutura para tabela u188898724_main.tour
CREATE TABLE IF NOT EXISTS `tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `price_unit` int(11) DEFAULT NULL,
  `price_unit_discount` int(11) DEFAULT NULL,
  `departure` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `ending` time DEFAULT NULL,
  `tour_limit` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `tour_language` varchar(50) DEFAULT NULL,
  `group_type` varchar(50) DEFAULT NULL,
  `display` int(11) DEFAULT 1,
  `disabled` int(11) DEFAULT 0,
  PRIMARY KEY (`id`,`language`) USING BTREE,
  KEY `FK_tour_language` (`language`),
  CONSTRAINT `FK_tour_language` FOREIGN KEY (`language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela com as várias experiências disponíveis.';

-- A despejar dados para tabela u188898724_main.tour: ~10 rows (aproximadamente)
DELETE FROM `tour`;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` (`id`, `language`, `name`, `price_unit`, `price_unit_discount`, `departure`, `duration`, `ending`, `tour_limit`, `description`, `image`, `tour_language`, `group_type`, `display`, `disabled`) VALUES
	(1, 1, 'Degustações em 2 vinícolas, almoço do chef e passeio de barco', 145, NULL, '8:30/9:00/10:00', '9,5 Horas', '18:00:00', 35, 'Embarque numa experiência exclusiva e autêntica no Vale do Douro. Desfrute de 11 degustações de vinhos, passeios de barco privativos, visitas a duas vinícolas e um almoço requintado preparado por um renomado chef. Mergulhe na rica cultura da região, conecte-se com os locais carismáticos e aprenda sobre os vinhos de mesa e o famoso vinho do Porto de uma forma divertida e envolvente.  ', './tour/1/tour1.png', 'Inglês', 'Pequenos', 1, 0),
	(1, 2, 'Wine tastings at 2 wineries, chef\'s lunch, and boat tour', 145, NULL, '8:30/9:00/10:00', '9,5 Hours', '18:00:00', 35, 'Embark on an exclusive and authentic experience in the Douro Valley. Enjoy 11 wine tastings, private boat tours, visits to two wineries, and a gourmet lunch prepared by a renowned chef. Immerse yourself in the rich culture of the region, connect with charismatic locals, and learn about table wines and the famous Port wine in a fun and engaging way.\r\n\r\n\r\n\r\n\r\n', './tour/1/tour1.png', 'English', 'Small', 1, 0),
	(2, 1, '11 Provas de vinhos, Vinhas, Chef privado, Almoço em um jardim', 115, NULL, '8:30/9:00/10:00', NULL, '18:00:00', 30, '\r\nExperimente o Vale do Douro como nunca antes. Desfrute de 11 degustações de vinhos, visitas exclusivas a duas vinícolas com apresentações do enólogo, almoço do chef, passeios de barco privativos e autênticos encontros locais. Sem estresse, 100% de satisfação garantida. Descubra os tesouros escondidos da região e crie memórias inesquecíveis nesta excecional experiência vínica.', './tour/2/tour1.png', 'Inglês', 'Pequenos', 1, 0),
	(2, 2, 'Eleven Wine Tastings, Wineries, Farm to Table Chef, Garden Lunch', 115, NULL, '8:30/9:00/10:00', NULL, '18:00:00', 30, 'Experience the Douro Valley like never before. Enjoy 11 wine tastings, exclusive visits to two wineries with presentations by the winemaker, a chef\'s lunch, private boat tours, and authentic local encounters. Stress-free, 100% satisfaction guaranteed. Discover the hidden treasures of the region and create unforgettable memories in this exceptional wine experience.', './tour/2/tour1.png', 'English', 'Small', 1, 0),
	(3, 1, 'Realeza do Vale do Douro impulsionado por Mercedes de Luxo', 400, NULL, '10:00', '7 Horas', '17:00:00', 6, 'Trazemos Dubai para o Vale do Douro em uma experiência completamente privada, apenas para os nossos hóspedes, com carros de luxo e os nossos barcos privados com snacks e bebidas. <br> Alimentada pela Mercedes Benz Classe S e Class E descapotável.', './tour/3/tour.png', 'Inglês', 'Pequenos', 1, 0),
	(3, 2, 'Royale Douro Valley powered by Luxury Mercedes', 400, NULL, '10:00', '7 Hours', '17:00:00', 6, 'We bring Dubai to Douro Valley in a completly private experience only for our guests, with luxury cars and our private boats with snacks an drinks. <br> Powered by Mercedes Benz S-class and E-class cabrio.', './tour/3/tour.png', 'English', 'Small', 1, 0),
	(4, 1, 'Vale do Douro em um Mercedes conversível', 300, NULL, '8:30/9:00/10:00', NULL, '18:00:00', 3, 'Experimente a derradeira aventura no Vale do Douro num luxuoso Mercedes E-Class descapotável. Delicie-se com os melhores vinhos, gastronomia e serviço profissional de foto/vídeo. Navegue ao longo do rio, saboreie vinhos do Porto e iguarias locais, visite duas quintas vinícolas locais e saboreie o almoço de um chef do Douro. Opte pela autenticidade e crie memórias inesquecíveis no Douro.', './tour/4/tour.png', 'Inglês', 'Pequenos', 1, 0),
	(4, 2, 'Douro Valley in a convertible Mercedes', 300, NULL, '8:30/9:00/10:00', NULL, '18:00:00', 3, 'Experience the ultimate adventure in the Douro Valley in a luxurious convertible Mercedes E-Class. Indulge in the finest wines, gastronomy, and professional photo/video service. Cruise along the river, savor Port wines and local delicacies, visit two local wineries, and enjoy lunch from a Douro chef. Choose authenticity and create unforgettable memories in the Douro.', './tour/4/tour.png', 'English', 'Small', 1, 0),
	(5, 1, 'Vinho Verde', NULL, NULL, '9:15', NULL, NULL, NULL, NULL, './tour/5/tour.png', 'Inglês', NULL, 0, 1),
	(5, 2, 'Green Wine', NULL, NULL, '9:15', NULL, NULL, NULL, NULL, './tour/5/tour.png', 'English', NULL, 0, 1);
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;

-- A despejar estrutura para tabela u188898724_main.tour_body
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

-- A despejar dados para tabela u188898724_main.tour_body: ~6 rows (aproximadamente)
DELETE FROM `tour_body`;
/*!40000 ALTER TABLE `tour_body` DISABLE KEYS */;
INSERT INTO `tour_body` (`id`, `language`, `edited_at`, `content`, `title`, `subtitle`) VALUES
	(1, 1, '2023-07-12 21:42:50', 'Faça um cruzeiro relaxante (nos nossos barcos) no Vale do Douro, exclusivo para os nossos hóspedes.\r\n<br><br>\r\nOuça a história da região contada pelo seu guia a bordo.\r\n<br><br>\r\nPoderá desfrutar de 11 provas de vinhos diferentes e visitar duas pequenas quintas familiares.\r\n<br><br>\r\nAlmoce com estilo, com um tradicional almoço de comida regional exclusiva, acompanhado por vários vinhos secos D.O.C. e vinho do Porto, preparado por um chef de uma família do Douro.\r\n<br><br>\r\nInicie o seu passeio com um cruzeiro guiado num barco privado. Relaxe e navegue pelo Vale do Douro durante 1 hora, enquanto saboreia as iguarias da região e aprecia as bebidas, ao mesmo tempo que ouve histórias sobre o Vale do Douro.\r\n<br><br>\r\nDe seguida, visite uma pequena quinta familiar para uma visita exclusiva diretamente com o viticultor, onde poderá apreciar os vinhos, provar alguns petiscos da região e degustar o azeite de oliva local. Imagine que vai assistir a uma peça de teatro sobre vinhos, onde aprenderá sobre vinhos enquanto se diverte com um copo na mão.\r\n<br><br>\r\nEm seguida, na nossa quinta familiar, desfrutará de um delicioso almoço "Farm-to-Table" do Chef, harmonizado com vinhos D.O.C., e provará alguns pratos típicos do Douro preparados pelo Chef na nossa propriedade. Experimente uma refeição portuguesa incrível que irá superar todas as suas expectativas.\r\n<br><br>\r\nAssistirá também à abertura de um vinho do Porto Vintage ao fogo, um evento notável e uma prática ancestral, e degustará o melhor dos vinhos do Porto. Somos a única experiência vínica que realiza este evento único e exclusivo todos os dias, apenas para os nossos hóspedes.\r\n<br><br>\r\nTemos várias surpresas preparadas para o nosso dia que não revelaremos aqui para não estragar a surpresa, claro.\r\n<br><br>\r\nEm relação aos vinhos, teremos 11 provas diferentes. Provaremos vinhos secos D.O.C. e várias categorias de vinhos do Porto, além de realizar uma autêntica degustação de aguardente do Vale do Douro.\r\n<br><br>\r\nFinalmente, regressará ao ponto de partida no centro do Porto para encerrar o passeio.\r\n<br><br>\r\nO seu sorriso no final do dia será o nosso sorriso a dobrar, queremos proporcionar-lhe um dia memorável, uma experiência inesquecível...', 'Degustações em 2 vinícolas, almoço do chef e passeio de barco', 'Acesso privilegiado ao Vale do Douro (experiência premiada)'),
	(1, 2, '2024-07-18 16:43:43', 'Go on a relaxing cruise ( our boats ) in the Douro Valley only for our guests.\r\n<br><br>\r\nHear about the history of the area from your guide in our boat.\r\n<br><br>\r\nEnjoy 11 different wine tastings and visit 2 small family winemakers.\r\n<br><br>\r\nDine in style with a traditional lunch with unique regional food paired with several D.O.C. dry wines and Port wine prepared by a Farm-to-Table chef of a Douro family.\r\n<br><br>\r\nBegin your tour with a private boat cruise.\r\nRelax and sail the Douro Valley for 1 hour, then, taste Douro delicacies and enjoy drinks while you listen to stories about the Douro Valley.\r\n<br><br>\r\nAfter this, visit a small family winery to have an exclusive visit directly with the winemaker, enjoy the wines , taste some Douro snacks and their olive oil. Imagine that you are going to see a wine theater play, where you are going to learn about wine while laughing with a glass in your hand\r\n<br><br>\r\nThen in our Family Wine Estate eat a delicious Farm-to-Table Chef lunch paired with D.O.C. wines and enjoy some Douro food prepared by the Chef in our propriety. Experience an amazing portuguese meal that will exceed all your expectations.\r\n<br><br>\r\nWitness the opening of a Vintage Port Wine by fire, a remarkable event and ancient practice and taste the best of Port wines.\r\nWe are the only wine experience to hold this unique and exclusive event every day just for our guests.\r\n<br><br>\r\nWe have several surprises for our day that we won\'t say here so as not to spoil the surprise, of course.\r\n<br><br>\r\nRegarding wines, we will have 11 different tastings. We will taste D.O.C dry wines and several categories of Port wines, also doing an authentic firewater tasting from the Douro Valley.\r\n<br><br>\r\nFinally, return to the starting point in Porto downtonw to end the tour.\r\n<br><br>\r\nYour smile at the end of the day it will be our double smile, we want to give you a memorable day, an experience of a lifetime...', 'Wine tastings at 2 wineries, chef\'s lunch, and boat tour.', 'Privileged access to the Douro Valley (award-winning experience)'),
	(2, 1, '2023-07-12 21:42:56', '11 Degustações de vinhos, 2 vinícolas, visita exclusiva com o vinicultor, Almoço do Chef no jardim, Barcos Privados, O QUE MAIS?!!\r\n<br><br>\r\nVisitaremos o Vale do Douro como se fosse com um amigo, um dia inesquecível/relaxante, uma experiência inesquecível.\r\nComigo, tudo é feito ao seu próprio ritmo, sem limites de tempo, sem prazos para nada.\r\n<br><br>\r\nNossa palavra-chave e o lema desta experiência são:\r\nSem ESTRESSE, 100% de satisfação garantida\r\n<br><br>\r\nVamos ver o Douro turístico que 99% das pessoas veem, mas quero que vocês sejam os 1% dos turistas que verão o Douro que mais ninguém vê.\r\nVou mostrar-lhe as estradas mais bonitas do Douro menos turístico e os lugares mais autênticos, da população local com seus costumes e suas comidas e vinhos.\r\n<br><br>\r\nTeremos uma visita exclusiva com o enólogo, aprenderemos a cultura vinícola de uma forma divertida, não chata como nas principais marcas comerciais, que você pode ver na cidade do Porto nas adegas.\r\nMostraremos algo diferente, prepare-se para se surpreender.\r\n<br><br>\r\nCruzeiro pelo rio em um barco privado com lanches e bebidas, um dos melhores cruzeiros fluviais da sua vida.\r\n<br><br>\r\nAlmoço do chef com degustação de autêntica comida do Douro combinada com os vinhos do chef, temos várias surpresas que você vai adorar.\r\nUm evento exclusivo da mais alta qualidade, como todos os nossos eventos, apenas para os nossos hóspedes.\r\n<br><br>\r\nVocê nunca vai esquecer essa experiência vinícola...', '11 Provas de vinhos, Vinhas, Chef privado, Almoço em um jardim', 'Onze vinhos, barco privado e almoço orgânico'),
	(2, 2, '2024-07-18 16:45:25', '11 Wine Tastings, 2 Wineries, Exclusive Visit with the Winemaker, Chef\'s Lunch in the Garden, Private Boats, WHAT ELSE?!!\r\n<br><br>\r\nWe will visit the Douro Valley as if with a friend, an unforgettable/relaxing day, an unforgettable experience. With me, everything is done at your own pace, without time limits, without deadlines for anything.\r\n<br><br>\r\nOur keyword and the motto of this experience are:\r\nNo STRESS, 100% satisfaction guaranteed.\r\n<br><br>\r\nWe will see the touristy Douro that 99% of people see, but I want you to be the 1% of tourists who will see the Douro that no one else sees.\r\nI will show you the most beautiful roads of the less touristy Douro and the most authentic places, with the local population, their customs, their food, and their wines.\r\n<br><br>\r\nWe will have an exclusive visit with the winemaker, learn about the wine culture in a fun way, not boring like the major commercial brands that you can see in the city of Porto at the cellars.\r\nWe will show you something different, get ready to be surprised.\r\n<br><br>\r\nRiver cruise on a private boat with snacks and drinks, one of the best river cruises of your life.\r\n<br><br>\r\nChef\'s lunch with a tasting of authentic Douro food paired with the chef\'s wines, we have several surprises that you will love.\r\nAn exclusive high-quality event, like all our events, just for our guests.\r\n<br><br>\r\nYou will never forget this wine experience...', 'Eleven Wine Tastings, Wineries, Farm to Table Chef, Garden Lunch', 'Eleven wines, private boat, and organic lunch'),
	(4, 1, '2023-07-12 21:43:00', 'Esqueça os passeios normais ao Vale do Douro feitos em carrinhas, temos ao seu dispor uma luxuosa Mercedes descapotável Classe E.\r\n<br><br>\r\nEste programa é o melhor de 3 experiências juntas em uma:\r\n\r\n- Melhor passeio em um Mercedes Classe E conversível.\r\n- Melhores vinhos e experiência gastronômica\r\n- O melhor serviço de foto e vídeo PRO para você se lembrar mais tarde em casa.\r\n<br><br>\r\nA minha experiência, que não chamo de tour, só tem eventos privados para os meus convidados, sem se misturar com pessoas de outros tours como fazem outras operadoras, nos barcos, adegas e almoços ...\r\n<br><br>\r\nEste não é um passeio, é um dia diferente e memorável com um amigo que irá mostrar-lhe as vistas deslumbrantes do Vale do Douro, ao volante de um Mercedes descapotável.\r\n<br><br>\r\nNo cruzeiro fluvial a bordo veremos paisagens deslumbrantes e conheceremos a história do Vale do Douro com guias privados ... degustaremos diversos vinhos do Porto juntamente com comidas locais feitas pela população local.\r\n<br><br>\r\nEm seguida iremos visitar a quinta mais antiga do Douro Est.1638 onde teremos uma prova de vinhos comentada exclusiva e teremos contacto direto com as vinhas onde poderá degustar as uvas se desejar.\r\n<br><br>\r\nPara fechar com chave de ouro, iremos visitar a aldeia vinícola mais antiga do douro e almoçar no FARM2TABLE Chef onde iremos provar comidas locais incríveis e 4 vinhos de mesa, incluindo vinhos premiados mundialmente\r\n<br><br>\r\nEsqueça os chefs Michelin, opte pela autenticidade do Douro.', 'Vale do Douro em um Mercedes conversível', 'Vale do Douro em um Mercedes conversível'),
	(4, 2, '2024-07-18 16:45:58', 'Forget the usual tours to the Douro Valley done in vans; we offer you a luxurious Mercedes E-Class convertible.\r\n<br><br>\r\nThis program combines the best of 3 experiences in one:\r\n\r\n- Best tour in a Mercedes E-Class convertible.\r\n- Finest wines and gastronomic experience.\r\n- Top PRO photo and video service for you to remember later at home.\r\n<br><br>\r\nMy experience, which I don’t call a tour, only includes private events for my guests, without mixing with people from other tours like other operators do, in boats, wineries, and lunches...\r\n<br><br>\r\nThis is not a tour; it\'s a different and memorable day with a friend who will show you the stunning views of the Douro Valley, at the wheel of a convertible Mercedes.\r\n<br><br>\r\nOn the river cruise, we will see breathtaking landscapes and learn about the history of the Douro Valley with private guides... we will taste various Port wines along with local foods made by the local population.\r\n<br><br>\r\nNext, we will visit the oldest estate in the Douro, Est. 1638, where we will have an exclusive wine tasting with commentary and have direct contact with the vineyards where you can taste the grapes if you wish.\r\n<br><br>\r\nTo top it off, we will visit the oldest wine village in the Douro and have lunch at FARM2TABLE Chef, where we will taste amazing local foods and 4 table wines, including internationally awarded wines.\r\n<br><br>\r\nForget Michelin chefs; choose the authenticity of the Douro.', 'Douro Valley in a convertible Mercedes', 'Douro Valley in a convertible Mercedes');
/*!40000 ALTER TABLE `tour_body` ENABLE KEYS */;

-- A despejar estrutura para tabela u188898724_main.tour_extras
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
  `before_tour` int(1) DEFAULT NULL,
  `should_take` int(1) DEFAULT NULL,
  `not_allowed` int(1) DEFAULT NULL,
  `not_recommended` int(1) DEFAULT NULL,
  `meeting_point` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_tour`,`language`) USING BTREE,
  KEY `FK_tour_itinerary_tour` (`id_tour`),
  KEY `FK_tour_itinerary_language` (`language`),
  CONSTRAINT `FK_tour_itinerary_language` FOREIGN KEY (`language`) REFERENCES `language` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tour_itinerary_tour` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela u188898724_main.tour_extras: ~56 rows (aproximadamente)
DELETE FROM `tour_extras`;
/*!40000 ALTER TABLE `tour_extras` DISABLE KEYS */;
INSERT INTO `tour_extras` (`id`, `id_tour`, `language`, `location`, `description`, `link`, `highlight`, `itinerary`, `include`, `before_tour`, `should_take`, `not_allowed`, `not_recommended`, `meeting_point`) VALUES
	(1, 1, 1, 'R. de Sá da Bandeira 102, 4000-427 Porto, Portugal', '\r\nO ponto de encontro é à porta do teatro Sá da Bandeira.', 'https://maps.google.com/?q=@41.14682388305664,-8.608904838562012', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
	(2, 1, 2, 'R. de Sá da Bandeira 102, 4000-427 Porto, Portugal', 'The meeting point is at the entrance of the Sá da Bandeira Theater.', 'https://maps.google.com/?q=@41.14682388305664,-8.608904838562012', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
	(3, 1, 1, NULL, 'Testemunhe a abertura de uma garrafa de vinho do Porto Vintage com fogo por um sommelier certificado.', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 1, 2, NULL, 'Witness opening a Vintage Porto wine bottle with fire by a certified sommelier.', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 1, 1, NULL, 'Passeio de barco com guia em nossos barcos particulares, desfrute de nossos petiscos e bebidas do Douro.', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 1, 2, NULL, 'Boat Cruise wit guide in our private boats, enjoy our Douro snacks and drinks.', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 1, 1, NULL, 'Visite duas pequenas vinícolas familiares e prove o delicioso vinho produzido localmente.', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 1, 2, NULL, 'Visit 2 small family-run wineries and taste the delicious locally produced wine.', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 1, 1, NULL, '11 degustações de vinhos, vinhos D.O.C. e vinhos do Porto, incluindo um Porto Vintage.', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 1, 2, NULL, '11 Wine Tastings, D.O.C wines and Porto wines including a Vintage Porto.', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 1, 1, NULL, 'Desfrute de um almoço tradicional do chef em nossa vinícola familiar do Douro, prove o azeite de oliva.', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 1, 2, NULL, 'Enjoy a traditional chef´s lunch in our Family Douro Wine Estate, Taste Olive oil.', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 1, 2, NULL, 'Transportation by air-conditioned van', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(14, 1, 2, NULL, 'Guided boat cruise with snacks and drinks', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(15, 1, 2, NULL, 'Visit to 2 family-run wineries', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(16, 1, 2, NULL, 'Vintage Port opening with fire by a certified sommelier', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(17, 1, 2, NULL, 'Tasting of 11 wines (D.O.C. dry wines, Porto wines including a Vintage and Douro firewater)', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(18, 1, 2, NULL, 'Farm-to-table lunch at a winery in Douro Valley', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(19, 1, 2, NULL, '2 olive oil tastings', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(20, 1, 2, NULL, 'Wine guides', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(21, 1, 2, NULL, 'Unlimited bottled water', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(22, 1, 2, NULL, 'Photos', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(23, 1, 2, NULL, 'Hotel pickup and drop-off', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL),
	(24, 1, 2, NULL, 'Additional meals and drinks\r\n', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL),
	(25, 1, 2, NULL, 'Tips (optional)\r\n', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, 1, 2, NULL, 'Children under 12 years', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(27, 1, 2, NULL, 'Wheelchair users', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(28, 1, 2, NULL, 'Comfortable shoes', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
	(29, 1, 2, NULL, 'Camera', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
	(30, 1, 2, NULL, 'This tour will take place rain or shine.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
	(31, 1, 2, NULL, 'Vegetarian and gluten-free options available if informed in advance. In the morning our guides will ask about food restrictions.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
	(32, 1, 1, NULL, 'Transporte em van com ar-condicionado', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(33, 1, 1, NULL, 'Passeio de barco guiado com lanches e bebidas', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(34, 1, 1, NULL, 'Visita a 2 vinícolas familiares', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(35, 1, 1, NULL, 'Abertura do Porto Vintage com fogo por um sommelier certificado', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(36, 1, 1, NULL, 'Degustação de 11 vinhos (vinhos secos D.O.C., vinhos do Porto, incluindo um Vintage e aguardente do Douro)', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(37, 1, 1, NULL, 'Almoço de fazenda para mesa em uma vinícola no Vale do Douro', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(38, 1, 1, NULL, '2 degustações de azeite', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(39, 1, 1, NULL, 'Guias de vinhos', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(40, 1, 1, NULL, 'Água engarrafada ilimitada', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(41, 1, 1, NULL, 'Fotos', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(42, 1, 1, NULL, 'Embarque e desembarque no hotel', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL),
	(43, 1, 1, NULL, 'Refeições e bebidas adicionais', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL),
	(44, 1, 1, NULL, 'Gratificação (opcional)', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL),
	(45, 1, 1, NULL, 'Crianças menores de 12 anos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(46, 1, 1, NULL, 'Utilizadores de cadeiras de rodas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL),
	(47, 1, 1, NULL, 'Calçados confortáveis', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
	(48, 1, 1, NULL, 'Câmera', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
	(49, 1, 1, NULL, 'Este passeio será realizado faça chuva ou faça sol.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
	(50, 1, 1, NULL, 'Opções vegetarianas e sem glúten disponíveis se informadas com antecedência. Pela manhã, os nossos guias perguntarão sobre restrições alimentares.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
	(51, 1, 1, NULL, 'Animais domésticos', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
	(52, 1, 1, NULL, 'Fumar no veículo', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
	(53, 1, 2, NULL, 'Pets', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
	(54, 1, 2, NULL, 'Smoking in the vehicle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(55, 1, 1, NULL, 'Guias certificados WSET em vinhos, nos níveis 1, 2 e 3 ', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
	(56, 1, 2, NULL, 'WSET level 1, 2, 3 wine guides', NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL),
	(57, 1, 2, NULL, 'Smoking inside the vehicles', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
/*!40000 ALTER TABLE `tour_extras` ENABLE KEYS */;

-- A despejar estrutura para tabela u188898724_main.tour_image
CREATE TABLE IF NOT EXISTS `tour_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tour` int(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `display` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_tour`),
  KEY `FK_tour_image_tour` (`id_tour`),
  CONSTRAINT `FK_tour_image_tour` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- A despejar dados para tabela u188898724_main.tour_image: ~13 rows (aproximadamente)
DELETE FROM `tour_image`;
/*!40000 ALTER TABLE `tour_image` DISABLE KEYS */;
INSERT INTO `tour_image` (`id`, `id_tour`, `image`, `display`) VALUES
	(1, 1, '1.png', NULL),
	(2, 1, '2.png', NULL),
	(3, 1, '3.png', NULL),
	(4, 1, '4.png', 1),
	(5, 1, '5.png', 1),
	(6, 1, '6.png', NULL),
	(7, 1, '7.png', NULL),
	(8, 1, '8.png', NULL),
	(9, 1, '9.png', 1),
	(10, 1, '10.png', NULL),
	(11, 1, '11.png', NULL),
	(12, 1, '12.png', NULL),
	(13, 1, '13.png', NULL),
	(14, 1, '14.png', NULL),
	(15, 1, '15.png', 1);
/*!40000 ALTER TABLE `tour_image` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
