/*
 Navicat Premium Data Transfer

 Source Server         : Mysql_8.0
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : boot_tsm

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 02/06/2020 07:09:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adm_id` int(10) NOT NULL COMMENT '员工号(主键)',
  `adm_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工登录密码',
  `adm_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工姓名',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`adm_id`),
  KEY `adm_id` (`adm_id`,`adm_password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员信息表';

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES (110, '123', '张强', 1, '15858287922');
COMMIT;

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply` (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `cors_id` int(11) NOT NULL COMMENT '课程id-外键',
  `isbn` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ISBN码',
  `title` varchar(255) DEFAULT NULL COMMENT '教材名称',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `press` varchar(50) DEFAULT NULL COMMENT '出版社',
  `fixed_price` decimal(10,2) DEFAULT NULL COMMENT '定价',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`apply_id`) USING BTREE,
  KEY `fk_apply_course` (`cors_id`),
  CONSTRAINT `fk_apply_course` FOREIGN KEY (`cors_id`) REFERENCES `course` (`cors_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='课程所需教材填报表';

-- ----------------------------
-- Records of apply
-- ----------------------------
BEGIN;
INSERT INTO `apply` VALUES (1, 1, '9787302233824', '微积分1', '微积分1作者', '新华出版社', 12.40, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/10_1241.jpg', '1');
INSERT INTO `apply` VALUES (4, 9, '9787030196590', '微积分2', '华长生', '科学出版社', 12.40, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/9_9787030196590.jpg', '1');
INSERT INTO `apply` VALUES (6, 12, '9787302511410', 'Java基础入门(第2版)', '黑马程序员', '清华大学出版社', 120.40, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/12_9787302511410.jpg', '1');
INSERT INTO `apply` VALUES (7, 13, '9787115429742', 'Servlet JSP和Spring MVC初学指南', 'Budi Kurniawan, Paul Deck', '人民邮电出版社', 69.00, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/13_9787115429742.jpg', '1');
INSERT INTO `apply` VALUES (8, 14, '9787115429742', 'Servlet JSP和Spring MVC初学指南', 'Budi Kurniawan, Paul Deck', '', 88.88, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/14_9787115429742.jpg', '1');
INSERT INTO `apply` VALUES (13, 23, '9787030196590', '微积分2', '华长生', '科学出版社', 25.00, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/23_9787030196590.jpg', '1');
INSERT INTO `apply` VALUES (14, 10, '9787040396614', '工程数学线性代数第六版', '同济大学数学系', '高等教育出版社', 22.20, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/10_9787040396614.jpg', '1');
INSERT INTO `apply` VALUES (15, 2, '9787512384972', '线性代数', '杨文泉,赵坤,赵鹏起', '中国电力出版社', 27.00, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/2_9787512384972.jpg', '1');
INSERT INTO `apply` VALUES (16, 18, '9787300242620', '概率论与数理统计（理工类·第五版）', '吴赣昌', '中国人民大学出版社', 42.80, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/18_9787300242620.jpg', '1');
INSERT INTO `apply` VALUES (17, 11, '9787300242620', '概率论与数理统计（理工类·第五版）', '吴赣昌', '中国人民大学出版社', 42.80, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/11_9787300242620.jpg', '1');
COMMIT;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(8) NOT NULL COMMENT '班级号-主键',
  `college` varchar(20) DEFAULT NULL COMMENT '学院',
  `department` varchar(20) DEFAULT NULL COMMENT '系',
  `major` varchar(20) DEFAULT NULL COMMENT '专业',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级信息表';

-- ----------------------------
-- Records of class
-- ----------------------------
BEGIN;
INSERT INTO `class` VALUES (16092711, '信息工程学院', '计算机系', '软件工程');
INSERT INTO `class` VALUES (16092712, '信息工程学院', '计算机系', '软件工程');
INSERT INTO `class` VALUES (16092713, '信息工程学院', '计算机系', '软件工程');
INSERT INTO `class` VALUES (16092714, '信息工程学院', '计算机系', '软件工程');
COMMIT;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cors_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `semester` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学期',
  `tch_id` int(6) NOT NULL COMMENT '教工号-外键',
  `cdtl_id` varchar(20) NOT NULL COMMENT '课程代码-外键',
  `status` int(10) DEFAULT '1' COMMENT '1:开课 0：未开',
  PRIMARY KEY (`cors_id`) USING BTREE,
  UNIQUE KEY `semester_tchid_corsid` (`semester`,`tch_id`,`cdtl_id`) USING BTREE,
  KEY `fk_course_teacher` (`tch_id`),
  KEY `fk_course_coursedtl` (`cdtl_id`),
  CONSTRAINT `fk_course_coursedtl` FOREIGN KEY (`cdtl_id`) REFERENCES `coursedtl` (`cdtl_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_course_teacher` FOREIGN KEY (`tch_id`) REFERENCES `teacher` (`tch_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='教师课程关系表';

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` VALUES (1, '20191', 160000, 'J0907081', 1);
INSERT INTO `course` VALUES (2, '20191', 160001, 'J9041008', 1);
INSERT INTO `course` VALUES (3, '20191', 160001, 'J9041009', 1);
INSERT INTO `course` VALUES (4, '20191', 160002, 'J0905372', 1);
INSERT INTO `course` VALUES (5, '20191', 160002, 'J9012004', 1);
INSERT INTO `course` VALUES (6, '20191', 160003, 'J0905372', 1);
INSERT INTO `course` VALUES (7, '20191', 160003, 'J9012004', 1);
INSERT INTO `course` VALUES (8, '20191', 160004, 'J0911011', 1);
INSERT INTO `course` VALUES (9, '20192', 160000, 'J0907082', 1);
INSERT INTO `course` VALUES (10, '20192', 160001, 'J9041008', 1);
INSERT INTO `course` VALUES (11, '20192', 160001, 'J9041009', 1);
INSERT INTO `course` VALUES (12, '20192', 160002, 'J0905372', 1);
INSERT INTO `course` VALUES (13, '20192', 160002, 'J9012004', 1);
INSERT INTO `course` VALUES (14, '20192', 160003, 'J9012004', 1);
INSERT INTO `course` VALUES (15, '20192', 160003, 'J0905372', 1);
INSERT INTO `course` VALUES (16, '20192', 160004, 'J0911012', 1);
INSERT INTO `course` VALUES (18, '20192', 160000, 'J9041009', 1);
INSERT INTO `course` VALUES (23, '20192', 160001, 'J0907082', 1);
COMMIT;

-- ----------------------------
-- Table structure for coursedtl
-- ----------------------------
DROP TABLE IF EXISTS `coursedtl`;
CREATE TABLE `coursedtl` (
  `cdtl_id` varchar(20) NOT NULL COMMENT '课程代码(主键)',
  `cdtl_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `credit` int(2) DEFAULT NULL COMMENT '学分：3.0',
  `credit_hour` int(4) DEFAULT NULL COMMENT '学时：96',
  `attribution` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '课程归属：校公选课',
  `nature` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '课程性质：公共选修',
  `campus_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '校区代码：青山湖',
  `college` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开课学院：计算机系',
  `exam_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '考试时间',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`cdtl_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程详细表';

-- ----------------------------
-- Records of coursedtl
-- ----------------------------
BEGIN;
INSERT INTO `coursedtl` VALUES ('J0905372', '程序设计基础(JAVA 语言)', 6, 96, NULL, '必修', '青山湖', '计算机系', NULL, 1);
INSERT INTO `coursedtl` VALUES ('J0907081', '微积分 1', 4, 64, NULL, '必修', '青山湖', '计算机系', NULL, 1);
INSERT INTO `coursedtl` VALUES ('J0907082', '微积分2', 4, 64, NULL, '必修', '青山湖', '计算机系', NULL, 1);
INSERT INTO `coursedtl` VALUES ('J0911011', '英语1', 4, 64, NULL, '必修', '青山湖', '计算机系', NULL, 1);
INSERT INTO `coursedtl` VALUES ('J0911012', '英语2', 2, 32, NULL, '限选', '青山湖', '计算机系', NULL, 1);
INSERT INTO `coursedtl` VALUES ('J9012004', 'JSP程序设计', 2, 48, NULL, '必修', '青山湖', '计算机系', NULL, 1);
INSERT INTO `coursedtl` VALUES ('J9041008', '线性代数', 2, 32, NULL, '必修', '青山湖', '计算机系', NULL, 1);
INSERT INTO `coursedtl` VALUES ('J9041009', '概率论与数理统计', 3, 48, NULL, '必修', '青山湖', '计算机系', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `dict_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典id(主键)',
  `dict_type_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典类别代码',
  `dict_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字典类别名称',
  `dict_item_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据字典项目名称',
  `dict_item_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据字典项目代码(可为空)',
  `dict_sort` int(10) DEFAULT NULL COMMENT '排序字段',
  `dict_enable` tinyint(1) NOT NULL COMMENT '1:使用 0:停用',
  `dict_memo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of dict
-- ----------------------------
BEGIN;
INSERT INTO `dict` VALUES ('1', '001', '学期', '2019-1', '20191', 1, 1, NULL);
INSERT INTO `dict` VALUES ('2', '001', '学期', '2019-2', '20192', 2, 1, NULL);
INSERT INTO `dict` VALUES ('3', '001', '学期', '2020-1', '20201', 3, 0, NULL);
INSERT INTO `dict` VALUES ('4', '100', '前端权限', '00', '20191', NULL, 1, '00都关，10学生开教师关，01学生关教师开');
INSERT INTO `dict` VALUES ('5', '100', '前端权限', '10', '20192', NULL, 1, '00都关，10学生开教师关，01学生关教师开');
COMMIT;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id(主键)-自增',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '公告内容',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` int(6) NOT NULL COMMENT '创建者id',
  `update_by` int(6) DEFAULT NULL COMMENT '修改者id',
  `is_display` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:显示 0:不显示',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:存在 0:已删除',
  `status` int(10) DEFAULT NULL COMMENT '0学生1老师2全部',
  PRIMARY KEY (`msg_id`) USING BTREE,
  KEY `fk_message_cby` (`create_by`),
  KEY `fk_message_uby` (`update_by`),
  CONSTRAINT `fk_message_cby` FOREIGN KEY (`create_by`) REFERENCES `admin` (`adm_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_message_uby` FOREIGN KEY (`update_by`) REFERENCES `admin` (`adm_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='公告信息表';

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
INSERT INTO `message` VALUES (1, '2019第一学期教材填报公告', '系统开放时间2019.8.15-2019.9.1，为能顺利完成新学期教材征订的任务，请任课老师在规定时间内填写所任课程所需要的书本信息并确保无误。', '2020-04-20 16:57:34', '2020-05-05 03:17:01', 110, 110, 1, 1, 1);
INSERT INTO `message` VALUES (2, '教材征订系统使用守则', '使用本系统前，请老师同学们仔细阅读以下内容......', '2020-04-20 17:00:24', '2020-05-05 03:17:03', 110, 110, 1, 1, 2);
INSERT INTO `message` VALUES (3, '2019第二学期教材征订开放系统时间', '请同学于2020年2月15日前完成教材选定，不操作默认为不订购。', '2020-04-20 17:02:19', '2020-05-05 03:17:06', 110, 110, 1, 1, 0);
INSERT INTO `message` VALUES (4, '2019第一学期教材征订开放系统时间', '1', '2020-05-05 01:20:37', '2020-05-29 19:20:05', 110, 110, 0, 0, 2);
INSERT INTO `message` VALUES (5, '2019第二学期教材征订开放系统时间', '2', '2020-05-05 01:20:45', '2020-05-05 03:19:37', 110, 110, 0, 0, 2);
INSERT INTO `message` VALUES (8, '2020第一学期教材征订开放系统时间-预备', '', '2020-05-05 03:19:09', '2020-05-29 19:19:34', 110, 110, 0, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for order_ad
-- ----------------------------
DROP TABLE IF EXISTS `order_ad`;
CREATE TABLE `order_ad` (
  `o_ad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号-自增主键',
  `isbn` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ISBN码',
  `quantity` int(11) NOT NULL COMMENT '订购数量',
  `order_from` varchar(32) DEFAULT NULL COMMENT '销售商：淘宝/xx出版社',
  `unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '单价',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '-1:已取消0：未完成 1:已入库',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '订单修改时间',
  `create_by` int(6) DEFAULT NULL COMMENT '订单创建者id',
  `update_by` int(6) DEFAULT NULL COMMENT '订单修改者id',
  `is_active` int(1) NOT NULL DEFAULT '1' COMMENT '1:存在 0:已删除',
  PRIMARY KEY (`o_ad_id`) USING BTREE,
  KEY `fk_order_ad_admin_cby` (`create_by`),
  KEY `fk_order_ad_admin_uby` (`update_by`),
  CONSTRAINT `fk_order_ad_admin_cby` FOREIGN KEY (`create_by`) REFERENCES `admin` (`adm_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_order_ad_admin_uby` FOREIGN KEY (`update_by`) REFERENCES `admin` (`adm_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='教材部门教材订购表';

-- ----------------------------
-- Records of order_ad
-- ----------------------------
BEGIN;
INSERT INTO `order_ad` VALUES (10, '9787040396614', 5, '高等教育出版社', 20.00, -1, '', '2020-05-18 17:42:09', '2020-05-29 18:54:58', 110, 110, 1);
INSERT INTO `order_ad` VALUES (12, '9787115429742', 5, '人民邮电出版社', 60.00, 0, '', '2020-05-29 19:16:54', '2020-05-29 19:16:54', 110, NULL, 1);
INSERT INTO `order_ad` VALUES (13, '9787302511410', 5, '淘宝：新华书店', 48.80, 0, '', '2020-05-29 19:17:30', '2020-05-29 19:17:30', 110, NULL, 1);
INSERT INTO `order_ad` VALUES (14, '9787030196590', 5, '科学出版社', 20.00, 1, '', '2020-05-29 19:18:25', '2020-05-29 19:18:25', 110, 110, 1);
COMMIT;

-- ----------------------------
-- Table structure for order_stu
-- ----------------------------
DROP TABLE IF EXISTS `order_stu`;
CREATE TABLE `order_stu` (
  `o_stu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `stu_id` int(8) NOT NULL COMMENT '学号-外键',
  `apply_id` int(11) NOT NULL COMMENT 'apply表id-外键',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '0:未领取 1:已领取 -1:已取消',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`o_stu_id`) USING BTREE,
  KEY `fk_order_stu_student` (`stu_id`),
  KEY `fk_order_stu_apply` (`apply_id`),
  CONSTRAINT `fk_order_stu_apply` FOREIGN KEY (`apply_id`) REFERENCES `apply` (`apply_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_order_stu_student` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='学生教材认购表';

-- ----------------------------
-- Records of order_stu
-- ----------------------------
BEGIN;
INSERT INTO `order_stu` VALUES (1, 16905635, 1, 1, '2020-04-20 17:29:36');
INSERT INTO `order_stu` VALUES (4, 16000001, 4, 0, '2020-04-29 02:19:48');
INSERT INTO `order_stu` VALUES (5, 16000001, 7, 0, '2020-04-29 02:19:51');
INSERT INTO `order_stu` VALUES (6, 16000002, 4, 0, '2020-04-29 02:21:26');
INSERT INTO `order_stu` VALUES (7, 16000002, 8, 0, '2020-04-29 02:21:29');
INSERT INTO `order_stu` VALUES (8, 16905625, 13, 1, '2020-04-29 02:23:29');
INSERT INTO `order_stu` VALUES (9, 16905625, 14, 0, '2020-04-29 02:23:33');
INSERT INTO `order_stu` VALUES (10, 16000002, 1, 1, '2020-04-29 02:25:21');
INSERT INTO `order_stu` VALUES (11, 16000004, 8, 0, '2020-04-29 02:26:06');
INSERT INTO `order_stu` VALUES (12, 16000004, 1, 1, '2020-04-29 02:26:12');
INSERT INTO `order_stu` VALUES (13, 16000001, 6, 0, '2020-04-29 05:13:45');
INSERT INTO `order_stu` VALUES (15, 16905635, 4, 1, '2020-05-01 08:50:48');
INSERT INTO `order_stu` VALUES (19, 16905635, 14, 0, '2020-05-30 09:51:39');
COMMIT;

-- ----------------------------
-- Table structure for schedule_stu
-- ----------------------------
DROP TABLE IF EXISTS `schedule_stu`;
CREATE TABLE `schedule_stu` (
  `sch_stu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `stu_id` int(8) NOT NULL COMMENT '学号-外键',
  `cors_id` int(11) NOT NULL COMMENT '课程id-外键',
  PRIMARY KEY (`sch_stu_id`) USING BTREE,
  UNIQUE KEY `stuid_corsid` (`stu_id`,`cors_id`) USING BTREE,
  KEY `fk_schedule_stu_course` (`cors_id`),
  CONSTRAINT `fk_schedule_stu_course` FOREIGN KEY (`cors_id`) REFERENCES `course` (`cors_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_schedule_stu_student` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='学生课程关系表';

-- ----------------------------
-- Records of schedule_stu
-- ----------------------------
BEGIN;
INSERT INTO `schedule_stu` VALUES (3, 16000001, 1);
INSERT INTO `schedule_stu` VALUES (4, 16000001, 8);
INSERT INTO `schedule_stu` VALUES (16, 16000001, 9);
INSERT INTO `schedule_stu` VALUES (29, 16000001, 12);
INSERT INTO `schedule_stu` VALUES (13, 16000001, 13);
INSERT INTO `schedule_stu` VALUES (20, 16000001, 16);
INSERT INTO `schedule_stu` VALUES (5, 16000002, 1);
INSERT INTO `schedule_stu` VALUES (6, 16000002, 8);
INSERT INTO `schedule_stu` VALUES (18, 16000002, 9);
INSERT INTO `schedule_stu` VALUES (14, 16000002, 14);
INSERT INTO `schedule_stu` VALUES (21, 16000002, 16);
INSERT INTO `schedule_stu` VALUES (7, 16000004, 1);
INSERT INTO `schedule_stu` VALUES (8, 16000004, 8);
INSERT INTO `schedule_stu` VALUES (19, 16000004, 9);
INSERT INTO `schedule_stu` VALUES (15, 16000004, 14);
INSERT INTO `schedule_stu` VALUES (22, 16000004, 16);
INSERT INTO `schedule_stu` VALUES (23, 16905625, 1);
INSERT INTO `schedule_stu` VALUES (24, 16905625, 8);
INSERT INTO `schedule_stu` VALUES (25, 16905625, 9);
INSERT INTO `schedule_stu` VALUES (26, 16905625, 10);
INSERT INTO `schedule_stu` VALUES (27, 16905625, 15);
INSERT INTO `schedule_stu` VALUES (28, 16905625, 16);
INSERT INTO `schedule_stu` VALUES (1, 16905635, 1);
INSERT INTO `schedule_stu` VALUES (2, 16905635, 8);
INSERT INTO `schedule_stu` VALUES (10, 16905635, 9);
INSERT INTO `schedule_stu` VALUES (12, 16905635, 10);
INSERT INTO `schedule_stu` VALUES (9, 16905635, 15);
INSERT INTO `schedule_stu` VALUES (11, 16905635, 16);
COMMIT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_id` int(8) NOT NULL COMMENT '学生学号',
  `stu_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '123' COMMENT '学生登录密码',
  `stu_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `grade` int(4) DEFAULT NULL COMMENT '年级：2016',
  `class_id` int(8) NOT NULL COMMENT '所在班级',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `is_monitor` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1：班长 0:非班长',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`stu_id`),
  KEY `fk_student_class` (`class_id`),
  CONSTRAINT `fk_student_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生信息表';

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO `student` VALUES (16000001, '123', '软1班长', 2016, 16092711, '13010101010', 1, 1);
INSERT INTO `student` VALUES (16000002, '123', '软2班长', 2016, 16092712, '13020202020', 1, 1);
INSERT INTO `student` VALUES (16000004, '123', '软4班长', 2016, 16092714, '13040404040', 1, 1);
INSERT INTO `student` VALUES (16905625, '123', '帅宇豪', 2016, 16092713, '13093761521', 0, 1);
INSERT INTO `student` VALUES (16905635, '123', '杨泽江', 2016, 16092713, '15858287952', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tch_id` int(6) NOT NULL COMMENT '教师工号(主键)',
  `tch_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师登录密码',
  `tch_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师姓名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态',
  `faculty` varchar(20) DEFAULT NULL COMMENT '学院：理学院',
  PRIMARY KEY (`tch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师信息表';

-- ----------------------------
-- Records of teacher
-- ----------------------------
BEGIN;
INSERT INTO `teacher` VALUES (160000, '123', '李伟芬', '198001001000', 1, '理学院');
INSERT INTO `teacher` VALUES (160001, '123', '王线概', '198001001001', 1, '理学院');
INSERT INTO `teacher` VALUES (160002, '123', '易家洼', '198001001002', 1, '计算机学院');
INSERT INTO `teacher` VALUES (160003, '123', '尔嘉娃', '198001001003', 1, '计算机学院');
INSERT INTO `teacher` VALUES (160004, '123', '林莹玉', '198001001004', 1, '外语学院');
COMMIT;

-- ----------------------------
-- Table structure for textbook
-- ----------------------------
DROP TABLE IF EXISTS `textbook`;
CREATE TABLE `textbook` (
  `isbn` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ISBN码-主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '教材名称',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '作者',
  `press` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '出版社',
  `fixed_price` decimal(10,2) DEFAULT NULL COMMENT '定价',
  `stock_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `real_price` decimal(10,2) DEFAULT NULL COMMENT '推荐价',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片路径',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` int(6) DEFAULT NULL COMMENT '创建者id',
  `update_by` int(6) DEFAULT NULL COMMENT '修改者id',
  `status` int(10) DEFAULT '1' COMMENT '状态1显示0被删除',
  PRIMARY KEY (`isbn`),
  KEY `fk_textbook_admin_cby` (`create_by`),
  KEY `fk_textbook_admin_uby` (`update_by`),
  CONSTRAINT `fk_textbook_admin_cby` FOREIGN KEY (`create_by`) REFERENCES `admin` (`adm_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_textbook_admin_uby` FOREIGN KEY (`update_by`) REFERENCES `admin` (`adm_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教材信息表';

-- ----------------------------
-- Records of textbook
-- ----------------------------
BEGIN;
INSERT INTO `textbook` VALUES ('123', '微积分1', '微积分1作者', '新华出版社', 12.40, 0, 12.00, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/ISBN123.jpg', '2020-04-20 17:03:12', '2020-05-29 18:56:04', 110, 110, 0);
INSERT INTO `textbook` VALUES ('1234', '微积分2', '微积分2作者', '新华出版社', 12.40, 0, 12.40, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/10_1241.jpg', '2020-04-29 11:11:04', '2020-05-29 18:56:06', 110, NULL, 0);
INSERT INTO `textbook` VALUES ('124', '线性代数', '线性代数作者', '清华大学出版社', 69.80, 0, 65.30, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/10_1241.jpg', '2020-04-20 17:06:03', '2020-05-29 18:56:08', 110, NULL, 0);
INSERT INTO `textbook` VALUES ('1241', '新版线性代数', '线性代数2作者', '清湖大学出版社', 70.00, 0, 70.00, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/10_1241.jpg', '2020-04-29 11:09:48', '2020-05-29 18:56:10', 110, NULL, 0);
INSERT INTO `textbook` VALUES ('2222', '概率论全解', '张三', '杭电出版社', 33.70, 0, NULL, '', '2020-05-07 00:43:55', '2020-05-29 18:56:12', 110, 110, 0);
INSERT INTO `textbook` VALUES ('3333', '程序设计基础(JAVA 语言)版', '马云', '杭电出版社', 120.40, 0, 120.00, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/10_1241.jpg', '2020-04-29 05:09:53', '2020-05-29 18:56:14', 110, NULL, 0);
INSERT INTO `textbook` VALUES ('4444', '初识JSP', '妞妞', '杭电出版社', 88.88, 0, 88.88, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/10_1241.jpg', '2020-04-29 04:29:57', '2020-05-29 18:56:15', 110, NULL, 0);
INSERT INTO `textbook` VALUES ('9787030196590', '微积分2', '华长生', '科学出版社', 25.00, 10, NULL, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/ISBN9787030196590.jpg', '2020-05-29 18:46:11', '2020-05-29 19:18:34', 110, NULL, 1);
INSERT INTO `textbook` VALUES ('9787040396614', '工程数学线性代数第六版', '同济大学数学系', '高等教育出版社', 22.20, 5, NULL, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/ISBN9787040396614.jpg', '2020-05-25 14:53:21', '2020-05-29 19:14:10', 110, NULL, 1);
INSERT INTO `textbook` VALUES ('9787115429742', 'Servlet JSP和Spring MVC初学指南', 'Budi Kurniawan, Paul Deck', '人民邮电出版社', 69.00, 0, NULL, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/ISBN9787115429742.jpg', '2020-05-29 18:52:32', '2020-05-29 19:15:13', 110, NULL, 1);
INSERT INTO `textbook` VALUES ('9787300242620', '概率论与数理统计（理工类·第五版）', '吴赣昌', '中国人民大学出版社', 42.80, 0, NULL, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/ISBN9787300242620.jpg', '2020-05-30 10:33:22', '2020-05-30 10:33:22', 110, NULL, 1);
INSERT INTO `textbook` VALUES ('9787302233824', '微积分1（第2版）', '清华大学数学科学系《微积分》编写组', '清华大学出版社', 24.33, 5, NULL, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/ISBN9787302233824.jpg', '2020-05-29 19:01:08', '2020-05-29 19:14:13', 110, NULL, 1);
INSERT INTO `textbook` VALUES ('9787302511410', 'Java基础入门(第2版)', '黑马程序员', '清华大学出版社', 59.06, 0, NULL, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/ISBN9787302511410.jpg', '2020-05-29 18:49:23', '2020-05-29 19:15:10', 110, NULL, 1);
INSERT INTO `textbook` VALUES ('9787512384972', '线性代数', '杨文泉,赵坤,赵鹏起', '中国电力出版社', 27.00, 5, NULL, 'https://yangzejiang.oss-cn-shanghai.aliyuncs.com/boot_tsm/covers/ISBN9787512384972.jpg', '2020-05-29 18:43:23', '2020-05-29 19:14:15', 110, NULL, 1);
COMMIT;

-- ----------------------------
-- View structure for orderdtl
-- ----------------------------
DROP VIEW IF EXISTS `orderdtl`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `orderdtl` AS select `order_stu`.`o_stu_id` AS `o_stu_id`,`student`.`class_id` AS `class_id`,`textbook`.`title` AS `title`,`apply`.`isbn` AS `isbn`,`order_stu`.`status` AS `status`,`course`.`semester` AS `semester` from ((((`order_stu` left join `student` on((`order_stu`.`stu_id` = `student`.`stu_id`))) left join `apply` on((`order_stu`.`apply_id` = `apply`.`apply_id`))) left join `course` on((`apply`.`cors_id` = `course`.`cors_id`))) left join `textbook` on((`textbook`.`isbn` = `apply`.`isbn`)));

-- ----------------------------
-- View structure for stu_book_list
-- ----------------------------
DROP VIEW IF EXISTS `stu_book_list`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `stu_book_list` AS select `schedule_stu`.`stu_id` AS `stu_id`,`coursedtl`.`cdtl_name` AS `cdtl_name`,`course`.`semester` AS `semester`,`apply`.`apply_id` AS `apply_id`,`teacher`.`tch_name` AS `tch_name`,`textbook`.`title` AS `title`,`apply`.`isbn` AS `isbn`,`coursedtl`.`nature` AS `nature` from (((((`schedule_stu` join `course` on((`schedule_stu`.`cors_id` = `course`.`cors_id`))) join `coursedtl` on((`course`.`cdtl_id` = `coursedtl`.`cdtl_id`))) join `apply` on((`course`.`cors_id` = `apply`.`cors_id`))) join `teacher` on((`course`.`tch_id` = `teacher`.`tch_id`))) left join `textbook` on((`textbook`.`isbn` = `apply`.`isbn`)));

-- ----------------------------
-- View structure for stu_order_list
-- ----------------------------
DROP VIEW IF EXISTS `stu_order_list`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `stu_order_list` AS select `order_stu`.`o_stu_id` AS `o_stu_id`,`order_stu`.`stu_id` AS `stu_id`,`course`.`semester` AS `semester`,`apply`.`isbn` AS `isbn`,`textbook`.`title` AS `title`,`coursedtl`.`cdtl_name` AS `cdtl_name`,`order_stu`.`status` AS `status` from ((((`order_stu` left join `apply` on((`order_stu`.`apply_id` = `apply`.`apply_id`))) join `coursedtl`) join `course` on(((`coursedtl`.`cdtl_id` = `course`.`cdtl_id`) and (`apply`.`cors_id` = `course`.`cors_id`)))) left join `textbook` on((`textbook`.`isbn` = `apply`.`isbn`)));

-- ----------------------------
-- View structure for tch_apply_list
-- ----------------------------
DROP VIEW IF EXISTS `tch_apply_list`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `tch_apply_list` AS select `apply`.`apply_id` AS `apply_id`,`apply`.`isbn` AS `isbn`,`apply`.`title` AS `title`,`course`.`semester` AS `semester`,`course`.`tch_id` AS `tch_id`,`course`.`cdtl_id` AS `cdtl_id`,`coursedtl`.`cdtl_name` AS `cdtl_name`,`apply`.`status` AS `status` from ((`apply` left join `course` on((`apply`.`cors_id` = `course`.`cors_id`))) join `coursedtl` on((`course`.`cdtl_id` = `coursedtl`.`cdtl_id`)));

-- ----------------------------
-- View structure for tch_course_list
-- ----------------------------
DROP VIEW IF EXISTS `tch_course_list`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `tch_course_list` AS select `course`.`cors_id` AS `cors_id`,`course`.`semester` AS `semester`,`course`.`tch_id` AS `tch_id`,`course`.`cdtl_id` AS `cdtl_id`,`course`.`status` AS `status`,`coursedtl`.`cdtl_name` AS `cdtl_name`,`coursedtl`.`credit` AS `credit`,`coursedtl`.`credit_hour` AS `credit_hour`,`coursedtl`.`nature` AS `nature`,`coursedtl`.`campus_code` AS `campus_code`,`coursedtl`.`college` AS `college`,`coursedtl`.`attribution` AS `attribution` from (`course` left join `coursedtl` on((`course`.`cdtl_id` = `coursedtl`.`cdtl_id`))) where (`course`.`status` = '1');

-- ----------------------------
-- Procedure structure for aa
-- ----------------------------
DROP PROCEDURE IF EXISTS `aa`;
delimiter ;;
CREATE PROCEDURE `aa`(IN time varchar(20))
  READS SQL DATA 
BEGIN
	CREATE TEMPORARY TABLE temp(
	class_id int(10) NOT NULL,
	stu_name VARCHAR(20),
	phone VARCHAR(20),
	done_num int(10)
	) ;
	INSERT INTO temp(class_id) SELECT  class_id FROM orderdtl WHERE semester = time GROUP BY class_id;
	UPDATE temp SET stu_name =(SELECT stu_name FROM student WHERE class_id = temp.class_id and is_monitor = '1'),
	phone = (SELECT phone FROM student WHERE class_id = temp.class_id and is_monitor = '1');
	
	SELECT * FROM temp ;
	
	

 
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
