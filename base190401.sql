/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 01/04/2019 11:07:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for w_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_menu`;
CREATE TABLE `w_admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_admin_menu
-- ----------------------------
INSERT INTO `w_admin_menu` VALUES (1, 0, 1, '仪表盘', 'fa-dashboard', '/', NULL, NULL, '2019-03-26 17:36:15');
INSERT INTO `w_admin_menu` VALUES (2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL);
INSERT INTO `w_admin_menu` VALUES (3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL);
INSERT INTO `w_admin_menu` VALUES (4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL);
INSERT INTO `w_admin_menu` VALUES (5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL);
INSERT INTO `w_admin_menu` VALUES (6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL);
INSERT INTO `w_admin_menu` VALUES (7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL);
INSERT INTO `w_admin_menu` VALUES (8, 0, 8, 'Redis manager', 'fa-database', 'redis', NULL, '2019-03-26 15:55:07', '2019-03-26 15:55:07');
INSERT INTO `w_admin_menu` VALUES (9, 0, 0, 'API管理', 'fa-link', 'apis', NULL, '2019-03-26 16:04:11', '2019-03-26 16:11:55');
INSERT INTO `w_admin_menu` VALUES (10, 0, 0, 'APP管理', 'fa-apple', 'apps', NULL, '2019-03-26 16:04:20', '2019-03-26 16:11:30');
INSERT INTO `w_admin_menu` VALUES (11, 0, 0, '系统管理', 'fa-gears', 'settings', NULL, '2019-03-26 16:04:34', '2019-03-26 16:04:58');
INSERT INTO `w_admin_menu` VALUES (12, 0, 0, '系统环境', 'fa-rocket', 'sys', NULL, '2019-03-26 17:36:53', '2019-03-26 17:36:53');
INSERT INTO `w_admin_menu` VALUES (13, 0, 0, '用户管理', 'fa-user', 'users', NULL, '2019-03-29 17:14:16', '2019-03-29 17:18:39');
INSERT INTO `w_admin_menu` VALUES (14, 0, 0, '设备管理', 'fa-cubes', 'devices', NULL, '2019-03-29 17:17:56', '2019-03-29 17:17:56');
INSERT INTO `w_admin_menu` VALUES (15, 0, 0, '分组管理', 'fa-columns', 'groups', NULL, '2019-03-29 17:21:03', '2019-03-29 17:21:03');

