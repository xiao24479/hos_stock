/*
 Navicat Premium Data Transfer

 Source Server         : 本地预约系统
 Source Server Type    : MySQL
 Source Server Version : 50617
 Source Host           : localhost:3306
 Source Schema         : hos_store

 Target Server Type    : MySQL
 Target Server Version : 50617
 File Encoding         : 65001

 Date: 01/04/2019 16:54:20
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_application
-- ----------------------------
DROP TABLE IF EXISTS `admin_application`;
CREATE TABLE `admin_application`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NULL DEFAULT NULL,
  `goods_id` int(11) NULL DEFAULT NULL,
  `applicant` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `apply_time`(`created_at`) USING BTREE,
  INDEX `applicant`(`applicant`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for admin_categories
-- ----------------------------
DROP TABLE IF EXISTS `admin_categories`;
CREATE TABLE `admin_categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_show` tinyint(1) NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_categories
-- ----------------------------
INSERT INTO `admin_categories` VALUES (1, 0, 1, '办公用品', 1, '2019-03-07 18:48:17', '2019-03-08 15:36:16');
INSERT INTO `admin_categories` VALUES (2, 0, 3, '体育用品', 1, '2019-03-07 18:48:35', '2019-03-08 15:36:32');
INSERT INTO `admin_categories` VALUES (3, 0, 4, '医务用品', 1, '2019-03-07 18:49:07', '2019-03-08 15:36:16');
INSERT INTO `admin_categories` VALUES (4, 1, 2, '电器', 1, '2019-03-08 10:33:20', '2019-03-08 15:36:32');

-- ----------------------------
-- Table structure for admin_goods
-- ----------------------------
DROP TABLE IF EXISTS `admin_goods`;
CREATE TABLE `admin_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT 1,
  `hos_id` int(11) NULL DEFAULT NULL,
  `cate_id` int(11) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `operated_admin_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `created_at`(`created_at`) USING BTREE,
  INDEX `cate_id`(`cate_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_goods
-- ----------------------------
INSERT INTO `admin_goods` VALUES (1, '办公桌', '核桃仁和体会突然', 1, 2, 1, '2019-03-30 14:41:50', '2019-03-30 17:45:26', 1);
INSERT INTO `admin_goods` VALUES (11, '篮球', '成都市成都市', 1, 2, 2, '2019-03-30 20:19:54', '2019-03-30 20:19:54', 1);
INSERT INTO `admin_goods` VALUES (12, '笔记本', '曾多次调查', 1, 6, 1, '2019-03-31 14:22:00', '2019-03-31 14:22:00', 1);
INSERT INTO `admin_goods` VALUES (13, '办公椅', '办公椅', 1, 6, 1, '2019-03-31 14:22:37', '2019-03-31 14:22:37', 1);
INSERT INTO `admin_goods` VALUES (14, '办公桌', '办公桌', 1, 6, 1, '2019-03-31 14:22:49', '2019-03-31 14:22:49', 1);
INSERT INTO `admin_goods` VALUES (15, '篮球', NULL, 1, 6, 2, '2019-03-31 15:22:51', '2019-03-31 15:22:51', 1);

-- ----------------------------
-- Table structure for admin_goods_stock_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_goods_stock_log`;
CREATE TABLE `admin_goods_stock_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `goods_id` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for admin_hospitals
-- ----------------------------
DROP TABLE IF EXISTS `admin_hospitals`;
CREATE TABLE `admin_hospitals`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_show` tinyint(1) NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_hospitals
-- ----------------------------
INSERT INTO `admin_hospitals` VALUES (2, 0, 1, '深圳仁爱医院', 1, '2019-01-16 18:29:52', '2019-01-16 19:38:24');
INSERT INTO `admin_hospitals` VALUES (3, 2, 2, '妇科', 1, '2019-01-16 18:31:33', '2019-03-06 19:30:55');
INSERT INTO `admin_hospitals` VALUES (4, 2, 4, '产科', 1, '2019-01-16 18:31:42', '2019-01-16 19:36:35');
INSERT INTO `admin_hospitals` VALUES (5, 2, 3, '后勤', 1, '2019-01-16 18:32:02', '2019-01-16 19:36:35');
INSERT INTO `admin_hospitals` VALUES (6, 0, 5, '宁波鄞州新东方医院', 1, '2019-01-16 18:33:08', '2019-01-16 19:36:35');
INSERT INTO `admin_hospitals` VALUES (7, 6, 6, '男科', 1, '2019-01-16 18:35:48', '2019-01-16 19:36:35');
INSERT INTO `admin_hospitals` VALUES (8, 6, 7, '妇科', 1, '2019-01-16 18:36:06', '2019-01-16 19:36:35');
INSERT INTO `admin_hospitals` VALUES (10, 0, 0, '台州五洲医院', 1, '2019-01-21 17:49:27', '2019-01-21 17:49:27');

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '首页', 'fa-bar-chart', '/', NULL, NULL, '2019-01-08 17:43:02');
INSERT INTO `admin_menu` VALUES (2, 0, 2, '管理员', 'fa-tasks', NULL, NULL, NULL, '2019-01-08 18:59:11');
INSERT INTO `admin_menu` VALUES (3, 2, 3, '用户管理', 'fa-users', 'auth/users', NULL, NULL, '2019-01-08 18:59:11');
INSERT INTO `admin_menu` VALUES (4, 2, 4, '角色管理', 'fa-user', 'auth/roles', NULL, NULL, '2019-01-08 17:27:11');
INSERT INTO `admin_menu` VALUES (5, 2, 5, '权限管理', 'fa-ban', 'auth/permissions', NULL, NULL, '2019-01-08 17:27:26');
INSERT INTO `admin_menu` VALUES (6, 2, 6, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, '2019-01-08 17:27:43');
INSERT INTO `admin_menu` VALUES (7, 2, 8, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, '2019-01-16 14:59:57');
INSERT INTO `admin_menu` VALUES (9, 2, 7, '医院管理', 'fa-hospital-o', 'hospitals', NULL, '2019-01-16 14:59:40', '2019-01-16 14:59:57');
INSERT INTO `admin_menu` VALUES (10, 0, 9, '物料', 'fa-list', NULL, NULL, '2019-03-07 11:18:13', '2019-03-24 09:40:22');
INSERT INTO `admin_menu` VALUES (11, 10, 11, '商品管理', 'fa-apple', 'goods', NULL, '2019-03-07 11:21:01', '2019-03-30 16:09:35');
INSERT INTO `admin_menu` VALUES (12, 10, 10, '分类管理', 'fa-align-left', 'categories', NULL, '2019-03-07 18:01:14', '2019-03-31 14:28:03');
INSERT INTO `admin_menu` VALUES (13, 10, 15, '库存日志', 'fa-calendar', 'stocklog', NULL, '2019-03-09 11:16:17', '2019-04-01 15:11:14');
INSERT INTO `admin_menu` VALUES (14, 10, 13, '申领管理', 'fa-arrow-right', 'application', NULL, '2019-03-24 09:39:43', '2019-03-30 18:34:15');
INSERT INTO `admin_menu` VALUES (15, 10, 12, '采购管理', 'fa-bars', 'purchase', NULL, '2019-03-30 11:41:39', '2019-03-31 14:28:03');
INSERT INTO `admin_menu` VALUES (16, 10, 14, '退还管理', 'fa-arrow-left', 'reback', NULL, '2019-03-30 18:33:23', '2019-03-30 18:33:47');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `input` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 431 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, '超级管理员', '*', '', '*', NULL, '2019-01-08 18:02:54');
INSERT INTO `admin_permissions` VALUES (2, '首页', 'dashboard', 'GET', '/', NULL, '2019-01-08 18:03:21');
INSERT INTO `admin_permissions` VALUES (7, '登录登出', 'auth.login/auth.logout', '', '/auth/login\r\n/auth/logout', '2019-01-16 15:37:08', '2019-01-16 15:37:45');
INSERT INTO `admin_permissions` VALUES (4, '用户设置', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, '2019-01-08 18:03:49');
INSERT INTO `admin_permissions` VALUES (5, '用户管理', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, '2019-01-08 18:04:16');
INSERT INTO `admin_permissions` VALUES (8, '切换医院', 'switchHos', 'POST', '/switchHos', '2019-03-06 19:40:09', '2019-03-06 19:41:17');
INSERT INTO `admin_permissions` VALUES (9, '库存管理', 'goods', 'GET,POST,PUT,PATCH,OPTIONS,HEAD', '/goods*', '2019-03-09 11:36:09', '2019-03-16 18:16:17');
INSERT INTO `admin_permissions` VALUES (10, '商品分类', 'category', 'GET,POST,PUT', '/categories*', '2019-03-09 11:36:34', '2019-03-14 17:40:59');
INSERT INTO `admin_permissions` VALUES (11, '库存日志', 'storelog', 'GET', '/storelog*', '2019-03-09 11:37:01', '2019-03-14 17:40:52');

-- ----------------------------
-- Table structure for admin_purchase
-- ----------------------------
DROP TABLE IF EXISTS `admin_purchase`;
CREATE TABLE `admin_purchase`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `quantity` int(10) UNSIGNED NULL DEFAULT NULL,
  `price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `operated_admin_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for admin_reback
-- ----------------------------
DROP TABLE IF EXISTS `admin_reback`;
CREATE TABLE `admin_reback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NULL DEFAULT NULL,
  `goods_id` int(11) NULL DEFAULT NULL,
  `applicant` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `apply_time`(`created_at`) USING BTREE,
  INDEX `applicant`(`applicant`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 8, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 9, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 10, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 7, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 2, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 11, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (2, 2, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (2, 3, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, '超级管理员', 'administrator', '2019-01-08 08:35:37', '2019-01-08 18:04:59');
INSERT INTO `admin_roles` VALUES (2, '普通用户', '普通用户', '2019-01-16 15:06:47', '2019-01-16 15:06:47');

-- ----------------------------
-- Table structure for admin_user_hospitals
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_hospitals`;
CREATE TABLE `admin_user_hospitals`  (
  `user_id` int(11) NOT NULL,
  `hos_id` int(11) NOT NULL,
  INDEX `admin_user_hos_user_id_hos_id_index`(`user_id`, `hos_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_user_hospitals
-- ----------------------------
INSERT INTO `admin_user_hospitals` VALUES (1, 3);
INSERT INTO `admin_user_hospitals` VALUES (1, 4);
INSERT INTO `admin_user_hospitals` VALUES (1, 5);
INSERT INTO `admin_user_hospitals` VALUES (1, 7);
INSERT INTO `admin_user_hospitals` VALUES (1, 8);
INSERT INTO `admin_user_hospitals` VALUES (2, 3);
INSERT INTO `admin_user_hospitals` VALUES (2, 4);
INSERT INTO `admin_user_hospitals` VALUES (2, 5);
INSERT INTO `admin_user_hospitals` VALUES (2, 7);
INSERT INTO `admin_user_hospitals` VALUES (2, 8);
INSERT INTO `admin_user_hospitals` VALUES (3, 3);
INSERT INTO `admin_user_hospitals` VALUES (3, 4);
INSERT INTO `admin_user_hospitals` VALUES (3, 5);

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$ln/fhNkKtiklM6//5MXkfeT7XKWJnesQ0DMiIizKWvSMV0f4ZvyPe', '墨菲定理', 'admin/images/20190306/20170407223831_VCSEK.thumb.700_0.jpeg', 'pa7hV6xRmMGQhO4g3IIaShwcETpmiBItrqiwyuHxdoysTk3wVqEPjacLLxsM', '2019-01-08 08:35:37', '2019-03-06 17:09:02');
INSERT INTO `admin_users` VALUES (2, 'leo', '$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW', 'leo', NULL, 'hHURrDQmieYUE1iHYvnJQqbCTMGSZNMPSD9TPQec3oENShbae002SAYUGHYW', '2019-01-16 15:04:54', '2019-01-16 15:04:54');
INSERT INTO `admin_users` VALUES (3, 'henry', '$2y$10$/YUhvoO8q6GL/EjuzqEqeOIdlSUnRiYq2Tl61daEPeSKthy0rymt.', 'henry', 'admin/images/20190316/1.jpg', NULL, '2019-03-16 15:43:53', '2019-03-16 15:43:53');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);

SET FOREIGN_KEY_CHECKS = 1;
