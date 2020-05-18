​
/*
Navicat MySQL Data Transfer
Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : sell
Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001
Date: 2018-05-27 00:14:54
*/
 
SET FOREIGN_KEY_CHECKS=0;
 
-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `detail_id` VARCHAR(32) NOT NULL,
  `order_id` VARCHAR(32) NOT NULL,
  `product_id` VARCHAR(32) NOT NULL,
  `product_name` VARCHAR(64) NOT NULL COMMENT '商品名称',
  `product_price` DECIMAL(8,2) NOT NULL COMMENT '当前价格,单位分',
  `product_quantity` INT(11) NOT NULL COMMENT '数量',
  `product_icon` VARCHAR(512) DEFAULT NULL COMMENT '小图',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`detail_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='订单详情表';
 
-- ----------------------------
-- Records of order_detail
-- ----------------------------
 
-- ----------------------------
-- Table structure for order_master
-- ----------------------------
DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master` (
  `order_id` VARCHAR(32) NOT NULL,
  `buyer_name` VARCHAR(32) NOT NULL COMMENT '买家名字',
  `buyer_phone` VARCHAR(32) NOT NULL COMMENT '买家电话',
  `buyer_address` VARCHAR(128) NOT NULL COMMENT '买家地址',
  `buyer_openid` VARCHAR(64) NOT NULL COMMENT '买家微信openid',
  `order_amount` DECIMAL(8,2) NOT NULL COMMENT '订单总金额',
  `order_status` TINYINT(3) NOT NULL DEFAULT '0' COMMENT '订单状态, 默认为新下单',
  `pay_status` TINYINT(3) NOT NULL DEFAULT '0' COMMENT '支付状态, 默认未支付',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  KEY `idx_buyer_openid` (`buyer_openid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='订单表';
 
-- ----------------------------
-- Records of order_master
-- ----------------------------
 
-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(64) NOT NULL COMMENT '类目名字',
  `category_type` INT(11) NOT NULL COMMENT '类目编号',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`category_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='类目表';
 
-- ----------------------------
-- Records of product_category
-- ----------------------------
 
-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `product_id` VARCHAR(32) NOT NULL,
  `product_name` VARCHAR(64) NOT NULL COMMENT '商品名称',
  `product_price` DECIMAL(8,2) NOT NULL COMMENT '单价',
  `product_stock` INT(11) NOT NULL COMMENT '库存',
  `product_description` VARCHAR(64) DEFAULT NULL COMMENT '描述',
  `product_icon` VARCHAR(512) DEFAULT NULL COMMENT '小图',
  `product_status` TINYINT(3) DEFAULT '0' COMMENT '商品状态,0正常1下架',
  `category_type` INT(11) NOT NULL COMMENT '类目编号',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`product_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='商品表';
 
-- ----------------------------
-- Records of product_info
-- ----------------------------
 
-- ----------------------------
-- Table structure for seller_info
-- ----------------------------
DROP TABLE IF EXISTS `seller_info`;
CREATE TABLE `seller_info` (
  `id` VARCHAR(32) NOT NULL,
  `username` VARCHAR(32) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `openid` VARCHAR(64) NOT NULL COMMENT '微信openid',
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='卖家信息表';
 
-- ----------------------------
-- Records of seller_info
-- ---------------------------
---------------------------------------------------------------------------------

mysql -v;









CREATE TABLE 'product_info'(
	'product_id' VARCHAR(32) NOT NULL,
	'product_name' VARCHAR(64) NOT NULL COMMENT '商品名称',
	'product_price' DECIMAL(8,2) NOT NULL COMMENT '单价',
	'product_stock' INT(11) NOT NULL COMMENT '库存',
	'product_description' VARCHAR(64) COMMENT'描述',
	'product_status' TINYINT(3) DEFAULT '0' COMMENT '商品状态，0正常 1下架',
	'product_icon' VARCHAR(512) COMMENT '小图',
	'category_type' INT(11) NOT NULL COMMENT '类目编号',
	'create_time' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	'update_time' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT'更新时间',
	PRIMARY KEY ('product_id')

) COMMENT '商品表';


CREATE TABLE 'product_category'(
	'category_id' INT NOT NULL AUTO_INCREMENT,
	'category_name' VARCHAR(64) NOT NULL COMMENT '类目名字',
	'category_type' INT NOT NULL COMMENT '类目编号',
	'create_time' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	'	' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY('category_id'),
	UNIQUE KEY 'uqe_category_type'('category_type')
) COMMENT'类目表';

CREATE TABLE 'order_master'(
	'order_id' VARCHAR(32) NOT NULL,
	'buyer_name' VARCHAR(32) NOT NULL COMMENT '买家名字',
	'buyer_phone' VARCHAR(32) NOT NULL COMMENT '买家电话',
	'buyer_address' VARCHAR(64) NOT NULL COMMENT '买家地址',
	'buyer_openid' VARCHAR(64) NOT NULL COMMENT '买家微信openID',
	'order_amount' VARCHAR(8,2) NOT NULL COMMENT '订单金额',
	'order_status' TINYINT(3) NOT NULL DEFAULT '0' COMMENT'订单状态,默认0新下单',
	'pay_status' TINYINT(3) NOT NULL DEFAULT '0' COMMENT '支付状态，默认0未支付', 
	'create_time' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	'update_time' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
	ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY('order_id'),
	KEY 'idx_buyer_openid'('buyer_openid')
) COMMENT '订单表';

CREATE TABLE 'order_detail'(
	'detail_id' VARCHAR(32) NOT NULL,
	'order_id' VARCHAR(32) NOT NULL,
	'product_id' VARCHAR(32) NOT NULL,
	'product_name' VARCHAR(64) NOT NULL COMMENT '商品名称',
	'product_price' DECIMAL(8,2) NOT NULL COMMENT '商品价格',
	'product_quantity' INT NOT NULL COMMENT '商品数量',
	'product_icon' VARCHAR(512) COMMENT '商品小图标',
	'create_time' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	'update_time' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY ('detail_id'),
	KEY 'idx_order_id' ('order_id')

) COMMENT '订单详情表';