-- ----------------------------
-- Table structure for w_admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_operation_log`;
CREATE TABLE `w_admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `w_admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 288 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_admin_operation_log
-- ----------------------------
INSERT INTO `w_admin_operation_log` VALUES (1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-03-26 15:53:15', '2019-03-26 15:53:15');
INSERT INTO `w_admin_operation_log` VALUES (2, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 15:53:22', '2019-03-26 15:53:22');
INSERT INTO `w_admin_operation_log` VALUES (3, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-03-26 15:55:12', '2019-03-26 15:55:12');
INSERT INTO `w_admin_operation_log` VALUES (4, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 15:56:41', '2019-03-26 15:56:41');
INSERT INTO `w_admin_operation_log` VALUES (5, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 15:58:19', '2019-03-26 15:58:19');
INSERT INTO `w_admin_operation_log` VALUES (6, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 15:58:20', '2019-03-26 15:58:20');
INSERT INTO `w_admin_operation_log` VALUES (7, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:21', '2019-03-26 15:58:21');
INSERT INTO `w_admin_operation_log` VALUES (8, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:22', '2019-03-26 15:58:22');
INSERT INTO `w_admin_operation_log` VALUES (9, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:24', '2019-03-26 15:58:24');
INSERT INTO `w_admin_operation_log` VALUES (10, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:25', '2019-03-26 15:58:25');
INSERT INTO `w_admin_operation_log` VALUES (11, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:26', '2019-03-26 15:58:26');
INSERT INTO `w_admin_operation_log` VALUES (12, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:27', '2019-03-26 15:58:27');
INSERT INTO `w_admin_operation_log` VALUES (13, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:29', '2019-03-26 15:58:29');
INSERT INTO `w_admin_operation_log` VALUES (14, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:30', '2019-03-26 15:58:30');
INSERT INTO `w_admin_operation_log` VALUES (15, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:31', '2019-03-26 15:58:31');
INSERT INTO `w_admin_operation_log` VALUES (16, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:32', '2019-03-26 15:58:32');
INSERT INTO `w_admin_operation_log` VALUES (17, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:34', '2019-03-26 15:58:34');
INSERT INTO `w_admin_operation_log` VALUES (18, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:35', '2019-03-26 15:58:35');
INSERT INTO `w_admin_operation_log` VALUES (19, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:36', '2019-03-26 15:58:36');
INSERT INTO `w_admin_operation_log` VALUES (20, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:37', '2019-03-26 15:58:37');
INSERT INTO `w_admin_operation_log` VALUES (21, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:39', '2019-03-26 15:58:39');
INSERT INTO `w_admin_operation_log` VALUES (22, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:40', '2019-03-26 15:58:40');
INSERT INTO `w_admin_operation_log` VALUES (23, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:41', '2019-03-26 15:58:41');
INSERT INTO `w_admin_operation_log` VALUES (24, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:42', '2019-03-26 15:58:42');
INSERT INTO `w_admin_operation_log` VALUES (25, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:44', '2019-03-26 15:58:44');
INSERT INTO `w_admin_operation_log` VALUES (26, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:45', '2019-03-26 15:58:45');
INSERT INTO `w_admin_operation_log` VALUES (27, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-26 15:58:46', '2019-03-26 15:58:46');
INSERT INTO `w_admin_operation_log` VALUES (28, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 16:01:22', '2019-03-26 16:01:22');
INSERT INTO `w_admin_operation_log` VALUES (29, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:01:24', '2019-03-26 16:01:24');
INSERT INTO `w_admin_operation_log` VALUES (30, 1, 'admin/redis/edit', 'GET', '127.0.0.1', '{\"key\":\"api_token\",\"conn\":\"default\",\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:01:43', '2019-03-26 16:01:43');
INSERT INTO `w_admin_operation_log` VALUES (31, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:03:36', '2019-03-26 16:03:36');
INSERT INTO `w_admin_operation_log` VALUES (32, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"API\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"apis\",\"roles\":[null],\"permission\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\"}', '2019-03-26 16:04:11', '2019-03-26 16:04:11');
INSERT INTO `w_admin_operation_log` VALUES (33, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 16:04:11', '2019-03-26 16:04:11');
INSERT INTO `w_admin_operation_log` VALUES (34, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"APP\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\"}', '2019-03-26 16:04:19', '2019-03-26 16:04:19');
INSERT INTO `w_admin_operation_log` VALUES (35, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 16:04:20', '2019-03-26 16:04:20');
INSERT INTO `w_admin_operation_log` VALUES (36, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"settings\",\"roles\":[null],\"permission\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\"}', '2019-03-26 16:04:34', '2019-03-26 16:04:34');
INSERT INTO `w_admin_operation_log` VALUES (37, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 16:04:34', '2019-03-26 16:04:34');
INSERT INTO `w_admin_operation_log` VALUES (38, 1, 'admin/auth/menu/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:04:35', '2019-03-26 16:04:35');
INSERT INTO `w_admin_operation_log` VALUES (39, 1, 'admin/auth/menu/10', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"APP\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"apps\",\"roles\":[null],\"permission\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/auth\\/menu\"}', '2019-03-26 16:04:40', '2019-03-26 16:04:40');
INSERT INTO `w_admin_operation_log` VALUES (40, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 16:04:40', '2019-03-26 16:04:40');
INSERT INTO `w_admin_operation_log` VALUES (41, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 16:04:43', '2019-03-26 16:04:43');
INSERT INTO `w_admin_operation_log` VALUES (42, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:04:51', '2019-03-26 16:04:51');
INSERT INTO `w_admin_operation_log` VALUES (43, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-gears\",\"uri\":\"settings\",\"roles\":[null],\"permission\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/auth\\/menu\"}', '2019-03-26 16:04:58', '2019-03-26 16:04:58');
INSERT INTO `w_admin_operation_log` VALUES (44, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 16:04:58', '2019-03-26 16:04:58');
INSERT INTO `w_admin_operation_log` VALUES (45, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:05:00', '2019-03-26 16:05:00');
INSERT INTO `w_admin_operation_log` VALUES (46, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:05:05', '2019-03-26 16:05:05');
INSERT INTO `w_admin_operation_log` VALUES (47, 1, 'admin/auth/menu/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:05:07', '2019-03-26 16:05:07');
INSERT INTO `w_admin_operation_log` VALUES (48, 1, 'admin/auth/menu/10', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"APP\\u7ba1\\u7406\",\"icon\":\"fa-apple\",\"uri\":\"apps\",\"roles\":[null],\"permission\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/auth\\/menu\"}', '2019-03-26 16:11:30', '2019-03-26 16:11:30');
INSERT INTO `w_admin_operation_log` VALUES (49, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 16:11:31', '2019-03-26 16:11:31');
INSERT INTO `w_admin_operation_log` VALUES (50, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:11:33', '2019-03-26 16:11:33');
INSERT INTO `w_admin_operation_log` VALUES (51, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:11:37', '2019-03-26 16:11:37');
INSERT INTO `w_admin_operation_log` VALUES (52, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:11:41', '2019-03-26 16:11:41');
INSERT INTO `w_admin_operation_log` VALUES (53, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"API\\u7ba1\\u7406\",\"icon\":\"fa-link\",\"uri\":\"apis\",\"roles\":[null],\"permission\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/auth\\/menu\"}', '2019-03-26 16:11:55', '2019-03-26 16:11:55');
INSERT INTO `w_admin_operation_log` VALUES (54, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 16:11:55', '2019-03-26 16:11:55');
INSERT INTO `w_admin_operation_log` VALUES (55, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 16:11:58', '2019-03-26 16:11:58');
INSERT INTO `w_admin_operation_log` VALUES (56, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:11:59', '2019-03-26 16:11:59');
INSERT INTO `w_admin_operation_log` VALUES (57, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:12:01', '2019-03-26 16:12:01');
INSERT INTO `w_admin_operation_log` VALUES (58, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:12:02', '2019-03-26 16:12:02');
INSERT INTO `w_admin_operation_log` VALUES (59, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:12:03', '2019-03-26 16:12:03');
INSERT INTO `w_admin_operation_log` VALUES (60, 1, 'admin/apps/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:12:06', '2019-03-26 16:12:06');
INSERT INTO `w_admin_operation_log` VALUES (61, 1, 'admin/apps', 'POST', '127.0.0.1', '{\"plt\":\"29\",\"name\":\"\\u667a\\u751f\\u6d3b\",\"no\":\"zsh\",\"plt_key\":\"6720b1a5e59c16e1596468b5bf529ba8\",\"plt_secret\":\"70b48809e0305276c9defa82d51fb48c\",\"plt_token\":null,\"plt_test_key\":null,\"plt_test_secret\":null,\"refresh_token_time\":null,\"expire_time\":\"315360000\",\"env\":\"on\",\"fcm_server_key\":null,\"jpush_key\":null,\"jpush_secret\":null,\"baidu_voice_id\":null,\"baidu_voice_key\":null,\"baidu_voice_secret\":null,\"sms_id\":\"1400116928\",\"sms_tpl_id\":\"165638\",\"sms_key\":\"5b910acf44f62418b125d88601900e60\",\"sms_sign\":\"\\u503c\\u5f97\\u770b\",\"qiniu_key\":null,\"qiniu_secret\":null,\"per_page\":\"10\",\"ios\":null,\"android\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apps\"}', '2019-03-26 16:13:34', '2019-03-26 16:13:34');
INSERT INTO `w_admin_operation_log` VALUES (62, 1, 'admin/apps/create', 'GET', '127.0.0.1', '[]', '2019-03-26 16:13:34', '2019-03-26 16:13:34');
INSERT INTO `w_admin_operation_log` VALUES (63, 1, 'admin/apps', 'POST', '127.0.0.1', '{\"plt\":\"29\",\"name\":\"\\u667a\\u751f\\u6d3b\",\"no\":\"zsh\",\"plt_key\":\"6720b1a5e59c16e1596468b5bf529ba8\",\"plt_secret\":\"70b48809e0305276c9defa82d51fb48c\",\"plt_token\":null,\"plt_test_key\":null,\"plt_test_secret\":null,\"refresh_token_time\":null,\"expire_time\":\"315360000\",\"env\":\"on\",\"fcm_server_key\":null,\"jpush_key\":null,\"jpush_secret\":null,\"baidu_voice_id\":null,\"baidu_voice_key\":null,\"baidu_voice_secret\":null,\"sms_id\":\"1400116928\",\"sms_tpl_id\":\"165638\",\"sms_key\":\"5b910acf44f62418b125d88601900e60\",\"sms_sign\":\"\\u503c\\u5f97\\u770b\",\"qiniu_key\":null,\"qiniu_secret\":null,\"per_page\":\"10\",\"ios\":null,\"android\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\"}', '2019-03-26 16:15:43', '2019-03-26 16:15:43');
INSERT INTO `w_admin_operation_log` VALUES (64, 1, 'admin/apps/create', 'GET', '127.0.0.1', '[]', '2019-03-26 16:15:44', '2019-03-26 16:15:44');
INSERT INTO `w_admin_operation_log` VALUES (65, 1, 'admin/apps', 'POST', '127.0.0.1', '{\"plt\":\"29\",\"name\":\"\\u667a\\u751f\\u6d3b\",\"no\":\"zsh\",\"plt_key\":\"6720b1a5e59c16e1596468b5bf529ba8\",\"plt_secret\":\"70b48809e0305276c9defa82d51fb48c\",\"plt_token\":null,\"plt_test_key\":null,\"plt_test_secret\":null,\"refresh_token_time\":null,\"expire_time\":\"315360000\",\"env\":\"on\",\"fcm_server_key\":null,\"jpush_key\":null,\"jpush_secret\":null,\"baidu_voice_id\":null,\"baidu_voice_key\":null,\"baidu_voice_secret\":null,\"sms_id\":\"1400116928\",\"sms_tpl_id\":\"165638\",\"sms_key\":\"5b910acf44f62418b125d88601900e60\",\"sms_sign\":\"\\u503c\\u5f97\\u770b\",\"qiniu_key\":null,\"qiniu_secret\":null,\"per_page\":\"10\",\"ios\":null,\"android\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\"}', '2019-03-26 16:17:07', '2019-03-26 16:17:07');
INSERT INTO `w_admin_operation_log` VALUES (66, 1, 'admin/apps/create', 'GET', '127.0.0.1', '[]', '2019-03-26 16:17:08', '2019-03-26 16:17:08');
INSERT INTO `w_admin_operation_log` VALUES (67, 1, 'admin/apps', 'POST', '127.0.0.1', '{\"plt\":\"29\",\"name\":\"\\u667a\\u751f\\u6d3b\",\"no\":\"zsh\",\"plt_key\":\"6720b1a5e59c16e1596468b5bf529ba8\",\"plt_secret\":\"70b48809e0305276c9defa82d51fb48c\",\"plt_token\":null,\"plt_test_key\":null,\"plt_test_secret\":null,\"refresh_token_time\":null,\"expire_time\":\"315360000\",\"env\":\"on\",\"fcm_server_key\":null,\"jpush_key\":null,\"jpush_secret\":null,\"baidu_voice_id\":null,\"baidu_voice_key\":null,\"baidu_voice_secret\":null,\"sms_id\":\"1400116928\",\"sms_tpl_id\":\"165638\",\"sms_key\":\"5b910acf44f62418b125d88601900e60\",\"sms_sign\":\"\\u503c\\u5f97\\u770b\",\"qiniu_key\":null,\"qiniu_secret\":null,\"per_page\":\"10\",\"ios\":null,\"android\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\"}', '2019-03-26 16:19:59', '2019-03-26 16:19:59');
INSERT INTO `w_admin_operation_log` VALUES (68, 1, 'admin/apps/create', 'GET', '127.0.0.1', '[]', '2019-03-26 16:19:59', '2019-03-26 16:19:59');
INSERT INTO `w_admin_operation_log` VALUES (69, 1, 'admin/apps/create', 'GET', '127.0.0.1', '[]', '2019-03-26 16:20:06', '2019-03-26 16:20:06');
INSERT INTO `w_admin_operation_log` VALUES (70, 1, 'admin/apps', 'POST', '127.0.0.1', '{\"plt\":null,\"name\":\"\\u667a\\u751f\\u6d3b\",\"no\":\"zsh\",\"plt_key\":\"6720b1a5e59c16e1596468b5bf529ba8\",\"plt_secret\":\"70b48809e0305276c9defa82d51fb48c\",\"plt_token\":null,\"plt_test_key\":null,\"plt_test_secret\":null,\"refresh_token_time\":null,\"expire_time\":\"315360000\",\"env\":\"on\",\"fcm_server_key\":null,\"jpush_key\":null,\"jpush_secret\":null,\"baidu_voice_id\":null,\"baidu_voice_key\":null,\"baidu_voice_secret\":null,\"sms_id\":null,\"sms_tpl_id\":null,\"sms_key\":null,\"sms_sign\":null,\"qiniu_key\":null,\"qiniu_secret\":null,\"per_page\":\"10\",\"ios\":null,\"android\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\"}', '2019-03-26 16:20:14', '2019-03-26 16:20:14');
INSERT INTO `w_admin_operation_log` VALUES (71, 1, 'admin/apps/create', 'GET', '127.0.0.1', '[]', '2019-03-26 16:20:14', '2019-03-26 16:20:14');
INSERT INTO `w_admin_operation_log` VALUES (72, 1, 'admin/apps', 'POST', '127.0.0.1', '{\"plt\":\"29\",\"name\":\"\\u667a\\u751f\\u6d3b\",\"no\":\"zsh\",\"plt_key\":\"6720b1a5e59c16e1596468b5bf529ba8\",\"plt_secret\":\"70b48809e0305276c9defa82d51fb48c\",\"plt_token\":null,\"plt_test_key\":null,\"plt_test_secret\":null,\"refresh_token_time\":null,\"expire_time\":\"315360000\",\"env\":\"on\",\"fcm_server_key\":null,\"jpush_key\":null,\"jpush_secret\":null,\"baidu_voice_id\":null,\"baidu_voice_key\":null,\"baidu_voice_secret\":null,\"sms_id\":null,\"sms_tpl_id\":null,\"sms_key\":null,\"sms_sign\":null,\"qiniu_key\":null,\"qiniu_secret\":null,\"per_page\":\"10\",\"ios\":null,\"android\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\"}', '2019-03-26 16:20:19', '2019-03-26 16:20:19');
INSERT INTO `w_admin_operation_log` VALUES (73, 1, 'admin/apps/create', 'GET', '127.0.0.1', '[]', '2019-03-26 16:20:19', '2019-03-26 16:20:19');
INSERT INTO `w_admin_operation_log` VALUES (74, 1, 'admin/apps', 'POST', '127.0.0.1', '{\"plt\":\"29\",\"name\":\"\\u667a\\u751f\\u6d3b\",\"no\":\"zsh\",\"plt_key\":\"6720b1a5e59c16e1596468b5bf529ba8\",\"plt_secret\":\"70b48809e0305276c9defa82d51fb48c\",\"plt_token\":null,\"plt_test_key\":null,\"plt_test_secret\":null,\"refresh_token_time\":null,\"expire_time\":\"315360000\",\"env\":\"on\",\"fcm_server_key\":null,\"jpush_key\":null,\"jpush_secret\":null,\"baidu_voice_id\":null,\"baidu_voice_key\":null,\"baidu_voice_secret\":null,\"sms_id\":null,\"sms_tpl_id\":null,\"sms_key\":null,\"sms_sign\":null,\"qiniu_key\":null,\"qiniu_secret\":null,\"per_page\":\"10\",\"ios\":null,\"android\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\"}', '2019-03-26 16:21:54', '2019-03-26 16:21:54');
INSERT INTO `w_admin_operation_log` VALUES (75, 1, 'admin/apps/create', 'GET', '127.0.0.1', '[]', '2019-03-26 16:21:55', '2019-03-26 16:21:55');
INSERT INTO `w_admin_operation_log` VALUES (76, 1, 'admin/apps/create', 'GET', '127.0.0.1', '[]', '2019-03-26 16:22:25', '2019-03-26 16:22:25');
INSERT INTO `w_admin_operation_log` VALUES (77, 1, 'admin/apps/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:22:43', '2019-03-26 16:22:43');
INSERT INTO `w_admin_operation_log` VALUES (78, 1, 'admin/apps/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:22:48', '2019-03-26 16:22:48');
INSERT INTO `w_admin_operation_log` VALUES (79, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:22:51', '2019-03-26 16:22:51');
INSERT INTO `w_admin_operation_log` VALUES (80, 1, 'admin/apps/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:22:54', '2019-03-26 16:22:54');
INSERT INTO `w_admin_operation_log` VALUES (81, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:23:08', '2019-03-26 16:23:08');
INSERT INTO `w_admin_operation_log` VALUES (82, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:23:09', '2019-03-26 16:23:09');
INSERT INTO `w_admin_operation_log` VALUES (83, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:23:11', '2019-03-26 16:23:11');
INSERT INTO `w_admin_operation_log` VALUES (84, 1, 'admin/apps/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:23:13', '2019-03-26 16:23:13');
INSERT INTO `w_admin_operation_log` VALUES (85, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:23:14', '2019-03-26 16:23:14');
INSERT INTO `w_admin_operation_log` VALUES (86, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:23:16', '2019-03-26 16:23:16');
INSERT INTO `w_admin_operation_log` VALUES (87, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:28:51', '2019-03-26 16:28:51');
INSERT INTO `w_admin_operation_log` VALUES (88, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:28:52', '2019-03-26 16:28:52');
INSERT INTO `w_admin_operation_log` VALUES (89, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:28:53', '2019-03-26 16:28:53');
INSERT INTO `w_admin_operation_log` VALUES (90, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:28:54', '2019-03-26 16:28:54');
INSERT INTO `w_admin_operation_log` VALUES (91, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:31:52', '2019-03-26 16:31:52');
INSERT INTO `w_admin_operation_log` VALUES (92, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:32:11', '2019-03-26 16:32:11');
INSERT INTO `w_admin_operation_log` VALUES (93, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:32:15', '2019-03-26 16:32:15');
INSERT INTO `w_admin_operation_log` VALUES (94, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u83b7\\u53d6token\",\"name\":\"token\",\"url\":\"\\/v3\\/token\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 16:32:52', '2019-03-26 16:32:52');
INSERT INTO `w_admin_operation_log` VALUES (95, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 16:32:52', '2019-03-26 16:32:52');
INSERT INTO `w_admin_operation_log` VALUES (96, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:33:07', '2019-03-26 16:33:07');
INSERT INTO `w_admin_operation_log` VALUES (97, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u8bbe\\u5907\",\"name\":\"cameras\",\"url\":\"\\/v3\\/cameras\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 16:33:33', '2019-03-26 16:33:33');
INSERT INTO `w_admin_operation_log` VALUES (98, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 16:33:33', '2019-03-26 16:33:33');
INSERT INTO `w_admin_operation_log` VALUES (99, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 16:33:58', '2019-03-26 16:33:58');
INSERT INTO `w_admin_operation_log` VALUES (100, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u8bbe\\u59072\",\"name\":\"devices\",\"url\":\"\\/v3\\/devices\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 16:34:07', '2019-03-26 16:34:07');
INSERT INTO `w_admin_operation_log` VALUES (101, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 16:34:08', '2019-03-26 16:34:08');
INSERT INTO `w_admin_operation_log` VALUES (102, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:01:48', '2019-03-26 17:01:48');
INSERT INTO `w_admin_operation_log` VALUES (103, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u8bbe\\u5907\\u72b6\\u6001\",\"name\":\"status\",\"url\":\"\\/v3\\/cameras\\/simple\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:02:01', '2019-03-26 17:02:01');
INSERT INTO `w_admin_operation_log` VALUES (104, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:02:01', '2019-03-26 17:02:01');
INSERT INTO `w_admin_operation_log` VALUES (105, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:02:13', '2019-03-26 17:02:13');
INSERT INTO `w_admin_operation_log` VALUES (106, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u8bbe\\u5907\\u8be6\\u7ec6\\u72b6\\u6001\",\"name\":\"status_detail\",\"url\":\"\\/v3\\/cameras\\/all\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:02:49', '2019-03-26 17:02:49');
INSERT INTO `w_admin_operation_log` VALUES (107, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:02:49', '2019-03-26 17:02:49');
INSERT INTO `w_admin_operation_log` VALUES (108, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:05:05', '2019-03-26 17:05:05');
INSERT INTO `w_admin_operation_log` VALUES (109, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u5f85\\u673a\\u8bbe\\u7f6e\",\"name\":\"await\",\"url\":\"\\/v3\\/cam\\/set_await\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:05:45', '2019-03-26 17:05:45');
INSERT INTO `w_admin_operation_log` VALUES (110, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:05:45', '2019-03-26 17:05:45');
INSERT INTO `w_admin_operation_log` VALUES (111, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:05:49', '2019-03-26 17:05:49');
INSERT INTO `w_admin_operation_log` VALUES (112, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u5f85\\u673a\\u67e5\\u8be2\",\"name\":\"awaits\",\"url\":\"\\/v3\\/cam\\/get_await\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:06:05', '2019-03-26 17:06:05');
INSERT INTO `w_admin_operation_log` VALUES (113, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:06:05', '2019-03-26 17:06:05');
INSERT INTO `w_admin_operation_log` VALUES (114, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:09:21', '2019-03-26 17:09:21');
INSERT INTO `w_admin_operation_log` VALUES (115, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u683c\\u5f0f\\u5316TF\\u5361\",\"name\":\"format\",\"url\":\"\\/v3\\/cam\\/format_card\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:09:57', '2019-03-26 17:09:57');
INSERT INTO `w_admin_operation_log` VALUES (116, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:09:58', '2019-03-26 17:09:58');
INSERT INTO `w_admin_operation_log` VALUES (117, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:10:03', '2019-03-26 17:10:03');
INSERT INTO `w_admin_operation_log` VALUES (118, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"TF\\u5361\\u683c\\u5f0f\\u5316\\u72b6\\u6001\",\"name\":\"formats\",\"url\":\"\\/v3\\/cam\\/format_card_status\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:10:28', '2019-03-26 17:10:28');
INSERT INTO `w_admin_operation_log` VALUES (119, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:10:28', '2019-03-26 17:10:28');
INSERT INTO `w_admin_operation_log` VALUES (120, 1, 'admin/apis/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:10:31', '2019-03-26 17:10:31');
INSERT INTO `w_admin_operation_log` VALUES (121, 1, 'admin/apis/8', 'PUT', '127.0.0.1', '{\"brief\":\"TF\\u5361\\u683c\\u5f0f\\u5316\",\"name\":\"format\",\"url\":\"\\/v3\\/cam\\/format_card\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:10:34', '2019-03-26 17:10:34');
INSERT INTO `w_admin_operation_log` VALUES (122, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:10:34', '2019-03-26 17:10:34');
INSERT INTO `w_admin_operation_log` VALUES (123, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:10:59', '2019-03-26 17:10:59');
INSERT INTO `w_admin_operation_log` VALUES (124, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u56fa\\u4ef6\",\"name\":\"firmware\",\"url\":\"\\/v3\\/version\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:11:33', '2019-03-26 17:11:33');
INSERT INTO `w_admin_operation_log` VALUES (125, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:11:34', '2019-03-26 17:11:34');
INSERT INTO `w_admin_operation_log` VALUES (126, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:12:26', '2019-03-26 17:12:26');
INSERT INTO `w_admin_operation_log` VALUES (127, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u56fa\\u4ef6\\u5347\\u7ea7\\u72b6\\u6001\",\"name\":\"firmwares\",\"url\":\"\\/v3\\/versionresult\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:12:40', '2019-03-26 17:12:40');
INSERT INTO `w_admin_operation_log` VALUES (128, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:12:40', '2019-03-26 17:12:40');
INSERT INTO `w_admin_operation_log` VALUES (129, 1, 'admin/apis/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:12:45', '2019-03-26 17:12:45');
INSERT INTO `w_admin_operation_log` VALUES (130, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:12:47', '2019-03-26 17:12:47');
INSERT INTO `w_admin_operation_log` VALUES (131, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:13:45', '2019-03-26 17:13:45');
INSERT INTO `w_admin_operation_log` VALUES (132, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:14:33', '2019-03-26 17:14:33');
INSERT INTO `w_admin_operation_log` VALUES (133, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:14:34', '2019-03-26 17:14:34');
INSERT INTO `w_admin_operation_log` VALUES (134, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u706f\",\"name\":\"lamp\",\"url\":\"\\/v3\\/cam\\/lamp_ctl\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:14:42', '2019-03-26 17:14:42');
INSERT INTO `w_admin_operation_log` VALUES (135, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:14:42', '2019-03-26 17:14:42');
INSERT INTO `w_admin_operation_log` VALUES (136, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:14:48', '2019-03-26 17:14:48');
INSERT INTO `w_admin_operation_log` VALUES (137, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u706f\\u72b6\\u6001\",\"name\":\"lamps\",\"url\":\"\\/v3\\/cam\\/lamp_status\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:14:58', '2019-03-26 17:14:58');
INSERT INTO `w_admin_operation_log` VALUES (138, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:14:58', '2019-03-26 17:14:58');
INSERT INTO `w_admin_operation_log` VALUES (139, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:15:20', '2019-03-26 17:15:20');
INSERT INTO `w_admin_operation_log` VALUES (140, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u65f6\\u533a\",\"name\":\"timezone\",\"url\":\"\\/v3\\/timezone\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:15:34', '2019-03-26 17:15:34');
INSERT INTO `w_admin_operation_log` VALUES (141, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:15:35', '2019-03-26 17:15:35');
INSERT INTO `w_admin_operation_log` VALUES (142, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:15:43', '2019-03-26 17:15:43');
INSERT INTO `w_admin_operation_log` VALUES (143, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u5206\\u8fa8\\u7387\",\"name\":\"rate\",\"url\":\"\\/v3\\/rate\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:16:00', '2019-03-26 17:16:00');
INSERT INTO `w_admin_operation_log` VALUES (144, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:16:00', '2019-03-26 17:16:00');
INSERT INTO `w_admin_operation_log` VALUES (145, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:16:18', '2019-03-26 17:16:18');
INSERT INTO `w_admin_operation_log` VALUES (146, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u4e8b\\u4ef6\\u5f00\\u5173\",\"name\":\"event\",\"url\":\"\\/v3\\/cam\\/set_event\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:16:53', '2019-03-26 17:16:53');
INSERT INTO `w_admin_operation_log` VALUES (147, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:16:53', '2019-03-26 17:16:53');
INSERT INTO `w_admin_operation_log` VALUES (148, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:17:03', '2019-03-26 17:17:03');
INSERT INTO `w_admin_operation_log` VALUES (149, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u4e8b\\u4ef6\\u5f00\\u5173\\u72b6\\u6001\",\"name\":\"events\",\"url\":\"\\/v3\\/cam\\/set_event\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:17:14', '2019-03-26 17:17:14');
INSERT INTO `w_admin_operation_log` VALUES (150, 1, 'admin/apis/create', 'GET', '127.0.0.1', '[]', '2019-03-26 17:17:14', '2019-03-26 17:17:14');
INSERT INTO `w_admin_operation_log` VALUES (151, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u4e8b\\u4ef6\\u5f00\\u5173\\u72b6\\u6001\",\"name\":\"events\",\"url\":\"\\/v3\\/cam\\/get_event\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\"}', '2019-03-26 17:17:24', '2019-03-26 17:17:24');
INSERT INTO `w_admin_operation_log` VALUES (152, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:17:24', '2019-03-26 17:17:24');
INSERT INTO `w_admin_operation_log` VALUES (153, 1, 'admin/apis/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:24:04', '2019-03-26 17:24:04');
INSERT INTO `w_admin_operation_log` VALUES (154, 1, 'admin/apis', 'POST', '127.0.0.1', '{\"brief\":\"\\u9884\\u7f6e\\u70b9\",\"name\":\"preset\",\"url\":\"\\/v3\\/preset\",\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/apis\"}', '2019-03-26 17:24:17', '2019-03-26 17:24:17');
INSERT INTO `w_admin_operation_log` VALUES (155, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:24:17', '2019-03-26 17:24:17');
INSERT INTO `w_admin_operation_log` VALUES (156, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:32:58', '2019-03-26 17:32:58');
INSERT INTO `w_admin_operation_log` VALUES (157, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:32:59', '2019-03-26 17:32:59');
INSERT INTO `w_admin_operation_log` VALUES (158, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:33:00', '2019-03-26 17:33:00');
INSERT INTO `w_admin_operation_log` VALUES (159, 1, 'admin/apps', 'GET', '127.0.0.1', '[]', '2019-03-26 17:34:36', '2019-03-26 17:34:36');
INSERT INTO `w_admin_operation_log` VALUES (160, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:34:50', '2019-03-26 17:34:50');
INSERT INTO `w_admin_operation_log` VALUES (161, 1, 'admin/settings', 'GET', '127.0.0.1', '[]', '2019-03-26 17:35:38', '2019-03-26 17:35:38');
INSERT INTO `w_admin_operation_log` VALUES (162, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:35:40', '2019-03-26 17:35:40');
INSERT INTO `w_admin_operation_log` VALUES (163, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:35:41', '2019-03-26 17:35:41');
INSERT INTO `w_admin_operation_log` VALUES (164, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:35:42', '2019-03-26 17:35:42');
INSERT INTO `w_admin_operation_log` VALUES (165, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:35:45', '2019-03-26 17:35:45');
INSERT INTO `w_admin_operation_log` VALUES (166, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:35:49', '2019-03-26 17:35:49');
INSERT INTO `w_admin_operation_log` VALUES (167, 1, 'admin/auth/menu/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:35:51', '2019-03-26 17:35:51');
INSERT INTO `w_admin_operation_log` VALUES (168, 1, 'admin/auth/menu/1', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4eea\\u8868\\u76d8\",\"icon\":\"fa-dashboard\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/auth\\/menu\"}', '2019-03-26 17:36:15', '2019-03-26 17:36:15');
INSERT INTO `w_admin_operation_log` VALUES (169, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 17:36:15', '2019-03-26 17:36:15');
INSERT INTO `w_admin_operation_log` VALUES (170, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 17:36:18', '2019-03-26 17:36:18');
INSERT INTO `w_admin_operation_log` VALUES (171, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:36:21', '2019-03-26 17:36:21');
INSERT INTO `w_admin_operation_log` VALUES (172, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:36:23', '2019-03-26 17:36:23');
INSERT INTO `w_admin_operation_log` VALUES (173, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:36:30', '2019-03-26 17:36:30');
INSERT INTO `w_admin_operation_log` VALUES (174, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u73af\\u5883\",\"icon\":\"fa-rocket\",\"uri\":\"sys\",\"roles\":[null],\"permission\":null,\"_token\":\"FIkPp4KSh4LAoJlPWHEoBexhoY3xG0wXFSEVPzNE\"}', '2019-03-26 17:36:53', '2019-03-26 17:36:53');
INSERT INTO `w_admin_operation_log` VALUES (175, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 17:36:53', '2019-03-26 17:36:53');
INSERT INTO `w_admin_operation_log` VALUES (176, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-26 17:36:55', '2019-03-26 17:36:55');
INSERT INTO `w_admin_operation_log` VALUES (177, 1, 'admin/sys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:36:57', '2019-03-26 17:36:57');
INSERT INTO `w_admin_operation_log` VALUES (178, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:37:10', '2019-03-26 17:37:10');
INSERT INTO `w_admin_operation_log` VALUES (179, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:38:16', '2019-03-26 17:38:16');
INSERT INTO `w_admin_operation_log` VALUES (180, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:39:08', '2019-03-26 17:39:08');
INSERT INTO `w_admin_operation_log` VALUES (181, 1, 'admin/apis', 'GET', '127.0.0.1', '[]', '2019-03-26 17:55:00', '2019-03-26 17:55:00');
INSERT INTO `w_admin_operation_log` VALUES (182, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:55:07', '2019-03-26 17:55:07');
INSERT INTO `w_admin_operation_log` VALUES (183, 1, 'admin/redis/edit', 'GET', '127.0.0.1', '{\"key\":\"sys\",\"conn\":\"default\",\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:55:14', '2019-03-26 17:55:14');
INSERT INTO `w_admin_operation_log` VALUES (184, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:55:18', '2019-03-26 17:55:18');
INSERT INTO `w_admin_operation_log` VALUES (185, 1, 'admin/redis/edit', 'GET', '127.0.0.1', '{\"key\":\"plt_29\",\"conn\":\"default\",\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:55:20', '2019-03-26 17:55:20');
INSERT INTO `w_admin_operation_log` VALUES (186, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:55:22', '2019-03-26 17:55:22');
INSERT INTO `w_admin_operation_log` VALUES (187, 1, 'admin/redis/edit', 'GET', '127.0.0.1', '{\"key\":\"api_cameras\",\"conn\":\"default\",\"_pjax\":\"#pjax-container\"}', '2019-03-26 17:56:26', '2019-03-26 17:56:26');
INSERT INTO `w_admin_operation_log` VALUES (188, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-03-27 09:42:35', '2019-03-27 09:42:35');
INSERT INTO `w_admin_operation_log` VALUES (189, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 09:42:38', '2019-03-27 09:42:38');
INSERT INTO `w_admin_operation_log` VALUES (190, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 09:42:42', '2019-03-27 09:42:42');
INSERT INTO `w_admin_operation_log` VALUES (191, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 09:42:44', '2019-03-27 09:42:44');
INSERT INTO `w_admin_operation_log` VALUES (192, 1, 'admin/redis/edit', 'GET', '127.0.0.1', '{\"key\":\"plt_29\",\"conn\":\"default\",\"_pjax\":\"#pjax-container\"}', '2019-03-27 09:42:59', '2019-03-27 09:42:59');
INSERT INTO `w_admin_operation_log` VALUES (193, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 09:43:04', '2019-03-27 09:43:04');
INSERT INTO `w_admin_operation_log` VALUES (194, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 09:43:07', '2019-03-27 09:43:07');
INSERT INTO `w_admin_operation_log` VALUES (195, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 09:43:08', '2019-03-27 09:43:08');
INSERT INTO `w_admin_operation_log` VALUES (196, 1, 'admin/sys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 09:43:09', '2019-03-27 09:43:09');
INSERT INTO `w_admin_operation_log` VALUES (197, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 09:43:10', '2019-03-27 09:43:10');
INSERT INTO `w_admin_operation_log` VALUES (198, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-03-27 15:26:04', '2019-03-27 15:26:04');
INSERT INTO `w_admin_operation_log` VALUES (199, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 15:42:22', '2019-03-27 15:42:22');
INSERT INTO `w_admin_operation_log` VALUES (200, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"conn\":\"cache\",\"_pjax\":\"#pjax-container\"}', '2019-03-27 15:42:28', '2019-03-27 15:42:28');
INSERT INTO `w_admin_operation_log` VALUES (201, 1, 'admin/redis/edit', 'GET', '127.0.0.1', '{\"key\":\"test\",\"conn\":\"cache\",\"_pjax\":\"#pjax-container\"}', '2019-03-27 15:42:31', '2019-03-27 15:42:31');
INSERT INTO `w_admin_operation_log` VALUES (202, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 15:42:35', '2019-03-27 15:42:35');
INSERT INTO `w_admin_operation_log` VALUES (203, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 17:03:07', '2019-03-27 17:03:07');
INSERT INTO `w_admin_operation_log` VALUES (204, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 17:03:10', '2019-03-27 17:03:10');
INSERT INTO `w_admin_operation_log` VALUES (205, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 17:03:27', '2019-03-27 17:03:27');
INSERT INTO `w_admin_operation_log` VALUES (206, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-27 17:07:14', '2019-03-27 17:07:14');
INSERT INTO `w_admin_operation_log` VALUES (207, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-03-27 18:46:29', '2019-03-27 18:46:29');
INSERT INTO `w_admin_operation_log` VALUES (208, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-03-28 11:21:26', '2019-03-28 11:21:26');
INSERT INTO `w_admin_operation_log` VALUES (209, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 11:21:28', '2019-03-28 11:21:28');
INSERT INTO `w_admin_operation_log` VALUES (210, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 11:21:29', '2019-03-28 11:21:29');
INSERT INTO `w_admin_operation_log` VALUES (211, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 11:21:30', '2019-03-28 11:21:30');
INSERT INTO `w_admin_operation_log` VALUES (212, 1, 'admin/sys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 11:21:30', '2019-03-28 11:21:30');
INSERT INTO `w_admin_operation_log` VALUES (213, 1, 'admin/settings', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 11:21:31', '2019-03-28 11:21:31');
INSERT INTO `w_admin_operation_log` VALUES (214, 1, 'admin/sys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 11:24:06', '2019-03-28 11:24:06');
INSERT INTO `w_admin_operation_log` VALUES (215, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 14:23:19', '2019-03-28 14:23:19');
INSERT INTO `w_admin_operation_log` VALUES (216, 1, 'admin/redis/edit', 'GET', '127.0.0.1', '{\"key\":\"api_cameras\",\"conn\":\"default\",\"_pjax\":\"#pjax-container\"}', '2019-03-28 14:23:24', '2019-03-28 14:23:24');
INSERT INTO `w_admin_operation_log` VALUES (217, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 14:23:27', '2019-03-28 14:23:27');
INSERT INTO `w_admin_operation_log` VALUES (218, 1, 'admin/redis/edit', 'GET', '127.0.0.1', '{\"key\":\"plt_29\",\"conn\":\"default\",\"_pjax\":\"#pjax-container\"}', '2019-03-28 14:23:32', '2019-03-28 14:23:32');
INSERT INTO `w_admin_operation_log` VALUES (219, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 14:23:34', '2019-03-28 14:23:34');
INSERT INTO `w_admin_operation_log` VALUES (220, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-28 14:23:40', '2019-03-28 14:23:40');
INSERT INTO `w_admin_operation_log` VALUES (221, 1, 'admin/redis/key', 'DELETE', '127.0.0.1', '{\"conn\":\"default\",\"key\":\"plt_29\",\"_token\":\"582Vz3kgwpRNZjLuMzxXx0CvzHKo4GKEzgb5YwAv\"}', '2019-03-28 14:23:44', '2019-03-28 14:23:44');
INSERT INTO `w_admin_operation_log` VALUES (222, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 14:23:44', '2019-03-28 14:23:44');
INSERT INTO `w_admin_operation_log` VALUES (223, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-28 14:23:47', '2019-03-28 14:23:47');
INSERT INTO `w_admin_operation_log` VALUES (224, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-28 14:23:57', '2019-03-28 14:23:57');
INSERT INTO `w_admin_operation_log` VALUES (225, 1, 'admin/redis/edit', 'GET', '127.0.0.1', '{\"key\":\"plt_29\",\"conn\":\"default\",\"_pjax\":\"#pjax-container\"}', '2019-03-28 14:24:09', '2019-03-28 14:24:09');
INSERT INTO `w_admin_operation_log` VALUES (226, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 14:24:22', '2019-03-28 14:24:22');
INSERT INTO `w_admin_operation_log` VALUES (227, 1, 'admin/redis/edit', 'GET', '127.0.0.1', '{\"key\":\"sys\",\"conn\":\"default\",\"_pjax\":\"#pjax-container\"}', '2019-03-28 14:24:25', '2019-03-28 14:24:25');
INSERT INTO `w_admin_operation_log` VALUES (228, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 14:24:29', '2019-03-28 14:24:29');
INSERT INTO `w_admin_operation_log` VALUES (229, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-28 17:14:25', '2019-03-28 17:14:25');
INSERT INTO `w_admin_operation_log` VALUES (230, 1, 'admin/redis/edit', 'GET', '127.0.0.1', '{\"key\":\"api_token\",\"conn\":\"default\",\"_pjax\":\"#pjax-container\"}', '2019-03-28 17:16:57', '2019-03-28 17:16:57');
INSERT INTO `w_admin_operation_log` VALUES (231, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 17:16:59', '2019-03-28 17:16:59');
INSERT INTO `w_admin_operation_log` VALUES (232, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-28 17:37:09', '2019-03-28 17:37:09');
INSERT INTO `w_admin_operation_log` VALUES (233, 1, 'admin/redis/edit', 'GET', '127.0.0.1', '{\"key\":\"ut_e1cc5faa2807ebafc5a0dd994141547d\",\"conn\":\"default\",\"_pjax\":\"#pjax-container\"}', '2019-03-28 17:37:13', '2019-03-28 17:37:13');
INSERT INTO `w_admin_operation_log` VALUES (234, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 17:37:15', '2019-03-28 17:37:15');
INSERT INTO `w_admin_operation_log` VALUES (235, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-28 17:38:25', '2019-03-28 17:38:25');
INSERT INTO `w_admin_operation_log` VALUES (236, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-28 17:39:13', '2019-03-28 17:39:13');
INSERT INTO `w_admin_operation_log` VALUES (237, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-28 17:39:45', '2019-03-28 17:39:45');
INSERT INTO `w_admin_operation_log` VALUES (238, 1, 'admin/redis/edit', 'GET', '127.0.0.1', '{\"key\":\"ut_076c9d0bf155baaf132ba87b18f14ac4\",\"conn\":\"default\",\"_pjax\":\"#pjax-container\"}', '2019-03-28 17:39:47', '2019-03-28 17:39:47');
INSERT INTO `w_admin_operation_log` VALUES (239, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 17:39:49', '2019-03-28 17:39:49');
INSERT INTO `w_admin_operation_log` VALUES (240, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-28 17:45:48', '2019-03-28 17:45:48');
INSERT INTO `w_admin_operation_log` VALUES (241, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-28 18:27:14', '2019-03-28 18:27:14');
INSERT INTO `w_admin_operation_log` VALUES (242, 1, 'admin/redis/key', 'DELETE', '127.0.0.1', '{\"conn\":\"default\",\"key\":\"ut_076c9d0bf155baaf132ba87b18f14ac4\",\"_token\":\"rQKqDZMoumj1hOOXuxC2AzCF1aMCaOeTsZpUk27E\"}', '2019-03-28 18:27:17', '2019-03-28 18:27:17');
INSERT INTO `w_admin_operation_log` VALUES (243, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-28 18:27:18', '2019-03-28 18:27:18');
INSERT INTO `w_admin_operation_log` VALUES (244, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-28 18:27:50', '2019-03-28 18:27:50');
INSERT INTO `w_admin_operation_log` VALUES (245, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-28 18:36:51', '2019-03-28 18:36:51');
INSERT INTO `w_admin_operation_log` VALUES (246, 1, 'admin', 'GET', '127.0.0.1', '[]', '2019-03-29 16:25:37', '2019-03-29 16:25:37');
INSERT INTO `w_admin_operation_log` VALUES (247, 1, 'admin/redis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 16:25:39', '2019-03-29 16:25:39');
INSERT INTO `w_admin_operation_log` VALUES (248, 1, 'admin/redis', 'GET', '127.0.0.1', '[]', '2019-03-29 16:46:55', '2019-03-29 16:46:55');
INSERT INTO `w_admin_operation_log` VALUES (249, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:13:12', '2019-03-29 17:13:12');
INSERT INTO `w_admin_operation_log` VALUES (250, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:13:33', '2019-03-29 17:13:33');
INSERT INTO `w_admin_operation_log` VALUES (251, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":\"\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"GSN7HL4DOZpeJ2mLSTu2OoaKibHDut1RtS1qN42B\"}', '2019-03-29 17:14:16', '2019-03-29 17:14:16');
INSERT INTO `w_admin_operation_log` VALUES (252, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-29 17:14:16', '2019-03-29 17:14:16');
INSERT INTO `w_admin_operation_log` VALUES (253, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8bbe\\u5907\\u7ba1\\u7406\",\"icon\":\"fa-cubes\",\"uri\":\"devices\",\"roles\":[null],\"permission\":null,\"_token\":\"GSN7HL4DOZpeJ2mLSTu2OoaKibHDut1RtS1qN42B\"}', '2019-03-29 17:17:55', '2019-03-29 17:17:55');
INSERT INTO `w_admin_operation_log` VALUES (254, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-29 17:17:56', '2019-03-29 17:17:56');
INSERT INTO `w_admin_operation_log` VALUES (255, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:17:59', '2019-03-29 17:17:59');
INSERT INTO `w_admin_operation_log` VALUES (256, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:18:02', '2019-03-29 17:18:02');
INSERT INTO `w_admin_operation_log` VALUES (257, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:18:04', '2019-03-29 17:18:04');
INSERT INTO `w_admin_operation_log` VALUES (258, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:18:09', '2019-03-29 17:18:09');
INSERT INTO `w_admin_operation_log` VALUES (259, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-29 17:18:12', '2019-03-29 17:18:12');
INSERT INTO `w_admin_operation_log` VALUES (260, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:18:13', '2019-03-29 17:18:13');
INSERT INTO `w_admin_operation_log` VALUES (261, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:18:17', '2019-03-29 17:18:17');
INSERT INTO `w_admin_operation_log` VALUES (262, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:18:23', '2019-03-29 17:18:23');
INSERT INTO `w_admin_operation_log` VALUES (263, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:18:29', '2019-03-29 17:18:29');
INSERT INTO `w_admin_operation_log` VALUES (264, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:18:32', '2019-03-29 17:18:32');
INSERT INTO `w_admin_operation_log` VALUES (265, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:18:34', '2019-03-29 17:18:34');
INSERT INTO `w_admin_operation_log` VALUES (266, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:18:35', '2019-03-29 17:18:35');
INSERT INTO `w_admin_operation_log` VALUES (267, 1, 'admin/auth/menu/13', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"GSN7HL4DOZpeJ2mLSTu2OoaKibHDut1RtS1qN42B\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/wcloud.com\\/admin\\/auth\\/menu\"}', '2019-03-29 17:18:39', '2019-03-29 17:18:39');
INSERT INTO `w_admin_operation_log` VALUES (268, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-29 17:18:39', '2019-03-29 17:18:39');
INSERT INTO `w_admin_operation_log` VALUES (269, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:19:01', '2019-03-29 17:19:01');
INSERT INTO `w_admin_operation_log` VALUES (270, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:19:03', '2019-03-29 17:19:03');
INSERT INTO `w_admin_operation_log` VALUES (271, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5206\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa-columns\",\"uri\":\"groups\",\"roles\":[null],\"permission\":null,\"_token\":\"GSN7HL4DOZpeJ2mLSTu2OoaKibHDut1RtS1qN42B\"}', '2019-03-29 17:21:03', '2019-03-29 17:21:03');
INSERT INTO `w_admin_operation_log` VALUES (272, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-29 17:21:03', '2019-03-29 17:21:03');
INSERT INTO `w_admin_operation_log` VALUES (273, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2019-03-29 17:21:05', '2019-03-29 17:21:05');
INSERT INTO `w_admin_operation_log` VALUES (274, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:21:14', '2019-03-29 17:21:14');
INSERT INTO `w_admin_operation_log` VALUES (275, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:21:17', '2019-03-29 17:21:17');
INSERT INTO `w_admin_operation_log` VALUES (276, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:21:18', '2019-03-29 17:21:18');
INSERT INTO `w_admin_operation_log` VALUES (277, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:21:32', '2019-03-29 17:21:32');
INSERT INTO `w_admin_operation_log` VALUES (278, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2019-03-29 17:23:27', '2019-03-29 17:23:27');
INSERT INTO `w_admin_operation_log` VALUES (279, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2019-03-29 17:27:10', '2019-03-29 17:27:10');
INSERT INTO `w_admin_operation_log` VALUES (280, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2019-03-29 17:27:59', '2019-03-29 17:27:59');
INSERT INTO `w_admin_operation_log` VALUES (281, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2019-03-29 17:28:06', '2019-03-29 17:28:06');
INSERT INTO `w_admin_operation_log` VALUES (282, 1, 'admin/groups', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:28:14', '2019-03-29 17:28:14');
INSERT INTO `w_admin_operation_log` VALUES (283, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:28:21', '2019-03-29 17:28:21');
INSERT INTO `w_admin_operation_log` VALUES (284, 1, 'admin/devices', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:31:56', '2019-03-29 17:31:56');
INSERT INTO `w_admin_operation_log` VALUES (285, 1, 'admin/devices', 'GET', '127.0.0.1', '[]', '2019-03-29 17:39:37', '2019-03-29 17:39:37');
INSERT INTO `w_admin_operation_log` VALUES (286, 1, 'admin/apps', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:49:48', '2019-03-29 17:49:48');
INSERT INTO `w_admin_operation_log` VALUES (287, 1, 'admin/apis', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-03-29 17:49:48', '2019-03-29 17:49:48');

-- ----------------------------
-- Table structure for w_admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_permissions`;
CREATE TABLE `w_admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `w_admin_permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_admin_permissions
-- ----------------------------
INSERT INTO `w_admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `w_admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `w_admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `w_admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `w_admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
INSERT INTO `w_admin_permissions` VALUES (6, 'Redis Manager', 'ext.redis-manager', NULL, '/redis*', '2019-03-26 15:55:07', '2019-03-26 15:55:07');

-- ----------------------------
-- Table structure for w_admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_role_menu`;
CREATE TABLE `w_admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `w_admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_admin_role_menu
-- ----------------------------
INSERT INTO `w_admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for w_admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_role_permissions`;
CREATE TABLE `w_admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `w_admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_admin_role_permissions
-- ----------------------------
INSERT INTO `w_admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for w_admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_role_users`;
CREATE TABLE `w_admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `w_admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_admin_role_users
-- ----------------------------
INSERT INTO `w_admin_role_users` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for w_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_roles`;
CREATE TABLE `w_admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `w_admin_roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_admin_roles
-- ----------------------------
INSERT INTO `w_admin_roles` VALUES (1, 'Administrator', 'administrator', '2019-03-26 15:51:18', '2019-03-26 15:51:18');

-- ----------------------------
-- Table structure for w_admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_user_permissions`;
CREATE TABLE `w_admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `w_admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for w_admin_users
-- ----------------------------
DROP TABLE IF EXISTS `w_admin_users`;
CREATE TABLE `w_admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `w_admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_admin_users
-- ----------------------------
INSERT INTO `w_admin_users` VALUES (1, 'admin', '$2y$10$Z7ph6wc.CNmlK04Nd4ShiOv4pTyox86pS310lxjoFoK8CkcmtOe82', 'Administrator', NULL, 'JgDgXzvOpSwiNJM1oAEBaNlxZJ4aseIWFOijr7EVAVAwfKmpMnaeCsjzM7d9', '2019-03-26 15:51:18', '2019-03-26 15:51:18');

