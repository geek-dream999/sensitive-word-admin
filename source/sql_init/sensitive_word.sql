/*
 Navicat MySQL Data Transfer

 Source Server         : 我的服务器
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : 49.233.53.131:3307
 Source Schema         : sensitive_word

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 07/09/2024 10:31:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lc_enum_mapping
-- ----------------------------
DROP TABLE IF EXISTS `lc_enum_mapping`;
CREATE TABLE `lc_enum_mapping`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `table_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名称',
  `column_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段编码',
  `label` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段显示',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_lc_enum_mapping`(`table_name` ASC, `column_name` ASC, `key` ASC) USING BTREE COMMENT '标识索引'
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '枚举映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_enum_mapping
-- ----------------------------
INSERT INTO `lc_enum_mapping` VALUES (1, 'word', 'status', 'S', '正常', '2024-07-30 18:00:09', '2024-07-30 18:00:09');
INSERT INTO `lc_enum_mapping` VALUES (2, 'word', 'status', 'F', '失效', '2024-07-30 18:00:09', '2024-07-30 18:00:09');
INSERT INTO `lc_enum_mapping` VALUES (3, 'word', 'type', 'ALLOW', '允许', '2024-07-30 18:00:09', '2024-07-30 18:00:09');
INSERT INTO `lc_enum_mapping` VALUES (4, 'word', 'type', 'DENY', '禁止', '2024-07-30 18:00:09', '2024-07-30 18:00:09');
INSERT INTO `lc_enum_mapping` VALUES (5, 'word_log', 'status', 'S', '正常', '2024-07-30 18:00:09', '2024-07-30 18:00:09');
INSERT INTO `lc_enum_mapping` VALUES (6, 'word_log', 'status', 'F', '失效', '2024-07-30 18:00:09', '2024-07-30 18:00:09');
INSERT INTO `lc_enum_mapping` VALUES (7, 'word_log', 'type', 'ALLOW', '允许', '2024-07-30 18:00:09', '2024-07-30 18:00:09');
INSERT INTO `lc_enum_mapping` VALUES (8, 'word_log', 'type', 'DENY', '禁止', '2024-07-30 18:00:09', '2024-07-30 18:00:09');
INSERT INTO `lc_enum_mapping` VALUES (9, 'tag', 'status', 'S', '正常', '2024-07-30 18:00:09', '2024-07-30 18:00:09');
INSERT INTO `lc_enum_mapping` VALUES (10, 'tag', 'status', 'F', '失效', '2024-07-30 18:00:09', '2024-07-30 18:00:09');
INSERT INTO `lc_enum_mapping` VALUES (11, 'word_log', 'operator_type', 'CREATE', '新增', '2024-07-30 18:00:09', '2024-07-30 18:00:09');
INSERT INTO `lc_enum_mapping` VALUES (12, 'word_log', 'operator_type', 'DELETE', '删除', '2024-07-30 18:00:09', '2024-07-30 18:00:09');
INSERT INTO `lc_enum_mapping` VALUES (13, 'word_log', 'operator_type', 'UPDATE', '更新', '2024-07-30 18:00:09', '2024-07-30 18:00:09');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应用自增主键',
  `tag_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签编码',
  `tag_label` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签描述',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'S' COMMENT '状态',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置描述',
  `operator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '操作员名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tag_code`(`tag_code` ASC) USING BTREE COMMENT '标签标识唯一索引'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------

-- ----------------------------
-- Table structure for word
-- ----------------------------
DROP TABLE IF EXISTS `word`;
CREATE TABLE `word`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应用自增主键',
  `word` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单词',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'S' COMMENT '状态',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置描述',
  `operator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '操作员名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_word`(`word` ASC) USING BTREE COMMENT '唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '敏感词表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of word
-- ----------------------------
INSERT INTO `word` VALUES (1, '你妈', 'DENY', 'S', '', 'system', '2024-07-30 18:08:05', '2024-07-30 18:08:05');
INSERT INTO `word` VALUES (2, '大胸', 'ALLOW', 'S', '', 'system', '2024-07-30 18:11:13', '2024-07-30 18:11:13');
INSERT INTO `word` VALUES (3, '你在干嘛', 'ALLOW', 'S', '', 'system', '2024-07-30 18:19:39', '2024-07-30 18:19:39');
INSERT INTO `word` VALUES (6, '北京', 'ALLOW', 'S', '', 'system', '2024-08-13 14:20:07', '2024-08-13 14:20:07');
INSERT INTO `word` VALUES (7, '天安门', 'ALLOW', 'S', '', 'system', '2024-08-13 14:23:16', '2024-08-13 14:23:16');
INSERT INTO `word` VALUES (8, '活动', 'ALLOW', 'S', '', 'system', '2024-09-07 09:48:55', '2024-09-07 09:48:55');
INSERT INTO `word` VALUES (9, '组织', 'ALLOW', 'S', '', 'system', '2024-09-07 09:53:35', '2024-09-07 09:53:35');

-- ----------------------------
-- Table structure for word_log
-- ----------------------------
DROP TABLE IF EXISTS `word_log`;
CREATE TABLE `word_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应用自增主键',
  `batch_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '批次号',
  `word` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单词',
  `word_before` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更前单词',
  `word_after` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更后单词',
  `type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'S' COMMENT '单词状态',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置描述',
  `operator_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作类别',
  `operator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '操作员名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_word`(`word` ASC) USING BTREE COMMENT '单词普通索引',
  INDEX `ix_batch_id`(`batch_id` ASC) USING BTREE COMMENT '批次号普通索引',
  INDEX `ix_update_time`(`update_time` ASC) USING BTREE COMMENT '更新时间普通索引'
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '敏感词操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of word_log
-- ----------------------------
INSERT INTO `word_log` VALUES (1, 'd6868d98e44d4f478c7a87c8b349e7d6', '你妈', NULL, '你妈', 'ALLOW', 'S', '', 'CREATE', 'system', '2024-07-30 18:08:06', '2024-07-30 18:08:06');
INSERT INTO `word_log` VALUES (2, '42862f143b1a4c868b698e9068cd82eb', '你妈', NULL, '你妈', 'DENY', 'S', '', 'UPDATE', 'system', '2024-07-30 18:09:03', '2024-07-30 18:09:03');
INSERT INTO `word_log` VALUES (3, '94cb7ef32afa4ebaa2f125dfa82d91b3', '大胸', NULL, '大胸', 'DENY', 'S', '', 'CREATE', 'system', '2024-07-30 18:11:13', '2024-07-30 18:11:13');
INSERT INTO `word_log` VALUES (4, '746449b3a3ac4ca0a6f6303c9dde55df', '你妈', NULL, '你妈', 'ALLOW', 'S', '', 'UPDATE', 'system', '2024-07-30 18:11:33', '2024-07-30 18:11:33');
INSERT INTO `word_log` VALUES (5, 'f876bd46db7f4b838fa7dfba56ea2ab1', '大胸', NULL, '大胸', 'ALLOW', 'S', '', 'UPDATE', 'system', '2024-07-30 18:16:54', '2024-07-30 18:16:54');
INSERT INTO `word_log` VALUES (6, '78b75836dab74d69a2415d564d8b406d', '你在干嘛', NULL, '你在干嘛', 'DENY', 'S', '', 'CREATE', 'system', '2024-07-30 18:19:40', '2024-07-30 18:19:40');
INSERT INTO `word_log` VALUES (7, '14a54b262c7943739b34196f5b709fbb', '1', NULL, '1', 'DENY', 'S', '', 'CREATE', 'system', '2024-07-30 18:20:04', '2024-07-30 18:20:04');
INSERT INTO `word_log` VALUES (8, 'ae5e01b17c3a45309d9df36b6cb495e4', '你妈', NULL, '你妈', 'DENY', 'S', '', 'UPDATE', 'system', '2024-07-30 18:20:18', '2024-07-30 18:20:18');
INSERT INTO `word_log` VALUES (9, '3d8863853e0a4a9f8e1c9a0688aeffdc', '66666', NULL, '66666', 'DENY', 'S', '', 'CREATE', 'system', '2024-07-30 18:20:33', '2024-07-30 18:20:33');
INSERT INTO `word_log` VALUES (10, '942f36cc93fd41bc9e2c048f5e8675e2', '你在干嘛', NULL, '你在干嘛', 'ALLOW', 'S', '', 'UPDATE', 'system', '2024-07-31 09:30:44', '2024-07-31 09:30:44');
INSERT INTO `word_log` VALUES (11, '450fd98371d84871a792d29ee9d9cb23', '北京', NULL, '北京', 'ALLOW', 'S', '', 'CREATE', 'system', '2024-08-13 14:20:07', '2024-08-13 14:20:07');
INSERT INTO `word_log` VALUES (12, '493fdd20559143fabb9137c81e28efd1', '天安门', NULL, '天安门', 'ALLOW', 'S', '', 'CREATE', 'system', '2024-08-13 14:23:16', '2024-08-13 14:23:16');
INSERT INTO `word_log` VALUES (13, 'ff72b6dd54fa4d338b472c19c43af0ed', '1', '1', NULL, 'DENY', 'S', '', 'DELETE', 'system', '2024-08-13 16:02:11', '2024-08-13 16:02:11');
INSERT INTO `word_log` VALUES (14, '4a7f3187816c4d3ebdf39fe8f00b465e', '66666', '66666', NULL, 'DENY', 'S', '', 'DELETE', 'system', '2024-08-13 16:02:21', '2024-08-13 16:02:21');
INSERT INTO `word_log` VALUES (15, 'bae482dcea9349298cd3a36fdbae84cf', '组织', NULL, '组织', 'ALLOW', 'S', '', 'CREATE', 'system', '2024-09-07 09:53:35', '2024-09-07 09:53:35');

-- ----------------------------
-- Table structure for word_tag_mapping
-- ----------------------------
DROP TABLE IF EXISTS `word_tag_mapping`;
CREATE TABLE `word_tag_mapping`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '应用自增主键',
  `word` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单词信息',
  `tag_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签编码',
  `operator_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '操作员名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间戳',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_word_tag_mapping`(`word` ASC, `tag_code` ASC) USING BTREE COMMENT '标签单词映射唯一索引'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签单词映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of word_tag_mapping
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
