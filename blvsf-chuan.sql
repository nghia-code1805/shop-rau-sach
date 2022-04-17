-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table kvt.ads
CREATE TABLE IF NOT EXISTS `ads` (
  `aId` int(11) NOT NULL AUTO_INCREMENT,
  `aImage` varchar(200) CHARACTER SET latin1 NOT NULL,
  `aURL` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`aId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf32;

-- Dumping data for table kvt.ads: ~3 rows (approximately)
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` (`aId`, `aImage`, `aURL`) VALUES
	(1, 'upload/quangcao1.jpg', 'https://daihoc.fpt.edu.vn/khoa-hoc-quang-cao-mien-phi-danh-cho-fptuers/'),
	(2, 'upload/quangcao2.jpg', 'https://www.behance.net/gallery/18745337/Drive-me-to-the-Moon-Lamborghini-Advertisement'),
	(3, 'upload/quangcao3.jpg', 'https://www.wessanen.com/organic-september-brings-feel-good-brands-together-first-time/');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;

-- Dumping structure for table kvt.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `pId` int(11) NOT NULL,
  `cartQuantity` int(11) NOT NULL,
  PRIMARY KEY (`cartId`),
  KEY `user_id` (`uId`),
  KEY `product_id` (`pId`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `products` (`pId`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`uId`) REFERENCES `users` (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf32;

-- Dumping data for table kvt.cart: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- Dumping structure for table kvt.category
CREATE TABLE IF NOT EXISTS `category` (
  `cId` int(11) NOT NULL AUTO_INCREMENT,
  `cName` varchar(25) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`cId`),
  KEY `id` (`cId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf32;

-- Dumping data for table kvt.category: ~3 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`cId`, `cName`) VALUES
	(1, 'Vegetable'),
	(2, 'Fruits'),
	(3, 'Meat');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table kvt.charge
CREATE TABLE IF NOT EXISTS `charge` (
  `chargeId` int(11) NOT NULL AUTO_INCREMENT,
  `chargeCardNumber` tinytext CHARACTER SET latin1 NOT NULL,
  `chargeValue` int(11) NOT NULL,
  `chargeUsed` tinyint(1) NOT NULL,
  `chargeTaken` tinyint(1) NOT NULL,
  PRIMARY KEY (`chargeId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf32;

-- Dumping data for table kvt.charge: ~20 rows (approximately)
/*!40000 ALTER TABLE `charge` DISABLE KEYS */;
INSERT INTO `charge` (`chargeId`, `chargeCardNumber`, `chargeValue`, `chargeUsed`, `chargeTaken`) VALUES
	(3, '2c1d10816677996c', 50000, 0, 0),
	(4, 'a56056437839727a', 50000, 0, 0),
	(5, '9e96a75983a77f25', 50000, 0, 0),
	(6, '3595a61e7a1a9991', 50000, 0, 0),
	(7, '8d43534d921f2719', 50000, 0, 0),
	(8, '634d7e859ba783a6', 100000, 0, 0),
	(9, '9f35691242634a16', 100000, 0, 0),
	(10, '8b65849c836f9f43', 100000, 0, 0),
	(11, '8f339e836e3d8b33', 100000, 0, 0),
	(12, '10819d59663a9256', 100000, 0, 0),
	(13, '804a43386b623f15', 200000, 0, 0),
	(14, '9aa5494d1641647e', 200000, 0, 0),
	(15, '17147f4c50584011', 200000, 0, 0),
	(16, 'a41f572a7e78a69c', 200000, 0, 0),
	(17, '889e541232142999', 200000, 0, 0),
	(18, '6314579277a7a618', 500000, 0, 0),
	(19, '824486893787295e', 500000, 0, 0),
	(20, '234a525a186d8544', 500000, 0, 0),
	(21, '781a3565418b4d58', 500000, 0, 0),
	(22, '1e4b30465b109d8e', 500000, 0, 0);
/*!40000 ALTER TABLE `charge` ENABLE KEYS */;

-- Dumping structure for table kvt.generalhistorypay
CREATE TABLE IF NOT EXISTS `generalhistorypay` (
  `gId` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `uName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gTotal` double DEFAULT NULL,
  `gPaymentStatus` int(11) DEFAULT NULL,
  `gGrossProduct` int(11) DEFAULT NULL,
  PRIMARY KEY (`gId`),
  KEY `generalhistorypay_FK` (`uId`),
  CONSTRAINT `generalhistorypay_FK` FOREIGN KEY (`uId`) REFERENCES `users` (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kvt.generalhistorypay: ~3 rows (approximately)
/*!40000 ALTER TABLE `generalhistorypay` DISABLE KEYS */;
INSERT INTO `generalhistorypay` (`gId`, `uId`, `uName`, `gTotal`, `gPaymentStatus`, `gGrossProduct`) VALUES
	(2, 28, 'user', 460000, 1, 3),
	(3, 28, 'user', 568000, 1, 4),
	(4, 28, 'user', 936, 1, 1);
/*!40000 ALTER TABLE `generalhistorypay` ENABLE KEYS */;

-- Dumping structure for table kvt.history
CREATE TABLE IF NOT EXISTS `history` (
  `hId` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `pId` int(11) NOT NULL,
  `hDate` varchar(25) NOT NULL,
  `hQuantity` int(11) NOT NULL,
  `uName` varchar(100) DEFAULT NULL,
  `uTotal` double DEFAULT NULL,
  `hPaymentStatus` int(1) DEFAULT NULL,
  `hGrossProduct` int(10) DEFAULT NULL,
  PRIMARY KEY (`hId`),
  KEY `user_id` (`uId`),
  KEY `product_id` (`pId`),
  CONSTRAINT `history_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `products` (`pId`),
  CONSTRAINT `history_ibfk_2` FOREIGN KEY (`uId`) REFERENCES `users` (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf32;

-- Dumping data for table kvt.history: ~61 rows (approximately)
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` (`hId`, `uId`, `pId`, `hDate`, `hQuantity`, `uName`, `uTotal`, `hPaymentStatus`, `hGrossProduct`) VALUES
	(8, 28, 30, '2022-04-12T13:49:34.245', 1, 'user', NULL, NULL, NULL),
	(9, 28, 29, '2022-04-12T13:50:09.583', 1, 'user', NULL, NULL, NULL),
	(10, 28, 30, '2022-04-12T15:40:54.895', 1, 'user', NULL, NULL, NULL),
	(11, 28, 29, '2022-04-13T09:26:40.303', 8, 'user', NULL, NULL, NULL),
	(12, 28, 29, '2022-04-13T09:27:00.906', 2, 'user', NULL, NULL, NULL),
	(13, 28, 28, '2022-04-13T09:50:47.730', 1, 'user', NULL, NULL, NULL),
	(14, 28, 28, '2022-04-13T10:37:14.905', 1, 'user', NULL, NULL, NULL),
	(15, 28, 28, '2022-04-13T14:28:20.507', 1, 'user', NULL, NULL, NULL),
	(16, 28, 22, '2022-04-13T14:50:22.209', 1, 'user', NULL, NULL, NULL),
	(17, 28, 22, '2022-04-13T14:54:08.708', 1, 'user', NULL, NULL, NULL),
	(18, 28, 30, '2022-04-13T15:06:17.235', 1, 'user', NULL, NULL, NULL),
	(19, 28, 28, '2022-04-13T15:10:06.085', 1, 'user', NULL, NULL, NULL),
	(20, 28, 27, '2022-04-13T15:10:06.099', 1, 'user', NULL, NULL, NULL),
	(21, 28, 30, '2022-04-13T15:17:06.073', 1, 'user', NULL, NULL, NULL),
	(22, 28, 28, '2022-04-13T15:17:06.086', 1, 'user', NULL, NULL, NULL),
	(23, 28, 30, '2022-04-13T15:27:26.379', 1, 'user', NULL, NULL, NULL),
	(24, 28, 30, '2022-04-13T15:28:16.265', 2, 'user', NULL, NULL, NULL),
	(25, 28, 28, '2022-04-13T15:28:16.362', 1, 'user', NULL, NULL, NULL),
	(26, 28, 22, '2022-04-13T15:30:19.906', 2, 'user', NULL, NULL, NULL),
	(27, 28, 30, '2022-04-13T15:31:49.046', 1, 'user', NULL, NULL, NULL),
	(28, 28, 28, '2022-04-13T15:31:49.061', 1, 'user', NULL, NULL, NULL),
	(29, 28, 22, '2022-04-13T15:36:19.344', 1, 'user', NULL, NULL, NULL),
	(30, 28, 21, '2022-04-13T15:36:19.358', 1, 'user', NULL, NULL, NULL),
	(31, 28, 23, '2022-04-13T15:36:19.368', 1, 'user', NULL, NULL, NULL),
	(32, 28, 24, '2022-04-13T15:36:19.379', 1, 'user', NULL, NULL, NULL),
	(33, 28, 30, '2022-04-13T15:53:53.957', 1, 'user', 328000, NULL, NULL),
	(34, 28, 28, '2022-04-13T15:53:53.990', 1, 'user', 328000, NULL, NULL),
	(35, 28, 30, '2022-04-13T16:14:54.987', 2, 'user', 216000, NULL, NULL),
	(36, 28, 22, '2022-04-13T16:54:07.904', 1, 'user', 80000, NULL, NULL),
	(37, 28, 30, '2022-04-13T17:01:41.933', 1, 'user', 108000, NULL, NULL),
	(38, 28, 22, '2022-04-13T17:04:51.923', 1, 'user', 80000, NULL, NULL),
	(39, 28, 2, '2022-04-13T17:08:09.693', 1, 'user', 70000, NULL, NULL),
	(40, 28, 28, '2022-04-14T11:14:55.244', 3, 'user', 660000, 0, NULL),
	(41, 28, 30, '2022-04-14T15:07:16.662', 1, 'user', 328000, 0, NULL),
	(42, 28, 28, '2022-04-14T15:07:16.678', 1, 'user', 328000, 0, NULL),
	(43, 28, 27, '2022-04-14T15:08:43.463', 1, 'user', 788000, 0, NULL),
	(44, 28, 26, '2022-04-14T15:08:43.478', 1, 'user', 788000, 0, NULL),
	(45, 28, 25, '2022-04-14T15:08:43.492', 1, 'user', 788000, 0, NULL),
	(46, 28, 28, '2022-04-14T15:08:43.504', 1, 'user', 788000, 0, NULL),
	(47, 28, 30, '2022-04-14T15:08:43.516', 1, 'user', 788000, 0, NULL),
	(48, 28, 30, '2022-04-14T15:13:40.672', 1, 'user', 388000, 0, NULL),
	(49, 28, 28, '2022-04-14T15:13:40.685', 1, 'user', 388000, 0, NULL),
	(50, 28, 26, '2022-04-14T15:13:40.697', 1, 'user', 388000, 0, NULL),
	(51, 28, 30, '2022-04-14T15:14:08.058', 2, 'user', 551000, 0, NULL),
	(52, 28, 27, '2022-04-14T15:14:08.068', 1, 'user', 551000, 0, NULL),
	(53, 28, 30, '2022-04-14T15:30:26.524', 1, 'user', 1678000, 0, 5),
	(54, 28, 27, '2022-04-14T15:30:26.541', 3, 'user', 1678000, 0, 5),
	(55, 28, 28, '2022-04-14T15:30:26.553', 2, 'user', 1678000, 0, 5),
	(56, 28, 25, '2022-04-14T15:30:26.563', 1, 'user', 1678000, 0, 5),
	(57, 28, 26, '2022-04-14T15:30:26.575', 1, 'user', 1678000, 0, 5),
	(58, 28, 30, '2022-04-14T16:59:25.726', 1, 'user', 388000, 0, 3),
	(59, 28, 28, '2022-04-14T16:59:25.743', 1, 'user', 388000, 0, 3),
	(60, 28, 26, '2022-04-14T16:59:25.758', 1, 'user', 388000, 0, 3),
	(61, 28, 27, '2022-04-16T11:11:07.956', 1, 'user', 460000, 0, 3),
	(62, 28, 26, '2022-04-16T11:11:07.970', 1, 'user', 460000, 0, 3),
	(63, 28, 25, '2022-04-16T11:11:07.982', 1, 'user', 460000, 0, 3),
	(64, 28, 30, '2022-04-16T11:16:30.880', 1, 'user', 568000, 0, 4),
	(65, 28, 27, '2022-04-16T11:16:30.893', 1, 'user', 568000, 0, 4),
	(66, 28, 26, '2022-04-16T11:16:30.904', 1, 'user', 568000, 0, 4),
	(67, 28, 25, '2022-04-16T11:16:30.914', 1, 'user', 568000, 0, 4),
	(68, 28, 32, '2022-04-16T14:27:12.226', 4, 'user', 936, 0, 1);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;

-- Dumping structure for table kvt.products
CREATE TABLE IF NOT EXISTS `products` (
  `pId` int(11) NOT NULL AUTO_INCREMENT,
  `cId` int(11) DEFAULT NULL,
  `pName` varchar(255) DEFAULT NULL,
  `pImage` varchar(255) DEFAULT NULL,
  `pPrice` double DEFAULT NULL,
  `pWeight` int(11) DEFAULT NULL,
  `pDescription` text DEFAULT NULL,
  `pQuantity` int(11) DEFAULT NULL,
  `pCreateDate` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`pId`),
  KEY `cId` (`cId`),
  KEY `pId` (`pId`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cId`) REFERENCES `category` (`cId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kvt.products: ~31 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`pId`, `cId`, `pName`, `pImage`, `pPrice`, `pWeight`, `pDescription`, `pQuantity`, `pCreateDate`) VALUES
	(1, 1, 'Green bean', 'upload/greenbean.jpg', 43000, 1000, 'Green beans are eaten around the world, and are sold fresh, canned, and frozen. They can be eaten raw or steamed, boiled, stir-fried, or baked. They are commonly cooked in other dishes such as soups, stews and casseroles. Green beans can also be pickled, much like cucumbers are.', 100, '2020-07-08'),
	(2, 1, 'Tomato Malaysia', 'upload/tomatomalay.jpg', 70000, 1000, 'Tomatoes are a very versatile ingredient that can be enjoyed as it is, used in salads, stews, sauces, and many more dishes!', 99, '2020-07-08'),
	(3, 1, 'Eggplant', 'upload/eggplant.jpg', 30000, 1000, 'Eggplant, Solanum melongena, is a tropical, herbaceous, perennial plant, closely related to tomato, in the family Solanaceae which is grown for its edible fruit. The plants has a branching stem and simple, long, flat. coarsely lobed leaves which are green in color and are arranged alternately on the branches.', 100, '2020-07-08'),
	(4, 1, 'Cabbage', 'upload/cabbage.jpg', 33000, 1000, 'The cabbage plant, Brassica oleracea, is an herbaceous annual or biennial vegetable in the family Brassicaceae grown for its edible head. ... The head of the cabbage is round and forms on a short thick stem. The leaves are thick and alternating with wavy or lobed edges and the roots are are fibrous and shallow.', 100, '2020-07-09'),
	(5, 1, 'Celery', 'upload/celery.jpg', 54500, 1000, 'Celery (Apium graveolens) is a marshland plant in the family Apiaceae that has been cultivated as a vegetable since antiquity. Celery has a long fibrous stalk tapering into leaves. Depending on location and cultivar, either its stalks, leaves or hypocotyl are eaten and used in cooking.', 100, '2020-07-09'),
	(6, 1, 'Bell pepper', 'upload/bellpepper.jpg', 18000, 1000, 'Bell peppers, Capsicum annuum are a cultivar group of annual or perennial plants in the family Solanaceae grown for their edible fruits. Bell pepper plants are short bushes with woody stems that grow brightly colored fruits. The alternating leaves are elliptical, smooth edged, and come to a distinct point. The plant produces white or purple bell-shaped flowers which are 2.5 cm (1 in) in diameter. Red, yellow, purple, or brown fruit are produced each season about 3-6 weeks after flowering. Pepper plants can grow 1 m (3.3 ft) tall and are usually grown as annuals in temperate regions for only one growing season. Bell pepper may be referred to as red pepper, yellow pepper or green pepper and is believed to have originated in Central and South America.', 100, '2020-07-09'),
	(7, 1, 'Potato', 'upload/potato.jpg', 50400, 1000, 'Potato, Solanum tuberosum, is an herbaceous perennial plant in the family Solanaceae which is grown for its edible tubers. The potato plant has a branched stem and alternately arranged leaves consisting of leaflets which are both of unequal size and shape. The leaflets can be oval to oblong in shape and the leaves can reach 10–30 cm (4–12 in) in length and 5–15 cm (2–6 in) wide. The potato plant produces white or blue flowers and yellow-green berries. The potato tubers grow underground and generally located in the top 25 cm (10 in) of the soil. The tubers can range in color from yellow to red or purple depending on the variety. Potato plants can reach in excess of 1 m (3.3 ft) in height and are grown as annual plants, surviving only one growing season. Potato may also be referred to as, spud, Irish potato, white potato or Spanish potato and originates from South America.', 100, '2020-07-09'),
	(8, 1, 'Leek', 'upload/leek.jpg', 52500, 1000, 'Leeks have a mild, onion-like taste. In its raw state, the vegetable is crunchy and firm. The edible portions of the leek are the white base of the leaves (above the roots and stem base), the light green parts, and to a lesser extent the dark green parts of the leaves.', 100, '2020-07-09'),
	(9, 1, 'Carrot', 'upload/carrot.jpg', 42000, 1000, 'The carrot (Daucus carota subsp. sativus) is a root vegetable, usually orange in colour, though purple, black, red, white, and yellow cultivars exist. ... The carrot is a biennial plant in the umbellifer family Apiaceae. At first, it grows a rosette of leaves while building up the enlarged taproot', 100, '2020-07-09'),
	(10, 1, 'Cucumber', 'upload/cucumber.jpg', 35000, 1000, 'The cucumber plant is a tender annual with a rough, succulent, trailing stem. The hairy leaves have three to five pointed lobes, and the stem bears branched tendrils by which the plant can be trained to supports. The five-petaled yellow flowers are unisexual and produce a type of berry known as a pepo.', 99, '2020-07-09'),
	(11, 1, 'Cauliflower', 'upload/cauliflower.jpg', 69000, 1000, 'Cauliflowers are annual plants that reach about 0.5 metre (1.5 feet) tall and bear large rounded leaves that resemble collards (Brassica oleracea, variety acephala). As desired for food, the terminal cluster forms a firm, succulent “curd,” or head, that is an immature inflorescence (cluster of flowers).', 100, '2020-07-09'),
	(12, 1, 'Spinach', 'upload/spinach.jpg', 39000, 1000, 'Spinach, Spinacia oleracea, is a leafy herbaceous annual plant in the family Amaranthaceae grown for its leaves which are used as a vegetable. ... The leaves grow in a rosette and can appear crinkled or flat. The plant produces small yellow-green flowers which are 3–4 mm (0.1 in) in diameter.', 100, '2020-07-09'),
	(13, 1, 'Broccoli', 'upload/broccoli.jpg', 33000, 1000, 'Broccoli is an edible green plant in the cabbage family (family Brassicaceae, genus Brassica) whose large flowering head and stalk is eaten as a vegetable. ... Broccoli has large flower heads, usually dark green in color, arranged in a tree-like structure branching out from a thick stalk which is usually light green.', 100, '2020-07-09'),
	(14, 1, 'Artichoke', 'upload/artichoke.jpg', 40000, 1000, 'Artichoke, (Cynara cardunculus, variety scolymus), also called globe artichoke or French artichoke, large thistlelike perennial plant of the aster family (Asteraceae) grown for its edible flower buds. ... Artichoke heads are served as a hot vegetable with a sauce or as a cold salad or appetizer', 100, '2020-07-09'),
	(15, 1, 'Peas', 'upload/peas.jpg', 40000, 1000, 'Description. A pea is a most commonly green, occasionally golden yellow, or infrequently purple pod-shaped vegetable, widely grown as a cool season vegetable crop. The seeds may be planted as soon as the soil temperature reaches 10 °C (50 °F), with the plants growing best at temperatures of 13 to 18 °C (55 to 64 °F).', 100, '2020-07-09'),
	(16, 1, 'Corn', 'upload/corn.jpeg', 5700, 1000, 'Whole corn, like you eat on the cob, is considered a vegetable. The corn kernel itself (where popcorn comes from) is considered a grain. ... This is why several foods people think of as vegetables are actually fruits, like tomatoes and avocados. So, corn is actually a vegetable, a whole grain, and a fruit.', 93, '2020-07-09'),
	(17, 1, 'Squash', 'upload/squash.jpg', 15000, 1000, 'Squash, (genus Cucurbita), genus of flowering plants in the gourd family (Cucurbitaceae), many of which are widely cultivated as vegetables and for livestock feed. ... The fruit of edible species is usually served as a cooked vegetable, and the seeds and blossoms may also be cooked and eaten.', 99, '2020-07-09'),
	(18, 1, 'Garlic', 'upload/garlic.jpg', 49000, 1000, 'Botanically, garlic (Allium sativum) is considered a vegetable. It belongs to the onion family, alongside shallots, leeks, and chives (2). Strictly speaking, a vegetable is any edible part of an herbaceous plant, such as the roots, leaves, stems, and bulbs. ... Therefore, it\'s botanically considered a vegetable.', 100, '2020-07-09'),
	(19, 1, 'Onion', 'upload/onion.jpg', 30000, 1000, 'Onion, Allium cepa, is an herbaceous biennial in the family Liliaceae grown for its edible bulb. The stem of the plant is a flattened disc at the base and the tubular leaves form a pseudostem where their sheaths overlap. The leaves are either erect or oblique and there are 3–8 per plant.', 99, '2020-07-09'),
	(20, 1, 'Hot pepper', 'upload/hotpepper.jpg', 25000, 1000, 'Chili pepper, any of several species and cultivars of very hot, pungent peppers in the nightshade family (Solanaceae). Chili peppers are native to the Americas and are cultivated in warm climates around the world. Many of the most-common chili peppers are cultivars of Capsicum annuum, including the cayenne, jalapeño, serrano, and Thai chili peppers. Some of the hottest chili peppers are cultivars of C. chinense, including the habanero, the Carolina reaper, and the ghost chili pepper, or bhut jolokia, though tabasco is a cultivar of C. frutescens. Chili peppers can be eaten fresh or dried and are used to make chili powder and to flavour barbecue, hot curry, and other spicy sauces.', 85, '2020-07-09'),
	(21, 2, 'Apple', 'upload/apple.jpg', 40000, 1000, 'An apple is an edible fruit produced by an apple tree. Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today.', 99, '2020-07-20'),
	(22, 2, 'Strawberries', 'upload/strawberry.jpg', 80000, 1000, 'The garden strawberry is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness', 93, '2020-07-20'),
	(23, 2, 'Peaches', 'upload/peaches.jpg', 85000, 1000, 'A peach is a soft, juicy and fleshy stone fruit produced by a peach tree.', 98, '2020-07-20'),
	(24, 2, 'Avocado', 'upload/avocado.jpg', 95000, 1000, 'The avocado, a tree likely originating from south-central Mexico, is classified as a member of the flowering plant family Lauraceae. The fruit of the plant, also called an avocado, is botanically a large berry containing a single large seed', 99, '2020-07-20'),
	(25, 2, 'Kiwi', 'upload/kiwi.jpg', 65000, 1000, 'Kiwifruit, or Chinese gooseberry, is the edible berry of several species of woody vines in the genus Actinidia. The most common cultivar group of kiwifruit is oval, about the size of a large hen\'s egg: 5–8 centimetres in length and 4.5–5.5 cm in diameter', 96, '2020-07-20'),
	(26, 2, 'Mango', 'upload/mango.jpg', 60000, 1000, 'A mango is a juicy stone fruit produced from numerous species of tropical trees belonging to the flowering plant genus Mangifera, cultivated mostly for their edible fruit. Most of these species are found in nature as wild mangoes. The genus belongs to the cashew family Anacardiaceae', 94, '2020-07-20'),
	(27, 3, 'Beef', 'upload/beef.jpg', 335000, 1000, 'Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times. Beef is a source of protein and nutrients', 91, '2020-07-20'),
	(28, 3, 'Pork', 'upload/pork.jpg', 220000, 1000, 'Pork is the culinary name for the meat of a domestic pig. It is the most commonly consumed meat worldwide, with evidence of pig husbandry dating back to 5000 BC. Pork is eaten both freshly cooked and preserved. Curing extends the shelf life of the pork products', 83, '2020-07-20'),
	(29, 3, 'Chicken', 'upload/chicken.jpg', 80000, 1000, 'Chicken is the most common type of poultry in the world. Owing to the relative ease and low cost of raising them in comparison to animals such as cattle or hogs, chickens have become prevalent throughout the cuisine of cultures around the world, and their meat has been variously adapted to regional tastes', 0, '2022-04-16'),
	(30, 3, 'Fish', 'upload/fish.jpg', 108000, 1000, 'Many species of fish are consumed as food in virtually all regions around the world. Fish has been an important source of protein and other nutrients for humans throughout history. In culinary and fishery contexts, fish may include shellfish, such as molluscs, crustaceans and echinoderms', 70, '2022-04-16'),
	(32, 2, 'mhngbf', 'upload/1650094009759hinh-nen-may-cuc-dep.jpg', 234, 1212, 'HGDFSSÄA', 119, '2022-04-16');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table kvt.slides
CREATE TABLE IF NOT EXISTS `slides` (
  `sId` int(11) NOT NULL AUTO_INCREMENT,
  `pId` int(11) NOT NULL,
  `sTitle` varchar(100) CHARACTER SET latin1 NOT NULL,
  `sSubtitle` varchar(150) CHARACTER SET latin1 NOT NULL,
  `sDescription` text CHARACTER SET latin1 NOT NULL,
  `sImage` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`sId`),
  KEY `product_id` (`pId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf32;

-- Dumping data for table kvt.slides: ~3 rows (approximately)
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` (`sId`, `pId`, `sTitle`, `sSubtitle`, `sDescription`, `sImage`) VALUES
	(1, 22, 'Strawberry', 'Strawberry an excellent source of vitamin C and manganese', 'The garden strawberry is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit. The fruit is widely appreciated for its characteristic aroma, bright red color, juicy texture, and sweetness', 'upload/strawberry.jpg'),
	(2, 2, 'Tomato Malaysia', 'Tomato is a great source of vitamin C, potassium, folate, and vitamin K', 'Tomatoes are a very versatile ingredient that can be enjoyed as it is, used in salads, stews, sauces, and many more dishes!', 'upload/tomatomalay.jpg'),
	(3, 29, 'Chicken', 'Chicken generally includes low fat in the meat itself', 'Chicken is the most common type of poultry in the world. Owing to the relative ease and low cost of raising them in comparison to animals such as cattle or hogs, chickens have become prevalent throughout the cuisine of cultures around the world, and their meat has been variously adapted to regional tastes', 'upload/chicken.jpg');
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;

-- Dumping structure for table kvt.users
CREATE TABLE IF NOT EXISTS `users` (
  `uId` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(50) CHARACTER SET latin1 NOT NULL,
  `uEmail` varchar(50) CHARACTER SET latin1 NOT NULL,
  `uAddress` varchar(50) CHARACTER SET latin1 NOT NULL,
  `uJob` varchar(20) CHARACTER SET latin1 NOT NULL,
  `uPassword` varchar(200) CHARACTER SET latin1 NOT NULL,
  `uRole` varchar(50) CHARACTER SET latin1 NOT NULL,
  `uPhoto` varchar(200) CHARACTER SET latin1 NOT NULL DEFAULT 'upload/profile.jpg',
  `uCreateDate` date DEFAULT NULL,
  `uPhone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uId`),
  UNIQUE KEY `username` (`uName`),
  UNIQUE KEY `email` (`uEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table kvt.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`uId`, `uName`, `uEmail`, `uAddress`, `uJob`, `uPassword`, `uRole`, `uPhoto`, `uCreateDate`, `uPhone`) VALUES
	(28, 'user', 'ngtt@gmail.com', '1', '1', 'c4ca4238a0b923820dcc509a6f75849b', 'user', 'upload/user.png', '2022-04-12', '0387570221'),
	(29, 'admin', 'vzd@gmail.com', '1', '2', 'c4ca4238a0b923820dcc509a6f75849b', 'admin', 'upload/user.png', '2022-04-12', '23');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