-- ----------------------------
-- Table structure for w_migrations
-- ----------------------------
DROP TABLE IF EXISTS `w_migrations`;
CREATE TABLE `w_migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_migrations
-- ----------------------------
INSERT INTO `w_migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `w_migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `w_migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `w_migrations` VALUES (4, '2018_08_08_100000_create_telescope_entries_table', 2);

-- ----------------------------
-- Table structure for w_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `w_password_resets`;
CREATE TABLE `w_password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `w_password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for w_settings
-- ----------------------------
DROP TABLE IF EXISTS `w_settings`;
CREATE TABLE `w_settings`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `domain_test` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '测试域名',
  `domain_pro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '正式域名',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统设置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_settings
-- ----------------------------
INSERT INTO `w_settings` VALUES (1, 'http://opent.worthcloud.net', 'http://open.worthcloud.net', '2019-03-26 17:35:22', '2019-03-26 17:35:25', NULL);

-- ----------------------------
-- Table structure for w_sms
-- ----------------------------
DROP TABLE IF EXISTS `w_sms`;
CREATE TABLE `w_sms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机',
  `code` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '验证码',
  `expire` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '过期时间',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_sms
-- ----------------------------
INSERT INTO `w_sms` VALUES (1, '13266736876', '1234', '1553662477', NULL, NULL);
INSERT INTO `w_sms` VALUES (2, '13266736876', '233', '1553780770', '2019-03-27 17:54:30', '2019-03-27 17:54:30');

