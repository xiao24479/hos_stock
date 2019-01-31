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

 Date: 31/01/2019 17:29:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_hospitals
-- ----------------------------
DROP TABLE IF EXISTS `admin_hospitals`;
CREATE TABLE `admin_hospitals`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_show` tinyint(1) DEFAULT 1,
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_hospitals
-- ----------------------------
INSERT INTO `admin_hospitals` VALUES (2, 0, 1, '深圳仁爱医院', 1, '2019-01-16 18:29:52', '2019-01-16 19:38:24');
INSERT INTO `admin_hospitals` VALUES (3, 2, 2, '妇科', 0, '2019-01-16 18:31:33', '2019-01-16 19:50:43');
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
  `uri` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1471 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (328, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u533b\\u9662\\u7ba1\\u7406\",\"icon\":\"fa-hospital-o\",\"uri\":\"hospitals\",\"roles\":[null],\"permission\":null,\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 14:59:40', '2019-01-16 14:59:40');
INSERT INTO `admin_operation_log` VALUES (326, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 14:53:45', '2019-01-16 14:53:45');
INSERT INTO `admin_operation_log` VALUES (327, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 14:54:21', '2019-01-16 14:54:21');
INSERT INTO `admin_operation_log` VALUES (324, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 14:52:42', '2019-01-16 14:52:42');
INSERT INTO `admin_operation_log` VALUES (325, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 14:53:30', '2019-01-16 14:53:30');
INSERT INTO `admin_operation_log` VALUES (323, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 14:52:22', '2019-01-16 14:52:22');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 14:52:04', '2019-01-16 14:52:04');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 14:51:47', '2019-01-16 14:51:47');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 14:51:52', '2019-01-16 14:51:52');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 14:51:31', '2019-01-16 14:51:31');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 14:50:58', '2019-01-16 14:50:58');
INSERT INTO `admin_operation_log` VALUES (317, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 14:50:43', '2019-01-16 14:50:43');
INSERT INTO `admin_operation_log` VALUES (316, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 14:50:40', '2019-01-16 14:50:40');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 14:49:13', '2019-01-16 14:49:13');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 14:49:26', '2019-01-16 14:49:26');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 12:02:31', '2019-01-16 12:02:31');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 14:30:23', '2019-01-16 14:30:23');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"50\"}', '2019-01-16 11:53:04', '2019-01-16 11:53:04');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"50\",\"_pjax\":\"#pjax-container\"}', '2019-01-16 11:45:49', '2019-01-16 11:45:49');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"10\",\"_pjax\":\"#pjax-container\"}', '2019-01-16 11:45:46', '2019-01-16 11:45:46');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin/users', 'GET', '127.0.0.1', '{\"per_page\":\"50\",\"_pjax\":\"#pjax-container\"}', '2019-01-16 11:45:44', '2019-01-16 11:45:44');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-16 09:34:27', '2019-01-16 09:34:27');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:34:30', '2019-01-16 09:34:30');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:34:32', '2019-01-16 09:34:32');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-16 09:34:40', '2019-01-16 09:34:40');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:34:43', '2019-01-16 09:34:43');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:34:44', '2019-01-16 09:34:44');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:34:45', '2019-01-16 09:34:45');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-01-16 09:35:15', '2019-01-16 09:35:15');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:39:16', '2019-01-16 09:39:16');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:39:20', '2019-01-16 09:39:20');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:53:27', '2019-01-16 09:53:27');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:53:29', '2019-01-16 09:53:29');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 10:23:15', '2019-01-16 10:23:15');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 10:28:36', '2019-01-16 10:28:36');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 10:28:53', '2019-01-16 10:28:53');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-16 10:34:22', '2019-01-16 10:34:22');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-16 10:43:50', '2019-01-16 10:43:50');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin/auth/menu/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 10:47:22', '2019-01-16 10:47:22');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 10:51:49', '2019-01-16 10:51:49');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/auth/menu/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 10:51:58', '2019-01-16 10:51:58');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 10:52:04', '2019-01-16 10:52:04');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 10:52:10', '2019-01-16 10:52:10');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-01-16 10:52:14', '2019-01-16 10:52:14');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-01-16 11:05:05', '2019-01-16 11:05:05');
INSERT INTO `admin_operation_log` VALUES (307, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2019-01-16 11:42:44', '2019-01-16 11:42:44');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/auth/menu/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:16:49', '2019-01-16 09:16:49');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:34:11', '2019-01-16 09:34:11');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/auth/menu/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:29:09', '2019-01-16 09:29:09');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:17:01', '2019-01-16 09:17:01');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:16:18', '2019-01-16 09:16:18');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/auth/permissions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:16:19', '2019-01-16 09:16:19');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:16:26', '2019-01-16 09:16:26');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:16:44', '2019-01-16 09:16:44');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/auth/permissions/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:16:15', '2019-01-16 09:16:15');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 16:01:10', '2019-01-14 16:01:10');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 16:01:17', '2019-01-14 16:01:17');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 08:25:50', '2019-01-16 08:25:50');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:15:58', '2019-01-16 09:15:58');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 09:16:07', '2019-01-16 09:16:07');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 16:00:29', '2019-01-14 16:00:29');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/auth/permissions/3', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 16:00:38', '2019-01-14 16:00:38');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 16:00:44', '2019-01-14 16:00:44');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/auth/permissions/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 16:00:47', '2019-01-14 16:00:47');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 16:00:57', '2019-01-14 16:00:57');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 16:01:10', '2019-01-14 16:01:10');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 16:00:27', '2019-01-14 16:00:27');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-14 10:58:06', '2019-01-14 10:58:06');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-14 16:00:01', '2019-01-14 16:00:01');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 16:00:20', '2019-01-14 16:00:20');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 16:00:22', '2019-01-14 16:00:22');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":null,\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"W8Srq10JOrcCdRvAlwZqC5WF0YAfURZ7JEvwllGp\"}', '2019-01-14 10:58:05', '2019-01-14 10:58:05');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-14 10:57:52', '2019-01-14 10:57:52');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":null,\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"W8Srq10JOrcCdRvAlwZqC5WF0YAfURZ7JEvwllGp\"}', '2019-01-14 10:57:52', '2019-01-14 10:57:52');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 10:56:15', '2019-01-14 10:56:15');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 10:56:17', '2019-01-14 10:56:17');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 10:56:20', '2019-01-14 10:56:20');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 10:56:23', '2019-01-14 10:56:23');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 10:31:50', '2019-01-14 10:31:50');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 10:31:33', '2019-01-14 10:31:33');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 10:31:37', '2019-01-14 10:31:37');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 10:29:57', '2019-01-14 10:29:57');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 10:31:30', '2019-01-14 10:31:30');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-14 10:31:32', '2019-01-14 10:31:32');
INSERT INTO `admin_operation_log` VALUES (384, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:08:49', '2019-01-16 15:08:49');
INSERT INTO `admin_operation_log` VALUES (383, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:08:43', '2019-01-16 15:08:43');
INSERT INTO `admin_operation_log` VALUES (382, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:08:30', '2019-01-16 15:08:30');
INSERT INTO `admin_operation_log` VALUES (380, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:08:20', '2019-01-16 15:08:20');
INSERT INTO `admin_operation_log` VALUES (381, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:08:30', '2019-01-16 15:08:30');
INSERT INTO `admin_operation_log` VALUES (379, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-01-16 15:08:15', '2019-01-16 15:08:15');
INSERT INTO `admin_operation_log` VALUES (378, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:08:11', '2019-01-16 15:08:11');
INSERT INTO `admin_operation_log` VALUES (377, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"2\",\"3\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:08:11', '2019-01-16 15:08:11');
INSERT INTO `admin_operation_log` VALUES (376, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:08:07', '2019-01-16 15:08:07');
INSERT INTO `admin_operation_log` VALUES (375, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:08:05', '2019-01-16 15:08:05');
INSERT INTO `admin_operation_log` VALUES (374, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"3\",\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:08:05', '2019-01-16 15:08:05');
INSERT INTO `admin_operation_log` VALUES (373, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:08:02', '2019-01-16 15:08:02');
INSERT INTO `admin_operation_log` VALUES (372, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:08:01', '2019-01-16 15:08:01');
INSERT INTO `admin_operation_log` VALUES (371, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:07:41', '2019-01-16 15:07:41');
INSERT INTO `admin_operation_log` VALUES (370, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:07:36', '2019-01-16 15:07:36');
INSERT INTO `admin_operation_log` VALUES (369, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:07:25', '2019-01-16 15:07:25');
INSERT INTO `admin_operation_log` VALUES (368, 2, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-01-16 15:07:22', '2019-01-16 15:07:22');
INSERT INTO `admin_operation_log` VALUES (367, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-16 15:07:15', '2019-01-16 15:07:15');
INSERT INTO `admin_operation_log` VALUES (365, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:07:08', '2019-01-16 15:07:08');
INSERT INTO `admin_operation_log` VALUES (366, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-16 15:07:14', '2019-01-16 15:07:14');
INSERT INTO `admin_operation_log` VALUES (364, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:07:06', '2019-01-16 15:07:06');
INSERT INTO `admin_operation_log` VALUES (363, 2, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:07:02', '2019-01-16 15:07:02');
INSERT INTO `admin_operation_log` VALUES (362, 2, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:07:01', '2019-01-16 15:07:01');
INSERT INTO `admin_operation_log` VALUES (361, 2, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:06:59', '2019-01-16 15:06:59');
INSERT INTO `admin_operation_log` VALUES (360, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:06:56', '2019-01-16 15:06:56');
INSERT INTO `admin_operation_log` VALUES (358, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:06:47', '2019-01-16 15:06:47');
INSERT INTO `admin_operation_log` VALUES (359, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:06:54', '2019-01-16 15:06:54');
INSERT INTO `admin_operation_log` VALUES (357, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:06:47', '2019-01-16 15:06:47');
INSERT INTO `admin_operation_log` VALUES (356, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:05:53', '2019-01-16 15:05:53');
INSERT INTO `admin_operation_log` VALUES (355, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:05:51', '2019-01-16 15:05:51');
INSERT INTO `admin_operation_log` VALUES (354, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:05:30', '2019-01-16 15:05:30');
INSERT INTO `admin_operation_log` VALUES (353, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:04:58', '2019-01-16 15:04:58');
INSERT INTO `admin_operation_log` VALUES (352, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-16 15:04:54', '2019-01-16 15:04:54');
INSERT INTO `admin_operation_log` VALUES (351, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"lebao520\",\"password_confirmation\":\"lebao520\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-16 15:04:54', '2019-01-16 15:04:54');
INSERT INTO `admin_operation_log` VALUES (350, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:03:30', '2019-01-16 15:03:30');
INSERT INTO `admin_operation_log` VALUES (349, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:03:27', '2019-01-16 15:03:27');
INSERT INTO `admin_operation_log` VALUES (348, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:03:24', '2019-01-16 15:03:24');
INSERT INTO `admin_operation_log` VALUES (347, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:03:23', '2019-01-16 15:03:23');
INSERT INTO `admin_operation_log` VALUES (345, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:02:53', '2019-01-16 15:02:53');
INSERT INTO `admin_operation_log` VALUES (346, 1, 'admin/auth/menu/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:02:59', '2019-01-16 15:02:59');
INSERT INTO `admin_operation_log` VALUES (344, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:02:50', '2019-01-16 15:02:50');
INSERT INTO `admin_operation_log` VALUES (343, 1, 'admin/auth/permissions/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:02:30', '2019-01-16 15:02:30');
INSERT INTO `admin_operation_log` VALUES (342, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:02:08', '2019-01-16 15:02:08');
INSERT INTO `admin_operation_log` VALUES (341, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:02:01', '2019-01-16 15:02:01');
INSERT INTO `admin_operation_log` VALUES (340, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:01:56', '2019-01-16 15:01:56');
INSERT INTO `admin_operation_log` VALUES (339, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:01:52', '2019-01-16 15:01:52');
INSERT INTO `admin_operation_log` VALUES (338, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:01:20', '2019-01-16 15:01:20');
INSERT INTO `admin_operation_log` VALUES (337, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:01:13', '2019-01-16 15:01:13');
INSERT INTO `admin_operation_log` VALUES (336, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:00:53', '2019-01-16 15:00:53');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:00:49', '2019-01-16 15:00:49');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:00:46', '2019-01-16 15:00:46');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/auth/menu/6/edit', 'GET', '127.0.0.1', '[]', '2019-01-16 15:00:43', '2019-01-16 15:00:43');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/auth/menu/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:00:06', '2019-01-16 15:00:06');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 14:59:57', '2019-01-16 14:59:57');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":9},{\\\"id\\\":7}]}]\"}', '2019-01-16 14:59:57', '2019-01-16 14:59:57');
INSERT INTO `admin_operation_log` VALUES (329, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-16 14:59:40', '2019-01-16 14:59:40');
INSERT INTO `admin_operation_log` VALUES (385, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:08:56', '2019-01-16 15:08:56');
INSERT INTO `admin_operation_log` VALUES (386, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:09:06', '2019-01-16 15:09:06');
INSERT INTO `admin_operation_log` VALUES (387, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:09:11', '2019-01-16 15:09:11');
INSERT INTO `admin_operation_log` VALUES (388, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:09:13', '2019-01-16 15:09:13');
INSERT INTO `admin_operation_log` VALUES (389, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:09:23', '2019-01-16 15:09:23');
INSERT INTO `admin_operation_log` VALUES (390, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:09:39', '2019-01-16 15:09:39');
INSERT INTO `admin_operation_log` VALUES (391, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:09:41', '2019-01-16 15:09:41');
INSERT INTO `admin_operation_log` VALUES (392, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:09:45', '2019-01-16 15:09:45');
INSERT INTO `admin_operation_log` VALUES (393, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:09:49', '2019-01-16 15:09:49');
INSERT INTO `admin_operation_log` VALUES (394, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:09:51', '2019-01-16 15:09:51');
INSERT INTO `admin_operation_log` VALUES (395, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:09:53', '2019-01-16 15:09:53');
INSERT INTO `admin_operation_log` VALUES (396, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:10:05', '2019-01-16 15:10:05');
INSERT INTO `admin_operation_log` VALUES (397, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:10:09', '2019-01-16 15:10:09');
INSERT INTO `admin_operation_log` VALUES (398, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:10:12', '2019-01-16 15:10:12');
INSERT INTO `admin_operation_log` VALUES (399, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:10:28', '2019-01-16 15:10:28');
INSERT INTO `admin_operation_log` VALUES (400, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:10:31', '2019-01-16 15:10:31');
INSERT INTO `admin_operation_log` VALUES (401, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"2\",\"3\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:10:37', '2019-01-16 15:10:37');
INSERT INTO `admin_operation_log` VALUES (402, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:10:37', '2019-01-16 15:10:37');
INSERT INTO `admin_operation_log` VALUES (403, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-01-16 15:11:00', '2019-01-16 15:11:00');
INSERT INTO `admin_operation_log` VALUES (404, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:11:09', '2019-01-16 15:11:09');
INSERT INTO `admin_operation_log` VALUES (405, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:11:15', '2019-01-16 15:11:15');
INSERT INTO `admin_operation_log` VALUES (406, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:11:15', '2019-01-16 15:11:15');
INSERT INTO `admin_operation_log` VALUES (407, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:11:30', '2019-01-16 15:11:30');
INSERT INTO `admin_operation_log` VALUES (408, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:11:39', '2019-01-16 15:11:39');
INSERT INTO `admin_operation_log` VALUES (409, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:11:53', '2019-01-16 15:11:53');
INSERT INTO `admin_operation_log` VALUES (410, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:11:55', '2019-01-16 15:11:55');
INSERT INTO `admin_operation_log` VALUES (411, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:11:57', '2019-01-16 15:11:57');
INSERT INTO `admin_operation_log` VALUES (412, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:12:08', '2019-01-16 15:12:08');
INSERT INTO `admin_operation_log` VALUES (413, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:12:40', '2019-01-16 15:12:40');
INSERT INTO `admin_operation_log` VALUES (414, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:12:45', '2019-01-16 15:12:45');
INSERT INTO `admin_operation_log` VALUES (415, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:12:56', '2019-01-16 15:12:56');
INSERT INTO `admin_operation_log` VALUES (416, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:12:57', '2019-01-16 15:12:57');
INSERT INTO `admin_operation_log` VALUES (417, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:12:58', '2019-01-16 15:12:58');
INSERT INTO `admin_operation_log` VALUES (418, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:13:14', '2019-01-16 15:13:14');
INSERT INTO `admin_operation_log` VALUES (419, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:13:15', '2019-01-16 15:13:15');
INSERT INTO `admin_operation_log` VALUES (420, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:13:17', '2019-01-16 15:13:17');
INSERT INTO `admin_operation_log` VALUES (421, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:13:20', '2019-01-16 15:13:20');
INSERT INTO `admin_operation_log` VALUES (422, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:13:22', '2019-01-16 15:13:22');
INSERT INTO `admin_operation_log` VALUES (423, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:13:24', '2019-01-16 15:13:24');
INSERT INTO `admin_operation_log` VALUES (424, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:13:26', '2019-01-16 15:13:26');
INSERT INTO `admin_operation_log` VALUES (425, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:13:39', '2019-01-16 15:13:39');
INSERT INTO `admin_operation_log` VALUES (426, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:13:42', '2019-01-16 15:13:42');
INSERT INTO `admin_operation_log` VALUES (427, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:13:44', '2019-01-16 15:13:44');
INSERT INTO `admin_operation_log` VALUES (428, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:13:51', '2019-01-16 15:13:51');
INSERT INTO `admin_operation_log` VALUES (429, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:13:53', '2019-01-16 15:13:53');
INSERT INTO `admin_operation_log` VALUES (430, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:13:57', '2019-01-16 15:13:57');
INSERT INTO `admin_operation_log` VALUES (431, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:14:00', '2019-01-16 15:14:00');
INSERT INTO `admin_operation_log` VALUES (432, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:14:06', '2019-01-16 15:14:06');
INSERT INTO `admin_operation_log` VALUES (433, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:14:08', '2019-01-16 15:14:08');
INSERT INTO `admin_operation_log` VALUES (434, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:14:26', '2019-01-16 15:14:26');
INSERT INTO `admin_operation_log` VALUES (435, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:14:27', '2019-01-16 15:14:27');
INSERT INTO `admin_operation_log` VALUES (436, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:14:28', '2019-01-16 15:14:28');
INSERT INTO `admin_operation_log` VALUES (437, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"2\",\"3\",\"5\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:15:46', '2019-01-16 15:15:46');
INSERT INTO `admin_operation_log` VALUES (438, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:15:46', '2019-01-16 15:15:46');
INSERT INTO `admin_operation_log` VALUES (439, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:15:50', '2019-01-16 15:15:50');
INSERT INTO `admin_operation_log` VALUES (440, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:15:53', '2019-01-16 15:15:53');
INSERT INTO `admin_operation_log` VALUES (441, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:15:54', '2019-01-16 15:15:54');
INSERT INTO `admin_operation_log` VALUES (442, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:15:55', '2019-01-16 15:15:55');
INSERT INTO `admin_operation_log` VALUES (443, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:15:59', '2019-01-16 15:15:59');
INSERT INTO `admin_operation_log` VALUES (444, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:16:08', '2019-01-16 15:16:08');
INSERT INTO `admin_operation_log` VALUES (445, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:16:10', '2019-01-16 15:16:10');
INSERT INTO `admin_operation_log` VALUES (446, 1, 'admin/auth/menu/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:16:13', '2019-01-16 15:16:13');
INSERT INTO `admin_operation_log` VALUES (447, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:16:23', '2019-01-16 15:16:23');
INSERT INTO `admin_operation_log` VALUES (448, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:16:38', '2019-01-16 15:16:38');
INSERT INTO `admin_operation_log` VALUES (449, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:16:47', '2019-01-16 15:16:47');
INSERT INTO `admin_operation_log` VALUES (450, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:16:50', '2019-01-16 15:16:50');
INSERT INTO `admin_operation_log` VALUES (451, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:17:27', '2019-01-16 15:17:27');
INSERT INTO `admin_operation_log` VALUES (452, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:17:30', '2019-01-16 15:17:30');
INSERT INTO `admin_operation_log` VALUES (453, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:17:35', '2019-01-16 15:17:35');
INSERT INTO `admin_operation_log` VALUES (454, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:17:41', '2019-01-16 15:17:41');
INSERT INTO `admin_operation_log` VALUES (455, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:17:45', '2019-01-16 15:17:45');
INSERT INTO `admin_operation_log` VALUES (456, 1, 'admin/auth/permissions/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:17:50', '2019-01-16 15:17:50');
INSERT INTO `admin_operation_log` VALUES (457, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:18:05', '2019-01-16 15:18:05');
INSERT INTO `admin_operation_log` VALUES (458, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:18:07', '2019-01-16 15:18:07');
INSERT INTO `admin_operation_log` VALUES (459, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:18:07', '2019-01-16 15:18:07');
INSERT INTO `admin_operation_log` VALUES (460, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:18:20', '2019-01-16 15:18:20');
INSERT INTO `admin_operation_log` VALUES (461, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:18:22', '2019-01-16 15:18:22');
INSERT INTO `admin_operation_log` VALUES (462, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"2\",\"3\",\"4\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:18:28', '2019-01-16 15:18:28');
INSERT INTO `admin_operation_log` VALUES (463, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:18:28', '2019-01-16 15:18:28');
INSERT INTO `admin_operation_log` VALUES (464, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:18:33', '2019-01-16 15:18:33');
INSERT INTO `admin_operation_log` VALUES (465, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:18:36', '2019-01-16 15:18:36');
INSERT INTO `admin_operation_log` VALUES (466, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:18:37', '2019-01-16 15:18:37');
INSERT INTO `admin_operation_log` VALUES (467, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:18:51', '2019-01-16 15:18:51');
INSERT INTO `admin_operation_log` VALUES (468, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:18:54', '2019-01-16 15:18:54');
INSERT INTO `admin_operation_log` VALUES (469, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:18:54', '2019-01-16 15:18:54');
INSERT INTO `admin_operation_log` VALUES (470, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:18:59', '2019-01-16 15:18:59');
INSERT INTO `admin_operation_log` VALUES (471, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:01', '2019-01-16 15:19:01');
INSERT INTO `admin_operation_log` VALUES (472, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:02', '2019-01-16 15:19:02');
INSERT INTO `admin_operation_log` VALUES (473, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:03', '2019-01-16 15:19:03');
INSERT INTO `admin_operation_log` VALUES (474, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:03', '2019-01-16 15:19:03');
INSERT INTO `admin_operation_log` VALUES (475, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:04', '2019-01-16 15:19:04');
INSERT INTO `admin_operation_log` VALUES (476, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:04', '2019-01-16 15:19:04');
INSERT INTO `admin_operation_log` VALUES (477, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:19:15', '2019-01-16 15:19:15');
INSERT INTO `admin_operation_log` VALUES (478, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"1\",\"2\",\"3\",\"4\",\"5\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:19:18', '2019-01-16 15:19:18');
INSERT INTO `admin_operation_log` VALUES (479, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:18', '2019-01-16 15:19:18');
INSERT INTO `admin_operation_log` VALUES (480, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:27', '2019-01-16 15:19:27');
INSERT INTO `admin_operation_log` VALUES (481, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:29', '2019-01-16 15:19:29');
INSERT INTO `admin_operation_log` VALUES (482, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:30', '2019-01-16 15:19:30');
INSERT INTO `admin_operation_log` VALUES (483, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:31', '2019-01-16 15:19:31');
INSERT INTO `admin_operation_log` VALUES (484, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:31', '2019-01-16 15:19:31');
INSERT INTO `admin_operation_log` VALUES (485, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:19:32', '2019-01-16 15:19:32');
INSERT INTO `admin_operation_log` VALUES (486, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:19:37', '2019-01-16 15:19:37');
INSERT INTO `admin_operation_log` VALUES (487, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"1\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:19:41', '2019-01-16 15:19:41');
INSERT INTO `admin_operation_log` VALUES (488, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:42', '2019-01-16 15:19:42');
INSERT INTO `admin_operation_log` VALUES (489, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:49', '2019-01-16 15:19:49');
INSERT INTO `admin_operation_log` VALUES (490, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:51', '2019-01-16 15:19:51');
INSERT INTO `admin_operation_log` VALUES (491, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:53', '2019-01-16 15:19:53');
INSERT INTO `admin_operation_log` VALUES (492, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:19:55', '2019-01-16 15:19:55');
INSERT INTO `admin_operation_log` VALUES (493, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:19:58', '2019-01-16 15:19:58');
INSERT INTO `admin_operation_log` VALUES (494, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:20:06', '2019-01-16 15:20:06');
INSERT INTO `admin_operation_log` VALUES (495, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:20:11', '2019-01-16 15:20:11');
INSERT INTO `admin_operation_log` VALUES (496, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:20:15', '2019-01-16 15:20:15');
INSERT INTO `admin_operation_log` VALUES (497, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:20:29', '2019-01-16 15:20:29');
INSERT INTO `admin_operation_log` VALUES (498, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:20:32', '2019-01-16 15:20:32');
INSERT INTO `admin_operation_log` VALUES (499, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-16 15:20:42', '2019-01-16 15:20:42');
INSERT INTO `admin_operation_log` VALUES (500, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-16 15:20:42', '2019-01-16 15:20:42');
INSERT INTO `admin_operation_log` VALUES (501, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:20:47', '2019-01-16 15:20:47');
INSERT INTO `admin_operation_log` VALUES (502, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:20:49', '2019-01-16 15:20:49');
INSERT INTO `admin_operation_log` VALUES (503, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:20:51', '2019-01-16 15:20:51');
INSERT INTO `admin_operation_log` VALUES (504, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:20:58', '2019-01-16 15:20:58');
INSERT INTO `admin_operation_log` VALUES (505, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:24:38', '2019-01-16 15:24:38');
INSERT INTO `admin_operation_log` VALUES (506, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:24:43', '2019-01-16 15:24:43');
INSERT INTO `admin_operation_log` VALUES (507, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:24:46', '2019-01-16 15:24:46');
INSERT INTO `admin_operation_log` VALUES (508, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:24:56', '2019-01-16 15:24:56');
INSERT INTO `admin_operation_log` VALUES (509, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:25:02', '2019-01-16 15:25:02');
INSERT INTO `admin_operation_log` VALUES (510, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:25:10', '2019-01-16 15:25:10');
INSERT INTO `admin_operation_log` VALUES (511, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:25:20', '2019-01-16 15:25:20');
INSERT INTO `admin_operation_log` VALUES (512, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:25:24', '2019-01-16 15:25:24');
INSERT INTO `admin_operation_log` VALUES (513, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:25:32', '2019-01-16 15:25:32');
INSERT INTO `admin_operation_log` VALUES (514, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-16 15:25:41', '2019-01-16 15:25:41');
INSERT INTO `admin_operation_log` VALUES (515, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-16 15:25:41', '2019-01-16 15:25:41');
INSERT INTO `admin_operation_log` VALUES (516, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:25:50', '2019-01-16 15:25:50');
INSERT INTO `admin_operation_log` VALUES (517, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:26:26', '2019-01-16 15:26:26');
INSERT INTO `admin_operation_log` VALUES (518, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-16 15:26:38', '2019-01-16 15:26:38');
INSERT INTO `admin_operation_log` VALUES (519, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-16 15:26:39', '2019-01-16 15:26:39');
INSERT INTO `admin_operation_log` VALUES (520, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:26:42', '2019-01-16 15:26:42');
INSERT INTO `admin_operation_log` VALUES (521, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-16 15:26:47', '2019-01-16 15:26:47');
INSERT INTO `admin_operation_log` VALUES (522, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-16 15:26:47', '2019-01-16 15:26:47');
INSERT INTO `admin_operation_log` VALUES (523, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:26:51', '2019-01-16 15:26:51');
INSERT INTO `admin_operation_log` VALUES (524, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:26:53', '2019-01-16 15:26:53');
INSERT INTO `admin_operation_log` VALUES (525, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:26:59', '2019-01-16 15:26:59');
INSERT INTO `admin_operation_log` VALUES (526, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:27:06', '2019-01-16 15:27:06');
INSERT INTO `admin_operation_log` VALUES (527, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:27:26', '2019-01-16 15:27:26');
INSERT INTO `admin_operation_log` VALUES (528, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:27', '2019-01-16 15:27:27');
INSERT INTO `admin_operation_log` VALUES (529, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:30', '2019-01-16 15:27:30');
INSERT INTO `admin_operation_log` VALUES (530, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:27:33', '2019-01-16 15:27:33');
INSERT INTO `admin_operation_log` VALUES (531, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:27:40', '2019-01-16 15:27:40');
INSERT INTO `admin_operation_log` VALUES (532, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"2\",\"5\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:27:46', '2019-01-16 15:27:46');
INSERT INTO `admin_operation_log` VALUES (533, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:46', '2019-01-16 15:27:46');
INSERT INTO `admin_operation_log` VALUES (534, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:49', '2019-01-16 15:27:49');
INSERT INTO `admin_operation_log` VALUES (535, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:52', '2019-01-16 15:27:52');
INSERT INTO `admin_operation_log` VALUES (536, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:52', '2019-01-16 15:27:52');
INSERT INTO `admin_operation_log` VALUES (537, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:53', '2019-01-16 15:27:53');
INSERT INTO `admin_operation_log` VALUES (538, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:53', '2019-01-16 15:27:53');
INSERT INTO `admin_operation_log` VALUES (539, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:54', '2019-01-16 15:27:54');
INSERT INTO `admin_operation_log` VALUES (540, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:54', '2019-01-16 15:27:54');
INSERT INTO `admin_operation_log` VALUES (541, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:54', '2019-01-16 15:27:54');
INSERT INTO `admin_operation_log` VALUES (542, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:55', '2019-01-16 15:27:55');
INSERT INTO `admin_operation_log` VALUES (543, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:55', '2019-01-16 15:27:55');
INSERT INTO `admin_operation_log` VALUES (544, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:27:56', '2019-01-16 15:27:56');
INSERT INTO `admin_operation_log` VALUES (545, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:27:59', '2019-01-16 15:27:59');
INSERT INTO `admin_operation_log` VALUES (546, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"2\",\"4\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:28:05', '2019-01-16 15:28:05');
INSERT INTO `admin_operation_log` VALUES (547, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:28:05', '2019-01-16 15:28:05');
INSERT INTO `admin_operation_log` VALUES (548, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:28:07', '2019-01-16 15:28:07');
INSERT INTO `admin_operation_log` VALUES (549, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:28:11', '2019-01-16 15:28:11');
INSERT INTO `admin_operation_log` VALUES (550, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:28:16', '2019-01-16 15:28:16');
INSERT INTO `admin_operation_log` VALUES (551, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:28:23', '2019-01-16 15:28:23');
INSERT INTO `admin_operation_log` VALUES (552, 1, 'admin/auth/permissions/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:28:31', '2019-01-16 15:28:31');
INSERT INTO `admin_operation_log` VALUES (553, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:30:59', '2019-01-16 15:30:59');
INSERT INTO `admin_operation_log` VALUES (554, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:31:02', '2019-01-16 15:31:02');
INSERT INTO `admin_operation_log` VALUES (555, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:31:54', '2019-01-16 15:31:54');
INSERT INTO `admin_operation_log` VALUES (556, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:31:56', '2019-01-16 15:31:56');
INSERT INTO `admin_operation_log` VALUES (557, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[null],\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-16 15:31:59', '2019-01-16 15:31:59');
INSERT INTO `admin_operation_log` VALUES (558, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-16 15:31:59', '2019-01-16 15:31:59');
INSERT INTO `admin_operation_log` VALUES (559, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:32:04', '2019-01-16 15:32:04');
INSERT INTO `admin_operation_log` VALUES (560, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:32:07', '2019-01-16 15:32:07');
INSERT INTO `admin_operation_log` VALUES (561, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:32:15', '2019-01-16 15:32:15');
INSERT INTO `admin_operation_log` VALUES (562, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:32:16', '2019-01-16 15:32:16');
INSERT INTO `admin_operation_log` VALUES (563, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:32:18', '2019-01-16 15:32:18');
INSERT INTO `admin_operation_log` VALUES (564, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:32:20', '2019-01-16 15:32:20');
INSERT INTO `admin_operation_log` VALUES (565, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:32:25', '2019-01-16 15:32:25');
INSERT INTO `admin_operation_log` VALUES (566, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:32:25', '2019-01-16 15:32:25');
INSERT INTO `admin_operation_log` VALUES (567, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:32:28', '2019-01-16 15:32:28');
INSERT INTO `admin_operation_log` VALUES (568, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:32:34', '2019-01-16 15:32:34');
INSERT INTO `admin_operation_log` VALUES (569, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:32:36', '2019-01-16 15:32:36');
INSERT INTO `admin_operation_log` VALUES (570, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:32:38', '2019-01-16 15:32:38');
INSERT INTO `admin_operation_log` VALUES (571, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:32:39', '2019-01-16 15:32:39');
INSERT INTO `admin_operation_log` VALUES (572, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:32:42', '2019-01-16 15:32:42');
INSERT INTO `admin_operation_log` VALUES (573, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:32:55', '2019-01-16 15:32:55');
INSERT INTO `admin_operation_log` VALUES (574, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:32:56', '2019-01-16 15:32:56');
INSERT INTO `admin_operation_log` VALUES (575, 1, 'admin/auth/permissions/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:33:00', '2019-01-16 15:33:00');
INSERT INTO `admin_operation_log` VALUES (576, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:33:07', '2019-01-16 15:33:07');
INSERT INTO `admin_operation_log` VALUES (577, 1, 'admin/auth/permissions/3', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 15:33:20', '2019-01-16 15:33:20');
INSERT INTO `admin_operation_log` VALUES (578, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:33:20', '2019-01-16 15:33:20');
INSERT INTO `admin_operation_log` VALUES (579, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:33:29', '2019-01-16 15:33:29');
INSERT INTO `admin_operation_log` VALUES (580, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:33:29', '2019-01-16 15:33:29');
INSERT INTO `admin_operation_log` VALUES (581, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:33:32', '2019-01-16 15:33:32');
INSERT INTO `admin_operation_log` VALUES (582, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-01-16 15:33:36', '2019-01-16 15:33:36');
INSERT INTO `admin_operation_log` VALUES (583, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-01-16 15:33:38', '2019-01-16 15:33:38');
INSERT INTO `admin_operation_log` VALUES (584, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:33:40', '2019-01-16 15:33:40');
INSERT INTO `admin_operation_log` VALUES (585, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:33:43', '2019-01-16 15:33:43');
INSERT INTO `admin_operation_log` VALUES (586, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:33:50', '2019-01-16 15:33:50');
INSERT INTO `admin_operation_log` VALUES (587, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:33:52', '2019-01-16 15:33:52');
INSERT INTO `admin_operation_log` VALUES (588, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:33:55', '2019-01-16 15:33:55');
INSERT INTO `admin_operation_log` VALUES (589, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:33:56', '2019-01-16 15:33:56');
INSERT INTO `admin_operation_log` VALUES (590, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:33:57', '2019-01-16 15:33:57');
INSERT INTO `admin_operation_log` VALUES (591, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:33:59', '2019-01-16 15:33:59');
INSERT INTO `admin_operation_log` VALUES (592, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[null],\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-16 15:34:02', '2019-01-16 15:34:02');
INSERT INTO `admin_operation_log` VALUES (593, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-16 15:34:03', '2019-01-16 15:34:03');
INSERT INTO `admin_operation_log` VALUES (594, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:34:10', '2019-01-16 15:34:10');
INSERT INTO `admin_operation_log` VALUES (595, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:34:12', '2019-01-16 15:34:12');
INSERT INTO `admin_operation_log` VALUES (596, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:34:24', '2019-01-16 15:34:24');
INSERT INTO `admin_operation_log` VALUES (597, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-16 15:34:34', '2019-01-16 15:34:34');
INSERT INTO `admin_operation_log` VALUES (598, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-16 15:34:35', '2019-01-16 15:34:35');
INSERT INTO `admin_operation_log` VALUES (599, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-01-16 15:34:43', '2019-01-16 15:34:43');
INSERT INTO `admin_operation_log` VALUES (600, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:34:45', '2019-01-16 15:34:45');
INSERT INTO `admin_operation_log` VALUES (601, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:34:47', '2019-01-16 15:34:47');
INSERT INTO `admin_operation_log` VALUES (602, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:34:49', '2019-01-16 15:34:49');
INSERT INTO `admin_operation_log` VALUES (603, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-01-16 15:34:51', '2019-01-16 15:34:51');
INSERT INTO `admin_operation_log` VALUES (604, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-01-16 15:34:54', '2019-01-16 15:34:54');
INSERT INTO `admin_operation_log` VALUES (605, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:34:58', '2019-01-16 15:34:58');
INSERT INTO `admin_operation_log` VALUES (606, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:35:00', '2019-01-16 15:35:00');
INSERT INTO `admin_operation_log` VALUES (607, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:35:05', '2019-01-16 15:35:05');
INSERT INTO `admin_operation_log` VALUES (608, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-16 15:35:10', '2019-01-16 15:35:10');
INSERT INTO `admin_operation_log` VALUES (609, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-16 15:35:10', '2019-01-16 15:35:10');
INSERT INTO `admin_operation_log` VALUES (610, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2019-01-16 15:35:13', '2019-01-16 15:35:13');
INSERT INTO `admin_operation_log` VALUES (611, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:35:17', '2019-01-16 15:35:17');
INSERT INTO `admin_operation_log` VALUES (612, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:35:25', '2019-01-16 15:35:25');
INSERT INTO `admin_operation_log` VALUES (613, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-16 15:35:31', '2019-01-16 15:35:31');
INSERT INTO `admin_operation_log` VALUES (614, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-16 15:35:31', '2019-01-16 15:35:31');
INSERT INTO `admin_operation_log` VALUES (615, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:35:40', '2019-01-16 15:35:40');
INSERT INTO `admin_operation_log` VALUES (616, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:35:48', '2019-01-16 15:35:48');
INSERT INTO `admin_operation_log` VALUES (617, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:35:51', '2019-01-16 15:35:51');
INSERT INTO `admin_operation_log` VALUES (618, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:35:53', '2019-01-16 15:35:53');
INSERT INTO `admin_operation_log` VALUES (619, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:36:09', '2019-01-16 15:36:09');
INSERT INTO `admin_operation_log` VALUES (620, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:36:10', '2019-01-16 15:36:10');
INSERT INTO `admin_operation_log` VALUES (621, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:36:13', '2019-01-16 15:36:13');
INSERT INTO `admin_operation_log` VALUES (622, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"auth.login\\/auth.logout\",\"name\":\"\\u767b\\u5f55\\u767b\\u51fa\",\"http_method\":[null],\"http_path\":\"auth\\/login\\r\\nauth\\/logout\",\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/permissions\"}', '2019-01-16 15:37:08', '2019-01-16 15:37:08');
INSERT INTO `admin_operation_log` VALUES (623, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-01-16 15:37:08', '2019-01-16 15:37:08');
INSERT INTO `admin_operation_log` VALUES (624, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:37:40', '2019-01-16 15:37:40');
INSERT INTO `admin_operation_log` VALUES (625, 1, 'admin/auth/permissions/7', 'PUT', '127.0.0.1', '{\"slug\":\"auth.login\\/auth.logout\",\"name\":\"\\u767b\\u5f55\\u767b\\u51fa\",\"http_method\":[null],\"http_path\":\"\\/auth\\/login\\r\\n\\/auth\\/logout\",\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/permissions\"}', '2019-01-16 15:37:45', '2019-01-16 15:37:45');
INSERT INTO `admin_operation_log` VALUES (626, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2019-01-16 15:37:45', '2019-01-16 15:37:45');
INSERT INTO `admin_operation_log` VALUES (627, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-01-16 15:37:54', '2019-01-16 15:37:54');
INSERT INTO `admin_operation_log` VALUES (628, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:38:01', '2019-01-16 15:38:01');
INSERT INTO `admin_operation_log` VALUES (629, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:38:02', '2019-01-16 15:38:02');
INSERT INTO `admin_operation_log` VALUES (630, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:38:04', '2019-01-16 15:38:04');
INSERT INTO `admin_operation_log` VALUES (631, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"7\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:38:23', '2019-01-16 15:38:23');
INSERT INTO `admin_operation_log` VALUES (632, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:38:23', '2019-01-16 15:38:23');
INSERT INTO `admin_operation_log` VALUES (633, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:38:30', '2019-01-16 15:38:30');
INSERT INTO `admin_operation_log` VALUES (634, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2019-01-16 15:38:34', '2019-01-16 15:38:34');
INSERT INTO `admin_operation_log` VALUES (635, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:38:48', '2019-01-16 15:38:48');
INSERT INTO `admin_operation_log` VALUES (636, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:38:58', '2019-01-16 15:38:58');
INSERT INTO `admin_operation_log` VALUES (637, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:39:00', '2019-01-16 15:39:00');
INSERT INTO `admin_operation_log` VALUES (638, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:39:34', '2019-01-16 15:39:34');
INSERT INTO `admin_operation_log` VALUES (639, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:42:00', '2019-01-16 15:42:00');
INSERT INTO `admin_operation_log` VALUES (640, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:43:16', '2019-01-16 15:43:16');
INSERT INTO `admin_operation_log` VALUES (641, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:43:28', '2019-01-16 15:43:28');
INSERT INTO `admin_operation_log` VALUES (642, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:43:36', '2019-01-16 15:43:36');
INSERT INTO `admin_operation_log` VALUES (643, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:43:37', '2019-01-16 15:43:37');
INSERT INTO `admin_operation_log` VALUES (644, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:43:41', '2019-01-16 15:43:41');
INSERT INTO `admin_operation_log` VALUES (645, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:43:42', '2019-01-16 15:43:42');
INSERT INTO `admin_operation_log` VALUES (646, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"\\u666e\\u901a\\u7528\\u6237\",\"name\":\"\\u666e\\u901a\\u7528\\u6237\",\"permissions\":[\"7\",\"4\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/roles\"}', '2019-01-16 15:43:46', '2019-01-16 15:43:46');
INSERT INTO `admin_operation_log` VALUES (647, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 15:43:46', '2019-01-16 15:43:46');
INSERT INTO `admin_operation_log` VALUES (648, 2, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-16 15:43:50', '2019-01-16 15:43:50');
INSERT INTO `admin_operation_log` VALUES (649, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:43:52', '2019-01-16 15:43:52');
INSERT INTO `admin_operation_log` VALUES (650, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:44:18', '2019-01-16 15:44:18');
INSERT INTO `admin_operation_log` VALUES (651, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:45:42', '2019-01-16 15:45:42');
INSERT INTO `admin_operation_log` VALUES (652, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:46:04', '2019-01-16 15:46:04');
INSERT INTO `admin_operation_log` VALUES (653, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-01-16 15:46:41', '2019-01-16 15:46:41');
INSERT INTO `admin_operation_log` VALUES (654, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2019-01-16 15:46:41', '2019-01-16 15:46:41');
INSERT INTO `admin_operation_log` VALUES (655, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-01-16 15:46:43', '2019-01-16 15:46:43');
INSERT INTO `admin_operation_log` VALUES (656, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-01-16 15:46:45', '2019-01-16 15:46:45');
INSERT INTO `admin_operation_log` VALUES (657, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:46:47', '2019-01-16 15:46:47');
INSERT INTO `admin_operation_log` VALUES (658, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-01-16 15:56:08', '2019-01-16 15:56:08');
INSERT INTO `admin_operation_log` VALUES (659, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-01-16 15:57:28', '2019-01-16 15:57:28');
INSERT INTO `admin_operation_log` VALUES (660, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2019-01-16 15:57:38', '2019-01-16 15:57:38');
INSERT INTO `admin_operation_log` VALUES (661, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}', '2019-01-16 15:57:46', '2019-01-16 15:57:46');
INSERT INTO `admin_operation_log` VALUES (662, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 16:01:11', '2019-01-16 16:01:11');
INSERT INTO `admin_operation_log` VALUES (663, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 16:01:13', '2019-01-16 16:01:13');
INSERT INTO `admin_operation_log` VALUES (664, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-16 16:38:58', '2019-01-16 16:38:58');
INSERT INTO `admin_operation_log` VALUES (665, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 16:58:28', '2019-01-16 16:58:28');
INSERT INTO `admin_operation_log` VALUES (666, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 16:59:58', '2019-01-16 16:59:58');
INSERT INTO `admin_operation_log` VALUES (667, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:00:18', '2019-01-16 17:00:18');
INSERT INTO `admin_operation_log` VALUES (668, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:00:22', '2019-01-16 17:00:22');
INSERT INTO `admin_operation_log` VALUES (669, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:00:39', '2019-01-16 17:00:39');
INSERT INTO `admin_operation_log` VALUES (670, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:01:54', '2019-01-16 17:01:54');
INSERT INTO `admin_operation_log` VALUES (671, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"\\u6df1\\u5733\\u4ec1\\u7231\\u533b\\u9662\",\"roles\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:04:38', '2019-01-16 17:04:38');
INSERT INTO `admin_operation_log` VALUES (672, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:04:39', '2019-01-16 17:04:39');
INSERT INTO `admin_operation_log` VALUES (673, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"\\u6df1\\u5733\\u4ec1\\u7231\\u533b\\u9662\",\"roles\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:05:15', '2019-01-16 17:05:15');
INSERT INTO `admin_operation_log` VALUES (674, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:05:16', '2019-01-16 17:05:16');
INSERT INTO `admin_operation_log` VALUES (675, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"\\u6df1\\u5733\\u4ec1\\u7231\\u533b\\u9662\",\"roles\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:11:35', '2019-01-16 17:11:35');
INSERT INTO `admin_operation_log` VALUES (676, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:11:35', '2019-01-16 17:11:35');
INSERT INTO `admin_operation_log` VALUES (677, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:12:38', '2019-01-16 17:12:38');
INSERT INTO `admin_operation_log` VALUES (678, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"\\u4ec1\\u7231\\u533b\\u9662\",\"roles\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:12:55', '2019-01-16 17:12:55');
INSERT INTO `admin_operation_log` VALUES (679, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:12:56', '2019-01-16 17:12:56');
INSERT INTO `admin_operation_log` VALUES (680, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"\\u4ec1\\u7231\\u533b\\u9662\",\"roles\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:13:57', '2019-01-16 17:13:57');
INSERT INTO `admin_operation_log` VALUES (681, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:13:58', '2019-01-16 17:13:58');
INSERT INTO `admin_operation_log` VALUES (682, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"\\u4ec1\\u7231\\u533b\\u9662\",\"roles\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:15:04', '2019-01-16 17:15:04');
INSERT INTO `admin_operation_log` VALUES (683, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:15:04', '2019-01-16 17:15:04');
INSERT INTO `admin_operation_log` VALUES (684, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"ddvdv\",\"roles\":[\"1\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:15:15', '2019-01-16 17:15:15');
INSERT INTO `admin_operation_log` VALUES (685, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:15:15', '2019-01-16 17:15:15');
INSERT INTO `admin_operation_log` VALUES (686, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:17:08', '2019-01-16 17:17:08');
INSERT INTO `admin_operation_log` VALUES (687, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"henry\",\"roles\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:17:17', '2019-01-16 17:17:17');
INSERT INTO `admin_operation_log` VALUES (688, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:17:18', '2019-01-16 17:17:18');
INSERT INTO `admin_operation_log` VALUES (689, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"henry\",\"roles\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:19:56', '2019-01-16 17:19:56');
INSERT INTO `admin_operation_log` VALUES (690, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:19:56', '2019-01-16 17:19:56');
INSERT INTO `admin_operation_log` VALUES (691, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"henry\",\"roles\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:20:26', '2019-01-16 17:20:26');
INSERT INTO `admin_operation_log` VALUES (692, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:20:27', '2019-01-16 17:20:27');
INSERT INTO `admin_operation_log` VALUES (693, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:21:17', '2019-01-16 17:21:17');
INSERT INTO `admin_operation_log` VALUES (694, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:21:20', '2019-01-16 17:21:20');
INSERT INTO `admin_operation_log` VALUES (695, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:21:28', '2019-01-16 17:21:28');
INSERT INTO `admin_operation_log` VALUES (696, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:21:34', '2019-01-16 17:21:34');
INSERT INTO `admin_operation_log` VALUES (697, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:21:37', '2019-01-16 17:21:37');
INSERT INTO `admin_operation_log` VALUES (698, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:21:40', '2019-01-16 17:21:40');
INSERT INTO `admin_operation_log` VALUES (699, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:21:43', '2019-01-16 17:21:43');
INSERT INTO `admin_operation_log` VALUES (700, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:21:44', '2019-01-16 17:21:44');
INSERT INTO `admin_operation_log` VALUES (701, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-16 17:22:19', '2019-01-16 17:22:19');
INSERT INTO `admin_operation_log` VALUES (702, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:23:09', '2019-01-16 17:23:09');
INSERT INTO `admin_operation_log` VALUES (703, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:23:12', '2019-01-16 17:23:12');
INSERT INTO `admin_operation_log` VALUES (704, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:23:15', '2019-01-16 17:23:15');
INSERT INTO `admin_operation_log` VALUES (705, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"10421421\",\"roles\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:23:20', '2019-01-16 17:23:20');
INSERT INTO `admin_operation_log` VALUES (706, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:23:21', '2019-01-16 17:23:21');
INSERT INTO `admin_operation_log` VALUES (707, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"10421421\",\"roles\":[\"2\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:27:14', '2019-01-16 17:27:14');
INSERT INTO `admin_operation_log` VALUES (708, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:27:15', '2019-01-16 17:27:15');
INSERT INTO `admin_operation_log` VALUES (709, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:30:18', '2019-01-16 17:30:18');
INSERT INTO `admin_operation_log` VALUES (710, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:30:27', '2019-01-16 17:30:27');
INSERT INTO `admin_operation_log` VALUES (711, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u533b\\u9662\\u7ba1\\u7406\",\"icon\":\"fa-hospital-o\",\"uri\":\"hospitals\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/menu\"}', '2019-01-16 17:30:41', '2019-01-16 17:30:41');
INSERT INTO `admin_operation_log` VALUES (712, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-16 17:30:42', '2019-01-16 17:30:42');
INSERT INTO `admin_operation_log` VALUES (713, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:30:50', '2019-01-16 17:30:50');
INSERT INTO `admin_operation_log` VALUES (714, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u533b\\u9662\\u7ba1\\u7406\",\"icon\":\"fa-hospital-o\",\"uri\":\"hospitals\",\"roles\":[\"2\",null],\"permission\":null,\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/menu\"}', '2019-01-16 17:31:00', '2019-01-16 17:31:00');
INSERT INTO `admin_operation_log` VALUES (715, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-16 17:31:00', '2019-01-16 17:31:00');
INSERT INTO `admin_operation_log` VALUES (716, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-16 17:31:04', '2019-01-16 17:31:04');
INSERT INTO `admin_operation_log` VALUES (717, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:31:08', '2019-01-16 17:31:08');
INSERT INTO `admin_operation_log` VALUES (718, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u533b\\u9662\\u7ba1\\u7406\",\"icon\":\"fa-hospital-o\",\"uri\":\"hospitals\",\"roles\":[null],\"permission\":null,\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/menu\"}', '2019-01-16 17:31:13', '2019-01-16 17:31:13');
INSERT INTO `admin_operation_log` VALUES (719, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-16 17:31:13', '2019-01-16 17:31:13');
INSERT INTO `admin_operation_log` VALUES (720, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:31:24', '2019-01-16 17:31:24');
INSERT INTO `admin_operation_log` VALUES (721, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"\\u6df1\\u5733\\u4ec1\\u7231\\u533b\\u9662\",\"roles\":[\"1\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:31:42', '2019-01-16 17:31:42');
INSERT INTO `admin_operation_log` VALUES (722, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:31:42', '2019-01-16 17:31:42');
INSERT INTO `admin_operation_log` VALUES (723, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:33:04', '2019-01-16 17:33:04');
INSERT INTO `admin_operation_log` VALUES (724, 1, 'admin/auth/menu/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:33:12', '2019-01-16 17:33:12');
INSERT INTO `admin_operation_log` VALUES (725, 1, 'admin/auth/menu/3/edit', 'GET', '127.0.0.1', '[]', '2019-01-16 17:33:24', '2019-01-16 17:33:24');
INSERT INTO `admin_operation_log` VALUES (726, 1, 'admin/auth/menu/3/edit', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:05', '2019-01-16 17:38:05');
INSERT INTO `admin_operation_log` VALUES (727, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:38:09', '2019-01-16 17:38:09');
INSERT INTO `admin_operation_log` VALUES (728, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"\\u6df1\\u5733\\u4ec1\\u7231\\u533b\\u9662\",\"roles\":[\"1\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:38:23', '2019-01-16 17:38:23');
INSERT INTO `admin_operation_log` VALUES (729, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:23', '2019-01-16 17:38:23');
INSERT INTO `admin_operation_log` VALUES (730, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:24', '2019-01-16 17:38:24');
INSERT INTO `admin_operation_log` VALUES (731, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:25', '2019-01-16 17:38:25');
INSERT INTO `admin_operation_log` VALUES (732, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:26', '2019-01-16 17:38:26');
INSERT INTO `admin_operation_log` VALUES (733, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:26', '2019-01-16 17:38:26');
INSERT INTO `admin_operation_log` VALUES (734, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:27', '2019-01-16 17:38:27');
INSERT INTO `admin_operation_log` VALUES (735, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:28', '2019-01-16 17:38:28');
INSERT INTO `admin_operation_log` VALUES (736, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:28', '2019-01-16 17:38:28');
INSERT INTO `admin_operation_log` VALUES (737, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:29', '2019-01-16 17:38:29');
INSERT INTO `admin_operation_log` VALUES (738, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:30', '2019-01-16 17:38:30');
INSERT INTO `admin_operation_log` VALUES (739, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:30', '2019-01-16 17:38:30');
INSERT INTO `admin_operation_log` VALUES (740, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:31', '2019-01-16 17:38:31');
INSERT INTO `admin_operation_log` VALUES (741, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:32', '2019-01-16 17:38:32');
INSERT INTO `admin_operation_log` VALUES (742, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:32', '2019-01-16 17:38:32');
INSERT INTO `admin_operation_log` VALUES (743, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:33', '2019-01-16 17:38:33');
INSERT INTO `admin_operation_log` VALUES (744, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:34', '2019-01-16 17:38:34');
INSERT INTO `admin_operation_log` VALUES (745, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:34', '2019-01-16 17:38:34');
INSERT INTO `admin_operation_log` VALUES (746, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:35', '2019-01-16 17:38:35');
INSERT INTO `admin_operation_log` VALUES (747, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:36', '2019-01-16 17:38:36');
INSERT INTO `admin_operation_log` VALUES (748, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:36', '2019-01-16 17:38:36');
INSERT INTO `admin_operation_log` VALUES (749, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"name\":\"\\u6df1\\u5733\\u4ec1\\u7231\\u533b\\u9662\",\"roles\":[\"1\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:38:46', '2019-01-16 17:38:46');
INSERT INTO `admin_operation_log` VALUES (750, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:47', '2019-01-16 17:38:47');
INSERT INTO `admin_operation_log` VALUES (751, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:47', '2019-01-16 17:38:47');
INSERT INTO `admin_operation_log` VALUES (752, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:48', '2019-01-16 17:38:48');
INSERT INTO `admin_operation_log` VALUES (753, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:49', '2019-01-16 17:38:49');
INSERT INTO `admin_operation_log` VALUES (754, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:49', '2019-01-16 17:38:49');
INSERT INTO `admin_operation_log` VALUES (755, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:50', '2019-01-16 17:38:50');
INSERT INTO `admin_operation_log` VALUES (756, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:51', '2019-01-16 17:38:51');
INSERT INTO `admin_operation_log` VALUES (757, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:51', '2019-01-16 17:38:51');
INSERT INTO `admin_operation_log` VALUES (758, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:52', '2019-01-16 17:38:52');
INSERT INTO `admin_operation_log` VALUES (759, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:53', '2019-01-16 17:38:53');
INSERT INTO `admin_operation_log` VALUES (760, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:53', '2019-01-16 17:38:53');
INSERT INTO `admin_operation_log` VALUES (761, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:54', '2019-01-16 17:38:54');
INSERT INTO `admin_operation_log` VALUES (762, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:55', '2019-01-16 17:38:55');
INSERT INTO `admin_operation_log` VALUES (763, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:56', '2019-01-16 17:38:56');
INSERT INTO `admin_operation_log` VALUES (764, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:56', '2019-01-16 17:38:56');
INSERT INTO `admin_operation_log` VALUES (765, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:57', '2019-01-16 17:38:57');
INSERT INTO `admin_operation_log` VALUES (766, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:58', '2019-01-16 17:38:58');
INSERT INTO `admin_operation_log` VALUES (767, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:58', '2019-01-16 17:38:58');
INSERT INTO `admin_operation_log` VALUES (768, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:38:59', '2019-01-16 17:38:59');
INSERT INTO `admin_operation_log` VALUES (769, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:39:00', '2019-01-16 17:39:00');
INSERT INTO `admin_operation_log` VALUES (770, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:39:56', '2019-01-16 17:39:56');
INSERT INTO `admin_operation_log` VALUES (771, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:44:51', '2019-01-16 17:44:51');
INSERT INTO `admin_operation_log` VALUES (772, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:45:08', '2019-01-16 17:45:08');
INSERT INTO `admin_operation_log` VALUES (773, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:45:20', '2019-01-16 17:45:20');
INSERT INTO `admin_operation_log` VALUES (774, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:45:41', '2019-01-16 17:45:41');
INSERT INTO `admin_operation_log` VALUES (775, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:46:34', '2019-01-16 17:46:34');
INSERT INTO `admin_operation_log` VALUES (776, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:46:46', '2019-01-16 17:46:46');
INSERT INTO `admin_operation_log` VALUES (777, 1, 'admin/hospitals/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:46:49', '2019-01-16 17:46:49');
INSERT INTO `admin_operation_log` VALUES (778, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:46:50', '2019-01-16 17:46:50');
INSERT INTO `admin_operation_log` VALUES (779, 1, 'admin/hospitals/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:46:59', '2019-01-16 17:46:59');
INSERT INTO `admin_operation_log` VALUES (780, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:46:59', '2019-01-16 17:46:59');
INSERT INTO `admin_operation_log` VALUES (781, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:49:35', '2019-01-16 17:49:35');
INSERT INTO `admin_operation_log` VALUES (782, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:49:52', '2019-01-16 17:49:52');
INSERT INTO `admin_operation_log` VALUES (783, 1, 'admin/hospitals/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:49:55', '2019-01-16 17:49:55');
INSERT INTO `admin_operation_log` VALUES (784, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:50:14', '2019-01-16 17:50:14');
INSERT INTO `admin_operation_log` VALUES (785, 1, 'admin/hospitals/1', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:50:22', '2019-01-16 17:50:22');
INSERT INTO `admin_operation_log` VALUES (786, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:50:22', '2019-01-16 17:50:22');
INSERT INTO `admin_operation_log` VALUES (787, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 17:50:25', '2019-01-16 17:50:25');
INSERT INTO `admin_operation_log` VALUES (788, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u533b\\u9662\\u7ba1\\u7406\",\"roles\":[\"1\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 17:50:30', '2019-01-16 17:50:30');
INSERT INTO `admin_operation_log` VALUES (789, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 17:50:31', '2019-01-16 17:50:31');
INSERT INTO `admin_operation_log` VALUES (790, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:13:51', '2019-01-16 18:13:51');
INSERT INTO `admin_operation_log` VALUES (791, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:14:00', '2019-01-16 18:14:00');
INSERT INTO `admin_operation_log` VALUES (792, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:14:07', '2019-01-16 18:14:07');
INSERT INTO `admin_operation_log` VALUES (793, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:14:13', '2019-01-16 18:14:13');
INSERT INTO `admin_operation_log` VALUES (794, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-16 18:19:14', '2019-01-16 18:19:14');
INSERT INTO `admin_operation_log` VALUES (795, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 18:27:51', '2019-01-16 18:27:51');
INSERT INTO `admin_operation_log` VALUES (796, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6df1\\u5733\\u4ec1\\u7231\\u533b\\u9662\",\"roles\":[\"1\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 18:28:11', '2019-01-16 18:28:11');
INSERT INTO `admin_operation_log` VALUES (797, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 18:28:11', '2019-01-16 18:28:11');
INSERT INTO `admin_operation_log` VALUES (798, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 18:29:40', '2019-01-16 18:29:40');
INSERT INTO `admin_operation_log` VALUES (799, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6df1\\u5733\\u4ec1\\u7231\\u533b\\u9662\",\"roles\":[\"1\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 18:29:52', '2019-01-16 18:29:52');
INSERT INTO `admin_operation_log` VALUES (800, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 18:29:52', '2019-01-16 18:29:52');
INSERT INTO `admin_operation_log` VALUES (801, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:30:05', '2019-01-16 18:30:05');
INSERT INTO `admin_operation_log` VALUES (802, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:30:45', '2019-01-16 18:30:45');
INSERT INTO `admin_operation_log` VALUES (803, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u5987\\u79d1\",\"roles\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 18:31:33', '2019-01-16 18:31:33');
INSERT INTO `admin_operation_log` VALUES (804, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 18:31:33', '2019-01-16 18:31:33');
INSERT INTO `admin_operation_log` VALUES (805, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u4ea7\\u79d1\",\"roles\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 18:31:42', '2019-01-16 18:31:42');
INSERT INTO `admin_operation_log` VALUES (806, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 18:31:42', '2019-01-16 18:31:42');
INSERT INTO `admin_operation_log` VALUES (807, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u540e\\u52e4\",\"roles\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 18:32:02', '2019-01-16 18:32:02');
INSERT INTO `admin_operation_log` VALUES (808, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 18:32:02', '2019-01-16 18:32:02');
INSERT INTO `admin_operation_log` VALUES (809, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_order\":\"[{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":5},{\\\"id\\\":4}]}]\"}', '2019-01-16 18:32:10', '2019-01-16 18:32:10');
INSERT INTO `admin_operation_log` VALUES (810, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:32:10', '2019-01-16 18:32:10');
INSERT INTO `admin_operation_log` VALUES (811, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:32:14', '2019-01-16 18:32:14');
INSERT INTO `admin_operation_log` VALUES (812, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5b81\\u6ce2\\u911e\\u5dde\\u65b0\\u4e1c\\u65b9\\u533b\\u9662\",\"roles\":[\"1\",null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 18:33:08', '2019-01-16 18:33:08');
INSERT INTO `admin_operation_log` VALUES (813, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 18:33:08', '2019-01-16 18:33:08');
INSERT INTO `admin_operation_log` VALUES (814, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7537\\u79d1\",\"roles\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 18:35:48', '2019-01-16 18:35:48');
INSERT INTO `admin_operation_log` VALUES (815, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 18:35:48', '2019-01-16 18:35:48');
INSERT INTO `admin_operation_log` VALUES (816, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"6\",\"title\":\"\\u5987\\u79d1\",\"roles\":[null],\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\"}', '2019-01-16 18:36:06', '2019-01-16 18:36:06');
INSERT INTO `admin_operation_log` VALUES (817, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 18:36:06', '2019-01-16 18:36:06');
INSERT INTO `admin_operation_log` VALUES (818, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_order\":\"[{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":5},{\\\"id\\\":4}]},{\\\"id\\\":6,\\\"children\\\":[{\\\"id\\\":7},{\\\"id\\\":8}]}]\"}', '2019-01-16 18:36:13', '2019-01-16 18:36:13');
INSERT INTO `admin_operation_log` VALUES (819, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:36:14', '2019-01-16 18:36:14');
INSERT INTO `admin_operation_log` VALUES (820, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:36:44', '2019-01-16 18:36:44');
INSERT INTO `admin_operation_log` VALUES (821, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:36:46', '2019-01-16 18:36:46');
INSERT INTO `admin_operation_log` VALUES (822, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:36:48', '2019-01-16 18:36:48');
INSERT INTO `admin_operation_log` VALUES (823, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:36:49', '2019-01-16 18:36:49');
INSERT INTO `admin_operation_log` VALUES (824, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:39:00', '2019-01-16 18:39:00');
INSERT INTO `admin_operation_log` VALUES (825, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:39:02', '2019-01-16 18:39:02');
INSERT INTO `admin_operation_log` VALUES (826, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:39:05', '2019-01-16 18:39:05');
INSERT INTO `admin_operation_log` VALUES (827, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:39:08', '2019-01-16 18:39:08');
INSERT INTO `admin_operation_log` VALUES (828, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:39:38', '2019-01-16 18:39:38');
INSERT INTO `admin_operation_log` VALUES (829, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:39:48', '2019-01-16 18:39:48');
INSERT INTO `admin_operation_log` VALUES (830, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:39:50', '2019-01-16 18:39:50');
INSERT INTO `admin_operation_log` VALUES (831, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:39:57', '2019-01-16 18:39:57');
INSERT INTO `admin_operation_log` VALUES (832, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:40:12', '2019-01-16 18:40:12');
INSERT INTO `admin_operation_log` VALUES (833, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-16 18:45:31', '2019-01-16 18:45:31');
INSERT INTO `admin_operation_log` VALUES (834, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:45:34', '2019-01-16 18:45:34');
INSERT INTO `admin_operation_log` VALUES (835, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:45:44', '2019-01-16 18:45:44');
INSERT INTO `admin_operation_log` VALUES (836, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:46:33', '2019-01-16 18:46:33');
INSERT INTO `admin_operation_log` VALUES (837, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:46:35', '2019-01-16 18:46:35');
INSERT INTO `admin_operation_log` VALUES (838, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:46:56', '2019-01-16 18:46:56');
INSERT INTO `admin_operation_log` VALUES (839, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:46:58', '2019-01-16 18:46:58');
INSERT INTO `admin_operation_log` VALUES (840, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:47:04', '2019-01-16 18:47:04');
INSERT INTO `admin_operation_log` VALUES (841, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:47:10', '2019-01-16 18:47:10');
INSERT INTO `admin_operation_log` VALUES (842, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:47:17', '2019-01-16 18:47:17');
INSERT INTO `admin_operation_log` VALUES (843, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:47:18', '2019-01-16 18:47:18');
INSERT INTO `admin_operation_log` VALUES (844, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 18:47:19', '2019-01-16 18:47:19');
INSERT INTO `admin_operation_log` VALUES (845, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:15:39', '2019-01-16 19:15:39');
INSERT INTO `admin_operation_log` VALUES (846, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:15:40', '2019-01-16 19:15:40');
INSERT INTO `admin_operation_log` VALUES (847, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:15:43', '2019-01-16 19:15:43');
INSERT INTO `admin_operation_log` VALUES (848, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:15:44', '2019-01-16 19:15:44');
INSERT INTO `admin_operation_log` VALUES (849, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-16 19:30:26', '2019-01-16 19:30:26');
INSERT INTO `admin_operation_log` VALUES (850, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:30:31', '2019-01-16 19:30:31');
INSERT INTO `admin_operation_log` VALUES (851, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:31:01', '2019-01-16 19:31:01');
INSERT INTO `admin_operation_log` VALUES (852, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:31:15', '2019-01-16 19:31:15');
INSERT INTO `admin_operation_log` VALUES (853, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:31:48', '2019-01-16 19:31:48');
INSERT INTO `admin_operation_log` VALUES (854, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:32:22', '2019-01-16 19:32:22');
INSERT INTO `admin_operation_log` VALUES (855, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:32:58', '2019-01-16 19:32:58');
INSERT INTO `admin_operation_log` VALUES (856, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:33:29', '2019-01-16 19:33:29');
INSERT INTO `admin_operation_log` VALUES (857, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:33:32', '2019-01-16 19:33:32');
INSERT INTO `admin_operation_log` VALUES (858, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:35:17', '2019-01-16 19:35:17');
INSERT INTO `admin_operation_log` VALUES (859, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:35:19', '2019-01-16 19:35:19');
INSERT INTO `admin_operation_log` VALUES (860, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:35:21', '2019-01-16 19:35:21');
INSERT INTO `admin_operation_log` VALUES (861, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:35:22', '2019-01-16 19:35:22');
INSERT INTO `admin_operation_log` VALUES (862, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:35:35', '2019-01-16 19:35:35');
INSERT INTO `admin_operation_log` VALUES (863, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:35:37', '2019-01-16 19:35:37');
INSERT INTO `admin_operation_log` VALUES (864, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:36:00', '2019-01-16 19:36:00');
INSERT INTO `admin_operation_log` VALUES (865, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_order\":\"[{\\\"id\\\":6,\\\"children\\\":[{\\\"id\\\":7},{\\\"id\\\":8}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":5},{\\\"id\\\":4}]}]\"}', '2019-01-16 19:36:26', '2019-01-16 19:36:26');
INSERT INTO `admin_operation_log` VALUES (866, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:36:26', '2019-01-16 19:36:26');
INSERT INTO `admin_operation_log` VALUES (867, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_order\":\"[{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":5},{\\\"id\\\":4}]},{\\\"id\\\":6,\\\"children\\\":[{\\\"id\\\":7},{\\\"id\\\":8}]}]\"}', '2019-01-16 19:36:34', '2019-01-16 19:36:34');
INSERT INTO `admin_operation_log` VALUES (868, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:36:35', '2019-01-16 19:36:35');
INSERT INTO `admin_operation_log` VALUES (869, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:37:18', '2019-01-16 19:37:18');
INSERT INTO `admin_operation_log` VALUES (870, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:37:35', '2019-01-16 19:37:35');
INSERT INTO `admin_operation_log` VALUES (871, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-16 19:38:04', '2019-01-16 19:38:04');
INSERT INTO `admin_operation_log` VALUES (872, 1, 'admin/hospitals/2', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6df1\\u5733\\u4ec1\\u7231\\u533b\\u9662\",\"roles\":[\"1\",null],\"is_show\":\"off\",\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\"}', '2019-01-16 19:38:15', '2019-01-16 19:38:15');
INSERT INTO `admin_operation_log` VALUES (873, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:38:16', '2019-01-16 19:38:16');
INSERT INTO `admin_operation_log` VALUES (874, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:38:21', '2019-01-16 19:38:21');
INSERT INTO `admin_operation_log` VALUES (875, 1, 'admin/hospitals/2', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6df1\\u5733\\u4ec1\\u7231\\u533b\\u9662\",\"roles\":[\"1\",null],\"is_show\":\"on\",\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/hospitals\"}', '2019-01-16 19:38:24', '2019-01-16 19:38:24');
INSERT INTO `admin_operation_log` VALUES (876, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:38:25', '2019-01-16 19:38:25');
INSERT INTO `admin_operation_log` VALUES (877, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:38:27', '2019-01-16 19:38:27');
INSERT INTO `admin_operation_log` VALUES (878, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:38:32', '2019-01-16 19:38:32');
INSERT INTO `admin_operation_log` VALUES (879, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:41:33', '2019-01-16 19:41:33');
INSERT INTO `admin_operation_log` VALUES (880, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:41:48', '2019-01-16 19:41:48');
INSERT INTO `admin_operation_log` VALUES (881, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:41:55', '2019-01-16 19:41:55');
INSERT INTO `admin_operation_log` VALUES (882, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-16 19:42:43', '2019-01-16 19:42:43');
INSERT INTO `admin_operation_log` VALUES (883, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:42:47', '2019-01-16 19:42:47');
INSERT INTO `admin_operation_log` VALUES (884, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:45:55', '2019-01-16 19:45:55');
INSERT INTO `admin_operation_log` VALUES (885, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:47:12', '2019-01-16 19:47:12');
INSERT INTO `admin_operation_log` VALUES (886, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:48:11', '2019-01-16 19:48:11');
INSERT INTO `admin_operation_log` VALUES (887, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:49:01', '2019-01-16 19:49:01');
INSERT INTO `admin_operation_log` VALUES (888, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:49:52', '2019-01-16 19:49:52');
INSERT INTO `admin_operation_log` VALUES (889, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:50:03', '2019-01-16 19:50:03');
INSERT INTO `admin_operation_log` VALUES (890, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:50:37', '2019-01-16 19:50:37');
INSERT INTO `admin_operation_log` VALUES (891, 1, 'admin/hospitals/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:50:40', '2019-01-16 19:50:40');
INSERT INTO `admin_operation_log` VALUES (892, 1, 'admin/hospitals/3', 'PUT', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u5987\\u79d1\",\"roles\":[null],\"is_show\":\"off\",\"_token\":\"NeKzmdnE3hG3WM0P0H2IPMj4I4yNhn0VpzWG10tD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/hospitals\"}', '2019-01-16 19:50:43', '2019-01-16 19:50:43');
INSERT INTO `admin_operation_log` VALUES (893, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-16 19:50:43', '2019-01-16 19:50:43');
INSERT INTO `admin_operation_log` VALUES (894, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:50:57', '2019-01-16 19:50:57');
INSERT INTO `admin_operation_log` VALUES (895, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:51:02', '2019-01-16 19:51:02');
INSERT INTO `admin_operation_log` VALUES (896, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:51:04', '2019-01-16 19:51:04');
INSERT INTO `admin_operation_log` VALUES (897, 1, 'admin/hospitals/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:51:07', '2019-01-16 19:51:07');
INSERT INTO `admin_operation_log` VALUES (898, 1, 'admin/hospitals/5', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:51:09', '2019-01-16 19:51:09');
INSERT INTO `admin_operation_log` VALUES (899, 1, 'admin/hospitals/5/edit', 'GET', '127.0.0.1', '[]', '2019-01-16 19:51:09', '2019-01-16 19:51:09');
INSERT INTO `admin_operation_log` VALUES (900, 1, 'admin/hospitals/5', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:51:58', '2019-01-16 19:51:58');
INSERT INTO `admin_operation_log` VALUES (901, 1, 'admin/hospitals/5', 'GET', '127.0.0.1', '[]', '2019-01-16 19:53:58', '2019-01-16 19:53:58');
INSERT INTO `admin_operation_log` VALUES (902, 1, 'admin/hospitals/5', 'GET', '127.0.0.1', '[]', '2019-01-16 19:55:18', '2019-01-16 19:55:18');
INSERT INTO `admin_operation_log` VALUES (903, 1, 'admin/hospitals/5/edit', 'GET', '127.0.0.1', '[]', '2019-01-16 19:55:18', '2019-01-16 19:55:18');
INSERT INTO `admin_operation_log` VALUES (904, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:55:24', '2019-01-16 19:55:24');
INSERT INTO `admin_operation_log` VALUES (905, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:55:28', '2019-01-16 19:55:28');
INSERT INTO `admin_operation_log` VALUES (906, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:55:30', '2019-01-16 19:55:30');
INSERT INTO `admin_operation_log` VALUES (907, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:55:33', '2019-01-16 19:55:33');
INSERT INTO `admin_operation_log` VALUES (908, 1, 'admin/hospitals/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:55:35', '2019-01-16 19:55:35');
INSERT INTO `admin_operation_log` VALUES (909, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-16 19:55:36', '2019-01-16 19:55:36');
INSERT INTO `admin_operation_log` VALUES (910, 1, 'admin/hospitals/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:55:39', '2019-01-16 19:55:39');
INSERT INTO `admin_operation_log` VALUES (911, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-16 19:55:39', '2019-01-16 19:55:39');
INSERT INTO `admin_operation_log` VALUES (912, 1, 'admin/hospitals/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:55:47', '2019-01-16 19:55:47');
INSERT INTO `admin_operation_log` VALUES (913, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-16 19:55:47', '2019-01-16 19:55:47');
INSERT INTO `admin_operation_log` VALUES (914, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-16 19:57:48', '2019-01-16 19:57:48');
INSERT INTO `admin_operation_log` VALUES (915, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:57:52', '2019-01-16 19:57:52');
INSERT INTO `admin_operation_log` VALUES (916, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:57:54', '2019-01-16 19:57:54');
INSERT INTO `admin_operation_log` VALUES (917, 1, 'admin/hospitals/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:57:55', '2019-01-16 19:57:55');
INSERT INTO `admin_operation_log` VALUES (918, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-16 19:57:56', '2019-01-16 19:57:56');
INSERT INTO `admin_operation_log` VALUES (919, 1, 'admin/hospitals/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:57:59', '2019-01-16 19:57:59');
INSERT INTO `admin_operation_log` VALUES (920, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-16 19:57:59', '2019-01-16 19:57:59');
INSERT INTO `admin_operation_log` VALUES (921, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:58:57', '2019-01-16 19:58:57');
INSERT INTO `admin_operation_log` VALUES (922, 1, 'admin/hospitals/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:58:58', '2019-01-16 19:58:58');
INSERT INTO `admin_operation_log` VALUES (923, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:59:32', '2019-01-16 19:59:32');
INSERT INTO `admin_operation_log` VALUES (924, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:59:34', '2019-01-16 19:59:34');
INSERT INTO `admin_operation_log` VALUES (925, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-16 19:59:37', '2019-01-16 19:59:37');
INSERT INTO `admin_operation_log` VALUES (926, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-17 08:16:00', '2019-01-17 08:16:00');
INSERT INTO `admin_operation_log` VALUES (927, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 08:45:33', '2019-01-17 08:45:33');
INSERT INTO `admin_operation_log` VALUES (928, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-17 12:22:39', '2019-01-17 12:22:39');
INSERT INTO `admin_operation_log` VALUES (929, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 12:22:49', '2019-01-17 12:22:49');
INSERT INTO `admin_operation_log` VALUES (930, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 12:23:07', '2019-01-17 12:23:07');
INSERT INTO `admin_operation_log` VALUES (931, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 12:23:08', '2019-01-17 12:23:08');
INSERT INTO `admin_operation_log` VALUES (932, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 12:23:41', '2019-01-17 12:23:41');
INSERT INTO `admin_operation_log` VALUES (933, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 12:23:43', '2019-01-17 12:23:43');
INSERT INTO `admin_operation_log` VALUES (934, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 12:24:20', '2019-01-17 12:24:20');
INSERT INTO `admin_operation_log` VALUES (935, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 12:24:23', '2019-01-17 12:24:23');
INSERT INTO `admin_operation_log` VALUES (936, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 12:24:27', '2019-01-17 12:24:27');
INSERT INTO `admin_operation_log` VALUES (937, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 12:24:50', '2019-01-17 12:24:50');
INSERT INTO `admin_operation_log` VALUES (938, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 12:25:10', '2019-01-17 12:25:10');
INSERT INTO `admin_operation_log` VALUES (939, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 12:25:15', '2019-01-17 12:25:15');
INSERT INTO `admin_operation_log` VALUES (940, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:06:54', '2019-01-17 14:06:54');
INSERT INTO `admin_operation_log` VALUES (941, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:06:55', '2019-01-17 14:06:55');
INSERT INTO `admin_operation_log` VALUES (942, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:07:02', '2019-01-17 14:07:02');
INSERT INTO `admin_operation_log` VALUES (943, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:07:19', '2019-01-17 14:07:19');
INSERT INTO `admin_operation_log` VALUES (944, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:07:21', '2019-01-17 14:07:21');
INSERT INTO `admin_operation_log` VALUES (945, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:07:22', '2019-01-17 14:07:22');
INSERT INTO `admin_operation_log` VALUES (946, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:07:23', '2019-01-17 14:07:23');
INSERT INTO `admin_operation_log` VALUES (947, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:07:33', '2019-01-17 14:07:33');
INSERT INTO `admin_operation_log` VALUES (948, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:21:46', '2019-01-17 14:21:46');
INSERT INTO `admin_operation_log` VALUES (949, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:22:17', '2019-01-17 14:22:17');
INSERT INTO `admin_operation_log` VALUES (950, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:22:48', '2019-01-17 14:22:48');
INSERT INTO `admin_operation_log` VALUES (951, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:25:13', '2019-01-17 14:25:13');
INSERT INTO `admin_operation_log` VALUES (952, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:25:17', '2019-01-17 14:25:17');
INSERT INTO `admin_operation_log` VALUES (953, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:25:19', '2019-01-17 14:25:19');
INSERT INTO `admin_operation_log` VALUES (954, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:25:21', '2019-01-17 14:25:21');
INSERT INTO `admin_operation_log` VALUES (955, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:25:23', '2019-01-17 14:25:23');
INSERT INTO `admin_operation_log` VALUES (956, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:25:31', '2019-01-17 14:25:31');
INSERT INTO `admin_operation_log` VALUES (957, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:25:35', '2019-01-17 14:25:35');
INSERT INTO `admin_operation_log` VALUES (958, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:25:37', '2019-01-17 14:25:37');
INSERT INTO `admin_operation_log` VALUES (959, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:25:39', '2019-01-17 14:25:39');
INSERT INTO `admin_operation_log` VALUES (960, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:25:42', '2019-01-17 14:25:42');
INSERT INTO `admin_operation_log` VALUES (961, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:25:44', '2019-01-17 14:25:44');
INSERT INTO `admin_operation_log` VALUES (962, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:26:41', '2019-01-17 14:26:41');
INSERT INTO `admin_operation_log` VALUES (963, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-17 14:45:58', '2019-01-17 14:45:58');
INSERT INTO `admin_operation_log` VALUES (964, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:46:03', '2019-01-17 14:46:03');
INSERT INTO `admin_operation_log` VALUES (965, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-17 14:46:07', '2019-01-17 14:46:07');
INSERT INTO `admin_operation_log` VALUES (966, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:48:45', '2019-01-17 14:48:45');
INSERT INTO `admin_operation_log` VALUES (967, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-17 14:51:38', '2019-01-17 14:51:38');
INSERT INTO `admin_operation_log` VALUES (968, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:51:41', '2019-01-17 14:51:41');
INSERT INTO `admin_operation_log` VALUES (969, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:51:42', '2019-01-17 14:51:42');
INSERT INTO `admin_operation_log` VALUES (970, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 14:51:44', '2019-01-17 14:51:44');
INSERT INTO `admin_operation_log` VALUES (971, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-17 14:52:18', '2019-01-17 14:52:18');
INSERT INTO `admin_operation_log` VALUES (972, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-17 14:53:11', '2019-01-17 14:53:11');
INSERT INTO `admin_operation_log` VALUES (973, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-17 14:53:13', '2019-01-17 14:53:13');
INSERT INTO `admin_operation_log` VALUES (974, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-17 15:06:51', '2019-01-17 15:06:51');
INSERT INTO `admin_operation_log` VALUES (975, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-17 15:15:39', '2019-01-17 15:15:39');
INSERT INTO `admin_operation_log` VALUES (976, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-17 15:16:00', '2019-01-17 15:16:00');
INSERT INTO `admin_operation_log` VALUES (977, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-17 15:22:05', '2019-01-17 15:22:05');
INSERT INTO `admin_operation_log` VALUES (978, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-17 15:23:30', '2019-01-17 15:23:30');
INSERT INTO `admin_operation_log` VALUES (979, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 15:23:32', '2019-01-17 15:23:32');
INSERT INTO `admin_operation_log` VALUES (980, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-17 15:23:34', '2019-01-17 15:23:34');
INSERT INTO `admin_operation_log` VALUES (981, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-21 08:25:32', '2019-01-21 08:25:32');
INSERT INTO `admin_operation_log` VALUES (982, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 08:25:37', '2019-01-21 08:25:37');
INSERT INTO `admin_operation_log` VALUES (983, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 08:25:42', '2019-01-21 08:25:42');
INSERT INTO `admin_operation_log` VALUES (984, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 08:25:44', '2019-01-21 08:25:44');
INSERT INTO `admin_operation_log` VALUES (985, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 08:25:46', '2019-01-21 08:25:46');
INSERT INTO `admin_operation_log` VALUES (986, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 08:25:48', '2019-01-21 08:25:48');
INSERT INTO `admin_operation_log` VALUES (987, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 08:25:51', '2019-01-21 08:25:51');
INSERT INTO `admin_operation_log` VALUES (988, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 09:03:36', '2019-01-21 09:03:36');
INSERT INTO `admin_operation_log` VALUES (989, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 09:03:40', '2019-01-21 09:03:40');
INSERT INTO `admin_operation_log` VALUES (990, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 09:03:42', '2019-01-21 09:03:42');
INSERT INTO `admin_operation_log` VALUES (991, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-21 09:04:15', '2019-01-21 09:04:15');
INSERT INTO `admin_operation_log` VALUES (992, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-21 09:04:25', '2019-01-21 09:04:25');
INSERT INTO `admin_operation_log` VALUES (993, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 09:25:58', '2019-01-21 09:25:58');
INSERT INTO `admin_operation_log` VALUES (994, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 09:26:25', '2019-01-21 09:26:25');
INSERT INTO `admin_operation_log` VALUES (995, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 09:26:30', '2019-01-21 09:26:30');
INSERT INTO `admin_operation_log` VALUES (996, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-21 09:26:36', '2019-01-21 09:26:36');
INSERT INTO `admin_operation_log` VALUES (997, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 09:26:40', '2019-01-21 09:26:40');
INSERT INTO `admin_operation_log` VALUES (998, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 09:26:42', '2019-01-21 09:26:42');
INSERT INTO `admin_operation_log` VALUES (999, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 09:26:57', '2019-01-21 09:26:57');
INSERT INTO `admin_operation_log` VALUES (1000, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 09:27:00', '2019-01-21 09:27:00');
INSERT INTO `admin_operation_log` VALUES (1001, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-21 14:09:38', '2019-01-21 14:09:38');
INSERT INTO `admin_operation_log` VALUES (1002, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:14:02', '2019-01-21 14:14:02');
INSERT INTO `admin_operation_log` VALUES (1003, 1, 'admin/auth/roles/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:14:06', '2019-01-21 14:14:06');
INSERT INTO `admin_operation_log` VALUES (1004, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:14:11', '2019-01-21 14:14:11');
INSERT INTO `admin_operation_log` VALUES (1005, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:15:24', '2019-01-21 14:15:24');
INSERT INTO `admin_operation_log` VALUES (1006, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 14:17:11', '2019-01-21 14:17:11');
INSERT INTO `admin_operation_log` VALUES (1007, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 14:18:09', '2019-01-21 14:18:09');
INSERT INTO `admin_operation_log` VALUES (1008, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 14:19:31', '2019-01-21 14:19:31');
INSERT INTO `admin_operation_log` VALUES (1009, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 14:20:26', '2019-01-21 14:20:26');
INSERT INTO `admin_operation_log` VALUES (1010, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:20:28', '2019-01-21 14:20:28');
INSERT INTO `admin_operation_log` VALUES (1011, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:20:29', '2019-01-21 14:20:29');
INSERT INTO `admin_operation_log` VALUES (1012, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:20:33', '2019-01-21 14:20:33');
INSERT INTO `admin_operation_log` VALUES (1013, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:20:41', '2019-01-21 14:20:41');
INSERT INTO `admin_operation_log` VALUES (1014, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:20:42', '2019-01-21 14:20:42');
INSERT INTO `admin_operation_log` VALUES (1015, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:25:40', '2019-01-21 14:25:40');
INSERT INTO `admin_operation_log` VALUES (1016, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:25:41', '2019-01-21 14:25:41');
INSERT INTO `admin_operation_log` VALUES (1017, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:28:10', '2019-01-21 14:28:10');
INSERT INTO `admin_operation_log` VALUES (1018, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:30:37', '2019-01-21 14:30:37');
INSERT INTO `admin_operation_log` VALUES (1019, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:30:42', '2019-01-21 14:30:42');
INSERT INTO `admin_operation_log` VALUES (1020, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 14:32:51', '2019-01-21 14:32:51');
INSERT INTO `admin_operation_log` VALUES (1021, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 14:34:05', '2019-01-21 14:34:05');
INSERT INTO `admin_operation_log` VALUES (1022, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 14:34:21', '2019-01-21 14:34:21');
INSERT INTO `admin_operation_log` VALUES (1023, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 14:34:59', '2019-01-21 14:34:59');
INSERT INTO `admin_operation_log` VALUES (1024, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 14:36:51', '2019-01-21 14:36:51');
INSERT INTO `admin_operation_log` VALUES (1025, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 14:37:05', '2019-01-21 14:37:05');
INSERT INTO `admin_operation_log` VALUES (1026, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 14:37:25', '2019-01-21 14:37:25');
INSERT INTO `admin_operation_log` VALUES (1027, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 14:37:49', '2019-01-21 14:37:49');
INSERT INTO `admin_operation_log` VALUES (1028, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2019-01-21 14:37:53', '2019-01-21 14:37:53');
INSERT INTO `admin_operation_log` VALUES (1029, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:38:27', '2019-01-21 14:38:27');
INSERT INTO `admin_operation_log` VALUES (1030, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '[]', '2019-01-21 14:38:27', '2019-01-21 14:38:27');
INSERT INTO `admin_operation_log` VALUES (1031, 1, 'admin/auth/roles/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:38:30', '2019-01-21 14:38:30');
INSERT INTO `admin_operation_log` VALUES (1032, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:38:33', '2019-01-21 14:38:33');
INSERT INTO `admin_operation_log` VALUES (1033, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:38:38', '2019-01-21 14:38:38');
INSERT INTO `admin_operation_log` VALUES (1034, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:38:56', '2019-01-21 14:38:56');
INSERT INTO `admin_operation_log` VALUES (1035, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:39:03', '2019-01-21 14:39:03');
INSERT INTO `admin_operation_log` VALUES (1036, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:41:50', '2019-01-21 14:41:50');
INSERT INTO `admin_operation_log` VALUES (1037, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:41:55', '2019-01-21 14:41:55');
INSERT INTO `admin_operation_log` VALUES (1038, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:41:58', '2019-01-21 14:41:58');
INSERT INTO `admin_operation_log` VALUES (1039, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:42:56', '2019-01-21 14:42:56');
INSERT INTO `admin_operation_log` VALUES (1040, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 14:42:58', '2019-01-21 14:42:58');
INSERT INTO `admin_operation_log` VALUES (1041, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 14:42:58', '2019-01-21 14:42:58');
INSERT INTO `admin_operation_log` VALUES (1042, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:06:20', '2019-01-21 15:06:20');
INSERT INTO `admin_operation_log` VALUES (1043, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:06:47', '2019-01-21 15:06:47');
INSERT INTO `admin_operation_log` VALUES (1044, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:07:32', '2019-01-21 15:07:32');
INSERT INTO `admin_operation_log` VALUES (1045, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:08:27', '2019-01-21 15:08:27');
INSERT INTO `admin_operation_log` VALUES (1046, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:08:36', '2019-01-21 15:08:36');
INSERT INTO `admin_operation_log` VALUES (1047, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:09:11', '2019-01-21 15:09:11');
INSERT INTO `admin_operation_log` VALUES (1048, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:11:58', '2019-01-21 15:11:58');
INSERT INTO `admin_operation_log` VALUES (1049, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:13:15', '2019-01-21 15:13:15');
INSERT INTO `admin_operation_log` VALUES (1050, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:23:26', '2019-01-21 15:23:26');
INSERT INTO `admin_operation_log` VALUES (1051, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:24:40', '2019-01-21 15:24:40');
INSERT INTO `admin_operation_log` VALUES (1052, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:24:55', '2019-01-21 15:24:55');
INSERT INTO `admin_operation_log` VALUES (1053, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:27:49', '2019-01-21 15:27:49');
INSERT INTO `admin_operation_log` VALUES (1054, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:28:43', '2019-01-21 15:28:43');
INSERT INTO `admin_operation_log` VALUES (1055, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:30:37', '2019-01-21 15:30:37');
INSERT INTO `admin_operation_log` VALUES (1056, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:31:12', '2019-01-21 15:31:12');
INSERT INTO `admin_operation_log` VALUES (1057, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:31:28', '2019-01-21 15:31:28');
INSERT INTO `admin_operation_log` VALUES (1058, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:38:44', '2019-01-21 15:38:44');
INSERT INTO `admin_operation_log` VALUES (1059, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:40:06', '2019-01-21 15:40:06');
INSERT INTO `admin_operation_log` VALUES (1060, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:40:58', '2019-01-21 15:40:58');
INSERT INTO `admin_operation_log` VALUES (1061, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:41:40', '2019-01-21 15:41:40');
INSERT INTO `admin_operation_log` VALUES (1062, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:42:12', '2019-01-21 15:42:12');
INSERT INTO `admin_operation_log` VALUES (1063, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:43:58', '2019-01-21 15:43:58');
INSERT INTO `admin_operation_log` VALUES (1064, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:44:40', '2019-01-21 15:44:40');
INSERT INTO `admin_operation_log` VALUES (1065, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2019-01-21 15:44:49', '2019-01-21 15:44:49');
INSERT INTO `admin_operation_log` VALUES (1066, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 15:45:51', '2019-01-21 15:45:51');
INSERT INTO `admin_operation_log` VALUES (1067, 1, 'admin/auth/roles/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 15:45:54', '2019-01-21 15:45:54');
INSERT INTO `admin_operation_log` VALUES (1068, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 15:45:58', '2019-01-21 15:45:58');
INSERT INTO `admin_operation_log` VALUES (1069, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 15:46:00', '2019-01-21 15:46:00');
INSERT INTO `admin_operation_log` VALUES (1070, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 15:46:32', '2019-01-21 15:46:32');
INSERT INTO `admin_operation_log` VALUES (1071, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 15:46:49', '2019-01-21 15:46:49');
INSERT INTO `admin_operation_log` VALUES (1072, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 15:46:51', '2019-01-21 15:46:51');
INSERT INTO `admin_operation_log` VALUES (1073, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 15:46:53', '2019-01-21 15:46:53');
INSERT INTO `admin_operation_log` VALUES (1074, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 15:48:20', '2019-01-21 15:48:20');
INSERT INTO `admin_operation_log` VALUES (1075, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-21 16:01:40', '2019-01-21 16:01:40');
INSERT INTO `admin_operation_log` VALUES (1076, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-21 16:03:25', '2019-01-21 16:03:25');
INSERT INTO `admin_operation_log` VALUES (1077, 1, 'admin/hospitals/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:04:21', '2019-01-21 16:04:21');
INSERT INTO `admin_operation_log` VALUES (1078, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:04:25', '2019-01-21 16:04:25');
INSERT INTO `admin_operation_log` VALUES (1079, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-21 16:05:11', '2019-01-21 16:05:11');
INSERT INTO `admin_operation_log` VALUES (1080, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u53f0\\u5dde\\u4e94\\u6d32\\u533b\\u9662\",\"is_show\":\"on\",\"_token\":\"lGSJXGv80Ymcu1L23iYMUCleYVotmD4cr2zcccqN\"}', '2019-01-21 16:05:25', '2019-01-21 16:05:25');
INSERT INTO `admin_operation_log` VALUES (1081, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-21 16:05:25', '2019-01-21 16:05:25');
INSERT INTO `admin_operation_log` VALUES (1082, 1, 'admin/hospitals/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:05:34', '2019-01-21 16:05:34');
INSERT INTO `admin_operation_log` VALUES (1083, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:05:36', '2019-01-21 16:05:36');
INSERT INTO `admin_operation_log` VALUES (1084, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:05:45', '2019-01-21 16:05:45');
INSERT INTO `admin_operation_log` VALUES (1085, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:05:48', '2019-01-21 16:05:48');
INSERT INTO `admin_operation_log` VALUES (1086, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:05:52', '2019-01-21 16:05:52');
INSERT INTO `admin_operation_log` VALUES (1087, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:06:03', '2019-01-21 16:06:03');
INSERT INTO `admin_operation_log` VALUES (1088, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-21 16:07:26', '2019-01-21 16:07:26');
INSERT INTO `admin_operation_log` VALUES (1089, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:07:29', '2019-01-21 16:07:29');
INSERT INTO `admin_operation_log` VALUES (1090, 1, 'admin/auth/roles/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:07:31', '2019-01-21 16:07:31');
INSERT INTO `admin_operation_log` VALUES (1091, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:07:33', '2019-01-21 16:07:33');
INSERT INTO `admin_operation_log` VALUES (1092, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:07:36', '2019-01-21 16:07:36');
INSERT INTO `admin_operation_log` VALUES (1093, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:08:45', '2019-01-21 16:08:45');
INSERT INTO `admin_operation_log` VALUES (1094, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:08:45', '2019-01-21 16:08:45');
INSERT INTO `admin_operation_log` VALUES (1095, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:08:47', '2019-01-21 16:08:47');
INSERT INTO `admin_operation_log` VALUES (1096, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:08:48', '2019-01-21 16:08:48');
INSERT INTO `admin_operation_log` VALUES (1097, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:08:50', '2019-01-21 16:08:50');
INSERT INTO `admin_operation_log` VALUES (1098, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-21 16:09:23', '2019-01-21 16:09:23');
INSERT INTO `admin_operation_log` VALUES (1099, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-21 16:09:37', '2019-01-21 16:09:37');
INSERT INTO `admin_operation_log` VALUES (1100, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:09:47', '2019-01-21 16:09:47');
INSERT INTO `admin_operation_log` VALUES (1101, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:10:17', '2019-01-21 16:10:17');
INSERT INTO `admin_operation_log` VALUES (1102, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-21 16:14:58', '2019-01-21 16:14:58');
INSERT INTO `admin_operation_log` VALUES (1103, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:15:00', '2019-01-21 16:15:00');
INSERT INTO `admin_operation_log` VALUES (1104, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:15:02', '2019-01-21 16:15:02');
INSERT INTO `admin_operation_log` VALUES (1105, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-21 16:15:35', '2019-01-21 16:15:35');
INSERT INTO `admin_operation_log` VALUES (1106, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-21 16:16:39', '2019-01-21 16:16:39');
INSERT INTO `admin_operation_log` VALUES (1107, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-21 16:17:20', '2019-01-21 16:17:20');
INSERT INTO `admin_operation_log` VALUES (1108, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-21 16:17:56', '2019-01-21 16:17:56');
INSERT INTO `admin_operation_log` VALUES (1109, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-21 16:18:16', '2019-01-21 16:18:16');
INSERT INTO `admin_operation_log` VALUES (1110, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-21 16:18:41', '2019-01-21 16:18:41');
INSERT INTO `admin_operation_log` VALUES (1111, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 16:18:44', '2019-01-21 16:18:44');
INSERT INTO `admin_operation_log` VALUES (1112, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-21 17:02:09', '2019-01-21 17:02:09');
INSERT INTO `admin_operation_log` VALUES (1113, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-21 17:02:55', '2019-01-21 17:02:55');
INSERT INTO `admin_operation_log` VALUES (1114, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-21 17:04:55', '2019-01-21 17:04:55');
INSERT INTO `admin_operation_log` VALUES (1115, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-21 17:05:25', '2019-01-21 17:05:25');
INSERT INTO `admin_operation_log` VALUES (1116, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-21 17:11:08', '2019-01-21 17:11:08');
INSERT INTO `admin_operation_log` VALUES (1117, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-21 17:11:41', '2019-01-21 17:11:41');
INSERT INTO `admin_operation_log` VALUES (1118, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-21 17:12:59', '2019-01-21 17:12:59');
INSERT INTO `admin_operation_log` VALUES (1119, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:15:11', '2019-01-21 17:15:11');
INSERT INTO `admin_operation_log` VALUES (1120, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:15:16', '2019-01-21 17:15:16');
INSERT INTO `admin_operation_log` VALUES (1121, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"hospitals\":[\"3\",\"4\",\"5\",null],\"_token\":\"lGSJXGv80Ymcu1L23iYMUCleYVotmD4cr2zcccqN\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-21 17:15:22', '2019-01-21 17:15:22');
INSERT INTO `admin_operation_log` VALUES (1122, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-21 17:15:23', '2019-01-21 17:15:23');
INSERT INTO `admin_operation_log` VALUES (1123, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:42:53', '2019-01-21 17:42:53');
INSERT INTO `admin_operation_log` VALUES (1124, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-21 17:42:54', '2019-01-21 17:42:54');
INSERT INTO `admin_operation_log` VALUES (1125, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:42:56', '2019-01-21 17:42:56');
INSERT INTO `admin_operation_log` VALUES (1126, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-21 17:42:56', '2019-01-21 17:42:56');
INSERT INTO `admin_operation_log` VALUES (1127, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:42:59', '2019-01-21 17:42:59');
INSERT INTO `admin_operation_log` VALUES (1128, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:43:00', '2019-01-21 17:43:00');
INSERT INTO `admin_operation_log` VALUES (1129, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-21 17:43:01', '2019-01-21 17:43:01');
INSERT INTO `admin_operation_log` VALUES (1130, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:43:07', '2019-01-21 17:43:07');
INSERT INTO `admin_operation_log` VALUES (1131, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:43:09', '2019-01-21 17:43:09');
INSERT INTO `admin_operation_log` VALUES (1132, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-21 17:43:09', '2019-01-21 17:43:09');
INSERT INTO `admin_operation_log` VALUES (1133, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:44:49', '2019-01-21 17:44:49');
INSERT INTO `admin_operation_log` VALUES (1134, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:44:50', '2019-01-21 17:44:50');
INSERT INTO `admin_operation_log` VALUES (1135, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-21 17:44:51', '2019-01-21 17:44:51');
INSERT INTO `admin_operation_log` VALUES (1136, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-21 17:45:55', '2019-01-21 17:45:55');
INSERT INTO `admin_operation_log` VALUES (1137, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:46:13', '2019-01-21 17:46:13');
INSERT INTO `admin_operation_log` VALUES (1138, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:46:15', '2019-01-21 17:46:15');
INSERT INTO `admin_operation_log` VALUES (1139, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-21 17:46:16', '2019-01-21 17:46:16');
INSERT INTO `admin_operation_log` VALUES (1140, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:46:18', '2019-01-21 17:46:18');
INSERT INTO `admin_operation_log` VALUES (1141, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-21 17:46:19', '2019-01-21 17:46:19');
INSERT INTO `admin_operation_log` VALUES (1142, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:46:20', '2019-01-21 17:46:20');
INSERT INTO `admin_operation_log` VALUES (1143, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-21 17:46:21', '2019-01-21 17:46:21');
INSERT INTO `admin_operation_log` VALUES (1144, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-21 17:47:26', '2019-01-21 17:47:26');
INSERT INTO `admin_operation_log` VALUES (1145, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:47:30', '2019-01-21 17:47:30');
INSERT INTO `admin_operation_log` VALUES (1146, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-21 17:47:31', '2019-01-21 17:47:31');
INSERT INTO `admin_operation_log` VALUES (1147, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-01-21 17:48:42', '2019-01-21 17:48:42');
INSERT INTO `admin_operation_log` VALUES (1148, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:48:45', '2019-01-21 17:48:45');
INSERT INTO `admin_operation_log` VALUES (1149, 1, 'admin/hospitals/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:49:17', '2019-01-21 17:49:17');
INSERT INTO `admin_operation_log` VALUES (1150, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:49:20', '2019-01-21 17:49:20');
INSERT INTO `admin_operation_log` VALUES (1151, 1, 'admin/hospitals/9', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"lGSJXGv80Ymcu1L23iYMUCleYVotmD4cr2zcccqN\"}', '2019-01-21 17:49:23', '2019-01-21 17:49:23');
INSERT INTO `admin_operation_log` VALUES (1152, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:49:23', '2019-01-21 17:49:23');
INSERT INTO `admin_operation_log` VALUES (1153, 1, 'admin/hospitals', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u53f0\\u5dde\\u4e94\\u6d32\\u533b\\u9662\",\"is_show\":\"on\",\"_token\":\"lGSJXGv80Ymcu1L23iYMUCleYVotmD4cr2zcccqN\"}', '2019-01-21 17:49:27', '2019-01-21 17:49:27');
INSERT INTO `admin_operation_log` VALUES (1154, 1, 'admin/hospitals', 'GET', '127.0.0.1', '[]', '2019-01-21 17:49:27', '2019-01-21 17:49:27');
INSERT INTO `admin_operation_log` VALUES (1155, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:49:38', '2019-01-21 17:49:38');
INSERT INTO `admin_operation_log` VALUES (1156, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:49:41', '2019-01-21 17:49:41');
INSERT INTO `admin_operation_log` VALUES (1157, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:49:42', '2019-01-21 17:49:42');
INSERT INTO `admin_operation_log` VALUES (1158, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:49:44', '2019-01-21 17:49:44');
INSERT INTO `admin_operation_log` VALUES (1159, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:49:46', '2019-01-21 17:49:46');
INSERT INTO `admin_operation_log` VALUES (1160, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:49:48', '2019-01-21 17:49:48');
INSERT INTO `admin_operation_log` VALUES (1161, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":null,\"name\":null,\"password\":null,\"password_confirmation\":null,\"roles\":[null],\"permissions\":[null],\"hospitals\":[\"3\",\"4\",\"5\",null],\"_token\":\"lGSJXGv80Ymcu1L23iYMUCleYVotmD4cr2zcccqN\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-21 17:50:20', '2019-01-21 17:50:20');
INSERT INTO `admin_operation_log` VALUES (1162, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-21 17:50:20', '2019-01-21 17:50:20');
INSERT INTO `admin_operation_log` VALUES (1163, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:50:26', '2019-01-21 17:50:26');
INSERT INTO `admin_operation_log` VALUES (1164, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:50:28', '2019-01-21 17:50:28');
INSERT INTO `admin_operation_log` VALUES (1165, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"hospitals\":[\"3\",\"4\",\"5\",null],\"_token\":\"lGSJXGv80Ymcu1L23iYMUCleYVotmD4cr2zcccqN\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-21 17:50:36', '2019-01-21 17:50:36');
INSERT INTO `admin_operation_log` VALUES (1166, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-21 17:50:37', '2019-01-21 17:50:37');
INSERT INTO `admin_operation_log` VALUES (1167, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-21 17:52:50', '2019-01-21 17:52:50');
INSERT INTO `admin_operation_log` VALUES (1168, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"hospitals\":[\"3\",\"4\",null],\"_token\":\"lGSJXGv80Ymcu1L23iYMUCleYVotmD4cr2zcccqN\",\"_method\":\"PUT\"}', '2019-01-21 17:52:54', '2019-01-21 17:52:54');
INSERT INTO `admin_operation_log` VALUES (1169, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-21 17:52:55', '2019-01-21 17:52:55');
INSERT INTO `admin_operation_log` VALUES (1170, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-21 17:56:29', '2019-01-21 17:56:29');
INSERT INTO `admin_operation_log` VALUES (1171, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"hospitals\":[\"3\",\"4\",null],\"_token\":\"lGSJXGv80Ymcu1L23iYMUCleYVotmD4cr2zcccqN\",\"_method\":\"PUT\"}', '2019-01-21 17:56:35', '2019-01-21 17:56:35');
INSERT INTO `admin_operation_log` VALUES (1172, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-21 17:56:36', '2019-01-21 17:56:36');
INSERT INTO `admin_operation_log` VALUES (1173, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:56:48', '2019-01-21 17:56:48');
INSERT INTO `admin_operation_log` VALUES (1174, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo1\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"hospitals\":[null],\"_token\":\"lGSJXGv80Ymcu1L23iYMUCleYVotmD4cr2zcccqN\",\"_method\":\"PUT\"}', '2019-01-21 17:56:55', '2019-01-21 17:56:55');
INSERT INTO `admin_operation_log` VALUES (1175, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-21 17:56:55', '2019-01-21 17:56:55');
INSERT INTO `admin_operation_log` VALUES (1176, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-21 17:57:10', '2019-01-21 17:57:10');
INSERT INTO `admin_operation_log` VALUES (1177, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"hospitals\":[\"3\",\"4\",null],\"_token\":\"lGSJXGv80Ymcu1L23iYMUCleYVotmD4cr2zcccqN\",\"_method\":\"PUT\"}', '2019-01-21 17:57:16', '2019-01-21 17:57:16');
INSERT INTO `admin_operation_log` VALUES (1178, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-21 17:57:16', '2019-01-21 17:57:16');
INSERT INTO `admin_operation_log` VALUES (1179, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-21 17:58:45', '2019-01-21 17:58:45');
INSERT INTO `admin_operation_log` VALUES (1180, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"1\",\"2\",null],\"permissions\":[null],\"hospitals\":[\"3\",\"4\",null],\"_token\":\"lGSJXGv80Ymcu1L23iYMUCleYVotmD4cr2zcccqN\",\"_method\":\"PUT\"}', '2019-01-21 17:58:58', '2019-01-21 17:58:58');
INSERT INTO `admin_operation_log` VALUES (1181, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-21 17:58:59', '2019-01-21 17:58:59');
INSERT INTO `admin_operation_log` VALUES (1182, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-22 14:09:12', '2019-01-22 14:09:12');
INSERT INTO `admin_operation_log` VALUES (1183, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-22 14:20:24', '2019-01-22 14:20:24');
INSERT INTO `admin_operation_log` VALUES (1184, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-22 15:01:48', '2019-01-22 15:01:48');
INSERT INTO `admin_operation_log` VALUES (1185, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-22 15:01:59', '2019-01-22 15:01:59');
INSERT INTO `admin_operation_log` VALUES (1186, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-22 15:02:03', '2019-01-22 15:02:03');
INSERT INTO `admin_operation_log` VALUES (1187, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-22 15:02:04', '2019-01-22 15:02:04');
INSERT INTO `admin_operation_log` VALUES (1188, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-22 15:02:06', '2019-01-22 15:02:06');
INSERT INTO `admin_operation_log` VALUES (1189, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-22 15:02:10', '2019-01-22 15:02:10');
INSERT INTO `admin_operation_log` VALUES (1190, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-22 15:02:15', '2019-01-22 15:02:15');
INSERT INTO `admin_operation_log` VALUES (1191, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-22 15:02:16', '2019-01-22 15:02:16');
INSERT INTO `admin_operation_log` VALUES (1192, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-22 15:08:18', '2019-01-22 15:08:18');
INSERT INTO `admin_operation_log` VALUES (1193, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-22 15:08:20', '2019-01-22 15:08:20');
INSERT INTO `admin_operation_log` VALUES (1194, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-22 15:09:40', '2019-01-22 15:09:40');
INSERT INTO `admin_operation_log` VALUES (1195, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-22 15:09:43', '2019-01-22 15:09:43');
INSERT INTO `admin_operation_log` VALUES (1196, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-22 15:09:44', '2019-01-22 15:09:44');
INSERT INTO `admin_operation_log` VALUES (1197, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":null,\"name\":null,\"password\":null,\"password_confirmation\":null,\"roles\":[null],\"permissions\":[null],\"hospitals\":[\"3\",\"4\",\"5\",null],\"_token\":\"u0AX14xamvNMhntLQlcbT6pMFMn6LhC8hJXq9TsA\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-22 15:09:55', '2019-01-22 15:09:55');
INSERT INTO `admin_operation_log` VALUES (1198, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-22 15:09:55', '2019-01-22 15:09:55');
INSERT INTO `admin_operation_log` VALUES (1199, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-22 15:09:58', '2019-01-22 15:09:58');
INSERT INTO `admin_operation_log` VALUES (1200, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"henry\",\"name\":\"henry\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"roles\":[\"2\",null],\"permissions\":[\"2\",\"7\",null],\"hospitals\":[\"3\",\"4\",\"5\",null],\"_token\":\"u0AX14xamvNMhntLQlcbT6pMFMn6LhC8hJXq9TsA\"}', '2019-01-22 15:11:06', '2019-01-22 15:11:06');
INSERT INTO `admin_operation_log` VALUES (1201, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2019-01-22 15:11:07', '2019-01-22 15:11:07');
INSERT INTO `admin_operation_log` VALUES (1202, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-23 08:47:30', '2019-01-23 08:47:30');
INSERT INTO `admin_operation_log` VALUES (1203, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:48:08', '2019-01-23 08:48:08');
INSERT INTO `admin_operation_log` VALUES (1204, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:48:15', '2019-01-23 08:48:15');
INSERT INTO `admin_operation_log` VALUES (1205, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:48:18', '2019-01-23 08:48:18');
INSERT INTO `admin_operation_log` VALUES (1206, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:48:24', '2019-01-23 08:48:24');
INSERT INTO `admin_operation_log` VALUES (1207, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:48:26', '2019-01-23 08:48:26');
INSERT INTO `admin_operation_log` VALUES (1208, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:48:32', '2019-01-23 08:48:32');
INSERT INTO `admin_operation_log` VALUES (1209, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:48:33', '2019-01-23 08:48:33');
INSERT INTO `admin_operation_log` VALUES (1210, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"hospitals\":[\"3\",null],\"_token\":\"PX6abTSMnixvj2kVGoZqFaFxyth3W8elOhPeIgJX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-23 08:48:45', '2019-01-23 08:48:45');
INSERT INTO `admin_operation_log` VALUES (1211, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 08:48:46', '2019-01-23 08:48:46');
INSERT INTO `admin_operation_log` VALUES (1212, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:50:29', '2019-01-23 08:50:29');
INSERT INTO `admin_operation_log` VALUES (1213, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:50:31', '2019-01-23 08:50:31');
INSERT INTO `admin_operation_log` VALUES (1214, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:50:34', '2019-01-23 08:50:34');
INSERT INTO `admin_operation_log` VALUES (1215, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:51:02', '2019-01-23 08:51:02');
INSERT INTO `admin_operation_log` VALUES (1216, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:51:07', '2019-01-23 08:51:07');
INSERT INTO `admin_operation_log` VALUES (1217, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:51:19', '2019-01-23 08:51:19');
INSERT INTO `admin_operation_log` VALUES (1218, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 08:51:22', '2019-01-23 08:51:22');
INSERT INTO `admin_operation_log` VALUES (1219, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:00:26', '2019-01-23 09:00:26');
INSERT INTO `admin_operation_log` VALUES (1220, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"hospitals\":[\"3\",null],\"_token\":\"PX6abTSMnixvj2kVGoZqFaFxyth3W8elOhPeIgJX\",\"_method\":\"PUT\"}', '2019-01-23 09:00:33', '2019-01-23 09:00:33');
INSERT INTO `admin_operation_log` VALUES (1221, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:00:34', '2019-01-23 09:00:34');
INSERT INTO `admin_operation_log` VALUES (1222, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 09:00:37', '2019-01-23 09:00:37');
INSERT INTO `admin_operation_log` VALUES (1223, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:00:39', '2019-01-23 09:00:39');
INSERT INTO `admin_operation_log` VALUES (1224, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:00:45', '2019-01-23 09:00:45');
INSERT INTO `admin_operation_log` VALUES (1225, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:01:44', '2019-01-23 09:01:44');
INSERT INTO `admin_operation_log` VALUES (1226, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 09:01:47', '2019-01-23 09:01:47');
INSERT INTO `admin_operation_log` VALUES (1227, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 09:01:49', '2019-01-23 09:01:49');
INSERT INTO `admin_operation_log` VALUES (1228, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"hospitals\":[\"3\",\"4\",\"5\",null],\"_token\":\"PX6abTSMnixvj2kVGoZqFaFxyth3W8elOhPeIgJX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-23 09:08:57', '2019-01-23 09:08:57');
INSERT INTO `admin_operation_log` VALUES (1229, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:08:58', '2019-01-23 09:08:58');
INSERT INTO `admin_operation_log` VALUES (1230, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:10:06', '2019-01-23 09:10:06');
INSERT INTO `admin_operation_log` VALUES (1231, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:10:10', '2019-01-23 09:10:10');
INSERT INTO `admin_operation_log` VALUES (1232, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"hospitals\":[\"3\",\"5\",null],\"_token\":\"PX6abTSMnixvj2kVGoZqFaFxyth3W8elOhPeIgJX\",\"_method\":\"PUT\"}', '2019-01-23 09:10:19', '2019-01-23 09:10:19');
INSERT INTO `admin_operation_log` VALUES (1233, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:10:20', '2019-01-23 09:10:20');
INSERT INTO `admin_operation_log` VALUES (1234, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 09:10:25', '2019-01-23 09:10:25');
INSERT INTO `admin_operation_log` VALUES (1235, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:10:28', '2019-01-23 09:10:28');
INSERT INTO `admin_operation_log` VALUES (1236, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:11:21', '2019-01-23 09:11:21');
INSERT INTO `admin_operation_log` VALUES (1237, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"hospitals\":[\"3\",null],\"_token\":\"PX6abTSMnixvj2kVGoZqFaFxyth3W8elOhPeIgJX\",\"_method\":\"PUT\"}', '2019-01-23 09:11:26', '2019-01-23 09:11:26');
INSERT INTO `admin_operation_log` VALUES (1238, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:11:27', '2019-01-23 09:11:27');
INSERT INTO `admin_operation_log` VALUES (1239, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:13:35', '2019-01-23 09:13:35');
INSERT INTO `admin_operation_log` VALUES (1240, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:15:03', '2019-01-23 09:15:03');
INSERT INTO `admin_operation_log` VALUES (1241, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:18:35', '2019-01-23 09:18:35');
INSERT INTO `admin_operation_log` VALUES (1242, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:38:00', '2019-01-23 09:38:00');
INSERT INTO `admin_operation_log` VALUES (1243, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:41:00', '2019-01-23 09:41:00');
INSERT INTO `admin_operation_log` VALUES (1244, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:41:11', '2019-01-23 09:41:11');
INSERT INTO `admin_operation_log` VALUES (1245, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:41:14', '2019-01-23 09:41:14');
INSERT INTO `admin_operation_log` VALUES (1246, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:41:50', '2019-01-23 09:41:50');
INSERT INTO `admin_operation_log` VALUES (1247, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2019-01-23 09:42:04', '2019-01-23 09:42:04');
INSERT INTO `admin_operation_log` VALUES (1248, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"hospitals\":[\"4\",null],\"_token\":\"PX6abTSMnixvj2kVGoZqFaFxyth3W8elOhPeIgJX\",\"_method\":\"PUT\"}', '2019-01-23 09:42:10', '2019-01-23 09:42:10');
INSERT INTO `admin_operation_log` VALUES (1249, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 09:42:10', '2019-01-23 09:42:10');
INSERT INTO `admin_operation_log` VALUES (1250, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 09:43:24', '2019-01-23 09:43:24');
INSERT INTO `admin_operation_log` VALUES (1251, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 09:43:55', '2019-01-23 09:43:55');
INSERT INTO `admin_operation_log` VALUES (1252, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 09:43:58', '2019-01-23 09:43:58');
INSERT INTO `admin_operation_log` VALUES (1253, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 09:44:06', '2019-01-23 09:44:06');
INSERT INTO `admin_operation_log` VALUES (1254, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 09:44:21', '2019-01-23 09:44:21');
INSERT INTO `admin_operation_log` VALUES (1255, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 09:44:33', '2019-01-23 09:44:33');
INSERT INTO `admin_operation_log` VALUES (1256, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 09:46:00', '2019-01-23 09:46:00');
INSERT INTO `admin_operation_log` VALUES (1257, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:03:58', '2019-01-23 10:03:58');
INSERT INTO `admin_operation_log` VALUES (1258, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:04:32', '2019-01-23 10:04:32');
INSERT INTO `admin_operation_log` VALUES (1259, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:06:02', '2019-01-23 10:06:02');
INSERT INTO `admin_operation_log` VALUES (1260, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:15:33', '2019-01-23 10:15:33');
INSERT INTO `admin_operation_log` VALUES (1261, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"leo\",\"name\":\"leo\",\"password\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"password_confirmation\":\"$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW\",\"roles\":[\"2\",null],\"permissions\":[null],\"hospitals\":[\"3\",\"8\",null],\"_token\":\"PX6abTSMnixvj2kVGoZqFaFxyth3W8elOhPeIgJX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-23 10:15:41', '2019-01-23 10:15:41');
INSERT INTO `admin_operation_log` VALUES (1262, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:15:41', '2019-01-23 10:15:41');
INSERT INTO `admin_operation_log` VALUES (1263, 1, 'admin/auth/users/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:15:51', '2019-01-23 10:15:51');
INSERT INTO `admin_operation_log` VALUES (1264, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:15:56', '2019-01-23 10:15:56');
INSERT INTO `admin_operation_log` VALUES (1265, 1, 'admin/auth/users/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:15:58', '2019-01-23 10:15:58');
INSERT INTO `admin_operation_log` VALUES (1266, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:16:01', '2019-01-23 10:16:01');
INSERT INTO `admin_operation_log` VALUES (1267, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:16:02', '2019-01-23 10:16:02');
INSERT INTO `admin_operation_log` VALUES (1268, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:16:05', '2019-01-23 10:16:05');
INSERT INTO `admin_operation_log` VALUES (1269, 1, 'admin/auth/users/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:16:07', '2019-01-23 10:16:07');
INSERT INTO `admin_operation_log` VALUES (1270, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:16:11', '2019-01-23 10:16:11');
INSERT INTO `admin_operation_log` VALUES (1271, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:16:25', '2019-01-23 10:16:25');
INSERT INTO `admin_operation_log` VALUES (1272, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:16:27', '2019-01-23 10:16:27');
INSERT INTO `admin_operation_log` VALUES (1273, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:16:30', '2019-01-23 10:16:30');
INSERT INTO `admin_operation_log` VALUES (1274, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:16:32', '2019-01-23 10:16:32');
INSERT INTO `admin_operation_log` VALUES (1275, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:32:05', '2019-01-23 10:32:05');
INSERT INTO `admin_operation_log` VALUES (1276, 1, 'admin/auth/users/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:32:08', '2019-01-23 10:32:08');
INSERT INTO `admin_operation_log` VALUES (1277, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:32:08', '2019-01-23 10:32:08');
INSERT INTO `admin_operation_log` VALUES (1278, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:33:08', '2019-01-23 10:33:08');
INSERT INTO `admin_operation_log` VALUES (1279, 1, 'admin/auth/users/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:33:10', '2019-01-23 10:33:10');
INSERT INTO `admin_operation_log` VALUES (1280, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:44:28', '2019-01-23 10:44:28');
INSERT INTO `admin_operation_log` VALUES (1281, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:44:30', '2019-01-23 10:44:30');
INSERT INTO `admin_operation_log` VALUES (1282, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:44:33', '2019-01-23 10:44:33');
INSERT INTO `admin_operation_log` VALUES (1283, 1, 'admin/auth/users/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:45:24', '2019-01-23 10:45:24');
INSERT INTO `admin_operation_log` VALUES (1284, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 10:45:28', '2019-01-23 10:45:28');
INSERT INTO `admin_operation_log` VALUES (1285, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:53:11', '2019-01-23 10:53:11');
INSERT INTO `admin_operation_log` VALUES (1286, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:54:12', '2019-01-23 10:54:12');
INSERT INTO `admin_operation_log` VALUES (1287, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:54:42', '2019-01-23 10:54:42');
INSERT INTO `admin_operation_log` VALUES (1288, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:56:04', '2019-01-23 10:56:04');
INSERT INTO `admin_operation_log` VALUES (1289, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:57:14', '2019-01-23 10:57:14');
INSERT INTO `admin_operation_log` VALUES (1290, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:57:57', '2019-01-23 10:57:57');
INSERT INTO `admin_operation_log` VALUES (1291, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 10:59:10', '2019-01-23 10:59:10');
INSERT INTO `admin_operation_log` VALUES (1292, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:00:54', '2019-01-23 11:00:54');
INSERT INTO `admin_operation_log` VALUES (1293, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:02:37', '2019-01-23 11:02:37');
INSERT INTO `admin_operation_log` VALUES (1294, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:12:52', '2019-01-23 11:12:52');
INSERT INTO `admin_operation_log` VALUES (1295, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:13:11', '2019-01-23 11:13:11');
INSERT INTO `admin_operation_log` VALUES (1296, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:14:12', '2019-01-23 11:14:12');
INSERT INTO `admin_operation_log` VALUES (1297, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 11:16:05', '2019-01-23 11:16:05');
INSERT INTO `admin_operation_log` VALUES (1298, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 11:16:09', '2019-01-23 11:16:09');
INSERT INTO `admin_operation_log` VALUES (1299, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:18:24', '2019-01-23 11:18:24');
INSERT INTO `admin_operation_log` VALUES (1300, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:23:06', '2019-01-23 11:23:06');
INSERT INTO `admin_operation_log` VALUES (1301, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:23:18', '2019-01-23 11:23:18');
INSERT INTO `admin_operation_log` VALUES (1302, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:23:39', '2019-01-23 11:23:39');
INSERT INTO `admin_operation_log` VALUES (1303, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:23:57', '2019-01-23 11:23:57');
INSERT INTO `admin_operation_log` VALUES (1304, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:24:24', '2019-01-23 11:24:24');
INSERT INTO `admin_operation_log` VALUES (1305, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:24:49', '2019-01-23 11:24:49');
INSERT INTO `admin_operation_log` VALUES (1306, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:25:04', '2019-01-23 11:25:04');
INSERT INTO `admin_operation_log` VALUES (1307, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:25:15', '2019-01-23 11:25:15');
INSERT INTO `admin_operation_log` VALUES (1308, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:25:28', '2019-01-23 11:25:28');
INSERT INTO `admin_operation_log` VALUES (1309, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:25:48', '2019-01-23 11:25:48');
INSERT INTO `admin_operation_log` VALUES (1310, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:26:17', '2019-01-23 11:26:17');
INSERT INTO `admin_operation_log` VALUES (1311, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:26:39', '2019-01-23 11:26:39');
INSERT INTO `admin_operation_log` VALUES (1312, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:27:05', '2019-01-23 11:27:05');
INSERT INTO `admin_operation_log` VALUES (1313, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:28:22', '2019-01-23 11:28:22');
INSERT INTO `admin_operation_log` VALUES (1314, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:28:43', '2019-01-23 11:28:43');
INSERT INTO `admin_operation_log` VALUES (1315, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:29:07', '2019-01-23 11:29:07');
INSERT INTO `admin_operation_log` VALUES (1316, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:29:35', '2019-01-23 11:29:35');
INSERT INTO `admin_operation_log` VALUES (1317, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:30:19', '2019-01-23 11:30:19');
INSERT INTO `admin_operation_log` VALUES (1318, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:30:54', '2019-01-23 11:30:54');
INSERT INTO `admin_operation_log` VALUES (1319, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:32:04', '2019-01-23 11:32:04');
INSERT INTO `admin_operation_log` VALUES (1320, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:32:33', '2019-01-23 11:32:33');
INSERT INTO `admin_operation_log` VALUES (1321, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:34:37', '2019-01-23 11:34:37');
INSERT INTO `admin_operation_log` VALUES (1322, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:34:49', '2019-01-23 11:34:49');
INSERT INTO `admin_operation_log` VALUES (1323, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:34:59', '2019-01-23 11:34:59');
INSERT INTO `admin_operation_log` VALUES (1324, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:35:45', '2019-01-23 11:35:45');
INSERT INTO `admin_operation_log` VALUES (1325, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:35:55', '2019-01-23 11:35:55');
INSERT INTO `admin_operation_log` VALUES (1326, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:37:31', '2019-01-23 11:37:31');
INSERT INTO `admin_operation_log` VALUES (1327, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:37:51', '2019-01-23 11:37:51');
INSERT INTO `admin_operation_log` VALUES (1328, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:38:19', '2019-01-23 11:38:19');
INSERT INTO `admin_operation_log` VALUES (1329, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:38:54', '2019-01-23 11:38:54');
INSERT INTO `admin_operation_log` VALUES (1330, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:47:10', '2019-01-23 11:47:10');
INSERT INTO `admin_operation_log` VALUES (1331, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:47:50', '2019-01-23 11:47:50');
INSERT INTO `admin_operation_log` VALUES (1332, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:48:53', '2019-01-23 11:48:53');
INSERT INTO `admin_operation_log` VALUES (1333, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:50:51', '2019-01-23 11:50:51');
INSERT INTO `admin_operation_log` VALUES (1334, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 11:56:09', '2019-01-23 11:56:09');
INSERT INTO `admin_operation_log` VALUES (1335, 1, 'admin/auth/users/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 11:56:29', '2019-01-23 11:56:29');
INSERT INTO `admin_operation_log` VALUES (1336, 1, 'admin/auth/users/2', 'GET', '127.0.0.1', '[]', '2019-01-23 11:59:39', '2019-01-23 11:59:39');
INSERT INTO `admin_operation_log` VALUES (1337, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 11:59:42', '2019-01-23 11:59:42');
INSERT INTO `admin_operation_log` VALUES (1338, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"page:1\"}', '2019-01-23 11:59:49', '2019-01-23 11:59:49');
INSERT INTO `admin_operation_log` VALUES (1339, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 12:03:20', '2019-01-23 12:03:20');
INSERT INTO `admin_operation_log` VALUES (1340, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 12:05:19', '2019-01-23 12:05:19');
INSERT INTO `admin_operation_log` VALUES (1341, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 12:05:21', '2019-01-23 12:05:21');
INSERT INTO `admin_operation_log` VALUES (1342, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 12:05:22', '2019-01-23 12:05:22');
INSERT INTO `admin_operation_log` VALUES (1343, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 12:05:24', '2019-01-23 12:05:24');
INSERT INTO `admin_operation_log` VALUES (1344, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 12:05:30', '2019-01-23 12:05:30');
INSERT INTO `admin_operation_log` VALUES (1345, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 12:05:33', '2019-01-23 12:05:33');
INSERT INTO `admin_operation_log` VALUES (1346, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 12:05:35', '2019-01-23 12:05:35');
INSERT INTO `admin_operation_log` VALUES (1347, 1, 'admin/auth/users/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 12:05:37', '2019-01-23 12:05:37');
INSERT INTO `admin_operation_log` VALUES (1348, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 12:05:39', '2019-01-23 12:05:39');
INSERT INTO `admin_operation_log` VALUES (1349, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 12:06:53', '2019-01-23 12:06:53');
INSERT INTO `admin_operation_log` VALUES (1350, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 12:07:13', '2019-01-23 12:07:13');
INSERT INTO `admin_operation_log` VALUES (1351, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 12:07:42', '2019-01-23 12:07:42');
INSERT INTO `admin_operation_log` VALUES (1352, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 12:07:47', '2019-01-23 12:07:47');
INSERT INTO `admin_operation_log` VALUES (1353, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 14:12:17', '2019-01-23 14:12:17');
INSERT INTO `admin_operation_log` VALUES (1354, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 14:12:46', '2019-01-23 14:12:46');
INSERT INTO `admin_operation_log` VALUES (1355, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:12:50', '2019-01-23 14:12:50');
INSERT INTO `admin_operation_log` VALUES (1356, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-23 14:13:11', '2019-01-23 14:13:11');
INSERT INTO `admin_operation_log` VALUES (1357, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:13:22', '2019-01-23 14:13:22');
INSERT INTO `admin_operation_log` VALUES (1358, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:13:24', '2019-01-23 14:13:24');
INSERT INTO `admin_operation_log` VALUES (1359, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:13:24', '2019-01-23 14:13:24');
INSERT INTO `admin_operation_log` VALUES (1360, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:13:25', '2019-01-23 14:13:25');
INSERT INTO `admin_operation_log` VALUES (1361, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:13:27', '2019-01-23 14:13:27');
INSERT INTO `admin_operation_log` VALUES (1362, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:13:29', '2019-01-23 14:13:29');
INSERT INTO `admin_operation_log` VALUES (1363, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:13:35', '2019-01-23 14:13:35');
INSERT INTO `admin_operation_log` VALUES (1364, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:13:37', '2019-01-23 14:13:37');
INSERT INTO `admin_operation_log` VALUES (1365, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:13:53', '2019-01-23 14:13:53');
INSERT INTO `admin_operation_log` VALUES (1366, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:13:57', '2019-01-23 14:13:57');
INSERT INTO `admin_operation_log` VALUES (1367, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:13:59', '2019-01-23 14:13:59');
INSERT INTO `admin_operation_log` VALUES (1368, 1, 'admin/auth/users/1', 'PUT', '127.0.0.1', '{\"username\":\"admin\",\"name\":\"Administrator\",\"password\":\"$2y$10$ln\\/fhNkKtiklM6\\/\\/5MXkfeT7XKWJnesQ0DMiIizKWvSMV0f4ZvyPe\",\"password_confirmation\":\"$2y$10$ln\\/fhNkKtiklM6\\/\\/5MXkfeT7XKWJnesQ0DMiIizKWvSMV0f4ZvyPe\",\"roles\":[\"1\",null],\"permissions\":[null],\"hospitals\":[\"3\",\"4\",\"5\",\"7\",\"8\",null],\"_token\":\"MKaG1zlQ5wUg14mUYgCh4hMcf22hu5snrgAx1wkm\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.hosstore.com\\/admin\\/auth\\/users\"}', '2019-01-23 14:14:04', '2019-01-23 14:14:04');
INSERT INTO `admin_operation_log` VALUES (1369, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 14:14:04', '2019-01-23 14:14:04');
INSERT INTO `admin_operation_log` VALUES (1370, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:14:37', '2019-01-23 14:14:37');
INSERT INTO `admin_operation_log` VALUES (1371, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:14:50', '2019-01-23 14:14:50');
INSERT INTO `admin_operation_log` VALUES (1372, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:15:02', '2019-01-23 14:15:02');
INSERT INTO `admin_operation_log` VALUES (1373, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:15:04', '2019-01-23 14:15:04');
INSERT INTO `admin_operation_log` VALUES (1374, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:15:05', '2019-01-23 14:15:05');
INSERT INTO `admin_operation_log` VALUES (1375, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:15:06', '2019-01-23 14:15:06');
INSERT INTO `admin_operation_log` VALUES (1376, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:15:07', '2019-01-23 14:15:07');
INSERT INTO `admin_operation_log` VALUES (1377, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:16:43', '2019-01-23 14:16:43');
INSERT INTO `admin_operation_log` VALUES (1378, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:16:47', '2019-01-23 14:16:47');
INSERT INTO `admin_operation_log` VALUES (1379, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:16:47', '2019-01-23 14:16:47');
INSERT INTO `admin_operation_log` VALUES (1380, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:19:22', '2019-01-23 14:19:22');
INSERT INTO `admin_operation_log` VALUES (1381, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:19:34', '2019-01-23 14:19:34');
INSERT INTO `admin_operation_log` VALUES (1382, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:19:36', '2019-01-23 14:19:36');
INSERT INTO `admin_operation_log` VALUES (1383, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:19:38', '2019-01-23 14:19:38');
INSERT INTO `admin_operation_log` VALUES (1384, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:19:39', '2019-01-23 14:19:39');
INSERT INTO `admin_operation_log` VALUES (1385, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:19:40', '2019-01-23 14:19:40');
INSERT INTO `admin_operation_log` VALUES (1386, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:20:52', '2019-01-23 14:20:52');
INSERT INTO `admin_operation_log` VALUES (1387, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:21:58', '2019-01-23 14:21:58');
INSERT INTO `admin_operation_log` VALUES (1388, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:22:01', '2019-01-23 14:22:01');
INSERT INTO `admin_operation_log` VALUES (1389, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:22:53', '2019-01-23 14:22:53');
INSERT INTO `admin_operation_log` VALUES (1390, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:22:54', '2019-01-23 14:22:54');
INSERT INTO `admin_operation_log` VALUES (1391, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:22:57', '2019-01-23 14:22:57');
INSERT INTO `admin_operation_log` VALUES (1392, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:38:35', '2019-01-23 14:38:35');
INSERT INTO `admin_operation_log` VALUES (1393, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:39:31', '2019-01-23 14:39:31');
INSERT INTO `admin_operation_log` VALUES (1394, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:39:33', '2019-01-23 14:39:33');
INSERT INTO `admin_operation_log` VALUES (1395, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:39:45', '2019-01-23 14:39:45');
INSERT INTO `admin_operation_log` VALUES (1396, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 14:44:47', '2019-01-23 14:44:47');
INSERT INTO `admin_operation_log` VALUES (1397, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-23 18:23:03', '2019-01-23 18:23:03');
INSERT INTO `admin_operation_log` VALUES (1398, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 18:23:15', '2019-01-23 18:23:15');
INSERT INTO `admin_operation_log` VALUES (1399, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 18:23:18', '2019-01-23 18:23:18');
INSERT INTO `admin_operation_log` VALUES (1400, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 18:23:19', '2019-01-23 18:23:19');
INSERT INTO `admin_operation_log` VALUES (1401, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 18:23:20', '2019-01-23 18:23:20');
INSERT INTO `admin_operation_log` VALUES (1402, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 18:23:22', '2019-01-23 18:23:22');
INSERT INTO `admin_operation_log` VALUES (1403, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-23 18:23:26', '2019-01-23 18:23:26');
INSERT INTO `admin_operation_log` VALUES (1404, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-27 16:30:06', '2019-01-27 16:30:06');
INSERT INTO `admin_operation_log` VALUES (1405, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-27 16:38:32', '2019-01-27 16:38:32');
INSERT INTO `admin_operation_log` VALUES (1406, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-27 16:38:35', '2019-01-27 16:38:35');
INSERT INTO `admin_operation_log` VALUES (1407, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-27 16:38:36', '2019-01-27 16:38:36');
INSERT INTO `admin_operation_log` VALUES (1408, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-27 16:38:36', '2019-01-27 16:38:36');
INSERT INTO `admin_operation_log` VALUES (1409, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-27 16:38:37', '2019-01-27 16:38:37');
INSERT INTO `admin_operation_log` VALUES (1410, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-27 16:39:09', '2019-01-27 16:39:09');
INSERT INTO `admin_operation_log` VALUES (1411, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-29 08:29:28', '2019-01-29 08:29:28');
INSERT INTO `admin_operation_log` VALUES (1412, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:29:45', '2019-01-29 08:29:45');
INSERT INTO `admin_operation_log` VALUES (1413, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:29:47', '2019-01-29 08:29:47');
INSERT INTO `admin_operation_log` VALUES (1414, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:29:54', '2019-01-29 08:29:54');
INSERT INTO `admin_operation_log` VALUES (1415, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:29:55', '2019-01-29 08:29:55');
INSERT INTO `admin_operation_log` VALUES (1416, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:29:57', '2019-01-29 08:29:57');
INSERT INTO `admin_operation_log` VALUES (1417, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:32:36', '2019-01-29 08:32:36');
INSERT INTO `admin_operation_log` VALUES (1418, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:32:36', '2019-01-29 08:32:36');
INSERT INTO `admin_operation_log` VALUES (1419, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:32:38', '2019-01-29 08:32:38');
INSERT INTO `admin_operation_log` VALUES (1420, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:32:38', '2019-01-29 08:32:38');
INSERT INTO `admin_operation_log` VALUES (1421, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:32:39', '2019-01-29 08:32:39');
INSERT INTO `admin_operation_log` VALUES (1422, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:32:53', '2019-01-29 08:32:53');
INSERT INTO `admin_operation_log` VALUES (1423, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-29 08:34:18', '2019-01-29 08:34:18');
INSERT INTO `admin_operation_log` VALUES (1424, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:35:08', '2019-01-29 08:35:08');
INSERT INTO `admin_operation_log` VALUES (1425, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:35:16', '2019-01-29 08:35:16');
INSERT INTO `admin_operation_log` VALUES (1426, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:35:45', '2019-01-29 08:35:45');
INSERT INTO `admin_operation_log` VALUES (1427, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-29 08:36:20', '2019-01-29 08:36:20');
INSERT INTO `admin_operation_log` VALUES (1428, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-01-30 16:14:51', '2019-01-30 16:14:51');
INSERT INTO `admin_operation_log` VALUES (1429, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:14:55', '2019-01-30 16:14:55');
INSERT INTO `admin_operation_log` VALUES (1430, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:16:39', '2019-01-30 16:16:39');
INSERT INTO `admin_operation_log` VALUES (1431, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:16:41', '2019-01-30 16:16:41');
INSERT INTO `admin_operation_log` VALUES (1432, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:16:45', '2019-01-30 16:16:45');
INSERT INTO `admin_operation_log` VALUES (1433, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:16:45', '2019-01-30 16:16:45');
INSERT INTO `admin_operation_log` VALUES (1434, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:16:46', '2019-01-30 16:16:46');
INSERT INTO `admin_operation_log` VALUES (1435, 1, 'admin/hospitals', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:16:47', '2019-01-30 16:16:47');
INSERT INTO `admin_operation_log` VALUES (1436, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:16:50', '2019-01-30 16:16:50');
INSERT INTO `admin_operation_log` VALUES (1437, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:16:51', '2019-01-30 16:16:51');
INSERT INTO `admin_operation_log` VALUES (1438, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:17:10', '2019-01-30 16:17:10');
INSERT INTO `admin_operation_log` VALUES (1439, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:19:57', '2019-01-30 16:19:57');
INSERT INTO `admin_operation_log` VALUES (1440, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:20:01', '2019-01-30 16:20:01');
INSERT INTO `admin_operation_log` VALUES (1441, 1, 'admin/auth/users/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:20:05', '2019-01-30 16:20:05');
INSERT INTO `admin_operation_log` VALUES (1442, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:20:07', '2019-01-30 16:20:07');
INSERT INTO `admin_operation_log` VALUES (1443, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 16:20:10', '2019-01-30 16:20:10');
INSERT INTO `admin_operation_log` VALUES (1444, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2019-01-30 16:30:10', '2019-01-30 16:30:10');
INSERT INTO `admin_operation_log` VALUES (1445, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2019-01-30 16:30:12', '2019-01-30 16:30:12');
INSERT INTO `admin_operation_log` VALUES (1446, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2019-01-30 16:46:46', '2019-01-30 16:46:46');
INSERT INTO `admin_operation_log` VALUES (1447, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2019-01-30 16:46:52', '2019-01-30 16:46:52');
INSERT INTO `admin_operation_log` VALUES (1448, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2019-01-30 16:55:33', '2019-01-30 16:55:33');
INSERT INTO `admin_operation_log` VALUES (1449, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2019-01-30 16:55:50', '2019-01-30 16:55:50');
INSERT INTO `admin_operation_log` VALUES (1450, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2019-01-30 16:59:12', '2019-01-30 16:59:12');
INSERT INTO `admin_operation_log` VALUES (1451, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2019-01-30 16:59:14', '2019-01-30 16:59:14');
INSERT INTO `admin_operation_log` VALUES (1452, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2019-01-30 16:59:20', '2019-01-30 16:59:20');
INSERT INTO `admin_operation_log` VALUES (1453, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2019-01-30 17:00:56', '2019-01-30 17:00:56');
INSERT INTO `admin_operation_log` VALUES (1454, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 17:01:01', '2019-01-30 17:01:01');
INSERT INTO `admin_operation_log` VALUES (1455, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-01-30 17:01:03', '2019-01-30 17:01:03');
INSERT INTO `admin_operation_log` VALUES (1456, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:03:07', '2019-01-30 17:03:07');
INSERT INTO `admin_operation_log` VALUES (1457, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:07:15', '2019-01-30 17:07:15');
INSERT INTO `admin_operation_log` VALUES (1458, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:07:16', '2019-01-30 17:07:16');
INSERT INTO `admin_operation_log` VALUES (1459, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:07:17', '2019-01-30 17:07:17');
INSERT INTO `admin_operation_log` VALUES (1460, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:07:18', '2019-01-30 17:07:18');
INSERT INTO `admin_operation_log` VALUES (1461, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:07:19', '2019-01-30 17:07:19');
INSERT INTO `admin_operation_log` VALUES (1462, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:07:19', '2019-01-30 17:07:19');
INSERT INTO `admin_operation_log` VALUES (1463, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:07:20', '2019-01-30 17:07:20');
INSERT INTO `admin_operation_log` VALUES (1464, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:07:20', '2019-01-30 17:07:20');
INSERT INTO `admin_operation_log` VALUES (1465, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:07:20', '2019-01-30 17:07:20');
INSERT INTO `admin_operation_log` VALUES (1466, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:07:21', '2019-01-30 17:07:21');
INSERT INTO `admin_operation_log` VALUES (1467, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:07:22', '2019-01-30 17:07:22');
INSERT INTO `admin_operation_log` VALUES (1468, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:07:35', '2019-01-30 17:07:35');
INSERT INTO `admin_operation_log` VALUES (1469, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:07:41', '2019-01-30 17:07:41');
INSERT INTO `admin_operation_log` VALUES (1470, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2019-01-30 17:09:33', '2019-01-30 17:09:33');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `http_path` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, '超级管理员', '*', '', '*', NULL, '2019-01-08 18:02:54');
INSERT INTO `admin_permissions` VALUES (2, '首页', 'dashboard', 'GET', '/', NULL, '2019-01-08 18:03:21');
INSERT INTO `admin_permissions` VALUES (7, '登录登出', 'auth.login/auth.logout', '', '/auth/login\r\n/auth/logout', '2019-01-16 15:37:08', '2019-01-16 15:37:45');
INSERT INTO `admin_permissions` VALUES (4, '用户设置', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, '2019-01-08 18:03:49');
INSERT INTO `admin_permissions` VALUES (5, '用户管理', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, '2019-01-08 18:04:16');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
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
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 7, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 4, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (2, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
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
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
  INDEX `admin_user_hos_user_id_hos_id_index`(`user_id`, `hos_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_user_hospitals
