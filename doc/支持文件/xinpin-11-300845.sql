-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-11-30 00:44:12
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xinpin`
--

-- --------------------------------------------------------

--
-- 表的结构 `xp_binding`
--

CREATE TABLE `xp_binding` (
  `id` int(11) NOT NULL,
  `vid` int(11) NOT NULL COMMENT '经销商ID',
  `cid` int(11) NOT NULL COMMENT '机组ID',
  `addtime` int(11) NOT NULL COMMENT '绑定时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_binding`
--

INSERT INTO `xp_binding` (`id`, `vid`, `cid`, `addtime`) VALUES
(1, 2, 1, 1510801488),
(2, 2, 2, 1510990453),
(3, 1, 1, 1510990453),
(4, 1, 2, 1510801488),
(5, 1, 10, 1511604903),
(6, 1, 11, 1511604917),
(7, 1, 12, 1511604917),
(8, 1, 13, 1511604917),
(12, 1, 14, 1511837539),
(10, 1, 15, 1511837508);

-- --------------------------------------------------------

--
-- 表的结构 `xp_card`
--

CREATE TABLE `xp_card` (
  `id` int(11) NOT NULL,
  `iccard` varchar(50) NOT NULL COMMENT 'IC卡编号',
  `name` varchar(255) DEFAULT NULL COMMENT '持有人姓名',
  `studentcode` int(11) DEFAULT NULL COMMENT '学籍号',
  `school` varchar(255) DEFAULT NULL COMMENT '学校',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `type` tinyint(1) NOT NULL COMMENT 'IC卡类型(0：免费 1：计费)',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0：未绑定 1：已绑定 2：挂失)',
  `addtime` int(11) NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_card`
--

INSERT INTO `xp_card` (`id`, `iccard`, `name`, `studentcode`, `school`, `uid`, `type`, `status`, `addtime`) VALUES
(31, 'IC0001', NULL, NULL, NULL, NULL, 0, 0, 1510989876),
(32, 'IC0002', NULL, NULL, NULL, NULL, 0, 0, 1510989876),
(33, 'IC0003', NULL, NULL, NULL, NULL, 0, 0, 1510989876),
(34, 'IC0004', NULL, NULL, NULL, NULL, 0, 0, 1510989876),
(35, 'IC0005', NULL, NULL, NULL, NULL, 0, 0, 1510989876),
(36, 'IC0006', NULL, NULL, NULL, NULL, 0, 0, 1510989876),
(37, 'IC0007', NULL, NULL, NULL, NULL, 1, 0, 1510989876),
(38, 'IC0008', NULL, NULL, NULL, NULL, 1, 0, 1510989876),
(39, 'IC0009', NULL, NULL, NULL, NULL, 1, 0, 1510989876),
(40, 'IC0010', NULL, NULL, NULL, NULL, 1, 0, 1510989876),
(42, 'IC0000', NULL, NULL, NULL, NULL, 0, 0, 1511427435),
(43, '18112236364114563214', '00', NULL, '', 1, 1, 0, 1511427435);

-- --------------------------------------------------------

--
-- 表的结构 `xp_consume`
--

CREATE TABLE `xp_consume` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `icid` int(11) NOT NULL COMMENT 'IC卡ID',
  `flow` int(10) NOT NULL COMMENT '消费流量',
  `address` varchar(255) NOT NULL COMMENT '消费地点',
  `time` int(11) NOT NULL COMMENT '消费时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_consume`
--

INSERT INTO `xp_consume` (`id`, `uid`, `icid`, `flow`, `address`, `time`) VALUES
(1, 1, 43, -16, 'aaaa', 1511919559),
(2, 1, 43, -16, 'aaaa', 1511919620),
(3, 1, 43, -16, 'aaaa', 1511919763),
(4, 1, 43, 4552, 'aaaa', 1511923696),
(5, 1, 43, 4536, 'aaaa', 1511923703),
(6, 1, 43, 4520, 'aaaa', 1511923709),
(7, 1, 43, 4504, 'aaaa', 1511923710),
(8, 1, 43, 4488, 'aaaa', 1511923710),
(9, 1, 43, 4472, 'aaaa', 1511923710),
(10, 1, 43, 16, 'aaaa', 1511923956),
(11, 1, 43, 16, 'aaaa', 1511924002),
(12, 1, 43, 16, 'aaaa', 1511924101),
(13, 1, 43, 16, 'aaaa', 1511924106),
(14, 1, 43, 16, 'aaaa', 1511924272),
(15, 1, 43, 16, 'aaaa', 1511924396),
(16, 1, 43, 16, 'aaaa', 1511924468),
(17, 1, 43, 16, 'aaaa', 1511924517),
(18, 1, 43, 16, 'aaaa', 1511924644),
(19, 1, 43, 16, 'aaaa', 1511924674),
(20, 1, 43, 16, 'aaaa', 1511924814),
(21, 1, 43, 16, 'aaaa', 1511924881),
(22, 1, 43, 16, 'aaaa', 1511924937),
(23, 1, 43, 16, 'aaaa', 1511925423),
(24, 1, 43, 16, 'aaaa', 1511925575),
(25, 1, 43, 16, 'aaaa', 1511925579),
(26, 1, 43, 16, 'aaaa', 1511925805),
(27, 1, 43, 16, 'aaaa', 1511925810),
(28, 1, 43, 16, 'aaaa', 1511925827);

