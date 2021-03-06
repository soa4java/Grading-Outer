DROP TABLE IF EXISTS  `subject`;
CREATE TABLE `subject` (
  `subject_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(16) COMMENT '科目名称' ,
  `subject_code` int(11) COMMENT '科目内码' ,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='科目定义';

DROP TABLE IF EXISTS  `test`;
CREATE TABLE `test` (
  `test_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_oid` bigint(20) NOT NULL COMMENT '内码，设置规则：yyyymmdd' ,
  `subject_id` bigint(20) NOT NULL ,
  `test_name` varchar(16)  COMMENT '考试名称',
  `test_from` datetime DEFAULT NULL COMMENT '考试开始时间' ,
  `test_to` datetime DEFAULT NULL COMMENT '考试完成时间' ,
  `test_year` int(4)  COMMENT '考试年度' ,
  `test_month` int(2)  DEFAULT '1' COMMENT '一年中月分数字(1-12)' ,
  `test_week` int(2)  DEFAULT '1' COMMENT '一年中的周数（取值范围1-54）' ,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='试卷信息定义';

DROP TABLE IF EXISTS  `paper_info`;
CREATE TABLE `paper_info` (
  `paper_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `taper_oid` bigint(20) COMMENT '内码，设置规则：test_oid+1位数字(1-9)' ,
  `paper_name` varchar(16) COMMENT '试卷名称',
  `paper_type` varchar(16) COMMENT '试卷类型',
  `full_score` float(5,2) COMMENT '试卷满分',
  `subjectivity_score` float(5,2) COMMENT '试卷满分',
  `objectivity_score` float(5,2) COMMENT '试卷满分',
  PRIMARY KEY (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='试卷信息定义';

DROP TABLE IF EXISTS  `paper_card`;
CREATE TABLE `paper_card` (
  `card_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `paper_id` bigint(20) COMMENT '关联到paper_info' ,
  `card_seq` int(2) COMMENT '答题卡图片顺序' ,
  `path` varchar(255) COMMENT '答题卡存储的相对路径',
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='试卷答题卡原图信息';


DROP TABLE IF EXISTS  `test_used_paper`;
CREATE TABLE `test_used_paper` (
  `tup_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `paper_id` bigint(20) NOT NULL ,
  `test_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT ='考试用卷';

DROP TABLE IF EXISTS  `paper_section_info`;
CREATE TABLE `paper_section_info` (
  `section_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `paper_id` bigint(20) NOT NULL ,
  `section_oid` bigint(20) NOT NULL COMMENT '内码，设置规则：paper_oid+2位数字(01-99)',
  `section_name` varchar(64) COMMENT '在试卷中大题的题干',
  `section_caption` varchar(64) COMMENT '评卷时显示文字',
  `max_pinci` varchar(64) COMMENT '最多评次,也就是最多只能进行的评卷次数',
  `left` int(4) COMMENT '在试卷扫描图片中相对左边位置，最小值0',
  `top` int(4)  COMMENT '在试卷扫描图片中相对上边位置，最小值0',
  `width` int(4)  COMMENT '在试卷扫描图片中相对宽度，最小值0',
  `height` int(4)  COMMENT '在试卷扫描图片中相对高度，最小值0',
  `full_score` float(5,2) COMMENT '大题满分，如20分，则为20.0',
  `maxerror` float(5,2) COMMENT '大题得分允许误差值，最大值不能超过full_score，如5分，则为5.0',
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='试卷大题定义';

DROP TABLE IF EXISTS  `paper_item_info`;
CREATE TABLE `paper_item_info` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `section_id` bigint(20) NOT NULL ,
  `item_oid` bigint(20) NOT NULL COMMENT '内码，设置规则：section_oid+3(001-999)位数字',
  `item_name` varchar(64) COMMENT '在试卷中小题的题干',
  `item_caption` varchar(64) COMMENT '评卷时显示文字',
  `left` int(4) COMMENT '在大题切割图片中相对左边位置，最小值0，最大值不能超过大题的width值',
  `top` int(4)  COMMENT '在大题切割图片中相对上边位置，最小值0，最大值不能超过大题的height值',
  `width` int(4)  COMMENT '在大题切割图片中相对宽度，最小值0，最大值不能超过大题的width值',
  `height` int(4)  COMMENT '在大题切割图片中相对高度，最小值0，最大值不能超过大题的height值',
  `full_score` float(5,2) COMMENT '小题满分，如5分，则为5.0',
  `validscoredot` varchar(255)  COMMENT '小题给分串,以,号分隔，如1,2,3,4,5',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='试卷小题定义';

DROP TABLE IF EXISTS  `properties_dict`;
CREATE TABLE `properties_dict` (
  `prodict_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prodict_catagory` varchar(32) COMMENT '分类标识，如试卷类型为papertype',
  `prodict_code` varchar(32) COMMENT '分类标识代码，如试卷类型 正卷A卷标识为A',
  `prodict_name` varchar(64) COMMENT '分类标识名称，如试卷类型 正卷A卷标识为A卷'  ,
  PRIMARY KEY (`prodict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='属性字典表,保存以键值对定义的业务数据';

DROP TABLE IF EXISTS  `teacher_info`;
CREATE TABLE `teacher_info` (
  `teacher_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL COMMENT '所评科目',
  `teacher_account` varchar(32) DEFAULT NULL COMMENT '评卷教师账号，与subject_code关系为： teacher_account=subject_code+(001-999)',
  `leader` int(4) DEFAULT NULL COMMENT '组长标识，0--组员，1--小组长',
  `teacher_name` varchar(32) DEFAULT NULL COMMENT '评卷教师姓名',
  `teacher_passord` varchar(32) DEFAULT NULL COMMENT '评卷教师密码,需要加密存储',
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1  DEFAULT CHARSET=utf8 COMMENT='评卷教师信息';

DROP TABLE IF EXISTS  `examinne`;
CREATE TABLE `examinne` (
  `examinne_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) COMMENT '',
  `examinne_name` varchar(32) COMMENT '考生姓名',
  `examinne_uuid` varchar(32) COMMENT '考生在本次考试中的唯一编码',
  PRIMARY KEY (`examinne_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='考生信息';

DROP TABLE IF EXISTS  `room`;
CREATE TABLE `room` (
  `room_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `district_id` bigint(20) COMMENT '',
  `room_number` int(8) COMMENT '考场编号',
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='考场信息';

DROP TABLE IF EXISTS  `district`;
CREATE TABLE `district` (
  `district_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` int(16) COMMENT '',
  `district_number` varchar(32) COMMENT '考区编号',
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='考区信息';