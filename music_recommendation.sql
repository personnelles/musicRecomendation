/*
 Navicat Premium Data Transfer

 Source Server         : 12
 Source Server Type    : MySQL
 Source Server Version : 80403 (8.4.3)
 Source Host           : localhost:3306
 Source Schema         : music_recommendation

 Target Server Type    : MySQL
 Target Server Version : 80403 (8.4.3)
 File Encoding         : 65001

 Date: 28/06/2025 09:31:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (3, 'aaaa');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES (51, 3, 13);
INSERT INTO `auth_group_permissions` VALUES (52, 3, 14);
INSERT INTO `auth_group_permissions` VALUES (53, 3, 15);
INSERT INTO `auth_group_permissions` VALUES (50, 3, 16);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 播放记录', 7, 'add_playhistory');
INSERT INTO `auth_permission` VALUES (26, 'Can change 播放记录', 7, 'change_playhistory');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 播放记录', 7, 'delete_playhistory');
INSERT INTO `auth_permission` VALUES (28, 'Can view 播放记录', 7, 'view_playhistory');
INSERT INTO `auth_permission` VALUES (29, 'Can add 用户收藏歌曲', 8, 'add_usercollectionsong');
INSERT INTO `auth_permission` VALUES (30, 'Can change 用户收藏歌曲', 8, 'change_usercollectionsong');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 用户收藏歌曲', 8, 'delete_usercollectionsong');
INSERT INTO `auth_permission` VALUES (32, 'Can view 用户收藏歌曲', 8, 'view_usercollectionsong');
INSERT INTO `auth_permission` VALUES (33, 'Can add 歌曲', 9, 'add_song');
INSERT INTO `auth_permission` VALUES (34, 'Can change 歌曲', 9, 'change_song');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 歌曲', 9, 'delete_song');
INSERT INTO `auth_permission` VALUES (36, 'Can view 歌曲', 9, 'view_song');
INSERT INTO `auth_permission` VALUES (37, 'Can add uploaded file', 10, 'add_uploadedfile');
INSERT INTO `auth_permission` VALUES (38, 'Can change uploaded file', 10, 'change_uploadedfile');
INSERT INTO `auth_permission` VALUES (39, 'Can delete uploaded file', 10, 'delete_uploadedfile');
INSERT INTO `auth_permission` VALUES (40, 'Can view uploaded file', 10, 'view_uploadedfile');
INSERT INTO `auth_permission` VALUES (41, 'Can add 用户打分', 11, 'add_userscoreonsong');
INSERT INTO `auth_permission` VALUES (42, 'Can change 用户打分', 11, 'change_userscoreonsong');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 用户打分', 11, 'delete_userscoreonsong');
INSERT INTO `auth_permission` VALUES (44, 'Can view 用户打分', 11, 'view_userscoreonsong');
INSERT INTO `auth_permission` VALUES (45, 'Can add 歌曲信息', 12, 'add_dynamic');
INSERT INTO `auth_permission` VALUES (46, 'Can change 歌曲信息', 12, 'change_dynamic');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 歌曲信息', 12, 'delete_dynamic');
INSERT INTO `auth_permission` VALUES (48, 'Can view 歌曲信息', 12, 'view_dynamic');
INSERT INTO `auth_permission` VALUES (49, 'Can add Person', 13, 'add_person');
INSERT INTO `auth_permission` VALUES (50, 'Can change Person', 13, 'change_person');
INSERT INTO `auth_permission` VALUES (51, 'Can delete Person', 13, 'delete_person');
INSERT INTO `auth_permission` VALUES (52, 'Can view Person', 13, 'view_person');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$1000000$WvneoHyHSQ4h14r7RMJZx8$u9sdC0sG4xOwCoNuIFY8dF9+hI15LhI5RwLkrQrLAqI=', '2025-05-20 11:20:31.093444', 0, '1', '', '', '1@1.com', 0, 1, '2025-04-24 17:23:58.890241');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$1000000$tdEsJK2J1j2KffbZNPzG6N$I8SjC50KtFzKyJeo/cqm8iK/AZ2ExSffxMqqZz29VfU=', '2025-06-28 01:26:49.571731', 1, 'admin1', '于大数据', '基', '112@1.com', 1, 1, '2025-04-24 17:36:00.000000');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$1000000$2M6TWJHM0XuGlQbC2JjdAD$a+b1oK/hVwtxaEVwEJXRxROpxjCrjBSVEsQLpdYsCIM=', '2025-04-24 20:50:49.801460', 1, 'super', '', '', 'super@io.com', 1, 1, '2025-04-24 20:11:01.153155');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$1000000$MvMBfnaUKsp3YX5apOaMPf$bjFj6Qas1tvJUJPO/vI7H+m2+xklzV+g7sOqRaPun6Q=', '2025-05-16 11:15:00.000000', 0, '2', '', '', '1@1.com', 1, 1, '2025-04-25 09:37:00.000000');
INSERT INTO `auth_user` VALUES (5, 'pbkdf2_sha256$1000000$dxJkL5c553CwCUv9IavuFr$BqAf33NBtkrQjGlBoE6HMq0T/kq9Brv5HCQZ9Rst5gE=', '2025-04-26 11:45:00.000000', 0, '3', '', '', '1@1.com', 0, 1, '2025-04-24 04:00:00.000000');
INSERT INTO `auth_user` VALUES (6, 'pbkdf2_sha256$1000000$hng59BFzUQl3WHm8u6GZWK$Boliv+Di1kcfofl6U/SfPJORMaF/YZtM9y11L8PJsQg=', '2025-04-25 09:40:09.785827', 0, '4', '', '', '1@1.com', 0, 1, '2025-04-25 09:40:09.424765');
INSERT INTO `auth_user` VALUES (7, 'pbkdf2_sha256$1000000$9KbU32RsIRxfo9m7VDwMVH$1g0LtJJP07hxd5r5eMojTzHJ4/ykzwaOV8mt3uRpilk=', '2025-04-26 11:43:07.698000', 0, '5', '', '', '1@1.com', 0, 1, '2025-04-25 09:40:17.535801');
INSERT INTO `auth_user` VALUES (9, 'pbkdf2_sha256$1000000$kb9lrbZAe0hbtkUbPPd533$wb+N+AD+hSVr3bBSf9/KZ4F9OhaJRR2nmUY+jwdBgbM=', '2025-06-07 18:45:29.375090', 1, 'alice', '', '', 'alice@giant.com', 1, 1, '2025-05-22 13:57:06.196355');
INSERT INTO `auth_user` VALUES (10, 'pbkdf2_sha256$1000000$6HDVrZDPqrY2p3QQ7HBaGt$TAAIAO77NcGYL5ZLJxzKTIehWwMQoFsPa4R0PXm+7BM=', '2025-06-25 07:26:12.508993', 0, 'emma', '', '', 'user@121.com', 1, 1, '2025-05-22 14:43:00.000000');
INSERT INTO `auth_user` VALUES (11, 'pbkdf2_sha256$1000000$0N5aXMgeRt3IJey6xqf5cY$MGw+TQRSowA830JXW7vB4SCH867w1A9V2sii7YNOdIE=', '2025-05-28 19:18:00.000000', 1, 'QQQ', '123', '123', '123@123.com', 1, 1, '2025-05-27 02:42:00.000000');
INSERT INTO `auth_user` VALUES (12, 'pbkdf2_sha256$1000000$Fa5GLEUJJ2j8hRrDMQ3u2C$Y1XASskvZx5pfw7rdK38aALymk0FA2pPjsUErv6DKB4=', '2025-05-27 15:40:00.000000', 0, '我', '我', '我们', 'user@121.com', 1, 1, '2025-05-27 06:14:00.000000');
INSERT INTO `auth_user` VALUES (13, 'pbkdf2_sha256$1000000$UVErNAg10PmpQpqeV9apTs$CxJq/sgJQpLqL0wSw6a71HQxA7Rsmur3+SrXy4xWB2w=', '2025-05-28 15:19:14.440070', 0, 'Jack', 'Jack', 'Smith', 'Jack@music.com', 0, 1, '2025-05-28 02:22:00.000000');
INSERT INTO `auth_user` VALUES (14, 'pbkdf2_sha256$1000000$mtjyuxtZz0brkcjck5sdNy$ZEaDs4PmYcQwYFJiu4xYuPy2DX1s5h8JeamJIll4WH0=', '2025-05-28 03:34:21.430461', 0, 'Tom', 'Tom', 'Smith', 'Tom@music.com', 0, 1, '2025-05-28 03:31:38.639626');
INSERT INTO `auth_user` VALUES (15, 'pbkdf2_sha256$1000000$eJkRd2LdCF13dzMLVTiZ0Q$1zP43mX7QKGRED01Bm5G7ROvjvJjePmR4Z6Oey26vwg=', '2025-05-28 17:12:50.245758', 0, 'Sw', 'Tom', 'Smith', 'Tom@music.com', 0, 1, '2025-05-28 13:46:30.028764');
INSERT INTO `auth_user` VALUES (16, 'pbkdf2_sha256$1000000$jIGm9MBAnTnnwpSncbUIhe$/X5CraGy8UHPw5XbVsoCd7/ZrHt3ucKQ77Rg10MZL9I=', '2025-05-30 02:26:56.290124', 1, 'superuser_1', '', '', 'superuser_1@music.com', 1, 1, '2025-05-28 19:03:00.000000');
INSERT INTO `auth_user` VALUES (18, 'pbkdf2_sha256$1000000$aC8whlxLMcH2p3QTbKC35H$8x2VxvTuoeBaq1bq2NmdWHS1Ros90Wjcggg4CTZgenY=', '2025-06-02 06:41:34.876025', 0, 'Zoom', 'Zoom', 'Smith', 'Zoom@music.com', 1, 1, '2025-06-01 11:15:00.000000');
INSERT INTO `auth_user` VALUES (20, 'pbkdf2_sha256$1000000$0MsaCSSjmb2jznQqcYTVV9$uuijb/beh69Qb94HZ4GW1Ru1Y1162aS/eaH3OLhKqlU=', '2025-06-02 06:38:18.884817', 0, 'Zip', 'Zip', 'Smith', 'zip@music.com', 0, 1, '2025-06-02 06:34:12.809327');
INSERT INTO `auth_user` VALUES (21, 'pbkdf2_sha256$1000000$C8crfzMnPxv33hmRNSic4z$9cSR0ndOQOjAtTmGvfa+7AE+wTz3zRVdyIxmNHlOng0=', '2025-06-02 11:11:16.304374', 0, 'Yummy', 'Yummy', 'CCCC', 'Yummy@music.com', 0, 1, '2025-06-02 11:07:20.892223');
INSERT INTO `auth_user` VALUES (27, 'pbkdf2_sha256$1000000$vYssvZ0lPAzDE0jWxbMzmY$Z/DaLjwItws/Atsys3eHogrmqBbvy6ojfZ2H5Gy69Bw=', '2025-06-09 22:20:40.892072', 0, '46YNemSK', 'QlqzzNwr', 'QlqzzNwr', 'testing@example.com', 0, 1, '2025-06-09 22:20:40.437052');
INSERT INTO `auth_user` VALUES (31, 'pbkdf2_sha256$1000000$xoAEahf9ANoAChEAnNBebh$Ei2oQ8Qjf2HQU3nFZZqGEBPDRyt/3qARUGH7FMpSrGY=', '2025-06-09 22:20:44.489656', 0, '920012', 'QlqzzNwr', 'QlqzzNwr', 'testing@example.com', 0, 1, '2025-06-09 22:20:43.910369');
INSERT INTO `auth_user` VALUES (38, 'pbkdf2_sha256$1000000$CZYKDqAjCNcIisljCZv7pF$5PqY9jV5hL/yJQQBjGCY4UGDA/OZIpkkDzsbAGmd+No=', '2025-06-25 17:45:22.744565', 0, '944251', 'zFPWdwPk', 'zFPWdwPk', 'testing@example.com', 0, 1, '2025-06-25 17:45:22.125450');
INSERT INTO `auth_user` VALUES (41, 'pbkdf2_sha256$1000000$ImuMyZ5AyNCxIeQtRU8Pg8$fxb9JiNSciRPcXAsFDro3WDxdutPe35aXoFZvV+pkU4=', '2025-06-25 17:45:33.524716', 0, '949340', 'zFPWdwPk', 'zFPWdwPk', 'testing@example.com', 0, 1, '2025-06-25 17:45:32.946589');
INSERT INTO `auth_user` VALUES (44, 'pbkdf2_sha256$1000000$ZUNB2PBQmLfBmkcR3mfTV0$Osot9Cp6SQNYraOxH6RttCSoqRZ3d5G8prjsC3+6qNE=', '2025-06-25 17:45:59.892330', 0, '8tHidbiZ', 'zFPWdwPk', 'zFPWdwPk', 'testing@example.com', 0, 1, '2025-06-25 17:45:59.260524');
INSERT INTO `auth_user` VALUES (46, 'pbkdf2_sha256$1000000$RfgLuYFHYO2ylT3bhM3KrB$R8jazygv2NbtiN04s6vnIgy9Ui5LrXFgIx3Y/pI5qug=', '2025-06-25 17:46:01.864881', 0, '996517', 'zFPWdwPk', 'zFPWdwPk', 'testing@example.com', 0, 1, '2025-06-25 17:46:01.217330');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
INSERT INTO `auth_user_user_permissions` VALUES (54, 10, 9);
INSERT INTO `auth_user_user_permissions` VALUES (55, 10, 10);
INSERT INTO `auth_user_user_permissions` VALUES (56, 10, 11);
INSERT INTO `auth_user_user_permissions` VALUES (57, 10, 12);
INSERT INTO `auth_user_user_permissions` VALUES (53, 11, 52);
INSERT INTO `auth_user_user_permissions` VALUES (1, 13, 1);
INSERT INTO `auth_user_user_permissions` VALUES (2, 13, 2);
INSERT INTO `auth_user_user_permissions` VALUES (3, 13, 3);
INSERT INTO `auth_user_user_permissions` VALUES (4, 13, 4);
INSERT INTO `auth_user_user_permissions` VALUES (5, 13, 5);
INSERT INTO `auth_user_user_permissions` VALUES (6, 13, 6);
INSERT INTO `auth_user_user_permissions` VALUES (7, 13, 7);
INSERT INTO `auth_user_user_permissions` VALUES (8, 13, 8);
INSERT INTO `auth_user_user_permissions` VALUES (9, 13, 9);
INSERT INTO `auth_user_user_permissions` VALUES (10, 13, 10);
INSERT INTO `auth_user_user_permissions` VALUES (11, 13, 11);
INSERT INTO `auth_user_user_permissions` VALUES (12, 13, 12);
INSERT INTO `auth_user_user_permissions` VALUES (13, 13, 13);
INSERT INTO `auth_user_user_permissions` VALUES (14, 13, 14);
INSERT INTO `auth_user_user_permissions` VALUES (15, 13, 15);
INSERT INTO `auth_user_user_permissions` VALUES (16, 13, 16);
INSERT INTO `auth_user_user_permissions` VALUES (17, 13, 17);
INSERT INTO `auth_user_user_permissions` VALUES (18, 13, 18);
INSERT INTO `auth_user_user_permissions` VALUES (19, 13, 19);
INSERT INTO `auth_user_user_permissions` VALUES (20, 13, 20);
INSERT INTO `auth_user_user_permissions` VALUES (21, 13, 21);
INSERT INTO `auth_user_user_permissions` VALUES (22, 13, 22);
INSERT INTO `auth_user_user_permissions` VALUES (23, 13, 23);
INSERT INTO `auth_user_user_permissions` VALUES (24, 13, 24);
INSERT INTO `auth_user_user_permissions` VALUES (25, 13, 25);
INSERT INTO `auth_user_user_permissions` VALUES (26, 13, 26);
INSERT INTO `auth_user_user_permissions` VALUES (27, 13, 27);
INSERT INTO `auth_user_user_permissions` VALUES (28, 13, 28);
INSERT INTO `auth_user_user_permissions` VALUES (29, 13, 29);
INSERT INTO `auth_user_user_permissions` VALUES (30, 13, 30);
INSERT INTO `auth_user_user_permissions` VALUES (31, 13, 31);
INSERT INTO `auth_user_user_permissions` VALUES (32, 13, 32);
INSERT INTO `auth_user_user_permissions` VALUES (33, 13, 33);
INSERT INTO `auth_user_user_permissions` VALUES (34, 13, 34);
INSERT INTO `auth_user_user_permissions` VALUES (35, 13, 35);
INSERT INTO `auth_user_user_permissions` VALUES (36, 13, 36);
INSERT INTO `auth_user_user_permissions` VALUES (37, 13, 37);
INSERT INTO `auth_user_user_permissions` VALUES (38, 13, 38);
INSERT INTO `auth_user_user_permissions` VALUES (39, 13, 39);
INSERT INTO `auth_user_user_permissions` VALUES (40, 13, 40);
INSERT INTO `auth_user_user_permissions` VALUES (41, 13, 41);
INSERT INTO `auth_user_user_permissions` VALUES (42, 13, 42);
INSERT INTO `auth_user_user_permissions` VALUES (43, 13, 43);
INSERT INTO `auth_user_user_permissions` VALUES (44, 13, 44);
INSERT INTO `auth_user_user_permissions` VALUES (45, 13, 45);
INSERT INTO `auth_user_user_permissions` VALUES (46, 13, 46);
INSERT INTO `auth_user_user_permissions` VALUES (47, 13, 47);
INSERT INTO `auth_user_user_permissions` VALUES (48, 13, 48);
INSERT INTO `auth_user_user_permissions` VALUES (49, 13, 49);
INSERT INTO `auth_user_user_permissions` VALUES (50, 13, 50);
INSERT INTO `auth_user_user_permissions` VALUES (51, 13, 51);
INSERT INTO `auth_user_user_permissions` VALUES (52, 13, 52);
INSERT INTO `auth_user_user_permissions` VALUES (58, 18, 33);
INSERT INTO `auth_user_user_permissions` VALUES (59, 18, 34);
INSERT INTO `auth_user_user_permissions` VALUES (60, 18, 35);
INSERT INTO `auth_user_user_permissions` VALUES (61, 18, 36);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 253 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

INSERT INTO `django_admin_log` VALUES (1, '2025-04-24 20:50:07.795241', '2', 'admin', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Last login\"]}}]', 4, 3);
INSERT INTO `django_admin_log` VALUES (2, '2025-04-24 20:51:06.346172', '2', 'admin', 2, '[{\"changed\": {\"fields\": [\"Superuser status\", \"Last login\"]}}]', 4, 3);
INSERT INTO `django_admin_log` VALUES (3, '2025-04-25 09:57:23.692707', '101', '吹梦到西洲', 1, '[{\"added\": {}}]', 9, 2);
INSERT INTO `django_admin_log` VALUES (4, '2025-04-26 04:04:53.432693', '101', '吹梦到西洲', 2, '[{\"changed\": {\"fields\": [\"\\u6d41\\u6d3e\"]}}]', 9, 2);
INSERT INTO `django_admin_log` VALUES (5, '2025-05-06 09:38:44.791586', '53', 'Dynamic object (53)', 2, '[]', 12, 2);
INSERT INTO `django_admin_log` VALUES (6, '2025-05-06 12:19:04.811538', '30', 'UserCollectionSong(admin1 collects 白昼之夜 at 2025-05-06 10:03:43.017181+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (7, '2025-05-06 12:19:04.811538', '29', 'UserCollectionSong(admin1 collects 三个人的时光 at 2025-05-06 10:00:22.972220+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (8, '2025-05-06 12:19:04.811538', '28', 'UserCollectionSong(admin1 collects L\'horloge tourne at 2025-05-06 00:59:31.511700+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (9, '2025-05-06 12:19:04.811538', '27', 'UserCollectionSong(admin1 collects Airplanes at 2025-05-02 11:57:43.324846+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (10, '2025-05-06 12:19:04.811538', '23', 'UserCollectionSong(admin1 collects 吹梦到西洲 at 2025-05-02 11:43:06.292420+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (11, '2025-05-06 12:19:04.811538', '19', 'UserCollectionSong(1 collects Sayama Bird 2 at 2025-05-02 11:31:21.115202+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (12, '2025-05-06 12:19:04.811538', '18', 'UserCollectionSong(1 collects Fallin\' Out at 2025-05-02 11:31:16.940799+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (13, '2025-05-06 12:19:04.811538', '17', 'UserCollectionSong(1 collects 28º À L\'Ombre at 2025-05-02 11:31:07.171757+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (14, '2025-05-06 12:19:04.811538', '16', 'UserCollectionSong(1 collects 涟漪 at 2025-05-02 11:31:05.514651+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (15, '2025-05-06 12:19:04.811538', '15', 'UserCollectionSong(1 collects Mission Impossible at 2025-05-02 11:30:58.995237+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (16, '2025-05-06 12:19:04.811538', '14', 'UserCollectionSong(1 collects Polska at 2025-05-02 11:30:56.857994+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (17, '2025-05-06 12:19:04.811538', '13', 'UserCollectionSong(1 collects What Are Words at 2025-05-02 11:30:55.085799+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (18, '2025-05-06 12:19:04.811538', '12', 'UserCollectionSong(1 collects 들리나요... at 2025-05-02 11:30:53.115805+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (19, '2025-05-06 12:19:04.811538', '11', 'UserCollectionSong(1 collects 白昼之夜 at 2025-05-02 11:30:48.541374+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (20, '2025-05-06 12:19:04.811538', '10', 'UserCollectionSong(1 collects 拥有 at 2025-05-02 11:30:46.477354+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (21, '2025-05-06 12:19:04.811538', '9', 'UserCollectionSong(admin1 collects 당신은.. 나는 바보입니다 at 2025-04-30 06:33:48.120646+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (22, '2025-05-06 12:19:04.811538', '8', 'UserCollectionSong(admin1 collects 万讃歌 at 2025-04-30 06:33:36.189326+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (23, '2025-05-06 12:19:04.811538', '2', 'UserCollectionSong(1 collects 三个人的时光 at 2025-04-28 03:06:21.950306+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (24, '2025-05-06 12:19:04.811538', '1', 'UserCollectionSong(1 collects 天空之城（钢琴版）（Cover 久石让） at 2025-04-28 03:06:19.409440+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (25, '2025-05-13 03:32:30.391232', '1', '1', 2, '[]', 4, 2);
INSERT INTO `django_admin_log` VALUES (26, '2025-05-13 03:33:42.722335', '1', '1', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (27, '2025-05-17 09:05:32.172464', '1', '1', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (28, '2025-05-24 13:02:16.493537', '9', 'alice', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (29, '2025-05-25 06:50:12.857964', '1', 'manager', 1, '[{\"added\": {}}]', 3, 2);
INSERT INTO `django_admin_log` VALUES (30, '2025-05-25 06:51:12.102650', '4', '2', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\", \"Last login\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (31, '2025-05-27 01:03:38.669198', '114', 'PlayHistory(2 played 3 60 times)', 1, '[{\"added\": {}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (32, '2025-05-27 01:16:35.540925', '2', 'PlayHistory(2 played 1 20 times)', 2, '[{\"changed\": {\"fields\": [\"\\u64ad\\u653e\\u6b21\\u6570\"]}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (33, '2025-05-27 02:41:12.509416', '5', '3', 2, '[{\"changed\": {\"fields\": [\"Last login\", \"Date joined\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (34, '2025-05-27 02:41:19.185577', '8', 'Julia', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\", \"Last login\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (35, '2025-05-27 02:41:31.729904', '10', 'emma', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (36, '2025-05-27 02:42:15.693637', '11', 'Ma', 1, '[{\"added\": {}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (37, '2025-05-27 02:42:42.973457', '11', 'Ma', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Superuser status\", \"Groups\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (38, '2025-05-27 02:42:55.997631', '11', 'Ma', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (39, '2025-05-27 02:51:27.780946', '11', 'Ma', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (40, '2025-05-27 02:53:47.361346', '11', 'Ma', 2, '[{\"changed\": {\"fields\": [\"Active\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (41, '2025-05-27 02:54:31.404429', '11', 'QQQ', 2, '[{\"changed\": {\"fields\": [\"Username\", \"Last login\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (42, '2025-05-27 03:00:16.527743', '11', 'QQQ', 2, '[{\"changed\": {\"fields\": [\"Active\", \"Last login\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (43, '2025-05-27 03:03:49.961805', '11', 'QQQ', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (44, '2025-05-27 06:53:05.713720', '2', '经理', 1, '[{\"added\": {}}]', 3, 2);
INSERT INTO `django_admin_log` VALUES (45, '2025-05-27 15:17:36.622164', '12', '我', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\", \"Last login\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (46, '2025-05-28 15:19:07.548492', '13', 'Jack', 2, '[{\"changed\": {\"fields\": [\"User permissions\", \"Last login\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (47, '2025-05-28 19:03:58.023462', '16', 'superuser_1', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Last login\"]}}]', 4, 16);
INSERT INTO `django_admin_log` VALUES (48, '2025-05-28 19:17:40.531840', '16', 'superuser_1', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (49, '2025-05-28 19:18:36.112313', '11', 'QQQ', 2, '[{\"changed\": {\"fields\": [\"Active\", \"Superuser status\", \"User permissions\"]}}]', 4, 16);
INSERT INTO `django_admin_log` VALUES (50, '2025-05-28 19:19:10.090698', '10', 'emma', 2, '[{\"changed\": {\"fields\": [\"Superuser status\"]}}]', 4, 11);
INSERT INTO `django_admin_log` VALUES (51, '2025-05-28 19:20:07.213500', '10', 'emma', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 11);
INSERT INTO `django_admin_log` VALUES (52, '2025-05-28 19:20:37.674397', '10', 'emma', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 16);
INSERT INTO `django_admin_log` VALUES (53, '2025-05-29 07:04:20.639251', '16', 'superuser_1', 2, '[{\"changed\": {\"fields\": [\"Last login\"]}}]', 4, 16);
INSERT INTO `django_admin_log` VALUES (54, '2025-06-01 11:18:42.239452', '11', 'QQQ', 2, '[{\"changed\": {\"fields\": [\"Superuser status\", \"Last login\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (55, '2025-06-01 11:19:08.991240', '130', 'PlayHistory(18 played 2 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (56, '2025-06-01 11:19:08.991240', '129', 'PlayHistory(18 played 9 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (57, '2025-06-01 11:19:08.991240', '128', 'PlayHistory(18 played 4 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (58, '2025-06-01 11:19:08.991240', '127', 'PlayHistory(18 played 12 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (59, '2025-06-01 11:19:08.991240', '126', 'PlayHistory(18 played 19 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (60, '2025-06-01 11:19:08.991240', '125', 'PlayHistory(18 played 3 2 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (61, '2025-06-01 11:19:08.991240', '124', 'PlayHistory(18 played 8 2 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (62, '2025-06-01 11:19:08.991240', '123', 'PlayHistory(18 played 1 5 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (63, '2025-06-01 11:45:13.642923', '12', '我', 2, '[{\"changed\": {\"fields\": [\"Superuser status\", \"Last login\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (64, '2025-06-01 11:45:41.931975', '140', 'PlayHistory(19 played 11 12 times)', 2, '[{\"changed\": {\"fields\": [\"\\u64ad\\u653e\\u6b21\\u6570\"]}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (65, '2025-06-01 11:46:17.556672', '2', '经理', 3, '', 3, 2);
INSERT INTO `django_admin_log` VALUES (66, '2025-06-01 11:46:27.761448', '1', 'manager', 3, '', 3, 2);
INSERT INTO `django_admin_log` VALUES (67, '2025-06-02 06:39:07.698620', '5', '28º À L\'Ombre', 2, '[{\"changed\": {\"fields\": [\"\\u6d41\\u884c\\u5ea6\", \"\\u6d41\\u6d3e\"]}}]', 9, 2);
INSERT INTO `django_admin_log` VALUES (68, '2025-06-02 06:39:44.673720', '18', 'Zoom', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Last login\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (69, '2025-06-02 06:41:14.841760', '18', 'Zoom', 2, '[{\"changed\": {\"fields\": [\"User permissions\", \"Last login\"]}}]', 4, 2);
INSERT INTO `django_admin_log` VALUES (70, '2025-06-02 14:34:59.021454', '3', '三个人的时光', 2, '[{\"changed\": {\"fields\": [\"\\u6d41\\u884c\\u5ea6\", \"\\u6d41\\u6d3e\"]}}]', 9, 2);
INSERT INTO `django_admin_log` VALUES (71, '2025-06-03 00:21:04.878656', '3', 'aaaa', 1, '[{\"added\": {}}]', 3, 2);
INSERT INTO `django_admin_log` VALUES (72, '2025-06-03 00:22:57.722236', '87', 'admin1 || I Heard It Through the Grapevine || 10', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (73, '2025-06-03 00:23:13.467275', '86', 'admin1 || Gone With The Sin || 9', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (74, '2025-06-03 00:23:13.467275', '85', 'admin1 || Chambermaid Swing || 2', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (75, '2025-06-03 00:23:29.052228', '88', 'admin1 || 拥有 || 9', 1, '[{\"added\": {}}]', 11, 2);
INSERT INTO `django_admin_log` VALUES (76, '2025-06-03 00:28:26.522611', '88', 'admin1 || 拥有 || 9', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (77, '2025-06-03 00:37:38.867991', '57', 'admin1 || Libella Swing || 9', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (78, '2025-06-03 00:37:38.867991', '56', 'admin1 || 사랑을 믿어요 || 1', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (79, '2025-06-03 00:37:38.867991', '55', 'admin1 || Sayama Bird 4 || 2', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (80, '2025-06-03 00:37:38.867991', '54', 'admin1 || Young For You || 7', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (81, '2025-06-03 00:37:38.867991', '53', 'admin1 || 들리나요... || 3', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (82, '2025-06-03 00:37:38.867991', '24', 'admin1 || Polska || 5', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (83, '2025-06-03 00:37:38.867991', '13', 'admin1 || INTRO 2009 || 1', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (84, '2025-06-03 00:37:38.867991', '12', 'admin1 || Skellig || 10', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (85, '2025-06-03 00:37:38.867991', '11', 'admin1 || 白昼之夜 || 10', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (86, '2025-06-03 00:37:38.867991', '10', 'admin1 || 涟漪 || 1', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (87, '2025-06-03 00:37:38.867991', '9', 'admin1 || 28º À L\'Ombre || 5', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (88, '2025-06-03 00:37:38.867991', '8', 'admin1 || Et si tu n\'existais pas || 0', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (89, '2025-06-03 00:37:38.867991', '7', 'admin1 || 僕らのつづき || 7', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (90, '2025-06-03 00:37:38.867991', '6', 'admin1 || L\'horloge tourne || 10', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (91, '2025-06-03 00:37:38.867991', '5', 'admin1 || 三个人的时光 || 5', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (92, '2025-06-03 00:37:38.867991', '4', 'admin1 || 拥有 || 6', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (93, '2025-06-03 00:37:38.867991', '3', 'admin1 || 吹梦到西洲 || 10', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (94, '2025-06-03 00:37:38.867991', '2', 'admin1 || Roter Mond || 2', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (95, '2025-06-03 00:37:38.867991', '1', 'admin1 || 天空之城（钢琴版）（Cover 久石让） || 10', 3, '', 11, 2);
INSERT INTO `django_admin_log` VALUES (96, '2025-06-03 01:14:36.928787', '106', 'UserCollectionSong(admin1 collects Polska at 2025-05-28 18:03:48.359663+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (97, '2025-06-03 01:14:36.928787', '105', 'UserCollectionSong(admin1 collects Lighters at 2025-05-28 17:10:47.924537+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (98, '2025-06-03 01:14:36.928787', '104', 'UserCollectionSong(admin1 collects I Believe I Can Fly at 2025-05-28 17:10:45.797181+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (99, '2025-06-03 01:14:36.928787', '103', 'UserCollectionSong(admin1 collects Airplanes at 2025-05-28 17:10:44.001879+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (100, '2025-06-03 01:14:36.928787', '102', 'UserCollectionSong(admin1 collects Traveling Light at 2025-05-28 17:10:42.339344+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (101, '2025-06-03 01:14:36.928787', '101', 'UserCollectionSong(admin1 collects I\'m Missing You at 2025-05-28 17:10:38.341224+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (102, '2025-06-03 01:14:36.928787', '100', 'UserCollectionSong(admin1 collects Through The Rain at 2025-05-28 17:10:36.147547+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (103, '2025-06-03 01:14:36.928787', '99', 'UserCollectionSong(admin1 collects Those Lazy, Hazy, Crazy Days of Summer at 2025-05-28 17:10:30.691271+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (104, '2025-06-03 01:14:36.928787', '97', 'UserCollectionSong(admin1 collects Ghosts at 2025-05-28 17:09:37.476635+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (105, '2025-06-03 01:14:36.928787', '96', 'UserCollectionSong(admin1 collects Chambermaid Swing at 2025-05-28 17:09:34.148871+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (106, '2025-06-03 01:14:36.928787', '95', 'UserCollectionSong(admin1 collects I Heard It Through the Grapevine at 2025-05-28 17:09:32.374512+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (107, '2025-06-03 01:14:36.928787', '94', 'UserCollectionSong(admin1 collects 场景一 向晚 at 2025-05-28 17:09:28.707523+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (108, '2025-06-03 01:14:36.928787', '93', 'UserCollectionSong(admin1 collects 들리나요... at 2025-05-28 17:09:27.190827+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (109, '2025-06-03 01:14:36.928787', '92', 'UserCollectionSong(admin1 collects 사랑아 또 사랑아 at 2025-05-28 17:09:25.596880+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (110, '2025-06-03 01:14:36.928787', '91', 'UserCollectionSong(admin1 collects Roter Mond at 2025-05-28 17:09:20.759853+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (111, '2025-06-03 01:14:36.929786', '90', 'UserCollectionSong(admin1 collects 白昼之夜 at 2025-05-28 13:48:46.496944+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (112, '2025-06-03 01:14:36.929786', '89', 'UserCollectionSong(admin1 collects Skellig at 2025-05-28 13:48:28.401019+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (113, '2025-06-03 01:14:36.929786', '88', 'UserCollectionSong(admin1 collects L\'horloge tourne at 2025-05-28 13:48:19.577564+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (114, '2025-06-03 01:14:36.929786', '79', 'UserCollectionSong(admin1 collects Et si tu n\'existais pas at 2025-05-27 02:09:01.444569+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (115, '2025-06-03 01:14:36.929786', '78', 'UserCollectionSong(admin1 collects 三个人的时光 at 2025-05-27 02:09:00.020078+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (116, '2025-06-03 01:16:22.755196', '121', 'UserCollectionSong(admin1 collects Sayama Bird 4 at 2025-06-01 13:37:41.455339+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (117, '2025-06-03 01:16:22.755196', '77', 'UserCollectionSong(admin1 collects 天空之城（钢琴版）（Cover 久石让） at 2025-05-27 02:08:58.178296+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (118, '2025-06-03 01:16:22.755196', '76', 'UserCollectionSong(admin1 collects 涟漪 at 2025-05-27 02:08:56.557137+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (119, '2025-06-03 01:16:22.755196', '75', 'UserCollectionSong(admin1 collects 28º À L\'Ombre at 2025-05-27 02:08:54.338526+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (120, '2025-06-03 01:16:22.755196', '74', 'UserCollectionSong(admin1 collects 拥有 at 2025-05-25 05:30:08.885214+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (121, '2025-06-03 01:16:22.755196', '69', 'UserCollectionSong(admin1 collects 秋意浓 at 2025-05-20 13:27:56.470839+00:00)', 3, '', 8, 2);
INSERT INTO `django_admin_log` VALUES (122, '2025-06-03 01:40:28.457301', '168', 'PlayHistory(2 played 31 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (123, '2025-06-03 01:40:28.457301', '141', 'PlayHistory(2 played 16 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (124, '2025-06-03 01:40:28.457301', '112', 'PlayHistory(2 played 17 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (125, '2025-06-03 01:40:28.457301', '111', 'PlayHistory(2 played 13 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (126, '2025-06-03 01:40:28.457301', '85', 'PlayHistory(2 played 57 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (127, '2025-06-03 01:40:28.457301', '73', 'PlayHistory(2 played 76 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (128, '2025-06-03 01:40:28.457301', '72', 'PlayHistory(2 played 73 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (129, '2025-06-03 01:40:28.457301', '71', 'PlayHistory(2 played 74 2 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (130, '2025-06-03 01:40:28.457301', '69', 'PlayHistory(2 played 71 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (131, '2025-06-03 01:40:28.457301', '68', 'PlayHistory(2 played 79 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (132, '2025-06-03 01:40:28.458254', '67', 'PlayHistory(2 played 34 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (133, '2025-06-03 01:40:28.458254', '64', 'PlayHistory(2 played 47 2 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (134, '2025-06-03 01:40:28.458254', '63', 'PlayHistory(2 played 66 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (135, '2025-06-03 01:40:28.458254', '62', 'PlayHistory(2 played 70 4 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (136, '2025-06-03 01:40:28.458254', '61', 'PlayHistory(2 played 48 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (137, '2025-06-03 01:40:28.458254', '60', 'PlayHistory(2 played 39 3 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (138, '2025-06-03 01:40:28.458254', '59', 'PlayHistory(2 played 72 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (139, '2025-06-03 01:40:28.458254', '58', 'PlayHistory(2 played 84 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (140, '2025-06-03 01:40:28.458254', '57', 'PlayHistory(2 played 81 3 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (141, '2025-06-03 01:40:28.458254', '56', 'PlayHistory(2 played 82 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (142, '2025-06-03 01:40:28.458254', '55', 'PlayHistory(2 played 86 2 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (143, '2025-06-03 01:40:28.458254', '54', 'PlayHistory(2 played 85 3 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (144, '2025-06-03 01:40:28.458254', '53', 'PlayHistory(2 played 87 2 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (145, '2025-06-03 01:40:28.458254', '52', 'PlayHistory(2 played 36 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (146, '2025-06-03 01:40:28.458254', '51', 'PlayHistory(2 played 41 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (147, '2025-06-03 01:40:28.458254', '50', 'PlayHistory(2 played 42 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (148, '2025-06-03 01:40:28.458254', '49', 'PlayHistory(2 played 43 2 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (149, '2025-06-03 01:40:28.459252', '48', 'PlayHistory(2 played 91 5 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (150, '2025-06-03 01:40:28.459252', '47', 'PlayHistory(2 played 92 5 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (151, '2025-06-03 01:40:28.459252', '46', 'PlayHistory(2 played 83 3 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (152, '2025-06-03 01:40:28.459252', '45', 'PlayHistory(2 played 80 3 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (153, '2025-06-03 01:40:28.459252', '44', 'PlayHistory(2 played 94 3 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (154, '2025-06-03 01:40:28.459252', '43', 'PlayHistory(2 played 95 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (155, '2025-06-03 01:40:28.459252', '42', 'PlayHistory(2 played 96 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (156, '2025-06-03 01:40:28.459252', '41', 'PlayHistory(2 played 97 2 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (157, '2025-06-03 01:40:28.459252', '40', 'PlayHistory(2 played 98 4 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (158, '2025-06-03 01:40:28.459252', '39', 'PlayHistory(2 played 99 3 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (159, '2025-06-03 01:40:28.459252', '38', 'PlayHistory(2 played 100 5 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (160, '2025-06-03 01:40:28.459252', '37', 'PlayHistory(2 played 20 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (161, '2025-06-03 01:40:28.459252', '36', 'PlayHistory(2 played 21 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (162, '2025-06-03 01:40:28.459252', '35', 'PlayHistory(2 played 22 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (163, '2025-06-03 01:40:28.459252', '34', 'PlayHistory(2 played 23 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (164, '2025-06-03 01:40:28.459252', '33', 'PlayHistory(2 played 6 10 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (165, '2025-06-03 01:40:28.459252', '32', 'PlayHistory(2 played 5 34 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (166, '2025-06-03 01:40:28.459252', '31', 'PlayHistory(2 played 64 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (167, '2025-06-03 01:40:28.459252', '30', 'PlayHistory(2 played 10 45 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (168, '2025-06-03 01:40:28.459252', '29', 'PlayHistory(2 played 9 32 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (169, '2025-06-03 01:40:28.459252', '28', 'PlayHistory(2 played 3 17 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (170, '2025-06-03 01:40:28.459252', '27', 'PlayHistory(2 played 101 19 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (171, '2025-06-03 01:40:28.459252', '26', 'PlayHistory(2 played 8 9 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (172, '2025-06-03 01:41:12.870080', '168', 'PlayHistory(2 played 31 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (173, '2025-06-03 01:45:02.443390', '168', 'PlayHistory(2 played 31 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (174, '2025-06-03 03:51:09.424275', '141', 'PlayHistory(2 played 16 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (175, '2025-06-03 03:51:26.440060', '168', 'PlayHistory(2 played 31 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (176, '2025-06-03 03:51:26.440060', '112', 'PlayHistory(2 played 17 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (177, '2025-06-03 03:51:26.440060', '111', 'PlayHistory(2 played 13 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (178, '2025-06-03 03:52:27.373586', '168', 'PlayHistory(2 played 31 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (179, '2025-06-03 03:52:27.373586', '112', 'PlayHistory(2 played 17 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (180, '2025-06-03 03:52:27.373586', '111', 'PlayHistory(2 played 13 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (181, '2025-06-03 03:52:34.167328', '168', 'PlayHistory(2 played 31 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (182, '2025-06-03 03:52:34.167328', '112', 'PlayHistory(2 played 17 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (183, '2025-06-03 03:52:34.167328', '111', 'PlayHistory(2 played 13 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (184, '2025-06-03 03:53:21.859975', '168', 'PlayHistory(2 played 31 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (185, '2025-06-03 03:53:21.859975', '112', 'PlayHistory(2 played 17 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (186, '2025-06-03 03:53:21.859975', '111', 'PlayHistory(2 played 13 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (187, '2025-06-03 03:53:27.948068', '73', 'PlayHistory(2 played 76 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (188, '2025-06-03 03:53:27.948068', '72', 'PlayHistory(2 played 73 1 times)', 3, '', 7, 2);
INSERT INTO `django_admin_log` VALUES (189, '2025-06-07 17:25:27.610268', '94', 'admin1 || 天空之城（钢琴版）（Cover 久石让） || 8', 1, '[{\"added\": {}}]', 11, 2);
INSERT INTO `django_admin_log` VALUES (190, '2025-06-09 22:48:04.051610', '94', 'admin1 || 天空之城（钢琴版）（Cover 久石让） || 2', 2, '[{\"changed\": {\"fields\": [\"\\u5206\\u6570\"]}}]', 11, 2);
INSERT INTO `django_admin_log` VALUES (191, '2025-06-25 19:17:26.024668', '102', '时光卷轴', 1, '[{\"added\": {}}]', 9, 2);
INSERT INTO `django_admin_log` VALUES (192, '2025-06-28 01:15:03.833364', '63', '“Reset”~“ありがとう”バージョン~', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (193, '2025-06-28 01:15:03.834362', '64', 'Only One', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (194, '2025-06-28 01:15:03.834362', '65', 'Jolene', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (195, '2025-06-28 01:15:03.834362', '80', '君に嘘', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (196, '2025-06-28 01:15:03.834362', '81', '僕らのつづき', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (197, '2025-06-28 01:15:03.834362', '82', '꽃보다 남자 Original Television Soundtrack - 내 머리가 나빠서 (Acoustic Version)', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (198, '2025-06-28 01:15:03.834362', '83', '나만 몰랐던 이야기', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (199, '2025-06-28 01:15:03.834362', '84', '사랑을 믿어요', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (200, '2025-06-28 01:15:03.834362', '85', '万讃歌', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (201, '2025-06-28 01:15:03.834362', '97', '1874', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (202, '2025-06-28 01:15:03.834362', '98', '几许风雨(Live)', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (203, '2025-06-28 01:15:03.834362', '100', 'Unreachable', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (204, '2025-06-28 01:16:38.728463', '63', '“Reset”~“ありがとう”バージョン~', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (205, '2025-06-28 01:16:38.728463', '64', 'Only One', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (206, '2025-06-28 01:16:38.728463', '65', 'Jolene', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (207, '2025-06-28 01:16:38.728463', '80', '君に嘘', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (208, '2025-06-28 01:16:38.728463', '81', '僕らのつづき', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (209, '2025-06-28 01:16:38.728463', '82', '꽃보다 남자 Original Television Soundtrack - 내 머리가 나빠서 (Acoustic Version)', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (210, '2025-06-28 01:16:38.728463', '83', '나만 몰랐던 이야기', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (211, '2025-06-28 01:16:38.728463', '84', '사랑을 믿어요', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (212, '2025-06-28 01:16:38.728463', '85', '万讃歌', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (213, '2025-06-28 01:16:38.729467', '97', '1874', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (214, '2025-06-28 01:16:38.729467', '98', '几许风雨(Live)', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (215, '2025-06-28 01:16:38.729467', '100', 'Unreachable', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (216, '2025-06-28 01:17:01.740692', '4', 'Et si tu n\'existais pas', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (217, '2025-06-28 01:17:01.740692', '63', '“Reset”~“ありがとう”バージョン~', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (218, '2025-06-28 01:17:01.740692', '64', 'Only One', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (219, '2025-06-28 01:17:01.740692', '65', 'Jolene', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (220, '2025-06-28 01:17:01.740692', '80', '君に嘘', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (221, '2025-06-28 01:17:01.740692', '81', '僕らのつづき', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (222, '2025-06-28 01:17:01.740692', '82', '꽃보다 남자 Original Television Soundtrack - 내 머리가 나빠서 (Acoustic Version)', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (223, '2025-06-28 01:17:01.740692', '83', '나만 몰랐던 이야기', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (224, '2025-06-28 01:17:01.740692', '84', '사랑을 믿어요', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (225, '2025-06-28 01:17:01.740692', '85', '万讃歌', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (226, '2025-06-28 01:17:01.740692', '97', '1874', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (227, '2025-06-28 01:17:01.740692', '98', '几许风雨(Live)', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (228, '2025-06-28 01:17:01.740692', '100', 'Unreachable', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (229, '2025-06-28 01:20:48.102962', '10', 'Roter Mond', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (230, '2025-06-28 01:20:48.102962', '11', 'Skellig', 3, '', 9, 2);
INSERT INTO `django_admin_log` VALUES (231, '2025-06-28 01:21:04.442739', '40', 'Jc8Bl0BB', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (232, '2025-06-28 01:21:04.442739', '8', 'Julia', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (233, '2025-06-28 01:24:07.795232', '45', '@@cw3n2', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (234, '2025-06-28 01:24:07.795232', '33', '@@Vs4UB', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (235, '2025-06-28 01:24:07.795232', '39', '1biKA8hCO', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (236, '2025-06-28 01:24:07.795232', '24', '1kK56CnzO', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (237, '2025-06-28 01:24:07.795232', '43', '1pBqPT5iO', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (238, '2025-06-28 01:24:07.795232', '35', '1ryea0rcO', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (239, '2025-06-28 01:24:07.795232', '29', 'bxss.me', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (240, '2025-06-28 01:24:07.795232', '25', 'cIjO8qJz', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (241, '2025-06-28 01:24:07.795232', '36', 'GOp47ilg', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (242, '2025-06-28 01:24:07.795232', '37', 'index.php', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (243, '2025-06-28 01:24:07.795232', '19', 'Lolia', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (244, '2025-06-28 01:24:07.795232', '17', 'Maire', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (245, '2025-06-28 01:24:07.795232', '22', 'QlqzzNwr', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (246, '2025-06-28 01:24:07.795232', '32', 'QlqzzNwr9454288', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (247, '2025-06-28 01:24:07.795232', '28', 'QlqzzNwrMqsSJDQD', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (248, '2025-06-28 01:24:07.795232', '26', 'QlqzzNwrxur4X2Fw', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (249, '2025-06-28 01:24:07.795232', '30', 'xfs.bxss.me', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (250, '2025-06-28 01:24:07.795232', '34', 'zFPWdwPk', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (251, '2025-06-28 01:24:07.795232', '47', 'zFPWdwPk9364600', 3, '', 4, 2);
INSERT INTO `django_admin_log` VALUES (252, '2025-06-28 01:24:07.795232', '42', 'zFPWdwPk9595091', 3, '', 4, 2);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (12, 'index', 'dynamic');
INSERT INTO `django_content_type` VALUES (9, 'index', 'song');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (13, 'users', 'person');
INSERT INTO `django_content_type` VALUES (7, 'users', 'playhistory');
INSERT INTO `django_content_type` VALUES (10, 'users', 'uploadedfile');
INSERT INTO `django_content_type` VALUES (8, 'users', 'usercollectionsong');
INSERT INTO `django_content_type` VALUES (11, 'users', 'userscoreonsong');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2025-04-24 17:08:30.181602');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2025-04-24 17:08:30.707206');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2025-04-24 17:08:30.876134');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2025-04-24 17:08:30.888138');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2025-04-24 17:08:30.907209');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2025-04-24 17:08:30.995715');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2025-04-24 17:08:31.070264');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2025-04-24 17:08:31.088547');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2025-04-24 17:08:31.095548');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2025-04-24 17:08:31.164970');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2025-04-24 17:08:31.167743');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2025-04-24 17:08:31.178541');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2025-04-24 17:08:31.247547');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2025-04-24 17:08:31.337914');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2025-04-24 17:08:31.358897');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2025-04-24 17:08:31.367809');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2025-04-24 17:08:31.456221');
INSERT INTO `django_migrations` VALUES (18, 'index', '0001_initial', '2025-04-24 17:08:31.518081');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2025-04-24 17:08:31.554920');
INSERT INTO `django_migrations` VALUES (20, 'users', '0001_initial', '2025-04-24 17:08:31.879957');
INSERT INTO `django_migrations` VALUES (21, 'index', '0002_rename_create_time_song_create_at', '2025-04-24 17:18:09.639062');
INSERT INTO `django_migrations` VALUES (22, 'users', '0002_uploadedfile', '2025-04-24 19:05:04.473170');
INSERT INTO `django_migrations` VALUES (23, 'users', '0003_remove_playhistory_play_at_playhistory_play_count', '2025-04-24 19:32:47.539376');
INSERT INTO `django_migrations` VALUES (24, 'index', '0003_alter_song_options_alter_song_artist_and_more', '2025-04-25 07:56:03.026875');
INSERT INTO `django_migrations` VALUES (25, 'users', '0004_userscoreonsong', '2025-04-25 07:56:03.321032');
INSERT INTO `django_migrations` VALUES (26, 'index', '0004_dynamic', '2025-04-26 11:57:34.985681');
INSERT INTO `django_migrations` VALUES (27, 'index', '0005_remove_dynamic_play_count_dynamic_total_play_count_and_more', '2025-04-28 01:59:20.097483');
INSERT INTO `django_migrations` VALUES (28, 'users', '0005_person', '2025-04-28 03:57:38.641279');
INSERT INTO `django_migrations` VALUES (29, 'users', '0006_person_gender', '2025-04-28 04:11:44.819857');
INSERT INTO `django_migrations` VALUES (30, 'users', '0007_delete_person', '2025-04-28 05:37:30.974035');
INSERT INTO `django_migrations` VALUES (31, 'users', '0008_alter_userscoreonsong_score', '2025-05-06 07:50:12.693053');
INSERT INTO `django_migrations` VALUES (32, 'users', '0009_usercollectionsong_unique_user_song_collection', '2025-05-06 09:58:10.448334');
INSERT INTO `django_migrations` VALUES (33, 'users', '0010_delete_uploadedfile', '2025-05-06 10:22:27.543896');
INSERT INTO `django_migrations` VALUES (34, 'index', '0006_alter_dynamic_collect_count_and_more', '2025-05-27 01:12:43.026338');
INSERT INTO `django_migrations` VALUES (35, 'users', '0011_alter_playhistory_play_count_alter_playhistory_song_and_more', '2025-05-27 01:12:43.156387');
INSERT INTO `django_migrations` VALUES (36, 'index', '0007_alter_song_file_path', '2025-05-28 08:22:45.612278');
INSERT INTO `django_migrations` VALUES (37, 'users', '0012_userscoreonsong_unique_user_song_score', '2025-06-07 17:28:23.584151');

-- ----------------------------
-- Table structure for index_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `index_dynamic`;
CREATE TABLE `index_dynamic`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `collect_count` int NOT NULL,
  `song_id` int NOT NULL,
  `total_play_count` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `song_id`(`song_id` ASC) USING BTREE,
  CONSTRAINT `index_dynamic_song_id_21bb9711_fk_index_song_id` FOREIGN KEY (`song_id`) REFERENCES `index_song` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of index_dynamic
-- ----------------------------
INSERT INTO `index_dynamic` VALUES (1, 7, 1, 83);
INSERT INTO `index_dynamic` VALUES (3, 2, 3, 35);
INSERT INTO `index_dynamic` VALUES (4, 3, 8, 42);
INSERT INTO `index_dynamic` VALUES (5, 4, 9, 53);
INSERT INTO `index_dynamic` VALUES (6, 4, 2, 46);
INSERT INTO `index_dynamic` VALUES (7, 3, 4, 20);
INSERT INTO `index_dynamic` VALUES (8, 3, 5, 51);
INSERT INTO `index_dynamic` VALUES (9, 3, 6, 27);
INSERT INTO `index_dynamic` VALUES (11, 2, 12, 1);
INSERT INTO `index_dynamic` VALUES (12, 0, 13, 5);
INSERT INTO `index_dynamic` VALUES (13, 1, 16, 5);
INSERT INTO `index_dynamic` VALUES (14, 0, 17, 4);
INSERT INTO `index_dynamic` VALUES (15, 0, 18, 8);
INSERT INTO `index_dynamic` VALUES (16, 1, 19, 2);
INSERT INTO `index_dynamic` VALUES (17, 1, 20, 2);
INSERT INTO `index_dynamic` VALUES (18, 1, 21, 2);
INSERT INTO `index_dynamic` VALUES (19, 0, 22, 4);
INSERT INTO `index_dynamic` VALUES (20, 0, 23, 3);
INSERT INTO `index_dynamic` VALUES (21, 0, 101, 22);
INSERT INTO `index_dynamic` VALUES (22, 1, 35, 3);
INSERT INTO `index_dynamic` VALUES (23, 0, 64, 1);
INSERT INTO `index_dynamic` VALUES (24, 0, 100, 5);
INSERT INTO `index_dynamic` VALUES (25, 0, 99, 4);
INSERT INTO `index_dynamic` VALUES (26, 1, 98, 4);
INSERT INTO `index_dynamic` VALUES (27, 0, 97, 2);
INSERT INTO `index_dynamic` VALUES (28, 0, 96, 1);
INSERT INTO `index_dynamic` VALUES (29, 0, 95, 1);
INSERT INTO `index_dynamic` VALUES (30, 0, 94, 4);
INSERT INTO `index_dynamic` VALUES (31, 0, 80, 3);
INSERT INTO `index_dynamic` VALUES (32, 0, 83, 4);
INSERT INTO `index_dynamic` VALUES (33, 0, 92, 5);
INSERT INTO `index_dynamic` VALUES (34, 0, 91, 5);
INSERT INTO `index_dynamic` VALUES (35, 2, 43, 3);
INSERT INTO `index_dynamic` VALUES (36, 1, 42, 1);
INSERT INTO `index_dynamic` VALUES (37, 0, 41, 6);
INSERT INTO `index_dynamic` VALUES (38, 1, 36, 3);
INSERT INTO `index_dynamic` VALUES (39, 0, 87, 3);
INSERT INTO `index_dynamic` VALUES (40, 1, 85, 3);
INSERT INTO `index_dynamic` VALUES (41, 0, 86, 3);
INSERT INTO `index_dynamic` VALUES (42, 0, 82, 1);
INSERT INTO `index_dynamic` VALUES (43, 0, 81, 3);
INSERT INTO `index_dynamic` VALUES (44, 0, 84, 1);
INSERT INTO `index_dynamic` VALUES (45, 0, 72, 2);
INSERT INTO `index_dynamic` VALUES (46, 1, 39, 4);
INSERT INTO `index_dynamic` VALUES (47, 0, 48, 1);
INSERT INTO `index_dynamic` VALUES (48, 0, 70, 4);
INSERT INTO `index_dynamic` VALUES (49, 0, 66, 1);
INSERT INTO `index_dynamic` VALUES (50, 0, 47, 2);
INSERT INTO `index_dynamic` VALUES (51, 1, 77, 1);
INSERT INTO `index_dynamic` VALUES (52, 1, 50, 1);
INSERT INTO `index_dynamic` VALUES (53, 0, 34, 1);
INSERT INTO `index_dynamic` VALUES (55, 0, 79, 1);
INSERT INTO `index_dynamic` VALUES (56, 1, 71, 0);
INSERT INTO `index_dynamic` VALUES (57, 0, 74, 2);
INSERT INTO `index_dynamic` VALUES (58, 0, 73, 0);
INSERT INTO `index_dynamic` VALUES (59, 0, 76, 1);
INSERT INTO `index_dynamic` VALUES (60, 1, 75, 0);
INSERT INTO `index_dynamic` VALUES (61, 1, 37, 0);
INSERT INTO `index_dynamic` VALUES (62, 1, 33, 2);
INSERT INTO `index_dynamic` VALUES (63, 0, 57, 1);
INSERT INTO `index_dynamic` VALUES (64, 0, 56, 0);
INSERT INTO `index_dynamic` VALUES (65, 0, 28, 3);
INSERT INTO `index_dynamic` VALUES (66, 0, 40, 3);
INSERT INTO `index_dynamic` VALUES (67, 0, 38, 3);
INSERT INTO `index_dynamic` VALUES (68, 0, 25, 3);
INSERT INTO `index_dynamic` VALUES (69, 0, 24, 2);
INSERT INTO `index_dynamic` VALUES (70, 0, 78, 0);
INSERT INTO `index_dynamic` VALUES (71, 0, 53, 0);
INSERT INTO `index_dynamic` VALUES (72, 0, 52, 0);
INSERT INTO `index_dynamic` VALUES (73, 0, 32, 0);
INSERT INTO `index_dynamic` VALUES (74, 0, 44, 1);
INSERT INTO `index_dynamic` VALUES (75, 0, 65, 0);
INSERT INTO `index_dynamic` VALUES (76, 0, 45, 2);
INSERT INTO `index_dynamic` VALUES (77, 0, 51, 1);
INSERT INTO `index_dynamic` VALUES (78, 0, 46, 0);
INSERT INTO `index_dynamic` VALUES (79, 1, 54, 0);
INSERT INTO `index_dynamic` VALUES (80, -1, 31, 0);
INSERT INTO `index_dynamic` VALUES (81, 1, 102, 6);
INSERT INTO `index_dynamic` VALUES (82, 1, 27, 0);

-- ----------------------------
-- Table structure for index_song
-- ----------------------------
DROP TABLE IF EXISTS `index_song`;
CREATE TABLE `index_song`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `artist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pop` int NOT NULL,
  `list_labels` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `file_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_song_name`(`name` ASC) USING BTREE,
  INDEX `idx_song_artist`(`artist` ASC) USING BTREE,
  INDEX `idx_song_pop`(`pop` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of index_song
-- ----------------------------
INSERT INTO `index_song` VALUES (1, '天空之城（钢琴版）（Cover 久石让）', 'iw ix', 100, '轻音乐 放松 经典 ', 'songs/iw ix - 天空之城（钢琴版）（Cover 久石让）.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (2, '拥有', '几米', 100, '轻音乐 放松 经典 ', 'songs/几米 - 拥有.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (3, '三个人的时光', '吴欣叡', 99, '轻音乐 放松 经典', 'songs/吴欣叡 - 三个人的时光.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (4, 'Et si tu n\'existais pas', 'Joe Dassin', 90, '小语种 清新 浪漫 ', 'songs/Joe Dassin - Et si tu n\'existais pas.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (5, '28º À L\'Ombre', 'Jean-Francois Maurice', 100, '小语种 清新 浪漫', 'songs/Jean-Francois Maurice - 28º À L\'Ombre.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (6, 'L\'horloge tourne', 'Mickael Miro', 60, '小语种 清新 浪漫 ', 'songs/Mickael Miro - L\'horloge tourne.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (8, '白昼之夜', '林隆璇', 100, '轻音乐 夜晚 放松 ', 'songs/林隆璇 - 白昼之夜.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (9, '涟漪', 'Lawrence', 90, '轻音乐 夜晚 放松 ', 'songs/Lawrence - 涟漪.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (12, 'Polska', 'Sava', 85, '民谣 欧美 小语种 ', 'songs/Sava - Polska.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (13, '秋意浓', '范宗沛', 75, '轻音乐 浪漫 伤感 ', 'songs/范宗沛 - 秋意浓.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (16, '场景一 向晚', '吴金黛', 55, '轻音乐 安静 放松 ', 'songs/吴金黛 - 场景一 向晚.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (17, 'Sayama Bird 4', 'The Nature Sounds Society Japan', 75, '轻音乐 安静 放松 ', 'songs/The Nature Sounds Society Japan - Sayama Bird 4.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (18, 'Sayama Bird 2', 'The Nature Sounds Society Japan', 65, '轻音乐 安静 放松 ', 'songs/The Nature Sounds Society Japan - Sayama Bird 2.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (19, '들리나요...', '太妍', 85, '韩语 影视原声 浪漫 ', 'songs/太妍 - 들리나요.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (20, '사랑아 또 사랑아', '白智英', 60, '韩语 影视原声 浪漫 ', 'songs/白智英 - 사랑아 또 사랑아.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (21, '오늘도 사랑해', '白智英', 55, '韩语 影视原声 浪漫 ', 'songs/白智英 - 오늘도 사랑해.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (22, 'INTRO 2009', 'HWA', 75, '电子 欧美 酒吧 ', 'songs/HWA - INTRO 2009.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (23, 'Happy Dreamer', 'Laidback', 70, '电子 欧美 酒吧 ', 'songs/Laidback - Happy Dreamer.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (24, 'Ghosts', 'Stéphane Pompougnac', 75, '电子 欧美 酒吧 ', 'songs/Stéphane Pompougnac - Ghosts.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (25, 'Those Lazy, Hazy, Crazy Days of Summer', 'Nat King Cole', 90, '爵士 欧美 酒吧 ', 'songs/Nat King Cole - Those Lazy, Hazy, Crazy Days of Summer.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (26, 'Libella Swing', 'Parov Stelar', 65, '爵士 欧美 酒吧 ', 'songs/Parov Stelar - Libella Swing.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (27, 'Chambermaid Swing', 'Parov Stelar', 75, '爵士 欧美 酒吧 ', 'songs/Parov Stelar - Chambermaid Swing.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (28, '碎月雨中奏', 'iw ix', 95, '轻音乐 学习 治愈 ', 'songs/iw ix - 碎月雨中奏.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (31, 'I Heard It Through the Grapevine', 'Creedence Clearwater Revival', 85, '摇滚 欧美 工作 ', 'songs/Creedence Clearwater Revival - I Heard It Through the Grapevine.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (32, 'Through The Rain', 'Cinderella', 70, '摇滚 欧美 工作 ', 'songs/Cinderella - Through The Rain.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (33, 'Gone With The Sin', 'HIM', 90, '摇滚 欧美 工作 ', 'songs/HIM - Gone With The Sin.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (34, 'I\'m Missing You', 'Bobby Tinsley', 95, '流行 欧美 快乐 ', 'songs/Bobby Tinsley - I\'m Missing You.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (35, 'Don\'t Love You No More (I\'m Sorry)', 'Craig David', 95, '流行 欧美 快乐 ', 'songs/Craig David - Don\'t Love You No More (I\'m Sorry).mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (36, 'What Are Words', 'Chris Medina', 100, '流行 欧美 快乐 ', 'songs/Chris Medina - What Are Words.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (37, 'Lighters', 'Eminem|Royce Da 5\'9\"|Bruno Mars', 95, '说唱 欧美 90后 ', 'songs/Eminem,Royce Da 5\'9,Bruno Mars - Lighters.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (38, 'Love The Way You Lie', 'Eminem|Rihanna', 95, '说唱 欧美 90后 ', 'songs/Eminem,Rihanna - Love The Way You Lie.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (39, 'Airplanes', 'B.o.B|Hayley Williams', 100, '说唱 欧美 90后 ', 'songs/B.o.B,Hayley Williams - Airplanes.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (40, 'Young For You', 'GALA', 100, '运动 兴奋 电子 ', 'songs/GALA - Young For You.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (41, 'Salamander', 'ELLEGARDEN', 80, '运动 兴奋 电子 ', 'songs/ELLEGARDEN - Salamander.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (42, 'Traveling Light', 'Joel Hanson|Sara Groves', 100, '运动 兴奋 电子 ', 'songs/Joel Hanson,Sara Groves - Traveling Light.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (43, 'Remember The Name (feat. Styles Of Beyond)', 'Fort Minor|Styles of Beyond', 100, '运动 欧美 兴奋 ', 'songs/Fort Minor,Styles of Beyond - Remember The Name (feat. Styles Of Beyond).mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (44, 'I Believe I Can Fly', 'R. Kelly', 85, '运动 欧美 兴奋 ', 'songs/R. Kelly - I Believe I Can Fly (1).mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (45, 'Fast Lane', 'Royce da 5\'9|Eminem', 60, '运动 欧美 兴奋 ', 'songs/Royce da 5\'9,Eminem - Fast Lane.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (46, 'Baby\'s Romance', 'Chris Garneau', 70, '欧美 民谣 另类/独立 ', 'songs/Chris Garneau - Baby\'s Romance.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (47, 'I Remember', 'MOCCA', 100, '欧美 民谣 另类/独立 ', 'songs/MOCCA - I Remember.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (48, 'Ordinary Day', 'Melanie Penn', 100, '欧美 民谣 另类/独立 ', 'songs/Melanie Penn - Ordinary Day.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (50, '故乡的原风景', '宗次郎', 100, 'ACG 日语 经典 ', 'songs/宗次郎 - 故乡的原风景.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (51, 'Luv Letter', 'DJ Okawari', 100, 'ACG 日语 经典 ', 'songs/DJ Okawari - Luv Letter.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (52, 'Time Travel', '岸部眞明', 100, '民谣 欧美 吉他 ', 'songs/岸部眞明 - Time Travel.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (53, 'Some Dreams', 'Allan Taylor|Thomas Klippel|Christine Maringer-Tries|Hans-Joerg Maucksch', 95, '民谣 欧美 吉他 ', 'songs/Allan Taylor,Thomas Klippel,Christine Maringer-Tries - Some Dreams.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (54, 'Pillow from Home', 'Brazzaville', 70, '民谣 欧美 吉他 ', 'songs/Brazzaville - Pillow from Home.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (55, 'Can\'t Help Falling in Love(studio duet)', 'Andrea Bocelli|Katharine McPhee', 80, '小语种 欧美 性感 ', 'songs/Andrea Bocelli,Katharine McPhee - Can\'t Help Falling in Love(studio duet).mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (56, 'Speak Softly Love', 'Andy Williams', 95, '小语种 欧美 性感 ', 'songs/Andy Williams - Speak Softly Love.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (57, 'Italia', 'Andrea Bocelli|Chris Botti', 85, '小语种 欧美 性感 ', 'songs/Andrea Bocelli,Chris Botti - Italia.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (60, 'What Are Words', 'Chris Medina', 100, '欧美 流行 榜单 ', 'songs/Chris Medina - What Are Words.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (61, '萤火虫之舞', '萤火虫', 80, '轻音乐 日语 ACG ', 'songs/萤火虫 - 萤火虫之舞.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (63, '“Reset”~“ありがとう”バージョン~', '山口裕史', 70, '轻音乐 日语 ACG ', 'songs/山口裕史 - “Reset”~“ありがとう”バージョン~.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (64, 'Only One', 'Alex Band', 80, '影视原声 欧美 流行 ', 'songs/Alex Band - Only One.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (65, 'Jolene', 'Dolly Parton', 90, '影视原声 欧美 流行 ', 'songs/Dolly Parton - Jolene.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (66, 'I Am You', 'Kim Taylor', 100, '影视原声 欧美 流行 ', 'songs/Kim Taylor - I Am You.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (67, '无限大', '侧田', 90, '粤语 流行 经典 ', 'songs/侧田 - 无限大.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (68, '情歌', '侧田', 100, '粤语 流行 经典 ', 'songs/侧田 - 情歌.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (69, 'Kong', '侧田', 100, '粤语 流行 经典 ', 'songs/侧田 - Kong.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (70, 'Fallin\' Out', 'Keyshia Cole', 100, '说唱 欧美 经典 ', 'songs/Keyshia Cole - Fallin\' Out.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (71, 'I Got 5 On It (2F Remix)', 'Luniz', 70, '说唱 欧美 经典 ', 'songs/Luniz - I Got 5 On It (2F Remix).mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (72, 'Tha Crossroads', 'Bone Thugs-N-Harmony', 80, '说唱 欧美 经典 ', 'songs/Bone Thugs-N-Harmony - Tha Crossroads.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (73, '西厢', '后弦', 100, '古风 华语 古典 ', 'songs/后弦 - 西厢.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (74, '折子戏', '黄阅', 100, '古风 华语 古典 ', 'songs/黄阅 - 折子戏.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (75, '如花', '河图', 95, '古风 华语 古典 ', 'songs/河图 - 如花.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (76, 'Somewhere', 'July', 100, '韩语 夜晚 流行 ', 'songs/July - Somewhere.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (77, '당신은.. 나는 바보입니다', 'Stay', 60, '韩语 夜晚 流行 ', 'songs/Stay - 당신은.. 나는 바보입니다.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (78, 'I Love U, I Want U, I Need U (Sweet Acoustic ver.)', '具荷拉', 65, '韩语 夜晚 流行 ', 'songs/具荷拉 - I Love U, I Want U, I Need U (Sweet Acoustic ver.).mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (79, 'とても痛い痛がりたい', '灯油', 75, '日语 ACG 翻唱 ', 'songs/灯油 - とても痛い痛がりたい.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (80, '君に嘘', 'うさ', 50, '日语 ACG 翻唱 ', 'songs/うさ - 君に嘘.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (81, '僕らのつづき', '柊優花', 90, '日语 ACG 翻唱 ', 'songs/柊優花 - 僕らのつづき.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (82, '꽃보다 남자 Original Television Soundtrack - 내 머리가 나빠서 (Acoustic Version)', '金贤重', 80, '韩语 流行 榜单 ', 'songs/金贤重 - 꽃보다 남자 Original Television Soundtrack - 내 머리가 나빠서 (Acoustic Version).mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (83, '나만 몰랐던 이야기', 'IU', 70, '韩语 流行 榜单 ', 'songs/IU - 나만 몰랐던 이야기.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (84, '사랑을 믿어요', 'IU|俞承豪', 50, '韩语 流行 榜单 ', 'songs/IU,俞承豪 - 사랑을 믿어요.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (85, '万讃歌', '葉加瀬太郎', 75, '轻音乐 兴奋 ', 'songs/葉加瀬太郎 - 万讃歌.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (86, 'The 5th', 'David Garrett', 55, '轻音乐 兴奋 ', 'songs/David Garrett - The 5th.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (87, 'Mission Impossible', 'David Garrett', 65, '轻音乐 兴奋 ', 'songs/David Garrett - Mission Impossible.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (91, '琴之翼', 'V.K克', 80, '轻音乐 钢琴 ACG ', 'songs/V.K克 - 琴之翼.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (92, 'Tassel', 'Cymophane', 100, '轻音乐 钢琴 ACG ', 'songs/Cymophane - Tassel.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (94, 'My Foolish Heart', 'Bill Evans', 90, '爵士 放松 欧美 ', 'songs/Bill Evans - My Foolish Heart.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (95, 'My Funny Valentine', 'Chet Baker', 95, '爵士 放松 欧美 ', 'songs/Chet Baker - My Funny Valentine.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (96, 'I Am a Fool to Want You', 'Chet Baker', 75, '爵士 放松 欧美 ', 'songs/Chet Baker - I Am a Fool to Want You.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (97, '1874', '陈奕迅', 95, '轻音乐 怀旧 民谣 ', 'songs/陈奕迅 - 1874.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (98, '几许风雨(Live)', '陈奕迅', 80, '轻音乐 怀旧 民谣 ', 'songs/陈奕迅 - 几许风雨(Live).mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (99, '贝加尔湖畔', '李健', 100, '轻音乐 怀旧 民谣 ', 'songs/李健 - 贝加尔湖畔.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (100, 'Unreachable', 'Robert J. P. Oberg', 95, '安静 轻音乐 器乐 ', 'songs/Robert J. P. Oberg - Unreachable.mp3', '2025-04-25 01:18:51.000000');
INSERT INTO `index_song` VALUES (101, '吹梦到西洲', '恋恋故人难,黄诗扶,王敬轩（妖扬）', 70, '古典 古风', 'songs/恋恋故人难黄诗扶王敬轩妖扬_-_吹梦到西洲.mp3', '2025-04-25 09:57:23.691588');
INSERT INTO `index_song` VALUES (102, '时光卷轴', '封茗囧菌,双笙', 50, '城堡 童话', 'songs/封茗囧菌双笙陈元汐_-_时光卷轴.mp3', '2025-06-25 19:17:26.022657');

-- ----------------------------
-- Table structure for users_playhistory
-- ----------------------------
DROP TABLE IF EXISTS `users_playhistory`;
CREATE TABLE `users_playhistory`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `song_id` int NOT NULL,
  `user_id` int NOT NULL,
  `play_count` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_playhistory_user_id_song_id_80770110_uniq`(`user_id` ASC, `song_id` ASC) USING BTREE,
  INDEX `users_playhistory_song_id_4861a8fa_fk_index_song_id`(`song_id` ASC) USING BTREE,
  INDEX `idx_play_history_user`(`user_id` ASC) USING BTREE,
  CONSTRAINT `users_playhistory_song_id_4861a8fa_fk_index_song_id` FOREIGN KEY (`song_id`) REFERENCES `index_song` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_playhistory_user_id_042980d3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_playhistory
-- ----------------------------
INSERT INTO `users_playhistory` VALUES (1, 35, 2, 3);
INSERT INTO `users_playhistory` VALUES (2, 1, 2, 35);
INSERT INTO `users_playhistory` VALUES (3, 4, 2, 7);
INSERT INTO `users_playhistory` VALUES (5, 1, 1, 39);
INSERT INTO `users_playhistory` VALUES (6, 3, 1, 9);
INSERT INTO `users_playhistory` VALUES (7, 8, 1, 17);
INSERT INTO `users_playhistory` VALUES (8, 9, 1, 16);
INSERT INTO `users_playhistory` VALUES (9, 2, 1, 16);
INSERT INTO `users_playhistory` VALUES (10, 4, 1, 5);
INSERT INTO `users_playhistory` VALUES (11, 5, 1, 6);
INSERT INTO `users_playhistory` VALUES (12, 6, 1, 3);
INSERT INTO `users_playhistory` VALUES (15, 12, 1, 1);
INSERT INTO `users_playhistory` VALUES (16, 13, 1, 4);
INSERT INTO `users_playhistory` VALUES (17, 16, 1, 4);
INSERT INTO `users_playhistory` VALUES (18, 17, 1, 3);
INSERT INTO `users_playhistory` VALUES (19, 18, 1, 8);
INSERT INTO `users_playhistory` VALUES (20, 19, 1, 1);
INSERT INTO `users_playhistory` VALUES (21, 20, 1, 1);
INSERT INTO `users_playhistory` VALUES (22, 21, 1, 1);
INSERT INTO `users_playhistory` VALUES (23, 22, 1, 3);
INSERT INTO `users_playhistory` VALUES (24, 23, 1, 1);
INSERT INTO `users_playhistory` VALUES (25, 2, 2, 25);
INSERT INTO `users_playhistory` VALUES (26, 8, 2, 12);
INSERT INTO `users_playhistory` VALUES (27, 101, 2, 20);
INSERT INTO `users_playhistory` VALUES (28, 3, 2, 19);
INSERT INTO `users_playhistory` VALUES (29, 9, 2, 33);
INSERT INTO `users_playhistory` VALUES (31, 64, 2, 1);
INSERT INTO `users_playhistory` VALUES (32, 5, 2, 38);
INSERT INTO `users_playhistory` VALUES (33, 6, 2, 12);
INSERT INTO `users_playhistory` VALUES (34, 23, 2, 1);
INSERT INTO `users_playhistory` VALUES (35, 22, 2, 1);
INSERT INTO `users_playhistory` VALUES (36, 21, 2, 1);
INSERT INTO `users_playhistory` VALUES (37, 20, 2, 1);
INSERT INTO `users_playhistory` VALUES (38, 100, 2, 5);
INSERT INTO `users_playhistory` VALUES (39, 99, 2, 3);
INSERT INTO `users_playhistory` VALUES (40, 98, 2, 4);
INSERT INTO `users_playhistory` VALUES (41, 97, 2, 2);
INSERT INTO `users_playhistory` VALUES (42, 96, 2, 1);
INSERT INTO `users_playhistory` VALUES (43, 95, 2, 1);
INSERT INTO `users_playhistory` VALUES (44, 94, 2, 3);
INSERT INTO `users_playhistory` VALUES (45, 80, 2, 3);
INSERT INTO `users_playhistory` VALUES (46, 83, 2, 3);
INSERT INTO `users_playhistory` VALUES (47, 92, 2, 5);
INSERT INTO `users_playhistory` VALUES (48, 91, 2, 5);
INSERT INTO `users_playhistory` VALUES (49, 43, 2, 2);
INSERT INTO `users_playhistory` VALUES (50, 42, 2, 1);
INSERT INTO `users_playhistory` VALUES (51, 41, 2, 1);
INSERT INTO `users_playhistory` VALUES (52, 36, 2, 1);
INSERT INTO `users_playhistory` VALUES (53, 87, 2, 2);
INSERT INTO `users_playhistory` VALUES (54, 85, 2, 3);
INSERT INTO `users_playhistory` VALUES (55, 86, 2, 2);
INSERT INTO `users_playhistory` VALUES (56, 82, 2, 1);
INSERT INTO `users_playhistory` VALUES (57, 81, 2, 3);
INSERT INTO `users_playhistory` VALUES (58, 84, 2, 1);
INSERT INTO `users_playhistory` VALUES (59, 72, 2, 1);
INSERT INTO `users_playhistory` VALUES (60, 39, 2, 3);
INSERT INTO `users_playhistory` VALUES (61, 48, 2, 1);
INSERT INTO `users_playhistory` VALUES (62, 70, 2, 4);
INSERT INTO `users_playhistory` VALUES (63, 66, 2, 1);
INSERT INTO `users_playhistory` VALUES (64, 47, 2, 2);
INSERT INTO `users_playhistory` VALUES (65, 101, 1, 1);
INSERT INTO `users_playhistory` VALUES (66, 50, 1, 1);
INSERT INTO `users_playhistory` VALUES (67, 34, 2, 1);
INSERT INTO `users_playhistory` VALUES (68, 79, 2, 1);
INSERT INTO `users_playhistory` VALUES (69, 71, 2, 1);
INSERT INTO `users_playhistory` VALUES (71, 74, 2, 2);
INSERT INTO `users_playhistory` VALUES (74, 2, 4, 1);
INSERT INTO `users_playhistory` VALUES (75, 8, 4, 11);
INSERT INTO `users_playhistory` VALUES (78, 6, 4, 10);
INSERT INTO `users_playhistory` VALUES (79, 5, 4, 3);
INSERT INTO `users_playhistory` VALUES (80, 4, 4, 7);
INSERT INTO `users_playhistory` VALUES (81, 3, 4, 5);
INSERT INTO `users_playhistory` VALUES (82, 77, 4, 1);
INSERT INTO `users_playhistory` VALUES (83, 1, 4, 2);
INSERT INTO `users_playhistory` VALUES (84, 83, 1, 1);
INSERT INTO `users_playhistory` VALUES (85, 57, 2, 1);
INSERT INTO `users_playhistory` VALUES (86, 72, 1, 1);
INSERT INTO `users_playhistory` VALUES (96, 41, 1, 5);
INSERT INTO `users_playhistory` VALUES (97, 28, 1, 3);
INSERT INTO `users_playhistory` VALUES (98, 99, 1, 1);
INSERT INTO `users_playhistory` VALUES (99, 86, 1, 1);
INSERT INTO `users_playhistory` VALUES (100, 40, 1, 3);
INSERT INTO `users_playhistory` VALUES (101, 38, 1, 2);
INSERT INTO `users_playhistory` VALUES (102, 33, 1, 2);
INSERT INTO `users_playhistory` VALUES (103, 25, 1, 2);
INSERT INTO `users_playhistory` VALUES (104, 24, 1, 1);
INSERT INTO `users_playhistory` VALUES (105, 94, 1, 1);
INSERT INTO `users_playhistory` VALUES (113, 25, 9, 1);
INSERT INTO `users_playhistory` VALUES (115, 36, 12, 1);
INSERT INTO `users_playhistory` VALUES (116, 9, 12, 1);
INSERT INTO `users_playhistory` VALUES (117, 2, 12, 3);
INSERT INTO `users_playhistory` VALUES (118, 1, 12, 3);
INSERT INTO `users_playhistory` VALUES (119, 3, 12, 1);
INSERT INTO `users_playhistory` VALUES (120, 5, 12, 1);
INSERT INTO `users_playhistory` VALUES (121, 9, 13, 1);
INSERT INTO `users_playhistory` VALUES (122, 1, 13, 1);
INSERT INTO `users_playhistory` VALUES (142, 36, 20, 1);
INSERT INTO `users_playhistory` VALUES (143, 39, 20, 1);
INSERT INTO `users_playhistory` VALUES (144, 44, 20, 1);
INSERT INTO `users_playhistory` VALUES (145, 45, 20, 2);
INSERT INTO `users_playhistory` VALUES (146, 5, 20, 2);
INSERT INTO `users_playhistory` VALUES (147, 6, 20, 1);
INSERT INTO `users_playhistory` VALUES (148, 17, 20, 1);
INSERT INTO `users_playhistory` VALUES (149, 19, 20, 1);
INSERT INTO `users_playhistory` VALUES (150, 43, 20, 1);
INSERT INTO `users_playhistory` VALUES (151, 76, 20, 1);
INSERT INTO `users_playhistory` VALUES (152, 87, 20, 1);
INSERT INTO `users_playhistory` VALUES (153, 1, 21, 3);
INSERT INTO `users_playhistory` VALUES (154, 2, 21, 1);
INSERT INTO `users_playhistory` VALUES (155, 51, 21, 1);
INSERT INTO `users_playhistory` VALUES (156, 23, 21, 1);
INSERT INTO `users_playhistory` VALUES (157, 3, 21, 1);
INSERT INTO `users_playhistory` VALUES (158, 6, 21, 1);
INSERT INTO `users_playhistory` VALUES (159, 9, 21, 2);
INSERT INTO `users_playhistory` VALUES (160, 5, 21, 1);
INSERT INTO `users_playhistory` VALUES (161, 4, 21, 1);
INSERT INTO `users_playhistory` VALUES (162, 8, 21, 1);
INSERT INTO `users_playhistory` VALUES (165, 101, 21, 1);
INSERT INTO `users_playhistory` VALUES (166, 13, 21, 1);
INSERT INTO `users_playhistory` VALUES (167, 16, 21, 1);
INSERT INTO `users_playhistory` VALUES (169, 8, 9, 1);
INSERT INTO `users_playhistory` VALUES (170, 38, 2, 1);
INSERT INTO `users_playhistory` VALUES (171, 102, 2, 6);
INSERT INTO `users_playhistory` VALUES (172, 24, 2, 1);

-- ----------------------------
-- Table structure for users_usercollectionsong
-- ----------------------------
DROP TABLE IF EXISTS `users_usercollectionsong`;
CREATE TABLE `users_usercollectionsong`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `collect_at` datetime(6) NOT NULL,
  `song_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_user_song_collection`(`user_id` ASC, `song_id` ASC) USING BTREE,
  INDEX `users_usercollectionsong_song_id_d5487fc5_fk_index_song_id`(`song_id` ASC) USING BTREE,
  INDEX `idx_user_collection_song_user`(`user_id` ASC) USING BTREE,
  CONSTRAINT `users_usercollectionsong_song_id_d5487fc5_fk_index_song_id` FOREIGN KEY (`song_id`) REFERENCES `index_song` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_usercollectionsong_user_id_d584e621_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_usercollectionsong
-- ----------------------------
INSERT INTO `users_usercollectionsong` VALUES (43, '2025-05-14 10:31:45.827827', 8, 1);
INSERT INTO `users_usercollectionsong` VALUES (46, '2025-05-14 10:31:51.112139', 1, 1);
INSERT INTO `users_usercollectionsong` VALUES (47, '2025-05-14 10:33:26.714331', 77, 4);
INSERT INTO `users_usercollectionsong` VALUES (48, '2025-05-14 10:33:28.712220', 71, 4);
INSERT INTO `users_usercollectionsong` VALUES (49, '2025-05-14 10:33:31.797069', 75, 4);
INSERT INTO `users_usercollectionsong` VALUES (50, '2025-05-14 10:33:37.001045', 43, 4);
INSERT INTO `users_usercollectionsong` VALUES (51, '2025-05-14 10:33:38.634592', 39, 4);
INSERT INTO `users_usercollectionsong` VALUES (52, '2025-05-14 10:33:40.871243', 37, 4);
INSERT INTO `users_usercollectionsong` VALUES (53, '2025-05-14 10:33:45.304318', 33, 4);
INSERT INTO `users_usercollectionsong` VALUES (54, '2025-05-16 08:28:12.502071', 9, 1);
INSERT INTO `users_usercollectionsong` VALUES (61, '2025-05-16 11:17:32.982350', 8, 4);
INSERT INTO `users_usercollectionsong` VALUES (62, '2025-05-16 11:17:36.898547', 4, 4);
INSERT INTO `users_usercollectionsong` VALUES (71, '2025-05-24 13:03:01.949155', 5, 9);
INSERT INTO `users_usercollectionsong` VALUES (72, '2025-05-24 13:03:03.754853', 1, 9);
INSERT INTO `users_usercollectionsong` VALUES (73, '2025-05-24 13:03:05.460215', 2, 9);
INSERT INTO `users_usercollectionsong` VALUES (80, '2025-05-27 06:14:30.957427', 1, 12);
INSERT INTO `users_usercollectionsong` VALUES (82, '2025-05-27 07:13:10.939927', 2, 12);
INSERT INTO `users_usercollectionsong` VALUES (83, '2025-05-27 15:59:24.971449', 3, 12);
INSERT INTO `users_usercollectionsong` VALUES (84, '2025-05-28 08:08:02.106575', 6, 13);
INSERT INTO `users_usercollectionsong` VALUES (85, '2025-05-28 08:08:03.849714', 9, 13);
INSERT INTO `users_usercollectionsong` VALUES (86, '2025-05-28 08:08:05.471558', 2, 13);
INSERT INTO `users_usercollectionsong` VALUES (87, '2025-05-28 08:22:55.932382', 1, 13);
INSERT INTO `users_usercollectionsong` VALUES (107, '2025-06-01 11:15:49.362454', 12, 18);
INSERT INTO `users_usercollectionsong` VALUES (108, '2025-06-01 11:15:51.611413', 20, 18);
INSERT INTO `users_usercollectionsong` VALUES (109, '2025-06-01 11:15:53.573948', 21, 18);
INSERT INTO `users_usercollectionsong` VALUES (110, '2025-06-01 11:15:58.300645', 9, 18);
INSERT INTO `users_usercollectionsong` VALUES (111, '2025-06-01 11:16:00.033293', 4, 18);
INSERT INTO `users_usercollectionsong` VALUES (112, '2025-06-01 11:16:02.331463', 1, 18);
INSERT INTO `users_usercollectionsong` VALUES (113, '2025-06-01 11:16:05.084612', 19, 18);
INSERT INTO `users_usercollectionsong` VALUES (114, '2025-06-01 11:16:08.534121', 98, 18);
INSERT INTO `users_usercollectionsong` VALUES (122, '2025-06-02 06:35:06.593203', 42, 20);
INSERT INTO `users_usercollectionsong` VALUES (124, '2025-06-02 06:36:04.704477', 5, 20);
INSERT INTO `users_usercollectionsong` VALUES (125, '2025-06-02 06:36:16.664929', 6, 20);
INSERT INTO `users_usercollectionsong` VALUES (126, '2025-06-02 06:36:18.208125', 1, 20);
INSERT INTO `users_usercollectionsong` VALUES (127, '2025-06-02 06:36:22.644595', 43, 20);
INSERT INTO `users_usercollectionsong` VALUES (132, '2025-06-02 11:10:21.154319', 54, 21);
INSERT INTO `users_usercollectionsong` VALUES (133, '2025-06-02 11:10:35.109686', 85, 21);
INSERT INTO `users_usercollectionsong` VALUES (134, '2025-06-02 11:10:37.679999', 50, 21);
INSERT INTO `users_usercollectionsong` VALUES (135, '2025-06-02 11:10:40.275103', 36, 21);
INSERT INTO `users_usercollectionsong` VALUES (137, '2025-06-07 17:24:34.067391', 35, 2);
INSERT INTO `users_usercollectionsong` VALUES (138, '2025-06-09 19:55:29.817286', 2, 2);
INSERT INTO `users_usercollectionsong` VALUES (139, '2025-06-09 20:18:37.138940', 5, 2);
INSERT INTO `users_usercollectionsong` VALUES (140, '2025-06-09 20:51:17.026662', 3, 2);
INSERT INTO `users_usercollectionsong` VALUES (141, '2025-06-09 20:51:19.505209', 8, 2);
INSERT INTO `users_usercollectionsong` VALUES (142, '2025-06-09 20:51:21.296109', 4, 2);
INSERT INTO `users_usercollectionsong` VALUES (143, '2025-06-09 20:51:23.281159', 9, 2);
INSERT INTO `users_usercollectionsong` VALUES (144, '2025-06-09 20:51:25.367874', 6, 2);
INSERT INTO `users_usercollectionsong` VALUES (145, '2025-06-13 13:24:43.168714', 1, 2);
INSERT INTO `users_usercollectionsong` VALUES (148, '2025-06-25 18:05:52.065101', 16, 2);
INSERT INTO `users_usercollectionsong` VALUES (149, '2025-06-25 19:38:20.166766', 102, 2);
INSERT INTO `users_usercollectionsong` VALUES (150, '2025-06-25 21:47:57.471798', 27, 2);
INSERT INTO `users_usercollectionsong` VALUES (151, '2025-06-28 01:27:42.205928', 12, 2);

-- ----------------------------
-- Table structure for users_userscoreonsong
-- ----------------------------
DROP TABLE IF EXISTS `users_userscoreonsong`;
CREATE TABLE `users_userscoreonsong`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `score` int NOT NULL,
  `score_at` datetime(6) NOT NULL,
  `song_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_user_song_score`(`user_id` ASC, `song_id` ASC) USING BTREE,
  INDEX `users_userscoreonsong_song_id_6d68c182_fk_index_song_id`(`song_id` ASC) USING BTREE,
  CONSTRAINT `users_userscoreonsong_song_id_6d68c182_fk_index_song_id` FOREIGN KEY (`song_id`) REFERENCES `index_song` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userscoreonsong_user_id_cbeb8530_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userscoreonsong
-- ----------------------------
INSERT INTO `users_userscoreonsong` VALUES (14, 10, '2025-05-14 10:31:25.562563', 2, 1);
INSERT INTO `users_userscoreonsong` VALUES (15, 9, '2025-05-14 10:31:28.169946', 6, 1);
INSERT INTO `users_userscoreonsong` VALUES (16, 5, '2025-05-14 10:31:30.992717', 9, 1);
INSERT INTO `users_userscoreonsong` VALUES (17, 9, '2025-05-14 10:32:33.226575', 1, 4);
INSERT INTO `users_userscoreonsong` VALUES (18, 8, '2025-05-14 10:32:38.500164', 9, 4);
INSERT INTO `users_userscoreonsong` VALUES (19, 1, '2025-05-14 10:33:48.479314', 27, 4);
INSERT INTO `users_userscoreonsong` VALUES (20, 3, '2025-05-14 10:33:52.629197', 32, 4);
INSERT INTO `users_userscoreonsong` VALUES (21, 3, '2025-05-16 08:27:20.432724', 4, 1);
INSERT INTO `users_userscoreonsong` VALUES (22, 5, '2025-05-16 08:34:13.374355', 83, 1);
INSERT INTO `users_userscoreonsong` VALUES (23, 4, '2025-05-16 08:34:21.751721', 35, 1);
INSERT INTO `users_userscoreonsong` VALUES (25, 1, '2025-05-16 11:16:23.357807', 6, 4);
INSERT INTO `users_userscoreonsong` VALUES (26, 7, '2025-05-16 11:27:19.083249', 8, 4);
INSERT INTO `users_userscoreonsong` VALUES (30, 1, '2025-05-20 11:20:48.937072', 5, 1);
INSERT INTO `users_userscoreonsong` VALUES (31, 9, '2025-05-20 11:20:52.305815', 18, 1);
INSERT INTO `users_userscoreonsong` VALUES (32, 10, '2025-05-20 12:00:22.000272', 8, 1);
INSERT INTO `users_userscoreonsong` VALUES (35, 1, '2025-05-20 12:10:21.954229', 13, 1);
INSERT INTO `users_userscoreonsong` VALUES (36, 10, '2025-05-20 12:19:13.441056', 40, 1);
INSERT INTO `users_userscoreonsong` VALUES (37, 8, '2025-05-20 12:25:23.349606', 17, 1);
INSERT INTO `users_userscoreonsong` VALUES (45, 10, '2025-05-24 13:02:47.356974', 25, 9);
INSERT INTO `users_userscoreonsong` VALUES (46, 4, '2025-05-24 13:02:53.834135', 48, 9);
INSERT INTO `users_userscoreonsong` VALUES (47, 10, '2025-05-27 06:14:29.542966', 3, 12);
INSERT INTO `users_userscoreonsong` VALUES (48, 2, '2025-05-27 07:12:24.669424', 2, 12);
INSERT INTO `users_userscoreonsong` VALUES (49, 9, '2025-05-27 07:13:44.717540', 4, 12);
INSERT INTO `users_userscoreonsong` VALUES (50, 3, '2025-05-27 07:13:53.910217', 5, 12);
INSERT INTO `users_userscoreonsong` VALUES (51, 7, '2025-05-27 07:27:37.963753', 1, 12);
INSERT INTO `users_userscoreonsong` VALUES (52, 2, '2025-05-28 15:19:20.268730', 1, 13);
INSERT INTO `users_userscoreonsong` VALUES (58, 1, '2025-06-01 11:17:12.751660', 1, 18);
INSERT INTO `users_userscoreonsong` VALUES (59, 6, '2025-06-01 11:17:21.009982', 9, 18);
INSERT INTO `users_userscoreonsong` VALUES (61, 8, '2025-06-01 11:17:28.573216', 4, 18);
INSERT INTO `users_userscoreonsong` VALUES (62, 6, '2025-06-01 11:17:33.171740', 21, 18);
INSERT INTO `users_userscoreonsong` VALUES (63, 8, '2025-06-01 11:17:36.730454', 16, 18);
INSERT INTO `users_userscoreonsong` VALUES (64, 9, '2025-06-01 11:17:44.491634', 27, 18);
INSERT INTO `users_userscoreonsong` VALUES (73, 2, '2025-06-02 06:35:12.346652', 41, 20);
INSERT INTO `users_userscoreonsong` VALUES (74, 6, '2025-06-02 06:35:22.027429', 38, 20);
INSERT INTO `users_userscoreonsong` VALUES (75, 6, '2025-06-02 06:35:30.034008', 43, 20);
INSERT INTO `users_userscoreonsong` VALUES (76, 10, '2025-06-02 06:35:34.813952', 45, 20);
INSERT INTO `users_userscoreonsong` VALUES (77, 6, '2025-06-02 06:35:40.750201', 36, 20);
INSERT INTO `users_userscoreonsong` VALUES (78, 3, '2025-06-02 06:35:48.698632', 64, 20);
INSERT INTO `users_userscoreonsong` VALUES (79, 10, '2025-06-02 11:08:34.340387', 6, 21);
INSERT INTO `users_userscoreonsong` VALUES (80, 5, '2025-06-02 11:08:38.153661', 5, 21);
INSERT INTO `users_userscoreonsong` VALUES (81, 10, '2025-06-02 11:08:43.572512', 4, 21);
INSERT INTO `users_userscoreonsong` VALUES (82, 1, '2025-06-02 11:08:47.826752', 1, 21);
INSERT INTO `users_userscoreonsong` VALUES (83, 1, '2025-06-02 11:08:54.075754', 22, 21);
INSERT INTO `users_userscoreonsong` VALUES (84, 6, '2025-06-02 11:08:57.430662', 17, 21);
INSERT INTO `users_userscoreonsong` VALUES (90, 1, '2025-06-07 15:05:45.590489', 9, 9);
INSERT INTO `users_userscoreonsong` VALUES (91, 2, '2025-06-07 17:24:38.944670', 35, 2);
INSERT INTO `users_userscoreonsong` VALUES (92, 2, '2025-06-07 17:24:43.782889', 3, 2);
INSERT INTO `users_userscoreonsong` VALUES (93, 10, '2025-06-07 17:24:48.351221', 2, 2);
INSERT INTO `users_userscoreonsong` VALUES (94, 2, '2025-06-07 17:25:27.609275', 1, 2);
INSERT INTO `users_userscoreonsong` VALUES (95, 10, '2025-06-09 19:37:31.294406', 4, 2);
INSERT INTO `users_userscoreonsong` VALUES (96, 10, '2025-06-09 20:42:38.880372', 5, 2);
INSERT INTO `users_userscoreonsong` VALUES (97, 10, '2025-06-25 19:18:52.181940', 102, 2);

SET FOREIGN_KEY_CHECKS = 1;
