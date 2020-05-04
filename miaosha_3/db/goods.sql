/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : miaosha

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 04/05/2020 19:14:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------

-- Table structure for goods

-- ----------------------------

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商品名称',
  `goods_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商品标题',
  `goods_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '商品的主图',
  `goods_detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品的详细信息',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '商品的价格',
  `goods_stock` int(11) NOT NULL DEFAULT 0 COMMENT '商品的库存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------

-- Records of goods

-- ----------------------------

INSERT INTO `goods` VALUES (1, 'iphone', 'iphone', '/img/iphonex.png', 'ipx', 2222.00, 111);
INSERT INTO `goods` VALUES (2, 'huawei', 'huawei', '/img/meta10.png', 'huawei', 2122.00, 11);

SET FOREIGN_KEY_CHECKS = 1;