-- ----------------------------
INSERT INTO `admin_user_hospitals` VALUES (2, 3, NULL, NULL);
INSERT INTO `admin_user_hospitals` VALUES (2, 8, NULL, NULL);
INSERT INTO `admin_user_hospitals` VALUES (1, 3, NULL, NULL);
INSERT INTO `admin_user_hospitals` VALUES (1, 4, NULL, NULL);
INSERT INTO `admin_user_hospitals` VALUES (1, 5, NULL, NULL);
INSERT INTO `admin_user_hospitals` VALUES (1, 7, NULL, NULL);
INSERT INTO `admin_user_hospitals` VALUES (1, 8, NULL, NULL);

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
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
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp(0) DEFAULT NULL,
  `updated_at` timestamp(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$ln/fhNkKtiklM6//5MXkfeT7XKWJnesQ0DMiIizKWvSMV0f4ZvyPe', 'Administrator', NULL, 'Q1qq5y5JozjRyZv7U3FnHTMgxuwmWcmOyQ3L6X6SyNRF7KHlgfZ7lvk3E280', '2019-01-08 08:35:37', '2019-01-08 08:35:37');
INSERT INTO `admin_users` VALUES (2, 'leo', '$2y$10$Smrg4lmpjkgD1QpJt8Qsb.MCTk7Oaz7c0PnXgLxMYkImxwQDG2kKW', 'leo', NULL, 'Ki97nLSFhFXGnSgSe82ONM7nsiuHNZAJwMswUrjsWNwuETQ3epQ69J5gUygo', '2019-01-16 15:04:54', '2019-01-16 15:04:54');

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
