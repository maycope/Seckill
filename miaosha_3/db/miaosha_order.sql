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

 Date: 04/05/2020 19:15:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for miaosha_order
-- ----------------------------
DROP TABLE IF EXISTS `miaosha_order`;
CREATE TABLE `miaosha_order`  (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `order_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '订单ID',
  `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
