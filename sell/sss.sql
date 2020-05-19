/*
SQLyog Ultimate v12.08 (32 bit)
MySQL - 5.5.62 : Database - sell
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sell` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `sell`;

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `detail_id` varchar(32) NOT NULL,
  `order_id` varchar(32) NOT NULL,
  `product_id` varchar(32) NOT NULL,
  `product_name` varchar(64) NOT NULL,
  `product_price` decimal(8,2) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_icon` varchar(512) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`detail_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `order_detail` */

insert  into `order_detail`(`detail_id`,`order_id`,`product_id`,`product_name`,`product_price`,`product_quantity`,`product_icon`,`create_time`,`update_time`) values ('1234567','111111','1111111','皮蛋粥','1.20',2,'http://aaa.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),('1234567890','1111110','1111110','皮蛋粥','1.20',3,'http://aaa.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),('1574167217296157798','1574167216812677148','1234568','芒果冰','20.00',1,'http://abc.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),('1574167753531309310','1574167753078483895','1234568','芒果冰','20.00',1,'http://abc.jpg','2019-11-19 20:49:13','0000-00-00 00:00:00'),('1574167753640720534','1574167753078483895','123457','皮皮虾','3.20',2,'http://aaaa.jpg','2019-11-19 20:49:13','0000-00-00 00:00:00'),('1574333635644208635','1574333635504269647','1234568','芒果冰','20.00',2,'http://abc.jpg','2019-11-21 18:53:55','0000-00-00 00:00:00'),('1574333948316674873','1574333947722162396','1234568','芒果冰','20.00',2,'http://abc.jpg','2019-11-21 18:59:08','0000-00-00 00:00:00'),('1574334055863978412','1574334055519509115','1234568','芒果冰','20.00',2,'http://abc.jpg','2019-11-21 19:00:56','0000-00-00 00:00:00'),('1574334887582207304','1574334886519556254','1234568','芒果冰','20.00',2,'http://abc.jpg','2019-11-21 19:14:48','0000-00-00 00:00:00');

/*Table structure for table `order_master` */

DROP TABLE IF EXISTS `order_master`;

CREATE TABLE `order_master` (
  `order_id` varchar(32) NOT NULL,
  `buyer_name` varchar(32) NOT NULL,
  `buyer_phone` varchar(32) NOT NULL,
  `buyer_address` varchar(64) NOT NULL,
  `buyer_openid` varchar(64) NOT NULL,
  `order_amount` decimal(8,2) NOT NULL,
  `order_status` tinyint(3) NOT NULL,
  `pay_status` tinyint(3) NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`),
  KEY `buyer_openid` (`buyer_openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `order_master` */

insert  into `order_master`(`order_id`,`buyer_name`,`buyer_phone`,`buyer_address`,`buyer_openid`,`order_amount`,`order_status`,`pay_status`,`update_time`,`create_time`) values ('123456','师兄','88888888','印象汇','110110','2.30',0,0,'2019-11-18 17:17:22','2019-11-18 17:17:22'),('1234567','师兄','88888888','印象汇','110110','2.50',0,0,'2019-11-18 17:21:06','2019-11-18 17:21:06'),('1574167216812677148','师兄','11111111','五指山','112112112','20.00',0,0,'2019-11-20 14:36:54','2019-11-19 20:40:17'),('1574167753078483895','师兄','11111111','五指山','112112112','26.40',0,1,'2019-11-20 17:38:19','2019-11-19 20:49:13'),('1574333635504269647','张三','123123123','印象汇','fefndskfjoengaf','40.00',2,0,'2019-11-22 11:06:03','2019-11-21 18:53:56'),('1574333947722162396','张三','123123123','印象汇','fefndskfjoengaf','40.00',0,0,'2019-11-21 18:59:08','2019-11-21 18:59:08'),('1574334055519509115','张三','123123123','印象汇','oZxSYwwsYgFgjXRxUCTPhhlWAh3M','40.00',0,0,'2019-11-27 15:24:27','2019-11-21 19:00:56'),('1574334886519556254','张三','123123123','印象汇','oTgZpweNnflvA9ER9EIXoH-jIrWQ','40.00',0,0,'2019-11-27 15:25:29','2019-11-21 19:14:48');

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `category_type` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_type` (`category_type`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `product_category` */

insert  into `product_category`(`category_id`,`category_name`,`category_type`,`create_time`,`update_time`) values (1,'热销榜',2,'2019-11-14 19:01:53','2019-11-14 19:01:58'),(2,'男生最爱',4,'2019-11-14 17:06:45','2019-11-14 17:18:54'),(3,'女生最爱',3,'2019-11-14 17:04:07','2019-11-14 19:02:50'),(8,'男生专享',10,'2019-11-14 20:24:40',NULL);

/*Table structure for table `product_info` */

DROP TABLE IF EXISTS `product_info`;

CREATE TABLE `product_info` (
  `product_id` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
  `product_name` varchar(64) CHARACTER SET utf8mb4 NOT NULL COMMENT '商品名称',
  `product_price` decimal(8,2) NOT NULL COMMENT '单价',
  `product_stock` int(11) DEFAULT NULL COMMENT '库存',
  `product_status` tinyint(3) DEFAULT '0' COMMENT '商品状态，0正常 1下架',
  `product_description` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '描述',
  `product_icon` varchar(512) CHARACTER SET utf8mb4 NOT NULL COMMENT '小图',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product_info` */

insert  into `product_info`(`product_id`,`product_name`,`product_price`,`product_stock`,`product_status`,`product_description`,`product_icon`,`category_type`,`create_time`,`update_time`) values ('123456','皮蛋粥','3.20',5,0,NULL,'http://aa.jpg',2,'0000-00-00 00:00:00','2019-12-01 14:24:01'),('1234568','芒果冰','20.00',197,0,NULL,'http://abc.jpg',2,'2019-11-16 17:55:03','2019-11-22 11:06:04'),('123457','皮皮虾','3.20',106,0,NULL,'http://aaaa.jpg',3,'0000-00-00 00:00:00','2019-11-20 16:00:38');

/*Table structure for table `seller_info` */

DROP TABLE IF EXISTS `seller_info`;

CREATE TABLE `seller_info` (
  `seller_id` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `openid` varchar(64) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `seller_info` */

insert  into `seller_info`(`seller_id`,`username`,`password`,`openid`,`create_time`,`update_time`) values ('1575267891437203240','admin','admin','abc','2019-12-02 14:24:52','0000-00-00 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