-- ----------------------------
-- Table structure for w_telescope_entries
-- ----------------------------
DROP TABLE IF EXISTS `w_telescope_entries`;
CREATE TABLE `w_telescope_entries`  (
  `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`sequence`) USING BTREE,
  UNIQUE INDEX `w_telescope_entries_uuid_unique`(`uuid`) USING BTREE,
  INDEX `w_telescope_entries_batch_id_index`(`batch_id`) USING BTREE,
  INDEX `w_telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`) USING BTREE,
  INDEX `w_telescope_entries_family_hash_index`(`family_hash`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for w_telescope_entries_tags
-- ----------------------------
DROP TABLE IF EXISTS `w_telescope_entries_tags`;
CREATE TABLE `w_telescope_entries_tags`  (
  `entry_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  INDEX `w_telescope_entries_tags_entry_uuid_tag_index`(`entry_uuid`, `tag`) USING BTREE,
  INDEX `w_telescope_entries_tags_tag_index`(`tag`) USING BTREE,
  CONSTRAINT `w_telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `w_telescope_entries` (`uuid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for w_telescope_monitoring
-- ----------------------------
DROP TABLE IF EXISTS `w_telescope_monitoring`;
CREATE TABLE `w_telescope_monitoring`  (
  `tag` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for w_users
-- ----------------------------
DROP TABLE IF EXISTS `w_users`;
CREATE TABLE `w_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plt` int(11) NOT NULL COMMENT '平台id',
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `tel` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机',
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email_verified_at` timestamp(0) NULL DEFAULT NULL COMMENT '确认时间',
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像',
  `reg_ip` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '注册IP',
  `last_login_ip` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态 0:正常 1:禁用',
  `login_times` int(11) NOT NULL DEFAULT 0 COMMENT '登录次数',
  `regid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备标识',
  `qq_open_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'qq的openid',
  `wx_open_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信的openid',
  `error_time` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码输错时间',
  `attempts` tinyint(4) NOT NULL DEFAULT 0 COMMENT '尝试错误次数',
  `freeze_time` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '冻结时间',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `create_token_time` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建token时间',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `plt`(`plt`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of w_users
-- ----------------------------
INSERT INTO `w_users` VALUES (1, 29, '13266736876', 'xiaomuu', '13266736875', '$2y$10$AZcamQ8omrvmw8qgEx6qdOwH0qMxNvCVx1KbQjYALE/GPAMAhHxOW', '2395781272@qq.com', NULL, NULL, '127.0.0.1', '127.0.0.1', 0, 17, '123', NULL, NULL, '', 0, '', NULL, '076c9d0bf155baaf132ba87b18f14ac4', '1553765948', '2019-03-27 10:08:18', '2019-03-28 17:39:08', NULL);

SET FOREIGN_KEY_CHECKS = 1;
