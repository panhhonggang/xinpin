/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : xinpin

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-11-16 11:29:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xp_binding
-- ----------------------------
DROP TABLE IF EXISTS `xp_binding`;
CREATE TABLE `xp_binding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) NOT NULL COMMENT '经销商ID',
  `cid` int(11) NOT NULL COMMENT '机组ID',
  `addtime` int(11) NOT NULL COMMENT '绑定时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_binding
-- ----------------------------
INSERT INTO `xp_binding` VALUES ('1', '2', '1', '1510801488');

-- ----------------------------
-- Table structure for xp_card
-- ----------------------------
DROP TABLE IF EXISTS `xp_card`;
CREATE TABLE `xp_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iccard` int(11) NOT NULL COMMENT 'IC卡编号',
  `name` varchar(255) DEFAULT NULL COMMENT '持有人姓名',
  `studentcode` int(11) DEFAULT NULL COMMENT '学籍号',
  `school` varchar(255) DEFAULT NULL COMMENT '学校',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `type` tinyint(1) NOT NULL COMMENT 'IC卡类型(0：免费 1：计费)',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0：未绑定 1：已绑定 2：挂失)',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_card
-- ----------------------------

-- ----------------------------
-- Table structure for xp_consume
-- ----------------------------
DROP TABLE IF EXISTS `xp_consume`;
CREATE TABLE `xp_consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `icid` int(11) NOT NULL COMMENT 'IC卡ID',
  `flow` int(10) NOT NULL COMMENT '消费流量',
  `address` varchar(255) NOT NULL COMMENT '消费地点',
  `time` int(11) NOT NULL COMMENT '消费时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_consume
-- ----------------------------

-- ----------------------------
-- Table structure for xp_crew
-- ----------------------------
DROP TABLE IF EXISTS `xp_crew`;
CREATE TABLE `xp_crew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) NOT NULL COMMENT '机组名',
  `did1` int(11) NOT NULL COMMENT '一号设备ID',
  `did2` int(11) DEFAULT NULL COMMENT '二号设备ID',
  `did3` int(11) DEFAULT NULL COMMENT '三号设备ID',
  `did4` int(11) DEFAULT NULL COMMENT '四号设备ID',
  `did5` int(11) DEFAULT NULL COMMENT '五号设备ID',
  `did6` int(11) DEFAULT NULL COMMENT '六号设备ID',
  `did7` int(11) DEFAULT NULL COMMENT '七号设备ID',
  `did8` int(11) DEFAULT NULL COMMENT '八号设备ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已绑定(0：未绑定  1：已绑定)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_crew
-- ----------------------------
INSERT INTO `xp_crew` VALUES ('1', '东莞技院', '12345', '23456', '34567', '45678', null, null, null, null, '1');
INSERT INTO `xp_crew` VALUES ('2', '三里屯试衣间', '23456', '34567', null, null, null, null, null, null, '0');
INSERT INTO `xp_crew` VALUES ('3', '广东AV艺校', '45678', '23456', '45678', '23456', '12345', '34567', '45678', '0', '0');

-- ----------------------------
-- Table structure for xp_devices
-- ----------------------------
DROP TABLE IF EXISTS `xp_devices`;
CREATE TABLE `xp_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `device_code` varchar(255) NOT NULL COMMENT '设备编码',
  `device_status` tinyint(1) NOT NULL COMMENT '设备状态',
  `binding_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否绑定(0：未绑定 1：已绑定)',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_devices
-- ----------------------------
INSERT INTO `xp_devices` VALUES ('1', '12345', '0', '0', '1468444334');
INSERT INTO `xp_devices` VALUES ('2', '23456', '0', '0', '1578865446');
INSERT INTO `xp_devices` VALUES ('3', '34567', '0', '0', '12312312');
INSERT INTO `xp_devices` VALUES ('4', '45678', '0', '0', '257954433');

-- ----------------------------
-- Table structure for xp_devices_statu
-- ----------------------------
DROP TABLE IF EXISTS `xp_devices_statu`;
CREATE TABLE `xp_devices_statu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL COMMENT '设备ID',
  `device_status` tinyint(1) NOT NULL COMMENT '设备状态',
  `time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_devices_statu
-- ----------------------------

-- ----------------------------
-- Table structure for xp_device_config
-- ----------------------------
DROP TABLE IF EXISTS `xp_device_config`;
CREATE TABLE `xp_device_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) NOT NULL COMMENT '设备ID',
  `dtid` int(11) NOT NULL COMMENT '设备类型ID',
  `vid` int(11) DEFAULT NULL COMMENT '经销商ID（备用）',
  `leasingmode` tinyint(1) DEFAULT NULL COMMENT '租赁模式(0：时间 1：流量)(备用)',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_device_config
-- ----------------------------

