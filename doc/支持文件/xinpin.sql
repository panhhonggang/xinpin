/*
Navicat MySQL Data Transfer

Source Server         : 192.168.37.76
Source Server Version : 50548
Source Host           : 192.168.37.76:3306
Source Database       : xinpin

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2017-12-04 14:42:32
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_binding
-- ----------------------------
INSERT INTO `xp_binding` VALUES ('1', '2', '1', '1510801488');
INSERT INTO `xp_binding` VALUES ('2', '2', '2', '1510990453');
INSERT INTO `xp_binding` VALUES ('3', '1', '1', '1510990453');
INSERT INTO `xp_binding` VALUES ('4', '1', '2', '1510801488');
INSERT INTO `xp_binding` VALUES ('5', '1', '10', '1511604903');
INSERT INTO `xp_binding` VALUES ('6', '1', '11', '1511604917');
INSERT INTO `xp_binding` VALUES ('7', '1', '12', '1511604917');
INSERT INTO `xp_binding` VALUES ('8', '1', '13', '1511604917');
INSERT INTO `xp_binding` VALUES ('12', '1', '14', '1511837539');
INSERT INTO `xp_binding` VALUES ('10', '1', '15', '1511837508');

-- ----------------------------
-- Table structure for xp_card
-- ----------------------------
DROP TABLE IF EXISTS `xp_card`;
CREATE TABLE `xp_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iccard` varchar(50) NOT NULL COMMENT 'IC卡编号',
  `name` varchar(255) DEFAULT NULL COMMENT '持有人姓名',
  `studentcode` int(11) DEFAULT NULL COMMENT '学籍号',
  `school` varchar(255) DEFAULT NULL COMMENT '学校',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `type` tinyint(1) NOT NULL COMMENT 'IC卡类型(0：免费 1：计费)',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0：未绑定 1：已绑定 2：挂失)',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_card
-- ----------------------------
INSERT INTO `xp_card` VALUES ('31', 'IC0001', null, null, null, null, '0', '0', '1510989876');
INSERT INTO `xp_card` VALUES ('32', 'IC0002', null, null, null, null, '0', '0', '1510989876');
INSERT INTO `xp_card` VALUES ('33', 'IC0003', null, null, null, null, '0', '0', '1510989876');
INSERT INTO `xp_card` VALUES ('34', 'IC0004', null, null, null, null, '0', '0', '1510989876');
INSERT INTO `xp_card` VALUES ('35', 'IC0005', null, null, null, null, '0', '0', '1510989876');
INSERT INTO `xp_card` VALUES ('36', 'IC0006', null, null, null, null, '0', '0', '1510989876');
INSERT INTO `xp_card` VALUES ('37', 'IC0007', null, null, null, null, '1', '0', '1510989876');
INSERT INTO `xp_card` VALUES ('38', 'IC0008', null, null, null, null, '1', '0', '1510989876');
INSERT INTO `xp_card` VALUES ('39', 'IC0009', null, null, null, null, '1', '0', '1510989876');
INSERT INTO `xp_card` VALUES ('40', 'IC0010', null, null, null, null, '1', '0', '1510989876');
INSERT INTO `xp_card` VALUES ('42', 'IC0000', null, null, null, null, '0', '0', '1511427435');
INSERT INTO `xp_card` VALUES ('43', '18112236364114563214', '00', null, '', '1', '1', '0', '1511427435');
INSERT INTO `xp_card` VALUES ('44', '112233445566778', '0000', null, null, '1', '1', '0', '1511427435');

-- ----------------------------
-- Table structure for xp_consume
-- ----------------------------
DROP TABLE IF EXISTS `xp_consume`;
CREATE TABLE `xp_consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) NOT NULL COMMENT '设备ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `icid` int(11) NOT NULL COMMENT 'IC卡ID',
  `flow` int(10) NOT NULL COMMENT '消费流量',
  `address` varchar(255) NOT NULL COMMENT '消费地点',
  `time` int(11) NOT NULL COMMENT '消费时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_consume
-- ----------------------------
INSERT INTO `xp_consume` VALUES ('1', '73', '1', '43', '-16', 'aaaa', '1511919559');
INSERT INTO `xp_consume` VALUES ('2', '73', '1', '43', '-16', 'aaaa', '1511919620');
INSERT INTO `xp_consume` VALUES ('3', '73', '1', '43', '-16', 'aaaa', '1511919763');
INSERT INTO `xp_consume` VALUES ('4', '73', '1', '43', '4552', 'aaaa', '1511923696');
INSERT INTO `xp_consume` VALUES ('5', '73', '1', '43', '4536', 'aaaa', '1511923703');
INSERT INTO `xp_consume` VALUES ('6', '73', '1', '43', '4520', 'aaaa', '1511923709');
INSERT INTO `xp_consume` VALUES ('7', '73', '1', '43', '4504', 'aaaa', '1511923710');
INSERT INTO `xp_consume` VALUES ('8', '73', '1', '43', '4488', 'aaaa', '1511923710');
INSERT INTO `xp_consume` VALUES ('9', '73', '1', '43', '4472', 'aaaa', '1511923710');
INSERT INTO `xp_consume` VALUES ('10', '73', '1', '43', '16', 'aaaa', '1511923956');
INSERT INTO `xp_consume` VALUES ('11', '73', '1', '43', '16', 'aaaa', '1511924002');
INSERT INTO `xp_consume` VALUES ('12', '73', '1', '43', '16', 'aaaa', '1511924101');
INSERT INTO `xp_consume` VALUES ('13', '73', '1', '43', '16', 'aaaa', '1511924106');
INSERT INTO `xp_consume` VALUES ('14', '73', '1', '43', '16', 'aaaa', '1511924272');
INSERT INTO `xp_consume` VALUES ('15', '73', '1', '43', '16', 'aaaa', '1511924396');
INSERT INTO `xp_consume` VALUES ('16', '73', '1', '43', '16', 'aaaa', '1511924468');
INSERT INTO `xp_consume` VALUES ('17', '73', '1', '43', '16', 'aaaa', '1511924517');
INSERT INTO `xp_consume` VALUES ('18', '73', '1', '43', '16', 'aaaa', '1511924644');
INSERT INTO `xp_consume` VALUES ('19', '73', '1', '43', '16', 'aaaa', '1511924674');
INSERT INTO `xp_consume` VALUES ('20', '73', '1', '43', '16', 'aaaa', '1511924814');
INSERT INTO `xp_consume` VALUES ('21', '73', '1', '43', '16', 'aaaa', '1511924881');
INSERT INTO `xp_consume` VALUES ('22', '73', '1', '43', '16', 'aaaa', '1511924937');
INSERT INTO `xp_consume` VALUES ('23', '73', '1', '43', '16', 'aaaa', '1511925423');
INSERT INTO `xp_consume` VALUES ('24', '73', '1', '43', '16', 'aaaa', '1511925575');
INSERT INTO `xp_consume` VALUES ('25', '73', '1', '43', '16', 'aaaa', '1511925579');
INSERT INTO `xp_consume` VALUES ('26', '73', '1', '43', '16', 'aaaa', '1511925805');
INSERT INTO `xp_consume` VALUES ('27', '73', '1', '43', '16', 'aaaa', '1511925810');
INSERT INTO `xp_consume` VALUES ('28', '73', '1', '43', '16', 'aaaa', '1511925827');
INSERT INTO `xp_consume` VALUES ('29', '73', '1', '43', '16', 'aaaa', '1511937994');
INSERT INTO `xp_consume` VALUES ('30', '73', '1', '43', '16', 'aaaa', '1511939340');
INSERT INTO `xp_consume` VALUES ('31', '73', '1', '43', '16', 'aaaa', '1511939357');
INSERT INTO `xp_consume` VALUES ('32', '8', '1', '43', '16', 'aaaa', '1512108338');
INSERT INTO `xp_consume` VALUES ('33', '8', '1', '43', '16', 'aaaa', '1512108406');
INSERT INTO `xp_consume` VALUES ('34', '87', '1', '43', '16', 'aaaa', '1512108440');
INSERT INTO `xp_consume` VALUES ('35', '87', '1', '43', '16', 'aaaa', '1512111488');

-- ----------------------------
-- Table structure for xp_crew
-- ----------------------------
DROP TABLE IF EXISTS `xp_crew`;
CREATE TABLE `xp_crew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) NOT NULL COMMENT '机组名',
  `dcode` varchar(30) NOT NULL COMMENT '一号设备ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已绑定(0：未绑定  1：已绑定)',
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_crew
-- ----------------------------
INSERT INTO `xp_crew` VALUES ('10', 'SB250', '112233445566778', '1', '1511145348');
INSERT INTO `xp_crew` VALUES ('11', 'AE86', '112233445566778', '1', '1511145348');
INSERT INTO `xp_crew` VALUES ('12', 'AE861', '2017051200000189', '1', '1511145348');
INSERT INTO `xp_crew` VALUES ('14', 'AA002', '2017051200000188', '1', '1511837298');
INSERT INTO `xp_crew` VALUES ('15', 'AA003', '2017051200000187', '1', '1511837497');
INSERT INTO `xp_crew` VALUES ('16', 'DDAA2017', '2017051200000118', '0', '1512003957');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_device_type
-- ----------------------------
INSERT INTO `xp_device_type` VALUES ('1', '商务型', 'PP棉', '滤芯1号', '', '', '', '', '', '', '1510802286');
INSERT INTO `xp_device_type` VALUES ('2', '家用型', 'RO膜', 'PP棉', '', '', '', '', '', '', '1510802316');
INSERT INTO `xp_device_type` VALUES ('3', '高级型', 'RO膜', 'PP棉', '滤芯1号', '', '', '', '', '', '1510802334');
INSERT INTO `xp_device_type` VALUES ('4', 'aaa', 'RO膜-C型', 'RO膜-C型', 'PP棉-B型', 'RO膜-C型', 'RO膜-C型', 'PP棉-B型', '', '', '1511593004');

-- ----------------------------
-- Table structure for xp_devices
-- ----------------------------
DROP TABLE IF EXISTS `xp_devices`;
CREATE TABLE `xp_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `device_code` varchar(255) NOT NULL COMMENT '设备编码',
  `device_status` tinyint(1) NOT NULL COMMENT '设备状态',
  `binding_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否绑定(0：未绑定 1：已绑定)',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '设备类型',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `updatetime` int(11) DEFAULT NULL COMMENT '激活时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_devices
-- ----------------------------
INSERT INTO `xp_devices` VALUES ('1', '2017051200000111', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('2', '2017051200000112', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('3', '2017051200000113', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('4', '2017051200000114', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('5', '2017051200000115', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('6', '2017051200000116', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('7', '2017051200000117', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('8', '2017051200000118', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('9', '2017051200000119', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('10', '2017051200000120', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('11', '2017051200000121', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('12', '2017051200000122', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('13', '2017051200000123', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('14', '2017051200000124', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('15', '2017051200000125', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('16', '2017051200000126', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('17', '2017051200000127', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('18', '2017051200000128', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('19', '2017051200000129', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('20', '2017051200000130', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('21', '2017051200000131', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('22', '2017051200000132', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('23', '2017051200000133', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('24', '2017051200000134', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('25', '2017051200000135', '0', '0', '4', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('26', '2017051200000136', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('27', '2017051200000137', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('28', '2017051200000138', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('29', '2017051200000139', '0', '0', '4', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('30', '2017051200000140', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('31', '2017051200000141', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('32', '2017051200000142', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('33', '2017051200000143', '0', '0', '4', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('34', '2017051200000144', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('35', '2017051200000145', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('36', '2017051200000146', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('37', '2017051200000147', '0', '0', '4', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('38', '2017051200000148', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('39', '2017051200000149', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('40', '2017051200000150', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('41', '2017051200000151', '0', '0', '4', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('42', '2017051200000152', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('43', '2017051200000153', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('44', '2017051200000154', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('45', '2017051200000155', '0', '0', '4', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('46', '2017051200000156', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('47', '2017051200000157', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('48', '2017051200000158', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('49', '2017051200000159', '0', '0', '4', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('50', '2017051200000160', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('51', '2017051200000161', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('52', '2017051200000162', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('53', '2017051200000163', '0', '0', '4', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('54', '2017051200000164', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('55', '2017051200000165', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('56', '2017051200000166', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('57', '2017051200000167', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('58', '2017051200000168', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('59', '2017051200000169', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('60', '2017051200000170', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('61', '2017051200000171', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('62', '2017051200000172', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('63', '2017051200000173', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('64', '2017051200000174', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('65', '2017051200000175', '0', '0', '4', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('66', '2017051200000176', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('67', '2017051200000182', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('68', '2017051200000183', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('69', '2017051200000184', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('70', '2017051200000185', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('71', '2017051200000186', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('72', '2017051200000187', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('73', '2017051200000188', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('74', '2017051200000189', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('75', '2017051200000190', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('76', '2017051200000191', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('77', '2017051200000192', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('78', '2017051200000193', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('79', '2017051200000194', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('80', '2017051200000195', '0', '0', '4', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('81', '2017051200000196', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('82', '2017051200000197', '0', '0', '3', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('83', '2017051200000198', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('84', '2017051200000199', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('85', '2017051200000200', '0', '0', '1', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('86', '2017051200000201', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('87', '112233445566778', '0', '0', '2', '1512021453', null);
INSERT INTO `xp_devices` VALUES ('88', '863586032488490', '0', '0', '1', '1512368076', null);

-- ----------------------------
-- Table structure for xp_devices_statu
-- ----------------------------
DROP TABLE IF EXISTS `xp_devices_statu`;
CREATE TABLE `xp_devices_statu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `DeviceID` varchar(20) NOT NULL COMMENT '设备码',
  `DeviceStause` tinyint(2) DEFAULT '11' COMMENT '设备状态 0:制水 1:冲洗 2:水满 3:缺水 4漏水 5:检修 6:欠费停机 7:关机 8:开机(仅命令)',
  `ReFlow` int(10) DEFAULT NULL COMMENT '剩余流量 租赁用',
  `Reday` int(10) DEFAULT NULL COMMENT '剩余天数 租赁用',
  `RawTDS` int(10) DEFAULT NULL COMMENT '纯水',
  `PureTDS` int(10) DEFAULT NULL COMMENT '原水',
  `Temperature` int(10) DEFAULT NULL COMMENT '温度',
  `ReFlowFilter1` int(10) DEFAULT NULL COMMENT '滤芯1剩余流量',
  `ReDayFilter1` int(10) DEFAULT NULL COMMENT '滤芯1剩余天数',
  `ReFlowFilter2` int(10) DEFAULT NULL COMMENT '滤芯2剩余流量',
  `ReDayFilter2` int(10) DEFAULT NULL COMMENT '滤芯2剩余天数',
  `ReFlowFilter3` int(10) DEFAULT NULL COMMENT '滤芯3剩余流量',
  `ReDayFilter3` int(10) DEFAULT NULL COMMENT '滤芯3剩余天数',
  `ReFlowFilter4` int(10) DEFAULT NULL COMMENT '滤芯4剩余流量',
  `ReDayFilter4` int(10) DEFAULT NULL COMMENT '滤芯4剩余天数',
  `ReFlowFilter5` int(10) DEFAULT NULL COMMENT '滤芯5剩余流量',
  `ReDayFilter5` int(10) DEFAULT NULL COMMENT '滤芯5剩余天数',
  `ReFlowFilter6` int(10) DEFAULT NULL COMMENT '滤芯6剩余流量',
  `ReDayFilter6` int(10) DEFAULT NULL COMMENT '滤芯6剩余天数',
  `ReFlowFilter7` int(10) DEFAULT NULL COMMENT '滤芯7剩余流量',
  `ReDayFilter7` int(10) DEFAULT NULL COMMENT '滤芯7剩余天数',
  `ReFlowFilter8` int(10) DEFAULT NULL COMMENT '滤芯8剩余流量',
  `ReDayFilter8` int(10) DEFAULT NULL COMMENT '滤芯8剩余天数',
  `LeasingMode` tinyint(1) DEFAULT NULL COMMENT '租赁模式  0:零售型 1:按流量计费 2:按时间计费 3:时长和流量套餐',
  `AliveStause` tinyint(1) DEFAULT NULL,
  `SumFlow` int(10) DEFAULT NULL COMMENT '累计流量',
  `SumDay` int(10) DEFAULT NULL COMMENT '累计天数',
  `FilterMode` tinyint(1) DEFAULT NULL COMMENT '滤芯模式',
  `Device` varchar(10) DEFAULT NULL,
  `ICCID` varchar(20) DEFAULT NULL,
  `CSQ` int(3) DEFAULT NULL,
  `Loaction` varchar(200) DEFAULT NULL,
  `addtime` varchar(11) DEFAULT NULL,
  `updatetime` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`DeviceID`,`DeviceStause`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_devices_statu
-- ----------------------------
INSERT INTO `xp_devices_statu` VALUES ('10', '2017051200000188', '11', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, 'GPRS', '11223344556677889900', '90', '10020\0\0\0\0\0', '1511775150', '1511943724');
INSERT INTO `xp_devices_statu` VALUES ('11', '112233445566778', '11', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, 'GPRS', '11223344556677889900', '90', '10020\0\0\0\0\0', '1512107170', '1512112024');

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
  `ordernumber` varchar(32) NOT NULL COMMENT '商户订单号',
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_users
-- ----------------------------
INSERT INTO `xp_users` VALUES ('1', '', '', '', '', '1', null, null, '8756', '0');

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
  `number` varchar(30) NOT NULL COMMENT '工单编号(时间+机组id)',
  `name` varchar(50) NOT NULL COMMENT '处理人',
  `phone` varchar(11) NOT NULL COMMENT '处理人电话',
  `type` tinyint(1) NOT NULL COMMENT '工单类型(0：安装 1：维修 2：维护)',
  `content` text NOT NULL COMMENT '维护内容',
  `address` varchar(50) NOT NULL COMMENT '地址',
  `result` tinyint(1) NOT NULL COMMENT '处理结果(0：未处理 1：正在处理 2：已处理)',
  `time` varchar(30) NOT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xp_work
-- ----------------------------
INSERT INTO `xp_work` VALUES ('1', '20171117-2', '隔壁老王', '', '0', '安装2号机组在三里屯试衣间', '三里屯', '2', '2017-11-17');
INSERT INTO `xp_work` VALUES ('2', '20171118-2', '啊啊', '', '1', '维护爱爱爱爱', '中国广东', '2', '2017-11-13');