-- --------------------------------------------------------

--
-- 表的结构 `xp_crew`
--

CREATE TABLE `xp_crew` (
  `id` int(11) NOT NULL,
  `cname` varchar(255) NOT NULL COMMENT '机组名',
  `dcode` varchar(30) NOT NULL COMMENT '一号设备ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已绑定(0：未绑定  1：已绑定)',
  `addtime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_crew`
--

INSERT INTO `xp_crew` (`id`, `cname`, `dcode`, `status`, `addtime`) VALUES
(10, 'SB250', '112233445566778', 1, 1511145348),
(11, 'AE86', '112233445566778', 1, 1511145348),
(12, 'AE861', '2017051200000189', 1, 1511145348),
(13, 'AE8612', '2017051200000189', 1, 1511145348),
(14, 'AA002', '2017051200000188', 1, 1511837298),
(15, 'AA003', '2017051200000187', 1, 1511837497);

-- --------------------------------------------------------

--
-- 表的结构 `xp_devices`
--

CREATE TABLE `xp_devices` (
  `id` int(11) NOT NULL COMMENT '设备ID',
  `device_code` varchar(255) NOT NULL COMMENT '设备编码',
  `device_status` tinyint(1) NOT NULL COMMENT '设备状态',
  `binding_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否绑定(0：未绑定 1：已绑定)',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '设备类型',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `updatetime` int(11) DEFAULT NULL COMMENT '激活时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_devices`
--

INSERT INTO `xp_devices` (`id`, `device_code`, `device_status`, `binding_status`, `type_id`, `addtime`, `updatetime`) VALUES
(1, '2017051200000189', 0, 0, 2, 1511837236, NULL),
(2, '2017051200000188', 0, 1, 3, 1511837283, NULL),
(3, '2017051200000187', 0, 1, 2, 1511837485, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `xp_devices_statu`
--

CREATE TABLE `xp_devices_statu` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '自增ID',
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
  `updatetime` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_devices_statu`
--

INSERT INTO `xp_devices_statu` (`id`, `DeviceID`, `DeviceStause`, `ReFlow`, `Reday`, `RawTDS`, `PureTDS`, `Temperature`, `ReFlowFilter1`, `ReDayFilter1`, `ReFlowFilter2`, `ReDayFilter2`, `ReFlowFilter3`, `ReDayFilter3`, `ReFlowFilter4`, `ReDayFilter4`, `ReFlowFilter5`, `ReDayFilter5`, `ReFlowFilter6`, `ReDayFilter6`, `ReFlowFilter7`, `ReDayFilter7`, `ReFlowFilter8`, `ReDayFilter8`, `LeasingMode`, `AliveStause`, `SumFlow`, `SumDay`, `FilterMode`, `Device`, `ICCID`, `CSQ`, `Loaction`, `addtime`, `updatetime`) VALUES
(10, '112233445566778', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'GPRS', '11223344556677889900', 90, '10020\0\0\0\0\0', '1511775150', '1511926998');

-- --------------------------------------------------------

--
-- 表的结构 `xp_device_config`
--

CREATE TABLE `xp_device_config` (
  `id` int(11) NOT NULL,
  `did` int(11) NOT NULL COMMENT '设备ID',
  `dtid` int(11) NOT NULL COMMENT '设备类型ID',
  `vid` int(11) DEFAULT NULL COMMENT '经销商ID（备用）',
  `leasingmode` tinyint(1) DEFAULT NULL COMMENT '租赁模式(0：时间 1：流量)(备用)',
  `addtime` int(11) NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xp_device_type`
--

CREATE TABLE `xp_device_type` (
  `id` int(11) NOT NULL,
  `typename` varchar(255) NOT NULL COMMENT '设备类型',
  `filter1` varchar(30) DEFAULT NULL COMMENT '一级滤芯',
  `filter2` varchar(30) DEFAULT NULL COMMENT '二级滤芯',
  `filter3` varchar(30) DEFAULT NULL COMMENT '三级滤芯',
  `filter4` varchar(30) DEFAULT NULL COMMENT '四级滤芯',
  `filter5` varchar(30) DEFAULT NULL COMMENT '五级滤芯',
  `filter6` varchar(30) DEFAULT NULL COMMENT '六级滤芯',
  `filter7` varchar(30) DEFAULT NULL COMMENT '七级滤芯',
  `filter8` varchar(30) DEFAULT NULL COMMENT '八级滤芯',
  `addtime` int(11) NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_device_type`
--

INSERT INTO `xp_device_type` (`id`, `typename`, `filter1`, `filter2`, `filter3`, `filter4`, `filter5`, `filter6`, `filter7`, `filter8`, `addtime`) VALUES
(1, '商务型', 'PP棉', '滤芯1号', '', '', '', '', '', '', 1510802286),
(2, '家用型', 'RO膜', 'PP棉', '', '', '', '', '', '', 1510802316),
(3, '高级型', 'RO膜', 'PP棉', '滤芯1号', '', '', '', '', '', 1510802334),
(4, 'aaa', 'RO膜-C型', 'RO膜-C型', 'PP棉-B型', 'RO膜-C型', 'RO膜-C型', 'PP棉-B型', '', '', 1511593004);

-- --------------------------------------------------------

--
-- 表的结构 `xp_filters`
--

CREATE TABLE `xp_filters` (
  `id` int(11) NOT NULL,
  `filtername` varchar(30) NOT NULL COMMENT '滤芯名称',
  `alias` varchar(30) DEFAULT NULL COMMENT '滤芯别名',
  `timelife` int(11) NOT NULL COMMENT '时间寿命(小时)',
  `flowlife` int(11) NOT NULL COMMENT '流量寿命(升)',
  `balancetime` int(11) DEFAULT NULL COMMENT '时间寿命使能',
  `balanceflow` int(11) DEFAULT NULL COMMENT '流量寿命使能',
  `introduce` varchar(255) NOT NULL COMMENT '滤芯简介',
  `url` varchar(255) DEFAULT NULL COMMENT '购买网址',
  `addtime` int(11) NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_filters`
--

INSERT INTO `xp_filters` (`id`, `filtername`, `alias`, `timelife`, `flowlife`, `balancetime`, `balanceflow`, `introduce`, `url`, `addtime`) VALUES
(1, '滤芯1号', 'A型', 500, 200, NULL, NULL, '啊实打实', 'http://www.baidu.com', 1510802182),
(2, 'PP棉', 'B型', 100, 321, NULL, NULL, '啊实打实', 'http://www.baidu.com', 1510802203),
(3, 'RO膜', 'C型', 500, 200, NULL, NULL, '驱蚊器无', 'http://www.baidu.com', 1510802307);

-- --------------------------------------------------------

--
-- 表的结构 `xp_flow`
--

CREATE TABLE `xp_flow` (
  `id` int(11) NOT NULL COMMENT '充值流水ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `ordernumber` varchar(32) NOT NULL COMMENT '商户订单号',
  `money` int(10) NOT NULL COMMENT '充值金额',
  `mode` tinyint(1) NOT NULL COMMENT '充值方式(0：系统赠送 1：微信 2：支付宝)',
  `time` int(11) NOT NULL COMMENT '充值时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xp_leavel`
--

CREATE TABLE `xp_leavel` (
  `id` int(11) NOT NULL,
  `vendors_id` int(11) NOT NULL COMMENT '经销商ID',
  `parent_vid` int(11) NOT NULL COMMENT '经销商父级ID',
  `path` varchar(255) NOT NULL COMMENT '经销商的层级关系'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xp_loglist`
--

CREATE TABLE `xp_loglist` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '登录用户ID',
  `content` varchar(255) NOT NULL COMMENT '操作内容',
  `time` int(11) NOT NULL COMMENT '操作时间',
  `ip` varchar(15) NOT NULL COMMENT '操作IP'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `xp_users`
--

CREATE TABLE `xp_users` (
  `id` int(11) NOT NULL COMMENT '用户ID',
  `name` varchar(255) NOT NULL COMMENT '用户姓名',
  `phone` varchar(11) NOT NULL COMMENT '手机号码(登录账户)',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态(0：禁用1：启用)',
  `login_time` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(15) DEFAULT NULL COMMENT '最后登录IP',
  `balance` int(10) NOT NULL DEFAULT '0' COMMENT '账户余额',
  `addtime` int(11) NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_users`
--

INSERT INTO `xp_users` (`id`, `name`, `phone`, `password`, `address`, `status`, `login_time`, `login_ip`, `balance`, `addtime`) VALUES
(1, '', '', '', '', 1, NULL, NULL, 8924, 0);

-- --------------------------------------------------------

--
-- 表的结构 `xp_vendors`
--

CREATE TABLE `xp_vendors` (
  `id` int(11) NOT NULL COMMENT '后台用户ID',
  `name` varchar(255) NOT NULL COMMENT '经销商名字',
  `password` varchar(255) NOT NULL COMMENT '登录密码',
  `phone` varchar(11) NOT NULL COMMENT '联系电话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `idcard` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `company` varchar(255) NOT NULL COMMENT '公司名称',
  `pid` int(11) DEFAULT NULL COMMENT '经销商上级ID',
  `leavel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '经销商级别(0：超级管理员 1：一级 2：二级)',
  `addtime` int(11) NOT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_vendors`
--

INSERT INTO `xp_vendors` (`id`, `name`, `password`, `phone`, `email`, `address`, `idcard`, `company`, `pid`, `leavel`, `addtime`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', '13838381438', NULL, '中国', NULL, '点球电子', 0, 0, 1509585067),
(2, '经销商头子', '202cb962ac59075b964b07152d234b70', '13838381438', '619328391@qq.com', '中国广东', '430122199610224517', '点球', NULL, 1, 1510797277);

-- --------------------------------------------------------

--
-- 表的结构 `xp_work`
--

CREATE TABLE `xp_work` (
  `id` int(11) NOT NULL,
  `number` varchar(30) NOT NULL COMMENT '工单编号(时间+机组id)',
  `name` varchar(50) NOT NULL COMMENT '处理人',
  `phone` varchar(11) NOT NULL COMMENT '处理人电话',
  `type` tinyint(1) NOT NULL COMMENT '工单类型(0：安装 1：维修 2：维护)',
  `content` text NOT NULL COMMENT '维护内容',
  `address` varchar(50) NOT NULL COMMENT '地址',
  `result` tinyint(1) NOT NULL COMMENT '处理结果(0：未处理 1：正在处理 2：已处理)',
  `time` varchar(30) NOT NULL COMMENT '处理时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `xp_work`
--

INSERT INTO `xp_work` (`id`, `number`, `name`, `phone`, `type`, `content`, `address`, `result`, `time`) VALUES
(1, '20171117-2', '隔壁老王', '', 0, '安装2号机组在三里屯试衣间', '三里屯', 2, '2017-11-17'),
(2, '20171118-2', '啊啊', '', 1, '维护爱爱爱爱', '中国广东', 2, '2017-11-13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `xp_binding`
--
ALTER TABLE `xp_binding`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_card`
--
ALTER TABLE `xp_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_consume`
--
ALTER TABLE `xp_consume`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_crew`
--
ALTER TABLE `xp_crew`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_devices`
--
ALTER TABLE `xp_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_devices_statu`
--
ALTER TABLE `xp_devices_statu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`DeviceID`,`DeviceStause`);

--
-- Indexes for table `xp_device_config`
--
ALTER TABLE `xp_device_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_device_type`
--
ALTER TABLE `xp_device_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_filters`
--
ALTER TABLE `xp_filters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_flow`
--
ALTER TABLE `xp_flow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_leavel`
--
ALTER TABLE `xp_leavel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_loglist`
--
ALTER TABLE `xp_loglist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_users`
--
ALTER TABLE `xp_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_vendors`
--
ALTER TABLE `xp_vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xp_work`
--
ALTER TABLE `xp_work`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `xp_binding`
--
ALTER TABLE `xp_binding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `xp_card`
--
ALTER TABLE `xp_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- 使用表AUTO_INCREMENT `xp_consume`
--
ALTER TABLE `xp_consume`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- 使用表AUTO_INCREMENT `xp_crew`
--
ALTER TABLE `xp_crew`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `xp_devices`
--
ALTER TABLE `xp_devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设备ID', AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `xp_devices_statu`
--
ALTER TABLE `xp_devices_statu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `xp_device_config`
--
ALTER TABLE `xp_device_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `xp_device_type`
--
ALTER TABLE `xp_device_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `xp_filters`
--
ALTER TABLE `xp_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `xp_flow`
--
ALTER TABLE `xp_flow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值流水ID';
--
-- 使用表AUTO_INCREMENT `xp_leavel`
--
ALTER TABLE `xp_leavel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `xp_loglist`
--
ALTER TABLE `xp_loglist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `xp_users`
--
ALTER TABLE `xp_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `xp_vendors`
--
ALTER TABLE `xp_vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '后台用户ID', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `xp_work`
--
ALTER TABLE `xp_work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
