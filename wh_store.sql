
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for jsp_petmall
CREATE DATABASE IF NOT EXISTS `wh_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `wh_store`;

-- Dumping structure for table wh_store.goods
DROP TABLE IF EXISTS `goods`;
CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `cover` varchar(45) DEFAULT NULL,
  `image1` varchar(45) DEFAULT NULL,
  `image2` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `intro` varchar(300) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_id_idx` (`type_id`),
  CONSTRAINT `fk_type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

-- Dumping data for table wh_stort.goods: ~13 rows (approximately)
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`id`, `name`, `cover`, `image1`, `image2`, `price`, `intro`, `stock`, `type_id`) VALUES
	(181, '曲奇', '/picture/quqi01.jpg', '/picture/quqi02.jpg', '/picture/quqi03.jpg', 59.8, '印尼进口皇冠丹麦黄油曲奇饼干454g铁盒装节日送礼礼品礼物', 2000, 1),
	(182, '威化', '/picture/weihua01.jpg', '/picture/weihua02.jpg', '/picture/weihua03.jpg', 29, '印尼进口丽芝士nabati纳宝帝奶酪威化饼干290g网红休闲茶点零食品', 2000, 1),
	(183, '纸巾', '/picture/zhijin01.jpg', '/picture/zhijin02.jpg', '/picture/zhijin03.jpg', 29.9, '清风抽纸原木金装3层30包餐巾纸卫生纸面纸巾实惠装整箱24+6包', 2000, 3),
	(184, '消毒液', '/picture/xiaoduye01.jpg', '/picture/xiaoduye02.jpg', '/picture/xiaoduye03.jpg', 78, '爱特福84消毒液家居衣物百货消毒水消毒剂杀菌除菌去霉1.25L*5瓶', 2000, 3),
	(185, 'iPhone11', '/picture/iphone01.jpg', '/picture/iphone02.jpg', '/picture/iphone03.jpg', 8999, '【顺丰现货急速发】Apple/苹果 iPhone 11 手机现货国行 全国联保', 20, 4),
	(186, '相机', '/picture/xiangji01.jpg', '/picture/xiangji02.jpg', '/picture/xiangji03.jpg', 999, 'Canon/佳能口袋拍立得拍照打印一体机ZV123 无线蓝牙WIFI便携相机', 20, 4),
	(187, 'AD钙', '/picture/adgai01.jpg', '/picture/adgai02.jpg', '/picture/adgai03.jpg', 42.8, '娃哈哈 AD钙奶220g*24瓶/箱儿童奶含乳饮料童年哇哈哈', 2000, 2),
	(188, '葡萄酒', '/picture/hongjiu01.jpg', '/picture/hongjiu02.jpg', '/picture/hongjiu03.jpg', 12000, '张裕特选级干红葡萄酒（圆筒）750ml*6红酒 婚庆婚宴送礼礼品', 1000, 2),
	(189, '面膜', '/picture/mianmo01.jpg', '/picture/mianmo02.jpg', '/picture/mianmo03.jpg', 5, 'Dr.Jart+/蒂佳婷水动力蓝药丸面膜5片正品补水保湿高保湿提亮肤色', 2000, 5);

/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- Dumping structure for table wh_stort.order
DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` float DEFAULT NULL,
  `amount` int(6) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `paytype` tinyint(1) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- Dumping data for table wh_stort.order: ~1 rows (approximately)
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`id`, `total`, `amount`, `status`, `paytype`, `name`, `phone`, `address`, `datetime`, `user_id`) VALUES
	(49, 1000, 1, 2, 3, '张三', '12345678901', '江苏省南京市', '2020-01-31 09:58:07', 33);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- Dumping structure for table wh_stort.orderitem
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE IF NOT EXISTS `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_id_idx` (`order_id`),
  KEY `fk_orderitem_goods_id_idx` (`goods_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderitem_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- Dumping data for table wh_stort.orderitem: ~1 rows (approximately)
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` (`id`, `price`, `amount`, `goods_id`, `order_id`) VALUES
	(45, 1000, 1, 181, 49);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;

-- Dumping structure for table wh_stort.recommend
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE IF NOT EXISTS `recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goods_id_idx` (`goods_id`),
  CONSTRAINT `fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Dumping data for table wh_stort.recommend: ~10 rows (approximately)
/*!40000 ALTER TABLE `recommend` DISABLE KEYS */;
INSERT INTO `recommend` (`id`, `type`, `goods_id`) VALUES
	(29, 1, 181),
	(30, 2, 181),
	(31, 3, 181),
	(32, 2, 183),
	(33, 3, 183),
	(34, 1, 183),
	(35, 1, 184),
	(36, 3, 184),
	(37, 2, 185),
	(38, 1, 185);
/*!40000 ALTER TABLE `recommend` ENABLE KEYS */;

-- Dumping structure for table wh_stort.type
DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table wh_stort.type: ~5 rows (approximately)
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` (`id`, `name`) VALUES
	(1, '休闲零食'),
	(2, '酒水饮料'),
	(3, '日用百货'),
	(4, '电器数码'),
	(5, '美容护肤');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;

-- Dumping structure for table wh_stort.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `isadmin` bit(1) DEFAULT NULL,
  `isvalidate` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Dumping data for table wh_stort.user: ~5 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `email`, `password`, `name`, `phone`, `address`, `isadmin`, `isvalidate`) VALUES
	(6, 'admin', '13812345678@qq.com', 'admin', '林一', '13022502404', '广州市从化区中山大学南方学院', b'1', b'0'),
	(33, 'linus', 'linus@126.com', '123456', '张三', '12345678901', '广州市', b'0', b'0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
