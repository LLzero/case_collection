CREATE TABLE `t_disease_case` (
  #一般信息
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '病例号(主键)',
  `depart_id` bigint(20) DEFAULT NULL COMMENT '收集单位ID',
  `depart_name` varchar(200) DEFAULT NULL COMMENT '收集单位名称',
  `name` varchar(50)  DEFAULT NULL COMMENT '姓名',
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
  `in_hospital_date` timestamp COMMENT '入院日期',
  `out_hospital_date` timestamp COMMENT '出院日期',
  `in_hospital_office` varchar(200) DEFAULT NULL COMMENT '入院科室',
  `out_hospital_office` varchar(200) DEFAULT NULL COMMENT '出院科室',
  `hospital_days` int(10) DEFAULT NULL COMMENT '住院天数',

  #疾病诊断
  `in_diagnose` varchar(500) DEFAULT NULL COMMENT '入院诊断',
  `out_diagnose` varchar(500) DEFAULT NULL COMMENT '出院主要诊断',
  `diagnose_detail` varchar(1000) DEFAULT '' COMMENT '详细诊断信息',
  /*`diagnose1` varchar() DEFAULT '' COMMENT '糖尿病',
  `diagnose2` varchar() DEFAULT '' COMMENT 'I型糖尿病',
  `diagnose3` varchar() DEFAULT '' COMMENT 'II型糖尿病',
  `diagnose4` varchar() DEFAULT '' COMMENT '肥胖症',
  `diagnose5` varchar() DEFAULT '' COMMENT '原发高血压',
  `diagnose6` varchar() DEFAULT '' COMMENT '高血压I级',
  `diagnose7` varchar() DEFAULT '' COMMENT '高血压II级',
  `diagnose8` varchar() DEFAULT '' COMMENT '高血压III级',
  `diagnose9` varchar() DEFAULT '' COMMENT '非酒精性脂肪性肝病（NAFLD）',
  `diagnose10` varchar() DEFAULT '' COMMENT '单纯性脂肪肝',
  `diagnose11` varchar() DEFAULT '' COMMENT '非酒精性脂肪性肝炎',
  `diagnose12` varchar() DEFAULT '' COMMENT '非酒精性脂肪性肝炎相关肝硬化',
  `diagnose13` varchar() DEFAULT '' COMMENT '冠心病',
  `diagnose14` varchar() DEFAULT '' COMMENT '冠心病稳定性心绞痛',
  `diagnose15` varchar() DEFAULT '' COMMENT '冠心病不稳定性心绞痛',
  `diagnose16` varchar() DEFAULT '' COMMENT '冠心病急性ST段抬高性心梗',
  `diagnose17` varchar() DEFAULT '' COMMENT '冠心病急性非ST段抬高性心梗',
  `diagnose18` varchar() DEFAULT '' COMMENT '冠心病陈旧性心肌梗死',
  `diagnose19` varchar() DEFAULT '' COMMENT '外周动脉粥样硬化症',
  `diagnose20` varchar() DEFAULT '' COMMENT '心力衰竭',
  `diagnose21` varchar() DEFAULT '' COMMENT '心衰NYHA I级',
  `diagnose22` varchar() DEFAULT '' COMMENT '心衰NYHA II级',
  `diagnose23` varchar() DEFAULT '' COMMENT '心衰NYHA III级',
  `diagnose24` varchar() DEFAULT '' COMMENT '心衰NYHA IV级',
  `diagnose25` varchar() DEFAULT '' COMMENT '心房纤颤',
  `diagnose26` varchar() DEFAULT '' COMMENT '脑卒中',
  `diagnose27` varchar() DEFAULT '' COMMENT '肿瘤',
  `diagnose28` varchar() DEFAULT '' COMMENT '血脂异常',
  `diagnose29` varchar() DEFAULT '' COMMENT '高胆固醇血症',
  `diagnose30` varchar() DEFAULT '' COMMENT '高甘油三酯血症',
  `diagnose31` varchar() DEFAULT '' COMMENT '混合型高脂血症',*/
  `other_diagnose1` varchar(200) DEFAULT '' COMMENT '其他诊断1',
  `other_diagnose2` varchar(200) DEFAULT '' COMMENT '其他诊断2',
  `other_diagnose3` varchar(200) DEFAULT '' COMMENT '其他诊断3',
  `other_diagnose4` varchar(200) DEFAULT '' COMMENT '其他诊断4',
  `other_diagnose5` varchar(200) DEFAULT '' COMMENT '其他诊断5',

  #病史
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

  #体格检查
  `physical_examine1` varchar(50) DEFAULT NULL COMMENT 'T',
  `physical_examine2` varchar(50) DEFAULT NULL COMMENT 'P',
  `physical_examine3` varchar(50) DEFAULT NULL COMMENT 'R',
  `physical_examine4` varchar(50) DEFAULT NULL COMMENT 'SBP',
  `physical_examine5` varchar(50) DEFAULT NULL COMMENT 'DBP',
  `physical_examine6` varchar(50) DEFAULT NULL COMMENT '身高',
  `physical_examine7` varchar(50) DEFAULT NULL COMMENT '体重',
  `physical_examine8` varchar(50) DEFAULT NULL COMMENT '腹围',
  `physical_examine9` varchar(500) DEFAULT '' COMMENT '体格检查',

  #实验室检查
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

  #特殊检查
  `special_examine1` varchar(200) DEFAULT NULL COMMENT '心电图[图片]',
  `special_examine2` varchar(200) DEFAULT NULL COMMENT '心脏超声[图片]',
  `special_examine3` varchar(200) DEFAULT '' COMMENT '冠状动脉CTA造影[图片/文本]',
  `special_examine4` varchar(200) DEFAULT '' COMMENT '冠状动脉CTA造影[图片/文本]',
  `special_examine5` varchar(200) DEFAULT '' COMMENT '冠状动脉造影[图片/文本]',
  `special_examine6` varchar(200) DEFAULT '' COMMENT '冠状动脉造影[图片/文本]',
  `special_examine7` varchar(200) DEFAULT '' COMMENT '肝脏超声[图片/文本]',
  `special_examine8` varchar(200) DEFAULT '' COMMENT '肝脏超声[图片/文本]',

  #治疗
  `treatment_medicine` varchar(1000) DEFAULT '' COMMENT '治疗药物',
  /*`treatment1` int(4) DEFAULT '0' COMMENT '阿司匹林[0:否;1:是]',
  `treatment2` int(4) DEFAULT '0' COMMENT '氯吡格雷[0:否;1:是]',
  `treatment3` int(4) DEFAULT '0' COMMENT '替格瑞洛[0:否;1:是]',
  `treatment4` int(4) DEFAULT '0' COMMENT 'ACEI[0:否;1:是]',
  `treatment5` int(4) DEFAULT '0' COMMENT 'ARB[0:否;1:是]',
  `treatment6` int(4) DEFAULT '0' COMMENT '钙离子拮抗剂[0:否;1:是]',
  `treatment7` int(4) DEFAULT '0' COMMENT '依法布雷定[0:否;1:是]',
  `treatment8` int(4) DEFAULT '0' COMMENT 'B受体阻滞剂[0:否;1:是]',
  `treatment9` int(4) DEFAULT '0' COMMENT 'A受体阻滞剂[0:否;1:是]',
  `treatment10` int(4) DEFAULT '0' COMMENT '醛固酮拮抗剂[0:否;1:是]',
  `treatment11` int(4) DEFAULT '0' COMMENT '硝酸甘油或硝酸酯类药物[0:否;1:是]',
  `treatment12` int(4) DEFAULT '0' COMMENT '袢利尿剂[0:否;1:是]',
  `treatment13` int(4) DEFAULT '0' COMMENT '双氢克尿噻[0:否;1:是]',
  `treatment14` int(4) DEFAULT '0' COMMENT '二甲双胍类[0:否;1:是]',
  `treatment15` int(4) DEFAULT '0' COMMENT 'α-葡萄糖苷酶（阿卡波糖、伏格列波糖）[0:否;1:是]',
  `treatment16` int(4) DEFAULT '0' COMMENT '胰岛素及其类似物[0:否;1:是]',
  `treatment17` int(4) DEFAULT '0' COMMENT '磺脲类促泌剂（格列吡嗪、格列齐特、格列本脲、格列波脲、格列美脲）[0:否;1:是]',
  `treatment18` int(4) DEFAULT '0' COMMENT '非磺脲类苯茴酸类衍生物促泌剂（瑞格列奈）[0:否;1:是]',
  `treatment19` int(4) DEFAULT '0' COMMENT '胰岛素增敏剂（罗格列酮、吡格列酮）[0:否;1:是]',
  `treatment20` int(4) DEFAULT '0' COMMENT 'GLP-1受体激动剂（利拉鲁肽、艾塞那肽）[0:否;1:是]',
  `treatment21` int(4) DEFAULT '0' COMMENT 'DPP-4抑制剂（西格列汀、沙格列汀）[0:否;1:是]',
  `treatment22` int(4) DEFAULT '0' COMMENT 'HMG—CoA还原酶抑制剂（他汀）[0:否;1:是]',
  `treatment23` int(4) DEFAULT '0' COMMENT '烟酸及其衍生物[0:否;1:是]',
  `treatment24` int(4) DEFAULT '0' COMMENT '贝特类（非诺贝特、利贝特、苯扎贝特、吉非贝齐、氯贝特）[0:否;1:是]',
  `treatment25` int(4) DEFAULT '0' COMMENT '胆固醇吸收抑制剂（依折麦布，海折麦布）[0:否;1:是]',*/

  `is_delete` int(4) DEFAULT '0' COMMENT '1:是;0:否',
  `create_time` datetime DEFAULT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(150) DEFAULT NULL COMMENT '创建人',
  `modify_time` datetime DEFAULT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `modify_by` varchar(150) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `ix_modify_time` (`modify_time`),
  KEY `ix_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='病例表';



alter table t_disease_case modify in_hospital_date datetime DEFAULT NULL
COMMENT '入院时间'
;

alter table t_disease_case modify out_hospital_date datetime DEFAULT NULL
COMMENT '出院时间';


