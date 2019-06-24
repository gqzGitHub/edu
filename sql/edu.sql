/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : edu

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 24/06/2019 21:16:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admininfo
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo`  (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`adminid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO `admininfo` VALUES (1, 'admin', '13995971234', 'gqzdev@gmal.com', 'ganquanzhong', 1);

-- ----------------------------
-- Table structure for classinfo
-- ----------------------------
DROP TABLE IF EXISTS `classinfo`;
CREATE TABLE `classinfo`  (
  `classid` int(10) NOT NULL AUTO_INCREMENT,
  `teacherid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `classname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `collegename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total` int(3) NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '正常状态',
  `isDel` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`classid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2018020 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classinfo
-- ----------------------------
INSERT INTO `classinfo` VALUES (2018001, '1001002', '金英一班', '湖北武汉分校', 50, '2018-04-20 19:26:01', '正常状态', 1);
INSERT INTO `classinfo` VALUES (2018002, '1001002', '就业班', '湖北武汉', 48, '2018-04-20 19:26:05', '正常状态', 0);
INSERT INTO `classinfo` VALUES (2018003, '1001002', '50天速成1班', '理工-计算机学院', 34, '2018-04-20 19:26:07', '已停用', 0);
INSERT INTO `classinfo` VALUES (2018004, '1001002', '50天速成2班', '理工-湖师', 34, '2018-04-20 19:26:10', '正常状态', 1);
INSERT INTO `classinfo` VALUES (2018005, '1001002', '理工精英班', '湖北理工', 50, '2018-04-20 19:56:12', '正常状态', 0);
INSERT INTO `classinfo` VALUES (2018006, '1001002', 'Java EE集训营', '武汉future培训', 48, '2018-05-05 23:02:05', '正常状态', 1);
INSERT INTO `classinfo` VALUES (2018007, '1001002', '华科精英班', '华中科技大学', 60, '2018-05-01 23:47:45', '正常状态', 0);
INSERT INTO `classinfo` VALUES (2018008, '1001001', 'Java EE企业开发实战', '湖理-K教学楼', 36, '2018-05-02 16:19:31', '正常状态', 0);
INSERT INTO `classinfo` VALUES (2018009, '1001001', '高考冲刺班', '华中师范附属中学', 55, '2018-05-02 21:38:52', '已停用', 1);
INSERT INTO `classinfo` VALUES (2018010, '1001001', '武汉一班', '武汉大学', 50, '2018-05-03 08:33:37', '已停用', 0);
INSERT INTO `classinfo` VALUES (2018011, '1001001', '武汉金英一班', '武汉大学', 40, '2018-05-03 09:02:14', '正常状态', 0);
INSERT INTO `classinfo` VALUES (2018012, '1001001', '华科冲刺一班', '华中科技大学', 40, '2018-05-03 09:13:07', '正常状态', 0);
INSERT INTO `classinfo` VALUES (2018013, '1001006', '数据库SQL精讲', '湖北理工-计算机学院', 30, '2018-05-03 17:30:48', '正常状态', 0);
INSERT INTO `classinfo` VALUES (2018014, '1001002', '数学精讲', '校附属培训点', 48, '2018-08-17 16:41:25', '正常状态', 0);
INSERT INTO `classinfo` VALUES (2018015, '1001002', 'Java EE框架开发', '华师计算机培训点', 54, '2018-08-17 17:08:54', '已停用', 0);
INSERT INTO `classinfo` VALUES (2018016, '1001009', '小宇01班', '张宇授课点', 55, '2018-08-17 17:43:51', '已停用', 0);
INSERT INTO `classinfo` VALUES (2018017, '1001002', 'Spring开发', '北校', 55, '2018-08-18 10:43:24', '已停用', 1);
INSERT INTO `classinfo` VALUES (2018018, '1001001', '2018秋Python全栈', '潭洲教育', 60, '2018-09-18 16:22:05', '正常状态', 0);
INSERT INTO `classinfo` VALUES (2018019, '1001001', 'spring boot企业开发', '武汉光谷', 72, '2018-12-14 00:16:54', '正常状态', 0);

-- ----------------------------
-- Table structure for classroominfo
-- ----------------------------
DROP TABLE IF EXISTS `classroominfo`;
CREATE TABLE `classroominfo`  (
  `classroomid` int(10) NOT NULL AUTO_INCREMENT COMMENT '教室编号',
  `classroomcode` int(10) NULL DEFAULT NULL COMMENT '教室代码',
  `buildingroomname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教学楼名称',
  `classroomname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教室名称',
  `max` int(6) NULL DEFAULT NULL COMMENT '教室最大容纳人数',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`classroomid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contractinfo
-- ----------------------------
DROP TABLE IF EXISTS `contractinfo`;
CREATE TABLE `contractinfo`  (
  `contractid` int(20) NOT NULL AUTO_INCREMENT COMMENT '合同编号',
  `contractnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contracttype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同类型',
  `createtime` datetime(0) NULL DEFAULT NULL,
  `studentid` bigint(20) NULL DEFAULT NULL COMMENT '学生编号',
  `orderhour` int(10) NULL DEFAULT NULL COMMENT '预定小时',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '小时单价',
  `teachstart` datetime(0) NULL DEFAULT NULL COMMENT '授课开始时间',
  `teachend` datetime(0) NULL DEFAULT NULL COMMENT '授课结束时间',
  `courseid` int(10) NULL DEFAULT NULL COMMENT '课程编号',
  `teachplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `deliverdate` datetime(0) NULL DEFAULT NULL COMMENT '尾款交付日期',
  `totalamount` double(10, 0) NULL DEFAULT NULL COMMENT '合同总金额',
  PRIMARY KEY (`contractid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contractinfo
-- ----------------------------
INSERT INTO `contractinfo` VALUES (2, 'MMWWW20154041013302', '一对一', '2018-04-21 15:46:25', 201540410133, 100, 30.00, '2018-04-21 00:00:00', '2018-05-21 00:00:00', 2, '武汉理工大学', '支付宝', '2018-04-21 00:00:00', 3000);
INSERT INTO `contractinfo` VALUES (3, 'MMWWW20154041013701', '一对一', '2018-04-26 19:09:23', 201540410137, 120, 40.80, '2018-04-26 00:00:00', '2018-06-21 00:00:00', 1, '武汉精英培训班', '微信', '2018-04-27 00:00:00', 499);
INSERT INTO `contractinfo` VALUES (4, 'MMWWW20154041013901', '一对一', '2018-05-01 23:42:10', 201540410139, 100, 20.00, '2018-05-01 00:00:00', '2018-06-01 00:00:00', 1, '湖北师范大学', '支付宝', '2018-05-01 00:00:00', 2000);
INSERT INTO `contractinfo` VALUES (5, 'MMWWW20154041014001', '一对一', '2018-05-02 11:49:52', 201540410140, 66, 10.00, '2018-05-02 00:00:00', '2018-07-02 00:00:00', 1, '湖北理工外国语学院', '微信', '2018-10-11 00:00:00', 660);
INSERT INTO `contractinfo` VALUES (6, 'MMWWW20154041014101', '一对一', '2018-05-02 14:40:50', 201540410141, 200, 10.00, '2018-05-03 00:00:00', '2018-07-05 00:00:00', 1, '湖北', '支付宝', '2018-05-02 00:00:00', 2000);
INSERT INTO `contractinfo` VALUES (7, 'MMWWW20154041013401', '一对一', '2018-05-02 16:08:47', 201540410134, 66, 10.00, '2018-05-03 00:00:00', '2018-05-10 00:00:00', 1, '武汉二中', '微信', '2018-05-24 00:00:00', 660);
INSERT INTO `contractinfo` VALUES (8, 'MMWWW20154041014301', '一对一', '2018-05-03 08:32:38', 201540410143, 100, 20.00, '2018-05-03 00:00:00', '2018-06-03 00:00:00', 1, '湖北', '支付宝', '2018-05-03 00:00:00', 2000);
INSERT INTO `contractinfo` VALUES (9, 'MMWWW20154041014401', '一对一', '2018-05-03 09:00:53', 201540410144, 100, 20.00, '2018-05-03 00:00:00', '2018-06-03 00:00:00', 1, '武汉大学', '支付宝', '2018-05-03 00:00:00', 2000);
INSERT INTO `contractinfo` VALUES (10, 'MMWWW20154041014501', '一对一', '2018-05-03 09:12:17', 201540410145, 100, 20.00, '2018-05-03 00:00:00', '2018-06-03 00:00:00', 1, '湖北武汉大学', '支付宝', '2018-05-03 00:00:00', 2000);
INSERT INTO `contractinfo` VALUES (11, 'MMWWW20154041014601', '一对一', '2018-05-03 17:08:23', 201540410146, 55, 10.00, '2018-05-03 00:00:00', '2018-07-03 00:00:00', 14, '团风中学物理辅导室', '微信', '2018-07-31 00:00:00', 550);
INSERT INTO `contractinfo` VALUES (12, 'MMWWW20154041014701', '小班', '2018-08-15 15:38:11', 201540410147, 60, 25.00, '2018-07-20 00:00:00', '2018-08-20 00:00:00', 1, '校附属培训点', '微信', '2018-08-20 00:00:00', 2000);
INSERT INTO `contractinfo` VALUES (13, 'MMWWW20154041016001', '小班', '2018-08-17 16:19:47', 201540410160, 40, 50.00, '2018-06-20 00:00:00', '2018-08-20 00:00:00', 1, '本地培训', '微信', '2018-07-20 00:00:00', 2000);
INSERT INTO `contractinfo` VALUES (14, 'MMWWW20154041016301', '一对一', '2018-08-17 19:38:16', 201540410163, 55, 100.00, '2018-06-12 00:00:00', '2018-08-02 00:00:00', 2, '本校教学点', '微信', '2018-07-25 00:00:00', 5500);
INSERT INTO `contractinfo` VALUES (15, 'MMWWW20154041016201', '小班', '2018-08-17 20:45:41', 201540410162, 55, 100.00, '2018-06-17 00:00:00', '2018-10-17 00:00:00', 20, '宇哥集训点', '支付宝', '2018-10-01 00:00:00', 5500);
INSERT INTO `contractinfo` VALUES (16, 'MMWWW20154041015801', '一对一', '2018-08-18 00:04:14', 201540410158, 60, 100.00, '2018-06-01 00:00:00', '2018-11-01 00:00:00', 2, '理工Java课堂', '支付宝', '2018-12-01 00:00:00', 6000);
INSERT INTO `contractinfo` VALUES (17, 'MMWWW20154041015901', '一对一', '2018-08-18 00:06:14', 201540410159, 60, 100.00, '2018-06-01 00:00:00', '2018-11-01 00:00:00', 2, '理工Java课堂', '微信', '2018-12-01 00:00:00', 6000);
INSERT INTO `contractinfo` VALUES (18, 'MMWWW20154041016101', '一对一', '2018-08-18 00:07:39', 201540410161, 60, 1000.00, '2018-06-01 00:00:00', '2018-11-01 00:00:00', 2, '理工Java课堂', '微信', '2018-12-01 00:00:00', 6000);
INSERT INTO `contractinfo` VALUES (19, 'MMWWW20154041015501', '一对一', '2018-08-18 00:16:27', 201540410155, 50, 110.00, '2018-07-01 00:00:00', '2018-09-01 00:00:00', 20, '数学教学点', '刷卡', '2018-08-01 00:00:00', 5500);
INSERT INTO `contractinfo` VALUES (20, 'MMWWW20154041016401', '一对一', '2018-08-18 00:31:35', 201540410164, 60, 100.00, '2018-06-01 00:00:00', '2018-11-01 00:00:00', 16, '小黑课堂', '现金', '2018-08-01 00:00:00', 6000);
INSERT INTO `contractinfo` VALUES (21, 'MMWWW20154041013501', '一对一', '2018-08-18 10:44:54', 201540410135, 60, 100.00, '2018-08-03 00:00:00', '2018-10-18 00:00:00', 6, '东华大学', '微信', '2018-08-25 00:00:00', 6000);
INSERT INTO `contractinfo` VALUES (22, 'MMWWW20154041016501', '作业吧', '2018-09-10 09:40:45', 201540410165, 100, 20.00, '2018-09-10 00:00:00', '2018-10-10 00:00:00', 1, '湖北理工本部', '现金', '2018-09-10 00:00:00', 2000);
INSERT INTO `contractinfo` VALUES (23, 'MMWWW20154041015701', '一对一', '2018-09-27 22:50:55', 201540410157, 60, 100.00, '2018-09-27 00:00:00', '2018-12-27 00:00:00', 24, '湖北理工', '刷卡', '2019-04-27 00:00:00', 6000);

-- ----------------------------
-- Table structure for courseinfo
-- ----------------------------
DROP TABLE IF EXISTS `courseinfo`;
CREATE TABLE `courseinfo`  (
  `courseid` int(10) NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `coursename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `subjectid` int(10) NULL DEFAULT NULL COMMENT '所属学科',
  `schedule` int(10) NULL DEFAULT NULL COMMENT '课程学时',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '正常状态' COMMENT '状态',
  `isDel` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`courseid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courseinfo
-- ----------------------------
INSERT INTO `courseinfo` VALUES (1, '英语语法精讲', 300101, 20, '正常状态', 1);
INSERT INTO `courseinfo` VALUES (2, 'Java小白到项目开发', 800102, 40, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (3, '数学辅导班', 300102, 55, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (4, 'Visual C++编程实战', 600350, 40, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (5, '编译原理精讲', 112005, 48, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (6, 'UML2建模实战', 112008, 30, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (7, '设计模式', 201009, 40, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (8, '四级全程班', 900121, 42, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (9, '六级全程班', 900122, 58, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (10, '新托业全真班', 990100, 68, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (11, '算法心得', 100100, 88, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (12, 'Java程序设计', 308490, 55, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (13, '申论简易通关', 801012, 45, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (14, '高考物理全程班', 110124, 60, '正常状态', 1);
INSERT INTO `courseinfo` VALUES (15, 'Java应用', 154535, 100, '正常状态', 1);
INSERT INTO `courseinfo` VALUES (16, 'Java SE基础', 143234, 100, '正常状态', 1);
INSERT INTO `courseinfo` VALUES (17, 'Java EE', 242343, 100, '正常状态', 1);
INSERT INTO `courseinfo` VALUES (18, '深入分析Java Web技术内幕', 301001, 80, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (19, '计算机组成原理', 701023, 45, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (20, '数学训练营', 503452, 60, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (21, 'SSM企业级开发', 605401, 63, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (22, 'Android第一行代码', 640543, 72, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (23, 'C语言高级程序设计', 605454, 55, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (24, 'Python全栈开发', 905802, 66, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (25, '大数据速成班', 580074, 60, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (26, 'SQL数据库优化', 809300, 55, '正常状态', 0);
INSERT INTO `courseinfo` VALUES (27, 'spring boot开发', 901120, 70, '正常状态', 0);

-- ----------------------------
-- Table structure for curriculuminfo
-- ----------------------------
DROP TABLE IF EXISTS `curriculuminfo`;
CREATE TABLE `curriculuminfo`  (
  `curriculumid` int(10) NOT NULL AUTO_INCREMENT COMMENT '课程表编号',
  `classid` int(10) NULL DEFAULT NULL COMMENT '班级编号',
  `weekday` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '星期',
  `classtime` int(5) NULL DEFAULT NULL COMMENT '第几节课',
  `courseinfoid` int(10) NULL DEFAULT NULL COMMENT '课程编号',
  `classroomcode` int(10) NULL DEFAULT NULL COMMENT '教室代码',
  `curriculumstart` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `curriculumend` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `isDel` int(2) NULL DEFAULT NULL COMMENT '删除标志位',
  PRIMARY KEY (`curriculumid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2018018 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of curriculuminfo
-- ----------------------------
INSERT INTO `curriculuminfo` VALUES (2018001, 2018001, '三', 3, 1, 1001, '2018-05-01 00:00:00', '2018-06-23 23:05:49', 0);
INSERT INTO `curriculuminfo` VALUES (2018002, 2018002, '四', 1, 2, 1002, '2018-07-29 00:00:00', '2018-07-21 23:05:55', 0);
INSERT INTO `curriculuminfo` VALUES (2018003, 2018003, '一', 4, 1, 2001, '2018-05-05 00:00:00', '2018-05-01 23:06:40', 0);
INSERT INTO `curriculuminfo` VALUES (2018004, 2018004, '三', 5, 2, 1003, '2018-05-25 00:00:00', '2018-05-17 23:07:17', 0);
INSERT INTO `curriculuminfo` VALUES (2018005, 2018005, '二', 4, 2, 1008, '2018-05-06 00:00:00', '2018-05-18 23:08:00', 0);
INSERT INTO `curriculuminfo` VALUES (2018006, 2018006, '一', 6, 2, NULL, '2018-05-04 00:00:00', '2018-05-05 00:00:00', 0);
INSERT INTO `curriculuminfo` VALUES (2018007, 2018009, '日', 1, 14, NULL, '2018-05-02 00:00:00', '2018-06-01 00:00:00', 0);
INSERT INTO `curriculuminfo` VALUES (2018008, 2018002, '四', 6, 4, NULL, '2018-05-02 00:00:00', '2018-09-08 00:00:00', 0);
INSERT INTO `curriculuminfo` VALUES (2018009, 2018007, '日', 6, 12, NULL, '2018-05-03 00:00:00', '2018-06-08 00:00:00', 0);
INSERT INTO `curriculuminfo` VALUES (2018010, 2018003, '五', 2, 7, NULL, '2018-05-03 00:00:00', '2018-06-03 00:00:00', 0);
INSERT INTO `curriculuminfo` VALUES (2018011, 2018006, '三', 5, 18, NULL, '2018-05-03 00:00:00', '2019-05-03 00:00:00', 0);
INSERT INTO `curriculuminfo` VALUES (2018012, 2018008, '五', 0, 18, 1003, '2018-06-08 00:00:00', '2018-11-20 00:00:00', 0);
INSERT INTO `curriculuminfo` VALUES (2018013, 2018006, '三', 6, 2, NULL, '2018-07-18 00:00:00', '2018-08-19 00:00:00', 0);
INSERT INTO `curriculuminfo` VALUES (2018014, 2018001, '日', 0, 6, 1004, '2018-08-26 00:00:00', '2018-12-26 00:01:00', 0);
INSERT INTO `curriculuminfo` VALUES (2018015, 2018006, '四', 6, 12, NULL, '2018-08-31 00:00:00', '2018-10-18 00:00:00', 0);
INSERT INTO `curriculuminfo` VALUES (2018016, 2018018, '四', 3, 24, 1001, '2018-09-27 00:00:00', '2018-12-01 00:00:00', 0);
INSERT INTO `curriculuminfo` VALUES (2018017, 2018019, '五', 3, 27, NULL, '2018-12-21 00:00:00', '2019-04-14 00:00:00', 0);

-- ----------------------------
-- Table structure for scoreinfo
-- ----------------------------
DROP TABLE IF EXISTS `scoreinfo`;
CREATE TABLE `scoreinfo`  (
  `scoreid` int(10) NOT NULL AUTO_INCREMENT COMMENT '成绩编号',
  `studentid` bigint(20) NULL DEFAULT NULL COMMENT '学生编号',
  `courseid` int(10) NULL DEFAULT NULL COMMENT '课程编号',
  `score` float(5, 2) NULL DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`scoreid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2018001034 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scoreinfo
-- ----------------------------
INSERT INTO `scoreinfo` VALUES (2018001001, 201540410126, 10001, 94.00);
INSERT INTO `scoreinfo` VALUES (2018001002, 201540410137, 2018001, 80.00);
INSERT INTO `scoreinfo` VALUES (2018001005, 201540410139, 1, 90.00);
INSERT INTO `scoreinfo` VALUES (2018001006, 201540410132, 2, 80.00);
INSERT INTO `scoreinfo` VALUES (2018001010, 201540410130, 1, 30.00);
INSERT INTO `scoreinfo` VALUES (2018001011, 201540410138, 3, 100.00);
INSERT INTO `scoreinfo` VALUES (2018001012, 201540410129, 1, 100.00);
INSERT INTO `scoreinfo` VALUES (2018001014, 201540410133, 2, 68.00);
INSERT INTO `scoreinfo` VALUES (2018001015, 201540410162, 20, 140.00);
INSERT INTO `scoreinfo` VALUES (2018001016, 201540410158, 2, 92.00);
INSERT INTO `scoreinfo` VALUES (2018001017, 201540410159, 2, 89.00);
INSERT INTO `scoreinfo` VALUES (2018001018, 201540410161, 2, 79.00);
INSERT INTO `scoreinfo` VALUES (2018001021, 201540410155, 20, 134.00);
INSERT INTO `scoreinfo` VALUES (2018001024, 201540410158, 2, 98.00);
INSERT INTO `scoreinfo` VALUES (2018001025, 201540410152, 20, 136.00);
INSERT INTO `scoreinfo` VALUES (2018001026, 201540410153, 20, 116.00);
INSERT INTO `scoreinfo` VALUES (2018001027, 201540410154, 20, 107.00);
INSERT INTO `scoreinfo` VALUES (2018001028, 201540410156, 2, 80.00);
INSERT INTO `scoreinfo` VALUES (2018001029, 201540410163, 2, 90.00);
INSERT INTO `scoreinfo` VALUES (2018001031, 201540410140, 1, 79.00);
INSERT INTO `scoreinfo` VALUES (2018001032, 201540410136, 1, 88.00);
INSERT INTO `scoreinfo` VALUES (2018001033, 201540410135, 6, 100.00);

-- ----------------------------
-- Table structure for staffinfo
-- ----------------------------
DROP TABLE IF EXISTS `staffinfo`;
CREATE TABLE `staffinfo`  (
  `staffid` int(20) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(3) NULL DEFAULT NULL,
  `idcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `collegename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属教学点',
  `loginname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `posttype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位类型',
  `jointime` datetime(0) NULL DEFAULT NULL COMMENT '进入公司的时间',
  `arrangewage` double(10, 2) NULL DEFAULT NULL COMMENT '排课费',
  `senioritywage` double(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '工龄工资',
  `prepay` double(10, 2) NULL DEFAULT NULL COMMENT '预收提成',
  `regaddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户口地址',
  `liveaddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住地址',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `contractendtime` datetime(0) NULL DEFAULT NULL COMMENT '合同截至时间',
  `enterdate` datetime(0) NULL DEFAULT NULL COMMENT '录入时期',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `isDel` int(2) NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '正常' COMMENT '状态',
  PRIMARY KEY (`staffid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100025 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staffinfo
-- ----------------------------
INSERT INTO `staffinfo` VALUES (100001, '李刚', '男', 25, '421121198909088904', '13678944324', 'A1-100', NULL, NULL, '教师助手', '2018-03-08 00:00:00', 2000.00, 500.00, 400.00, '湖北省武汉市汉阳区永丰街陈家咀83号', '湖北黄石市下路区湖北理工学院', '1989-01-01 00:00:00', '2017-01-01 00:00:00', '2020-03-25 00:00:00', '可爱助手、、、', 0, '正常');
INSERT INTO `staffinfo` VALUES (100002, '刘元', '男', 25, '401211995080789505', '13634944326', 'C3-108', NULL, NULL, '其他', '2017-06-01 00:00:00', 2500.00, 400.00, 300.00, '湖北江夏区', '湖北黄石市下路区湖北理工', '1996-01-03 00:00:00', '2020-03-14 00:00:00', '2020-04-25 00:00:00', '', 0, '正常');
INSERT INTO `staffinfo` VALUES (100003, '李慧', '女', 24, '421121199089076744', '13623944326', 'B2-100', NULL, NULL, '教师助手', '2018-02-01 00:00:00', 3000.00, 400.00, 300.00, '湖北洪山区', '湖北黄石市下路区湖北理工', '1990-07-01 00:00:00', '2020-04-25 00:00:00', '2021-03-25 00:00:00', '', 0, '休假');
INSERT INTO `staffinfo` VALUES (100004, '张超', '男', 32, '412119890807452145', '13678554321', 'A1-101', NULL, NULL, '后勤人员', '2016-02-25 00:00:00', 2000.00, 2500.00, 300.00, '湖北黄陂区', '湖北黄石市下路区湖北理工', '1992-03-07 00:00:00', '2020-04-09 00:00:00', '2018-11-24 00:00:00', '', 0, '正常');
INSERT INTO `staffinfo` VALUES (100005, '陈园', '女', 23, '622722199610181035', '13578944322', 'A1-109', NULL, NULL, '财务处', '2017-08-25 00:00:00', 4000.00, 300.00, 300.00, '湖北武汉市', '湖北黄石市下路区湖北理工', '1987-03-13 21:20:26', '2018-04-05 00:00:00', '2018-12-15 00:00:00', '对外财务', 0, '正常');
INSERT INTO `staffinfo` VALUES (100006, '张斌', '男', 33, '420117199707050872', '13995986721', 'A1-201', NULL, NULL, '教师助手', '2018-04-26 00:00:00', 5500.00, 400.00, 300.00, '湖北武汉市', '湖北黄石市下路区湖北理工', '1988-07-16 01:03:27', '2020-11-21 00:00:00', '2018-04-26 00:00:00', '金牌助理', 0, '正常');
INSERT INTO `staffinfo` VALUES (100007, '林梅', '女', 24, '420502199612306510', '13597174271', 'A1-101', NULL, NULL, '教师助手', '2018-04-26 00:00:00', 4000.00, 300.00, 300.00, '湖北武汉市', '湖北黄石市下路区湖北理工', '2019-04-07 01:03:54', '2021-08-14 00:00:00', '2018-04-26 00:00:00', '王牌助理', 0, '正常');
INSERT INTO `staffinfo` VALUES (100008, '王强', '男', 23, '421121199609087890', '13995976182', '湖北理工', NULL, NULL, '客服人员', '2018-04-27 00:00:00', 300.00, 200.00, 200.00, '湖北黄冈', '武汉市江夏', '2018-04-26 00:00:00', '2018-04-26 00:00:00', '2018-04-26 00:00:00', '', 0, '正常');
INSERT INTO `staffinfo` VALUES (100009, '甘全中', '男', 23, '421121199804058967', '13998762345', '黄冈中学', NULL, NULL, '教师助手', '2018-04-26 00:00:00', 400.00, 500.00, 600.00, '湖北黄冈', '湖北理工', '1999-04-26 00:00:00', '2019-06-01 00:00:00', '2018-04-26 00:00:00', '湖北理工学院计算机学院', 0, '正常');
INSERT INTO `staffinfo` VALUES (100010, '孙瑶', '女', 25, '420117199612051653', '15571356823', '团风中学', NULL, NULL, '客服人员', '2018-04-25 00:00:00', 300.00, 400.00, 200.00, '湖北黄冈', '武汉市江夏区', '1998-05-15 00:00:00', '2020-05-15 00:00:00', '2018-04-26 00:00:00', '', 0, '正常');
INSERT INTO `staffinfo` VALUES (100011, '倪可', '女', 22, '421121199608078959', '15571398028', '武汉中学', NULL, NULL, '财务处', '2018-04-20 00:00:00', 300.00, 300.00, 200.00, '湖北黄冈', '武汉市江夏区', '1998-05-09 00:00:00', '2019-06-06 00:00:00', '2018-04-26 00:00:00', '', 0, '正常');
INSERT INTO `staffinfo` VALUES (100012, '林梅', '男', 20, '421121199608078959', '13597174271', '鄂州一中', NULL, NULL, '教师助手', '2018-04-10 00:00:00', 300.00, 200.00, 300.00, '湖北黄冈', '湖北鄂州', '1992-04-27 00:00:00', '2018-04-27 00:00:00', '2018-04-26 00:00:00', '你好', 0, '休假');
INSERT INTO `staffinfo` VALUES (100013, '杨金海', '男', 23, '420115199708050046', '13578343943', '东湖中学', NULL, NULL, '后勤人员', '2016-04-26 00:00:00', 200.00, 700.00, 300.00, '湖北黄冈', '湖北黄冈西湖中学', '1995-07-15 00:00:00', '2021-05-15 00:00:00', '2018-04-26 00:00:00', '', 0, '正常');
INSERT INTO `staffinfo` VALUES (100014, '王君其', '女', 23, '150221199611220026', '13578343943', '衡水中学', NULL, NULL, '后勤人员', '2016-04-26 00:00:00', 200.00, 700.00, 300.00, '湖北黄冈', '湖北黄冈西湖中学', '1995-07-15 00:00:00', '2021-05-15 00:00:00', '2018-04-26 00:00:00', '', 0, '正常');
INSERT INTO `staffinfo` VALUES (100015, '毛立言', '男', 34, '422201199508163213', '13578343943', '团风中学', NULL, NULL, '财务处', '2016-04-26 00:00:00', 200.00, 700.00, 300.00, '湖北黄冈', '湖北黄冈西湖中学', '1995-07-15 00:00:00', '2021-05-15 00:00:00', '2018-04-26 00:00:00', '', 0, '其他');
INSERT INTO `staffinfo` VALUES (100016, '蔓其', '女', 23, '341124199603204819', '13578343943', '西湖中学', NULL, NULL, '后勤人员', '2016-04-26 00:00:00', 200.00, 700.00, 300.00, '湖北黄冈', '湖北黄冈西湖中学', '1995-07-15 00:00:00', '2021-05-15 00:00:00', '2018-04-26 00:00:00', 'test', 0, '正常');
INSERT INTO `staffinfo` VALUES (100017, '张达', '男', 23, '420527199705183879', '13578343943', '宝塔中学', NULL, NULL, '客服人员', '2016-04-26 00:00:00', 200.00, 700.00, 300.00, '湖北黄冈', '湖北黄冈西湖中学', '1995-07-15 00:00:00', '2021-05-15 00:00:00', '2018-04-26 00:00:00', '1234', 0, '正常');
INSERT INTO `staffinfo` VALUES (100018, '郑飞', '男', 23, '421121198908031904', '13597670978', '武汉市附属中学', NULL, NULL, '教师助手', '2017-04-01 00:00:00', 400.00, 300.00, 400.00, '湖北鄂州', '武汉市江夏区', '1990-09-07 00:00:00', '2021-05-15 00:00:00', '2018-04-26 00:00:00', '武汉附属中学特级教师', 0, '正常');
INSERT INTO `staffinfo` VALUES (100019, '李道中', '男', 40, '421121198909088907', '13995976890', '西湖中学附属', NULL, NULL, '财务处', '2018-04-27 00:00:00', 300.00, 200.00, 4000.00, '湖北洪安', '武汉市青山区', '1975-04-12 00:00:00', '2018-04-18 00:00:00', '2018-04-27 00:00:00', '同学们很喜欢的助理老师！', 0, '正常');
INSERT INTO `staffinfo` VALUES (100020, '吴波', '男', 30, '421121143030424215', '13995976843', '湖北师范', NULL, NULL, '客服人员', '2018-04-27 00:00:00', 300.00, 500.00, 5000.00, '湖北十堰', '武汉市江夏区', '2018-04-27 00:00:00', '2018-04-27 00:00:00', '2018-04-27 00:00:00', 'test12', 1, '正常');
INSERT INTO `staffinfo` VALUES (100021, '陈浩', '男', 22, '421121199612148907', '13995987890', '湖北师范', NULL, NULL, '财务处', '2018-05-02 00:00:00', 300.00, 5000.00, 300.00, '湖北黄冈', '湖北武汉市江夏区', '1996-07-13 00:00:00', '2021-05-02 00:00:00', '2018-05-02 00:00:00', '', 0, '正常');
INSERT INTO `staffinfo` VALUES (100022, '赵乐天', '男', 22, '421127198709132431', '18327686545', '武汉大学', NULL, NULL, '教师助手', '2018-05-03 00:00:00', 1000.00, 4000.00, 200.00, '湖北', '湖北武汉', '1966-05-03 00:00:00', '2019-06-03 00:00:00', '2018-05-03 00:00:00', '', 1, '正常');
INSERT INTO `staffinfo` VALUES (100023, '王东', '男', 45, '420117199612051653', '18325652345', '华中师范大学', NULL, NULL, '教师助手', '2018-05-03 00:00:00', 200.00, 2000.00, 200.00, '湖北武汉', '湖北武汉', '2018-05-03 00:00:00', '2019-05-03 00:00:00', '2018-05-03 00:00:00', '', 1, '正常');
INSERT INTO `staffinfo` VALUES (100024, '李岩', '男', 23, '421087199508107332', '18326745675', '中国地质大学', NULL, NULL, '财务处', '2018-05-03 00:00:00', 100.00, 2000.00, 100.00, '湖北武汉', '武汉', '2018-04-16 00:00:00', '1996-05-03 00:00:00', '2018-05-03 00:00:00', '', 1, '正常');

-- ----------------------------
-- Table structure for staffwageinfo
-- ----------------------------
DROP TABLE IF EXISTS `staffwageinfo`;
CREATE TABLE `staffwageinfo`  (
  `staffwageid` int(10) NOT NULL AUTO_INCREMENT COMMENT '员工工资编号',
  `staffid` int(10) NULL DEFAULT NULL COMMENT '员工编号',
  `deductwage` double(10, 2) NULL DEFAULT NULL COMMENT '提成',
  `fine` double(10, 2) NULL DEFAULT NULL COMMENT '罚款',
  `totalwage` double(10, 2) NULL DEFAULT NULL COMMENT '总工资',
  `month` datetime(0) NULL DEFAULT NULL COMMENT '工资月份',
  PRIMARY KEY (`staffwageid`) USING BTREE,
  INDEX `staffid`(`staffid`) USING BTREE,
  CONSTRAINT `staffwageinfo_ibfk_1` FOREIGN KEY (`staffid`) REFERENCES `staffinfo` (`staffid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20017 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staffwageinfo
-- ----------------------------
INSERT INTO `staffwageinfo` VALUES (20001, 100001, 652.60, 100.00, 7800.00, '2018-04-25 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20002, 100002, 2300.00, 100.00, 8800.00, '2018-04-25 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20003, 100003, 1000.00, 100.00, 7050.00, '2018-04-25 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20005, 100004, 200.00, 200.00, 6000.00, '2018-04-28 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20006, 100009, 2000.00, 100.00, 6000.00, '2018-04-28 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20007, 100008, 0.00, 0.00, 0.00, '2018-04-28 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20008, 100019, 1200.00, 200.00, 6500.00, '2018-04-28 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20009, 100007, 0.00, 0.00, 0.00, '2018-05-01 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20010, 100006, 500.00, 200.00, 5000.00, '2018-05-01 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20011, 100018, 400.00, 300.00, 6000.00, '2018-05-01 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20012, 100017, 0.00, 0.00, 0.00, '2018-05-01 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20013, 100016, 0.00, 0.00, 0.00, '2018-05-01 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20014, 100021, 460.00, 200.00, 6000.00, '2018-05-02 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20015, 100023, 0.00, 200.00, 0.00, '2018-05-03 00:00:00');
INSERT INTO `staffwageinfo` VALUES (20016, 100024, 0.00, 0.00, 0.00, '2018-05-03 00:00:00');

-- ----------------------------
-- Table structure for studentinfo
-- ----------------------------
DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo`  (
  `studentid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '学生编号',
  `studentname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '出生年月',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住地址',
  `infosource` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息来源',
  `guardian` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监护人',
  `gdphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监护人电话号码',
  `relation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关系',
  `regtime` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `courseid` int(11) NULL DEFAULT NULL COMMENT '所报学科',
  `classid` int(11) NULL DEFAULT NULL,
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级（小班、中班、大班 1-12年级）',
  `school` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在学校',
  `subjectid` int(10) NULL DEFAULT NULL COMMENT '班级id',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '正常' COMMENT '状态（未报名、休眠）',
  PRIMARY KEY (`studentid`) USING BTREE,
  INDEX `classid`(`subjectid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201540410166 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of studentinfo
-- ----------------------------
INSERT INTO `studentinfo` VALUES (201540410126, '甘全中', '男', '1996-09-01 00:00:00', '13995976182', '湖北理工-腾龙公寓', '网络', '陈蓉', '13995976182', '其他', '2018-03-22 23:10:54', 1, 2018001, '89', '湖北理工', 2018001, '英语不是很好', '正常');
INSERT INTO `studentinfo` VALUES (201540410127, '杨慧', '女', '1996-07-11 00:00:00', '13578923918', '武汉东湖学院', '腾讯课堂', '杨梅', '12678439434', '父亲', '2018-03-25 14:40:28', 1, 2018001, '91', '武汉学院-----', 2018003, '数学不太好', '正常');
INSERT INTO `studentinfo` VALUES (201540410128, '蒋金星', '男', '2018-04-10 00:00:00', '15172518456', '湖北省黄石市桂林北路', '门店直访', '蒋开国', '18327862749', '爸 爸', '2018-04-14 19:15:29', 1, 2018001, '高三', '湖北省黄梅县第一中学', 1001002, '数学基础比较差', '未报名');
INSERT INTO `studentinfo` VALUES (201540410129, '迪云廷', '男', '1996-06-14 00:00:00', '18327862749', '湖北省黄石市桂林北路16号', '网络预约', '迪项', '18327862749', '奶奶', '2018-04-14 22:40:38', 1, 2018002, '高二', '山西省云城市第一中学', 1001003, '英语基础比较差', '未报名');
INSERT INTO `studentinfo` VALUES (201540410130, '陈雷', '男', '2018-04-16 00:00:00', '18327653456', '湖北北理工学院', '电话预约', '陈歌', '17623456524', '爸 爸', '2018-04-16 14:10:00', 1, 2018002, '一年级', '湖北理工学院', 1001003, '哈哈', '未报名');
INSERT INTO `studentinfo` VALUES (201540410131, '刘伟', '男', '2018-04-16 00:00:00', '17623456523', '湖北理工学院', '电话预约', '刘婷', '17623453212', '爸 爸', '2018-04-16 14:11:21', 2, 2018002, '一年级', '湖北理工学院', 1001004, '哈哈哈', '未报名');
INSERT INTO `studentinfo` VALUES (201540410132, '马梦', '女', '2018-04-16 00:00:00', '18327862749', '湖北理工学院', '电话预约', '马雷', '18327862749', '奶奶', '2018-04-16 14:38:03', 2, 2018005, '一年级', '湖北理工学院', 1001004, '哈哈哈', '未报名');
INSERT INTO `studentinfo` VALUES (201540410133, '刘肖晓', '男', '2018-04-16 00:00:00', '18327862749', '湖北理工学院', '电话预约', '刘云', '18327862749', '爸爸', '2018-04-16 14:40:30', 2, 2018005, '成人', '湖北学院', 1001004, '哈哈哈', '正常');
INSERT INTO `studentinfo` VALUES (201540410134, '徐小凤', '女', '1996-04-02 00:00:00', '13597178125', '湖北武汉', '网络预约', '徐兵', '15571398102', '其他', '2018-04-25 20:55:36', 1, 2018001, '高三', '武汉东湖中学', 1001002, '该生数学不太好！', '正常');
INSERT INTO `studentinfo` VALUES (201540410135, '陈蓉', '女', '1997-10-10 00:00:00', '16871392375', '湖北武汉', '网络预约', '甘全中', '13995976182', '其他', '2018-04-25 21:00:53', 6, 2018002, '一年级', '团风中学', 1001004, '该生在文科方面较强，但在理科思维方面不是很强，希望加强理科思维！', '正常');
INSERT INTO `studentinfo` VALUES (201540410136, '徐超', '男', '1996-11-14 00:00:00', '13568761343', '湖北理工学院', '网络预约', '徐有才', '13995783465', '爸 爸', '2018-04-26 18:32:52', 1, 2018005, '四年级', '东湖中学', 1001004, '', '未报名');
INSERT INTO `studentinfo` VALUES (201540410137, '钟意', '男', '1993-04-16 00:00:00', '13687904945', '湖北武汉市青山区', '门店直访', '钟进堂', '15980238903', '爸 爸', '2018-04-26 19:07:43', 3, 2018001, '六年级', '武汉市第六中学', 1001003, '英语较差，希望能够补习英语。\n', '正常');
INSERT INTO `studentinfo` VALUES (201540410138, '刘慧', '女', '1997-04-12 00:00:00', '13670642908', '武汉市青山区', '市场专员', '刘国强', '13789054343', '爸 爸', '2018-04-26 21:42:41', 3, 2018002, '高二', '武汉市第九中学', 1001002, '腾讯课堂，线上学习！', '未报名');
INSERT INTO `studentinfo` VALUES (201540410139, '赵云飞', '男', '2018-05-01 00:00:00', '18327862749', '湖北武汉', '电话预约', '蒋金星', '15172518456', '外婆', '2018-05-01 23:41:15', 1, 2018004, '初三', '武汉大学', 1001004, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410140, '周章军', '男', '1996-07-20 00:00:00', '15571395123', '湖北理工学院', '市场专员', '保密', '13995976182', '其他', '2018-05-02 11:48:52', 1, 2018005, '高中', '湖北理工', 1001003, '英语集训', '正常');
INSERT INTO `studentinfo` VALUES (201540410141, '刘晓莉', '女', '1998-05-02 00:00:00', '13546789781', '法国风格', '电话预约', '刘权', '13567973456', '爸 爸', '2018-05-02 14:38:37', 1, 2018001, '高三', '东湖中学', 1001001, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410142, '孙瑶', '女', '1996-05-03 00:00:00', '15571398101', '武汉学院', '电话预约', '孙莉', '13995976182', '其他', '2018-05-02 16:10:59', 3, 2018005, '初三', '武汉学院', 1001002, '', '未报名');
INSERT INTO `studentinfo` VALUES (201540410143, '高继辉', '男', '2018-05-03 00:00:00', '18327862378', '湖北武汉青山区', '电话预约', '高小军', '15276542345', '爸 爸', '2018-05-03 08:31:56', 1, 2018001, '成人', '武汉大学珞瑜路', 1001001, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410144, '严达贵', '男', '2018-05-03 00:00:00', '18327862456', '湖北黄石下陆区', '电话预约', '严斌', '16435678947', '爸 爸', '2018-05-03 09:00:03', 1, 2018001, '成人', '武汉大学', 1001004, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410145, '叶家伟', '男', '2018-05-03 00:00:00', '16543224566', '湖北武汉东湖畔', '电话预约', '叶利华', '15324565434', '爸 爸', '2018-05-03 09:11:40', 1, 2018001, '成人', '武汉大学', 1001001, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410146, '王银仙', '女', '1997-08-22 00:00:00', '13867645234', '湖北武汉黄黄陂区', '家长转介绍', '王军', '13995967834', '爸 爸', '2018-05-03 16:45:57', 14, 2018009, '高三', '团风中学', 1001004, '英语成绩很好，但是在理科方面不是很好，特别是在物理方面。', '正常');
INSERT INTO `studentinfo` VALUES (201540410147, '苏文倩', '女', '2006-08-25 00:00:00', '15123697851', '武汉江夏区', '电话预约', '苏梅', '13670623658', '妈妈', '2018-05-04 22:30:00', 1, 2018009, '六年级', '西湖小学', 1001002, '周末还有其他培训班，请注意班级安排。', '正常');
INSERT INTO `studentinfo` VALUES (201540410148, '张欣', '女', '2000-08-20 00:00:00', '15265555640', '湖北省汉川市庙头镇', '网络预约', '张保良', '18327864049', '爸 爸', '2018-05-25 06:38:07', NULL, NULL, '高一', '武汉市第二中学', 1001004, '', '未报名');
INSERT INTO `studentinfo` VALUES (201540410149, '王恩光', '男', '1999-03-18 00:00:00', '13656383968', '湖北省武汉市武昌区', '家长转介绍', '王景华', '15163592618', '爸 爸', '2018-06-07 15:40:58', NULL, NULL, '高三', '襄阳市第五中学', 1001002, '', '未报名');
INSERT INTO `studentinfo` VALUES (201540410150, '褚晓亚', '女', '1999-10-06 00:00:00', '18354507506', '湖北省广水市陈巷镇', '市场专员', '褚丁立', '15275816373', '爸 爸', '2018-06-07 13:43:30', NULL, NULL, '高三', '襄阳市第四中学', 1001003, '', '未报名');
INSERT INTO `studentinfo` VALUES (201540410151, '郭立壮', '男', '2000-03-22 00:00:00', '15265526892', '湖北省襄阳市南漳县', '网络预约', '郭子君', '13616354189', '爸 爸', '2018-07-11 15:45:34', NULL, NULL, '高三', '襄阳市第四中学', 1001004, '', '未报名');
INSERT INTO `studentinfo` VALUES (201540410152, '王海冰', '男', '2000-01-03 00:00:00', '15833164202', '荆州区弥市镇', '网络预约', '王国现', '15864390504', '叔叔', '2018-07-13 07:08:46', 20, 2018014, '一年级', '襄阳市第五中学', 1001002, '', '未报名');
INSERT INTO `studentinfo` VALUES (201540410153, '薛亚娟', '女', '1999-01-11 00:00:00', '15965251779', '湖北省宜昌市港窑路', '市场专员', '薛立业', '13995971833', '爸 爸', '2018-07-13 07:56:57', 20, 2018014, '高三', ' 武昌实验中学', 1001003, '', '未报名');
INSERT INTO `studentinfo` VALUES (201540410154, '赵丽莎', '女', '2000-03-10 00:00:00', '18363597889', '黄冈中学西湖', '电话预约', '王希彦', '13356257310', '叔叔', '2018-07-14 10:26:46', 20, 2018014, '高二', '黄冈中学', 1001006, '', '未报名');
INSERT INTO `studentinfo` VALUES (201540410155, '马庆辉', '男', '2000-08-10 00:00:00', '15963187623', '长沙市明德中学', '网络预约', '马合海', '15964365197', '爸 爸', '2018-07-15 11:08:33', 20, 2018014, '高三', '长沙市明德中学', 1001002, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410156, '徐晓娟', '女', '2002-06-20 00:00:00', '13455099036', '吉林市第一中学', '网络预约', '徐学林', '13356257310', '叔叔', '2018-07-18 09:35:16', 2, NULL, '成人', '吉林市第一中学', 1001003, '', '未报名');
INSERT INTO `studentinfo` VALUES (201540410157, '王青雪', '女', '2001-10-16 00:00:00', '15069585489', '长沙市长郡中学', '网络预约', '王铁钢', '13356257310', '爸 爸', '2018-07-18 12:00:14', 24, 2018018, '成人', '长沙市长郡中学', 1001004, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410158, '杨艺娴', '女', '2001-07-12 00:00:00', '13508931612', '东北师范大学附属中学', '电话预约', '杨晓林', '18694042856', '爸 爸', '2018-07-18 14:04:01', 2, 2018015, '成人', '东北师范大学附属中学', 1001004, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410159, '范立宽', '男', '2004-05-12 00:00:00', '15063595361', ' 江苏省扬州中学', '电话预约', '樊振杰', '15964365197', '妈妈', '2018-07-20 11:19:25', 2, 2018015, '成人', ' 江苏省扬州中学', 1001005, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410160, '杨艺娴', '女', '2004-06-04 00:00:00', '13563597274', ' 泉州第五中学公寓', '家长转介绍', '杨晓林', '15206519781', '爸 爸', '2018-07-20 12:10:10', 1, 2018001, '初二', '泉州第五中学', 1001003, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410161, '吕瑞雪', '女', '2004-07-22 00:00:00', '15192132194', ' 深圳实验学校', '家长转介绍', '吕子种', '15265526892', '爸 爸', '2018-07-20 10:12:53', 2, 2018015, '高一', '深圳实验学校', 1001004, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410162, '黄瑞浩', '男', '2003-09-27 00:00:00', '13995993590', '兴义市第八中学', '市场专员', '黄志国', '13561223674', '爸 爸', '2018-07-24 16:15:36', 20, 2018016, '高一', '兴义市第八中学', 1001002, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410163, '聂晓露', '女', '2003-11-22 00:00:00', '18865180518', '大庆实验中学', '市场专员', '聂小平', '15206519781', '爸 爸', '2018-07-24 16:17:45', 2, 2018006, '高一', '大庆实验中学', 1001002, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410164, '蔡瑞军', '男', '1997-08-14 00:00:00', '13563597274', '湖北武昌区', '门店直访', '蔡晓博', '18363597889', '爸 爸', '2018-08-18 00:25:34', 16, 2018008, '成人', '武昌实验中学', 1001003, '', '正常');
INSERT INTO `studentinfo` VALUES (201540410165, '李炫达', '男', '2000-09-10 00:00:00', '18327862749', '湖北武汉', '家长转介绍', '李甜甜', '18245684753', '爸 爸', '2018-09-10 09:39:42', 1, 2018018, '初三', '湖北理工学院', 1001004, '', '正常');

-- ----------------------------
-- Table structure for subjectinfo
-- ----------------------------
DROP TABLE IF EXISTS `subjectinfo`;
CREATE TABLE `subjectinfo`  (
  `subjectid` int(10) NOT NULL AUTO_INCREMENT,
  `subjectname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '正常',
  PRIMARY KEY (`subjectid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1001011 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subjectinfo
-- ----------------------------
INSERT INTO `subjectinfo` VALUES (1001001, '语文', '正常');
INSERT INTO `subjectinfo` VALUES (1001002, '数学', '正常');
INSERT INTO `subjectinfo` VALUES (1001003, '英语', '正常');
INSERT INTO `subjectinfo` VALUES (1001004, '物理', '正常');
INSERT INTO `subjectinfo` VALUES (1001005, '历史', '正常');
INSERT INTO `subjectinfo` VALUES (1001006, '政治', '正常');
INSERT INTO `subjectinfo` VALUES (1001007, '化学', '正常');
INSERT INTO `subjectinfo` VALUES (1001008, '生物', '正常');
INSERT INTO `subjectinfo` VALUES (1001009, '地理', '正常');
INSERT INTO `subjectinfo` VALUES (1001010, '其他', '正常');

-- ----------------------------
-- Table structure for teachclassinfo
-- ----------------------------
DROP TABLE IF EXISTS `teachclassinfo`;
CREATE TABLE `teachclassinfo`  (
  `teachclassid` int(10) NOT NULL AUTO_INCREMENT COMMENT '任课编号',
  `teacherid` int(20) NULL DEFAULT NULL COMMENT '教师id',
  `courseid` int(10) NULL DEFAULT NULL COMMENT '课程id',
  PRIMARY KEY (`teachclassid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teachclassinfo
-- ----------------------------
INSERT INTO `teachclassinfo` VALUES (1, 2018001, 1001001);

-- ----------------------------
-- Table structure for teacherinfo
-- ----------------------------
DROP TABLE IF EXISTS `teacherinfo`;
CREATE TABLE `teacherinfo`  (
  `teacherid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '教师编号',
  `teachername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师姓名',
  `loginname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(4) NULL DEFAULT NULL,
  `idcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `tsubjectname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授课学科',
  `rank` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师等级',
  `tgrade` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授课年级',
  `address` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住地',
  `salaryacount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工资账号',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `jointime` datetime(0) NULL DEFAULT NULL COMMENT '加入时间',
  `egcontact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `egphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人电话',
  `thour` float(10, 0) NULL DEFAULT NULL COMMENT '累积授课小时',
  `wage` float(10, 2) NULL DEFAULT NULL COMMENT '小时工资',
  `isDel` int(2) NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正常状态',
  `type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`teacherid`) USING BTREE,
  INDEX `teacherid`(`teacherid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1001012 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacherinfo
-- ----------------------------
INSERT INTO `teacherinfo` VALUES (1001001, '甘全中', '甘全中', 'admin', '男', 22, '421121199609093465', '数学', '中级教师', '高三', '湖北理工', '434243534543454', '13597174271', '2018-04-20 00:00:00', 'Mike Zhong', '13597174271', 254, 120.00, 0, '休假', 2);
INSERT INTO `teacherinfo` VALUES (1001002, '邓丹君', '邓丹君', 'admin', '女', 21, '421121199710067893', '生物', '初级教师', '高三', '湖北武汉光谷', '621220 0300025455723', '15571398101', '2018-04-20 00:00:00', '陈坤', '13995976182', 438, 300.00, 0, '正常', 2);
INSERT INTO `teacherinfo` VALUES (1001003, '林梅', '林梅', 'admin', '女', 30, '421121197809087890', '语文', '普通教师', '初一', '湖北理工', '622262 0630002248765', '13597174271', '2018-04-12 00:00:00', 'mike zhong', '13835170300', 434, 300.00, 0, '休假', 2);
INSERT INTO `teacherinfo` VALUES (1001004, '俞敏洪', '俞敏洪', 'teacher', '男', 48, '421121197809087890', '英语', '高级教师', '高三', '浙江', '622262 0630002240842', '13995976873', '2014-02-04 00:00:00', '新东方', '13835170300', 540, 150.00, 0, '正常', 2);
INSERT INTO `teacherinfo` VALUES (1001005, '李永兴', '李永兴', 'admin', '男', 49, '421121197809890979', '社会', '高级教师', '公务员考试', '北京海淀', '622262 0630002540842', '13995976834', '2015-04-09 00:00:00', '李永兴', '13995976834', 537, 400.00, 0, '正常', 2);
INSERT INTO `teacherinfo` VALUES (1001006, '谭浩强', '谭浩强', 'admin', '男', 62, '40122196808075609', '其他', '特级教师', '大学课程', '北京海淀', '622262 0630002240823', '13995976785', '2018-04-26 00:00:00', '谭浩强', '13995976785', 564, 300.00, 0, '正常', 2);
INSERT INTO `teacherinfo` VALUES (1001007, '张西民', '张西民', 'admin', '男', 41, '42122197808077865', '奥数', '中级教师', '初三', '湖北武汉市', '3434823492344238', '13995976834', '2018-04-05 00:00:00', '张夏', '13995976834', 643, 200.00, 0, '正常', 2);
INSERT INTO `teacherinfo` VALUES (1001008, '李琳娜', '李琳娜', 'admin', '女', 45, '421121197811287890X', '物理', '特聘教师', '高三', '武汉', '342423489023423480', '15571398108', '2018-04-28 00:00:00', '李小敏', '13995976182', 653, 400.00, 0, '正常', 2);
INSERT INTO `teacherinfo` VALUES (1001009, '张宇', '张宇', 'admin', '男', 48, '371522197010282920', '数学', '特级讲师', '高中、大学阶段', '北京海淀', '622848162873328286774', '13356257310', '2017-08-17 00:00:00', '张敏', '15963187830', 564, 200.00, 0, '正常', 2);
INSERT INTO `teacherinfo` VALUES (1001010, '张超', '张超', 'admin', '男', 28, '420527199005183879', '物理', '特聘讲师', '高中物理', '上海浦东', '6228481647728733286', '18327863395', '2007-08-17 00:00:00', '杨力', '13995995170', 782, 150.00, 0, '正常', 2);
INSERT INTO `teacherinfo` VALUES (1001011, '钟静', '钟静', 'admin', '男', 30, '341124198803204819', '历史', '特聘教师', '初中、高中历史', '湖北武汉', '6222620630002240842', '15826734138', '2015-07-11 00:00:00', '王丹', '13995974377', 453, 140.00, 0, '正常', 2);

-- ----------------------------
-- Table structure for teacherwageinfo
-- ----------------------------
DROP TABLE IF EXISTS `teacherwageinfo`;
CREATE TABLE `teacherwageinfo`  (
  `teacherwageid` int(20) NOT NULL AUTO_INCREMENT COMMENT '教师工资编号',
  `teacherid` bigint(20) NULL DEFAULT NULL COMMENT '教师编号',
  `period` int(10) NULL DEFAULT NULL COMMENT '授课学时',
  `fine` double(10, 2) NULL DEFAULT NULL COMMENT '罚款',
  `totalwage` double(10, 2) NULL DEFAULT NULL COMMENT '总工资',
  `month` datetime(0) NULL DEFAULT NULL COMMENT '工资月份',
  PRIMARY KEY (`teacherwageid`) USING BTREE,
  INDEX `teacherid`(`teacherid`) USING BTREE,
  CONSTRAINT `teacherwageinfo_ibfk_1` FOREIGN KEY (`teacherid`) REFERENCES `teacherinfo` (`teacherid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacherwageinfo
-- ----------------------------
INSERT INTO `teacherwageinfo` VALUES (1, 1001001, 81, 10.20, 8912.30, '2018-03-25 00:00:00');
INSERT INTO `teacherwageinfo` VALUES (2, 1001002, 67, 345.90, 7900.34, '2018-03-25 14:01:42');
INSERT INTO `teacherwageinfo` VALUES (3, 1001008, 20, 410.00, 7000.00, '2018-04-21 00:00:00');
INSERT INTO `teacherwageinfo` VALUES (5, 1001007, 34, 0.00, 500.00, '2018-04-28 00:00:00');
INSERT INTO `teacherwageinfo` VALUES (6, 1001006, 34, 100.00, 6000.00, '2018-04-28 00:00:00');
INSERT INTO `teacherwageinfo` VALUES (7, 1001005, 20, 120.00, 5000.00, '2018-04-28 00:00:00');
INSERT INTO `teacherwageinfo` VALUES (8, 1001004, 46, 0.00, 4000.00, '2018-04-28 00:00:00');
INSERT INTO `teacherwageinfo` VALUES (9, 1001003, 45, 340.00, 500.00, '2018-04-28 00:00:00');
INSERT INTO `teacherwageinfo` VALUES (10, 1001011, 45, 200.00, 7000.00, '2018-08-17 00:00:00');
INSERT INTO `teacherwageinfo` VALUES (11, 1001010, 0, 0.00, 0.00, '2018-08-20 15:03:37');

SET FOREIGN_KEY_CHECKS = 1;
