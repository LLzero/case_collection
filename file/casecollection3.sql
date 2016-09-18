/*
 Navicat MySQL Data Transfer

 Source Server         : inteliAns
 Source Server Version : 50710
 Source Host           : 123.57.51.209
 Source Database       : casecollection

 Target Server Version : 50710
 File Encoding         : utf-8

 Date: 08/13/2016 11:36:16 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_disease_case`
-- ----------------------------
DROP TABLE IF EXISTS `t_disease_case`;
CREATE TABLE `t_disease_case` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '病例号(主键)',
  `code` varchar(50) NOT NULL COMMENT '病例号',
  `depart_id` bigint(20) DEFAULT NULL COMMENT '收集单位ID',
  `depart_name` varchar(200) DEFAULT NULL COMMENT '收集单位名称',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `sex` int(4) DEFAULT '0' COMMENT '性别[0:男;1:女]',
  `is_married` int(4) DEFAULT '0' COMMENT '婚姻[0:否;1:是]',
  `profession` varchar(200) DEFAULT NULL COMMENT '职业',
  `birth_address` varchar(200) DEFAULT NULL COMMENT '出生地',
  `nation` varchar(50) DEFAULT '汉族' COMMENT '民族',
  `nationality` varchar(50) DEFAULT '中国' COMMENT '国籍',
  `identity_number` varchar(50) DEFAULT '' COMMENT '身份证号',
  `contact_address` varchar(200) DEFAULT NULL COMMENT '通讯地址',
  `contact_name` varchar(50) DEFAULT '' COMMENT '联系人',
  `contact_phone` varchar(50) DEFAULT '' COMMENT '联系电话',
  `in_hospital_date` datetime DEFAULT NULL COMMENT '入院时间',
  `out_hospital_date` datetime DEFAULT NULL COMMENT '出院时间',
  `in_hospital_office` varchar(200) DEFAULT NULL COMMENT '入院科室',
  `out_hospital_office` varchar(200) DEFAULT NULL COMMENT '出院科室',
  `hospital_days` int(10) DEFAULT NULL COMMENT '住院天数',
  `in_diagnose` varchar(500) DEFAULT NULL COMMENT '入院诊断',
  `out_diagnose` varchar(500) DEFAULT NULL COMMENT '出院主要诊断',
  `diagnose_detail` varchar(1000) DEFAULT '' COMMENT '详细诊断信息',
  `other_diagnose1` varchar(200) DEFAULT '' COMMENT '其他诊断1',
  `other_diagnose2` varchar(200) DEFAULT '' COMMENT '其他诊断2',
  `other_diagnose3` varchar(200) DEFAULT '' COMMENT '其他诊断3',
  `other_diagnose4` varchar(200) DEFAULT '' COMMENT '其他诊断4',
  `other_diagnose5` varchar(200) DEFAULT '' COMMENT '其他诊断5',
  `medical_history` varchar(500) DEFAULT NULL COMMENT '主诉',
  `medical_history1` varchar(200) DEFAULT NULL COMMENT '现病史',
  `medical_history2` varchar(50) DEFAULT '' COMMENT '既往史[1:高血压、2:冠心病、3:糖尿病、4:肥胖]',
  `medical_history3` varchar(200) DEFAULT '' COMMENT '其他既往史',
  `medical_history4` varchar(50) DEFAULT '' COMMENT '个人史[1:吸烟、2:酗酒、3:药物滥用]',
  `medical_history5` int(10) DEFAULT NULL COMMENT '吸烟史[根/天]',
  `medical_history6` int(10) DEFAULT NULL COMMENT '吸烟史[年]',
  `medical_history7` varchar(50) DEFAULT '' COMMENT '酗酒史[1:白酒、2:红酒、3:啤酒]',
  `medical_history8` varchar(50) DEFAULT NULL COMMENT '酗酒史[g/天]',
  `medical_history9` varchar(200) DEFAULT '' COMMENT '传染病史',
  `medical_history10` varchar(200) DEFAULT '' COMMENT '过敏史',
  `medical_history11` varchar(50) DEFAULT '' COMMENT '家族遗传史[1:高血压、2:冠心病、3:糖尿病、4:肥胖]',
  `medical_history12` varchar(200) DEFAULT '' COMMENT '其他家族遗传史',
  `medical_history13` varchar(200) DEFAULT '' COMMENT '月经史(女)',
  `medical_history14` varchar(200) DEFAULT '' COMMENT '婚育史',
  `physical_examine1` varchar(50) DEFAULT NULL COMMENT 'T',
  `physical_examine2` varchar(50) DEFAULT NULL COMMENT 'P',
  `physical_examine3` varchar(50) DEFAULT NULL COMMENT 'R',
  `physical_examine4` varchar(50) DEFAULT NULL COMMENT 'SBP',
  `physical_examine5` varchar(50) DEFAULT NULL COMMENT 'DBP',
  `physical_examine6` varchar(50) DEFAULT NULL COMMENT '身高',
  `physical_examine7` varchar(50) DEFAULT NULL COMMENT '体重',
  `physical_examine8` varchar(50) DEFAULT NULL COMMENT '腹围',
  `physical_examine9` varchar(500) DEFAULT '' COMMENT '体格检查',
  `blood_routine1` varchar(50) DEFAULT NULL COMMENT '红细胞计数(RBC)',
  `blood_routine2` varchar(50) DEFAULT NULL COMMENT '红细胞压积(HCT)',
  `blood_routine3` varchar(50) DEFAULT NULL COMMENT '平均红细胞体积(MCV)',
  `blood_routine4` varchar(50) DEFAULT NULL COMMENT '红细胞分布宽度',
  `blood_routine5` varchar(50) DEFAULT NULL COMMENT '血红蛋白浓度(HGB)',
  `blood_routine6` varchar(50) DEFAULT NULL COMMENT '白细胞计数(WBC)',
  `blood_routine7` varchar(50) DEFAULT NULL COMMENT '单核细胞计数(MONO) ',
  `blood_routine8` varchar(50) DEFAULT NULL COMMENT '单核细胞比例(MONO%)',
  `blood_routine9` varchar(50) DEFAULT NULL COMMENT '中性粒细胞计数(NEUT)',
  `blood_routine10` varchar(50) DEFAULT NULL COMMENT '中性粒细胞比例(NEUT%) ',
  `blood_routine11` varchar(50) DEFAULT NULL COMMENT '淋巴细胞计数(LY) ',
  `blood_routine12` varchar(50) DEFAULT NULL COMMENT '淋巴细胞比值(LY%)',
  `blood_routine13` varchar(50) DEFAULT NULL COMMENT '血小板计数(PLT)',
  `blood_routine14` varchar(50) DEFAULT NULL COMMENT '血小板体积分布宽度(PDW) ',
  `blood_routine15` varchar(50) DEFAULT NULL COMMENT '平均血小板体积(MPV) ',
  `blood_routine16` varchar(50) DEFAULT NULL COMMENT '血清丙氨酸氨基转移酶（ALT）',
  `blood_routine17` varchar(50) DEFAULT NULL COMMENT '血清天门冬氨酰基转移酶（AST）',
  `blood_routine18` varchar(50) DEFAULT NULL COMMENT '碱性磷酸酶（ALP）',
  `blood_routine19` varchar(50) DEFAULT NULL COMMENT '血清γ--谷氨酰基转移酶（GGT）',
  `blood_routine20` varchar(50) DEFAULT NULL COMMENT '血清总蛋白测定',
  `blood_routine21` varchar(50) DEFAULT NULL COMMENT '血清白蛋白测定',
  `blood_routine22` varchar(50) DEFAULT NULL COMMENT '球蛋白',
  `blood_routine23` varchar(50) DEFAULT NULL COMMENT '血清总胆红素测定',
  `blood_routine24` varchar(50) DEFAULT NULL COMMENT '血清直接胆红素',
  `blood_routine25` varchar(50) DEFAULT NULL COMMENT '血清总胆固醇',
  `blood_routine26` varchar(50) DEFAULT NULL COMMENT '血清甘油三酯',
  `blood_routine27` varchar(50) DEFAULT NULL COMMENT '血清高密度脂蛋白胆固醇',
  `blood_routine28` varchar(50) DEFAULT NULL COMMENT '血清低密度脂蛋白胆固醇',
  `blood_routine29` varchar(50) DEFAULT '' COMMENT '血清载脂蛋白A1',
  `blood_routine30` varchar(50) DEFAULT '' COMMENT '血清载脂蛋白B',
  `blood_routine31` varchar(50) DEFAULT '' COMMENT '血清载脂蛋白(a)',
  `blood_routine32` varchar(50) DEFAULT NULL COMMENT '尿素',
  `blood_routine33` varchar(50) DEFAULT NULL COMMENT '肌酐',
  `blood_routine34` varchar(50) DEFAULT NULL COMMENT '尿酸',
  `blood_routine35` varchar(50) DEFAULT '' COMMENT '血清肌酸激酶',
  `blood_routine36` varchar(50) DEFAULT '' COMMENT '血清肌酸激酶－MB同功酶（CK-MB）',
  `blood_routine37` varchar(50) DEFAULT '' COMMENT '心肌肌钙蛋白I(cTnI)',
  `blood_routine38` varchar(50) DEFAULT '' COMMENT '心肌肌钙蛋白T(cTnT)',
  `blood_routine39` varchar(50) DEFAULT '' COMMENT 'B型脑尿钠肽',
  `blood_routine40` varchar(50) DEFAULT NULL COMMENT '钾（K）',
  `blood_routine41` varchar(50) DEFAULT NULL COMMENT '钠（Na）',
  `blood_routine42` varchar(50) DEFAULT NULL COMMENT '氯（Cl）',
  `blood_routine43` varchar(50) DEFAULT NULL COMMENT '钙（Ca）',
  `blood_routine44` varchar(50) DEFAULT '' COMMENT '磷（P）',
  `blood_routine45` varchar(50) DEFAULT NULL COMMENT '随机血糖',
  `blood_routine46` varchar(50) DEFAULT '' COMMENT '空腹血糖',
  `blood_routine47` varchar(50) DEFAULT '' COMMENT '餐后2小时血糖',
  `ogit1` varchar(50) DEFAULT '' COMMENT '空腹血糖',
  `ogit2` varchar(50) DEFAULT '' COMMENT '30分钟',
  `ogit3` varchar(50) DEFAULT '' COMMENT '1小时',
  `ogit4` varchar(50) DEFAULT '' COMMENT '2小时',
  `ogit5` varchar(50) DEFAULT '' COMMENT '3小时',
  `ogit6` varchar(50) DEFAULT '' COMMENT '糖化血红蛋白（HbA1c）',
  `ogit7` varchar(50) DEFAULT '' COMMENT '血清C-反应蛋白（CRP）',
  `ogit8` varchar(50) DEFAULT '' COMMENT '活化部分凝血活酶时间（APTT）',
  `ogit9` varchar(50) DEFAULT '' COMMENT '凝血酶原时间（PT）',
  `ogit10` varchar(50) DEFAULT '' COMMENT '凝血酶时间（TT）',
  `ogit11` varchar(50) DEFAULT '' COMMENT 'D-二聚体(D-Dimer)',
  `ogit12` varchar(50) DEFAULT '' COMMENT '血清游离T3（FT3）',
  `ogit13` varchar(50) DEFAULT '' COMMENT '血清游离甲状腺素（FT4）',
  `ogit14` varchar(50) DEFAULT '' COMMENT '促甲状腺激素(TSH)',
  `ogit15` varchar(50) DEFAULT '' COMMENT '皮质醇',
  `ogit16` varchar(50) DEFAULT '' COMMENT 'ATCH',
  `urine_routine1` int(4) DEFAULT '0' COMMENT '尿糖（GLU）[0:阴;1:阳]',
  `urine_routine2` int(4) DEFAULT '0' COMMENT '尿蛋白（PRO）[0:阴;1:阳]',
  `urine_routine3` int(4) DEFAULT '0' COMMENT '尿酮体（KET）[0:阴;1:阳]',
  `urine_routine4` varchar(50) DEFAULT '' COMMENT '24小时尿蛋白定量',
  `urine_routine5` int(4) DEFAULT '0' COMMENT '1:是;0:否',
  `special_examine1` varchar(200) DEFAULT NULL COMMENT '心电图[图片]',
  `special_examine2` varchar(200) DEFAULT NULL COMMENT '心脏超声[图片]',
  `special_examine3` varchar(200) DEFAULT '' COMMENT '冠状动脉CTA造影[图片/文本]',
  `special_examine4` varchar(200) DEFAULT '' COMMENT '冠状动脉CTA造影[图片/文本]',
  `special_examine5` varchar(200) DEFAULT '' COMMENT '冠状动脉造影[图片/文本]',
  `special_examine6` varchar(200) DEFAULT '' COMMENT '冠状动脉造影[图片/文本]',
  `special_examine7` varchar(200) DEFAULT '' COMMENT '肝脏超声[图片/文本]',
  `special_examine8` varchar(200) DEFAULT '' COMMENT '肝脏超声[图片/文本]',
  `treatment_medicine` varchar(1000) DEFAULT '' COMMENT '治疗药物',
  `is_delete` int(4) DEFAULT '0' COMMENT '1:是;0:否',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(150) DEFAULT NULL COMMENT '创建人',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `modify_by` varchar(150) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `ix_modify_time` (`modify_time`),
  KEY `ix_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='病例表';

-- ----------------------------
--  Table structure for `t_flag`
-- ----------------------------
DROP TABLE IF EXISTS `t_flag`;
CREATE TABLE `t_flag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flag` int(4) NOT NULL DEFAULT '0' COMMENT '标识',
  `version` int(4) NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_flag`
-- ----------------------------
BEGIN;
INSERT INTO `t_flag` VALUES ('1', '22', '0');
COMMIT;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) NOT NULL COMMENT '用户名（单位名）',
  `password` varchar(200) NOT NULL COMMENT '登录密码(md5加密)  初始密码 000000',
  `contact` varchar(200) NOT NULL COMMENT '联系人',
  `contact_means` varchar(100) NOT NULL COMMENT '联系方式',
  `report_account` varchar(50) NOT NULL DEFAULT '' COMMENT '填报账号',
  `query_account` varchar(50) NOT NULL DEFAULT '' COMMENT '查询账号',
  `data_level` int(4) NOT NULL DEFAULT '2' COMMENT '权限级别  0-管理员  2-普通用户',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '用户状态  0-启用  1-禁用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(200) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_by` varchar(200) NOT NULL DEFAULT '' COMMENT '修改人',
  `create_type` int(4) NOT NULL DEFAULT '1' COMMENT '创建方式  0-初始化  1-注册  2-密码重置',
  `login_times` bigint(20) NOT NULL DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', '0', '0', '2016-08-12 10:30:34', '2016-08-12 10:46:12', '', 'admin', '0', '0'), ('2', '华中科技大学同济医学院附属协和医院', '000000', '黄恺', '13986102602', 'I001', 'Q001', '2', '0', '2016-08-12 10:47:58', '2016-08-13 02:10:42', 'admin', 'admin', '2', '0'), ('3', '湖南省湘潭市中心医院', '000000', '曾建平', '13973206628', 'I002', 'Q002', '2', '0', '2016-08-12 10:50:24', '2016-08-12 10:59:58', 'admin', 'admin', '2', '0'), ('4', '中南大学湘雅三医院', '000000', '蒋卫红', '13786113632', 'I003', 'Q003', '2', '0', '2016-08-12 10:50:58', '2016-08-12 11:00:04', 'admin', 'admin', '2', '0'), ('5', '中南大学血脂与动脉粥样硬化研究所', '000000', '彭道泉', '13974822567', 'I004', 'Q004', '2', '0', '2016-08-12 10:51:35', '2016-08-12 11:00:09', 'admin', 'admin', '2', '0'), ('6', '中南大学湘雅医院', '000000', '夏珂', '13908483367', 'I005', 'Q005', '2', '0', '2016-08-12 10:52:11', '2016-08-12 11:00:17', 'admin', 'admin', '2', '0'), ('7', '武汉大学人民医院', '000000', '包明威', '15327105667', 'I006', 'Q006', '2', '0', '2016-08-12 10:53:05', '2016-08-12 11:00:23', 'admin', 'admin', '2', '0'), ('8', '华中科技大学公共卫生学院', '000000', '潘安', '', 'I007', 'Q007', '2', '0', '2016-08-12 10:53:52', '2016-08-12 11:00:29', 'admin', 'admin', '2', '0'), ('9', '郑州大学第一附属医院', '000000', '姚瑞', '18703841188', 'I008', 'Q008', '2', '0', '2016-08-12 10:54:18', '2016-08-12 11:00:35', 'admin', 'admin', '2', '0'), ('10', '新疆医科大学第一附属医院', '000000', '高颖', '13999815660', 'I009', 'Q009', '2', '0', '2016-08-12 10:54:50', '2016-08-12 11:00:41', 'admin', 'admin', '2', '0'), ('11', '广西医科大学第一附属医院', '000000', '桂春', '13878885268', 'I010', 'Q010', '2', '0', '2016-08-12 10:55:19', '2016-08-12 10:55:19', 'admin', 'admin', '2', '0'), ('12', '江苏省人民医院', '000000', '王晖', '13016957730', 'I011', 'Q011', '2', '0', '2016-08-12 10:55:38', '2016-08-12 10:55:38', 'admin', 'admin', '2', '0'), ('13', '哈尔滨医科大学附属第二医院', '000000', '吴健', '15245001123', 'I012', 'Q012', '2', '0', '2016-08-12 10:55:58', '2016-08-12 10:55:58', 'admin', 'admin', '2', '0'), ('14', '南昌大学第二附属医院', '000000', '徐劲松', '13607067019', 'I013', 'Q013', '2', '0', '2016-08-12 10:56:22', '2016-08-12 10:56:22', 'admin', 'admin', '2', '0'), ('15', '中山大学附属第一医院', '000000', '廖志红', '18925106578', 'I014', 'Q014', '2', '0', '2016-08-12 10:56:40', '2016-08-12 10:56:40', 'admin', 'admin', '2', '0'), ('16', '广东省人民医院', '000000', '谭宁', '13903073651', 'I015', 'Q015', '2', '0', '2016-08-12 10:57:00', '2016-08-12 10:57:00', 'admin', 'admin', '2', '0'), ('17', '西安交通大学第一附属医院', '000000', '张卫萍', '13096947055', 'I016', 'Q016', '2', '0', '2016-08-12 10:57:23', '2016-08-12 10:57:23', 'admin', 'admin', '2', '0'), ('18', '海南省人民医院', '000000', '马建林', '13005008679', 'I017', 'Q017', '2', '0', '2016-08-12 10:57:42', '2016-08-12 10:57:42', 'admin', 'admin', '2', '0'), ('19', '山东大学齐鲁医院', '000000', '安丰双', '13791122759', 'I018', 'Q018', '2', '0', '2016-08-12 10:58:01', '2016-08-12 10:58:01', 'admin', 'admin', '2', '0'), ('20', '遵义医学院附属医院', '000000', '赵然尊', '18685535533', 'I019', 'Q019', '2', '0', '2016-08-12 10:58:22', '2016-08-12 10:58:22', 'admin', 'admin', '2', '0'), ('21', '天津武警后勤医院', '000000', '刘军翔', '', 'I020', 'Q020', '2', '0', '2016-08-12 10:58:39', '2016-08-12 10:59:38', 'admin', 'admin', '2', '0'), ('22', '四川大学华西医院', '000000', '王勉', '', 'I021', 'Q021', '2', '0', '2016-08-12 10:58:57', '2016-08-12 10:59:41', 'admin', 'admin', '2', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