-- ----------------------------
-- Table structure for xp_device_type
-- ----------------------------
DROP TABLE IF EXISTS `xp_device_type`;
CREATE TABLE `xp_device_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) NOT NULL COMMENT '设备类型',
  `filter1` varchar(30) DEFAULT NULL COMMENT '一级滤芯',
  `filter2` varchar(30) DEFAULT NULL COMMENT '二级滤芯',
  `filter3` varchar(30) DEFAULT NULL COMMENT '三级滤芯',
  `filter4` varchar(30) DEFAULT NULL COMMENT '四级滤芯',
  `filter5` varchar(30) DEFAULT NULL COMMENT '五级滤芯',
  `filter6` varchar(30) DEFAULT NULL COMMENT '六级滤芯',
  `filter7` varchar(30) DEFAULT NULL COMMENT '七级滤芯',
  `filter8` varchar(30) DEFAULT NULL COMMENT '八级滤芯',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_device_type
-- ----------------------------
INSERT INTO `xp_device_type` VALUES ('1', '商务型', 'PP棉', '滤芯1号', '', '', '', '', '', '', '1510802286');
INSERT INTO `xp_device_type` VALUES ('2', '家用型', 'RO膜', 'PP棉', '', '', '', '', '', '', '1510802316');
INSERT INTO `xp_device_type` VALUES ('3', '高级型', 'RO膜', 'PP棉', '滤芯1号', '', '', '', '', '', '1510802334');

-- ----------------------------
-- Table structure for xp_filters
-- ----------------------------
DROP TABLE IF EXISTS `xp_filters`;
CREATE TABLE `xp_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filtername` varchar(30) NOT NULL COMMENT '滤芯名称',
  `alias` varchar(30) DEFAULT NULL COMMENT '滤芯别名',
  `timelife` int(11) NOT NULL COMMENT '时间寿命(小时)',
  `flowlife` int(11) NOT NULL COMMENT '流量寿命(升)',
  `balancetime` int(11) DEFAULT NULL COMMENT '时间寿命使能',
  `balanceflow` int(11) DEFAULT NULL COMMENT '流量寿命使能',
  `introduce` varchar(255) NOT NULL COMMENT '滤芯简介',
  `url` varchar(255) DEFAULT NULL COMMENT '购买网址',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_filters
-- ----------------------------
INSERT INTO `xp_filters` VALUES ('1', '滤芯1号', 'A型', '500', '200', null, null, '啊实打实', 'http://www.baidu.com', '1510802182');
INSERT INTO `xp_filters` VALUES ('2', 'PP棉', 'B型', '100', '321', null, null, '啊实打实', 'http://www.baidu.com', '1510802203');
INSERT INTO `xp_filters` VALUES ('3', 'RO膜', 'C型', '500', '200', null, null, '驱蚊器无', 'http://www.baidu.com', '1510802307');

-- ----------------------------
-- Table structure for xp_flow
-- ----------------------------
DROP TABLE IF EXISTS `xp_flow`;
CREATE TABLE `xp_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值流水ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `money` int(10) NOT NULL COMMENT '充值金额',
  `mode` tinyint(1) NOT NULL COMMENT '充值方式(0：系统赠送 1：微信 2：支付宝)',
  `time` int(11) NOT NULL COMMENT '充值时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_flow
-- ----------------------------

-- ----------------------------
-- Table structure for xp_leavel
-- ----------------------------
DROP TABLE IF EXISTS `xp_leavel`;
CREATE TABLE `xp_leavel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendors_id` int(11) NOT NULL COMMENT '经销商ID',
  `parent_vid` int(11) NOT NULL COMMENT '经销商父级ID',
  `path` varchar(255) NOT NULL COMMENT '经销商的层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_leavel
-- ----------------------------

-- ----------------------------
-- Table structure for xp_loglist
-- ----------------------------
DROP TABLE IF EXISTS `xp_loglist`;
CREATE TABLE `xp_loglist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '登录用户ID',
  `content` varchar(255) NOT NULL COMMENT '操作内容',
  `time` int(11) NOT NULL COMMENT '操作时间',
  `ip` varchar(15) NOT NULL COMMENT '操作IP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_loglist
-- ----------------------------

-- ----------------------------
-- Table structure for xp_users
-- ----------------------------
DROP TABLE IF EXISTS `xp_users`;
CREATE TABLE `xp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(255) NOT NULL COMMENT '用户姓名',
  `phone` varchar(11) NOT NULL COMMENT '手机号码(登录账户)',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态(0：禁用1：启用)',
  `login_time` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录IP',
  `balance` int(10) NOT NULL DEFAULT '0' COMMENT '账户余额',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_users
-- ----------------------------

-- ----------------------------
-- Table structure for xp_vendors
-- ----------------------------
DROP TABLE IF EXISTS `xp_vendors`;
CREATE TABLE `xp_vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台用户ID',
  `name` varchar(255) NOT NULL COMMENT '经销商名字',
  `password` varchar(255) NOT NULL COMMENT '登录密码',
  `phone` varchar(11) NOT NULL COMMENT '联系电话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `idcard` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `company` varchar(255) NOT NULL COMMENT '公司名称',
  `pid` int(11) DEFAULT NULL COMMENT '经销商上级ID',
  `leavel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '经销商级别(0：超级管理员 1：一级 2：二级)',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_vendors
-- ----------------------------
INSERT INTO `xp_vendors` VALUES ('1', 'admin', '202cb962ac59075b964b07152d234b70', '13838381438', null, '中国', null, '点球电子', '0', '0', '1509585067');
INSERT INTO `xp_vendors` VALUES ('2', '经销商头子', '202cb962ac59075b964b07152d234b70', '13838381438', '619328391@qq.com', '中国广东', '430122199610224517', '点球', null, '1', '1510797277');

-- ----------------------------
-- Table structure for xp_work
-- ----------------------------
DROP TABLE IF EXISTS `xp_work`;
CREATE TABLE `xp_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL COMMENT '工单编号(时间+序号)',
  `name` varchar(50) NOT NULL COMMENT '处理人',
  `type` tinyint(1) NOT NULL COMMENT '工单类型(0：安装 1：维修 2：维护)',
  `content` text NOT NULL COMMENT '维护内容',
  `address` varchar(50) NOT NULL COMMENT '地址',
  `result` tinyint(1) NOT NULL COMMENT '处理结果(0：未处理 1：正在处理 2：已处理)',
  `time` int(11) NOT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_work
-- ----------------------------
