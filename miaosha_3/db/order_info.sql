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

 Date: 04/05/2020 19:15:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT 'ID 订单表',
  `user_id` bigint(22) NOT NULL DEFAULT 0 COMMENT '用户ID 表示属于哪一个用户',
  `goods_id` bigint(22) NOT NULL DEFAULT 0 COMMENT '购买商品ID',
  `delivery_addr_id` bigint(22) NOT NULL DEFAULT 0 COMMENT '收货地址',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '冗余过来的商品的名称',
  `goods_count` bigint(22) NOT NULL DEFAULT 0 COMMENT '订单数量，秒杀业务下是1',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '订单的价格',
  `order_channel` tinyint(4) NOT NULL COMMENT '渠道： 1.PC.2 android.3 ios',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单状态： ０：未支付，1已支付，2： 已发货，3： 已收货，4：已退款，5：已完成',
  `create_date` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '下单时间',
  `pay_date` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '支付时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
