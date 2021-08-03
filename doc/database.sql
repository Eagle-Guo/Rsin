CREATE TABLE `user_role` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `role_user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(4) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(120) NOT NULL,
  `country_code` varchar(8) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `enabled` BOOLEAN DEFAULT true,
  `expire_date` date DEFAULT NULL,
  `login_date` date DEFAULT NULL,
  `fail_count` int(11) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `reg_date` date,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  KEY `username` (`username`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

/*CREATE TABLE `company` (
  `id` int(11) NOT NULL auto_increment,
  `status` varchar(10) NOT NULL,
  `total_shareholder` int not null default 0,
  `shareholder_comfirm` int not null default 0,
  `created_date` DATETIME,
  PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;*/
CREATE TABLE `company` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `backup_name` varchar(255),
  `uen` varchar(255),
  `nominated_director` varchar(255),
  `secretary` varchar(255),
  `type` varchar(100),
  `total_stock_capital` float,
  `actual_stock_capital` float,
  `activity_one` varchar (255),
  `activity_two` varchar (255),
  `address` varchar(255),
  `step` varchar(10) NOT NULL,
  `total_shareholder` int not null default 0,
  `shareholder_comfirm` int not null default 0,
  `registration_date` DATETIME,
  `created_date` DATETIME,
  `lock_flag` BOOLEAN default false,
  `timeline_lock_flag` BOOLEAN default false,
  PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

/*CREATE TABLE `company_service` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(10) NOT NULL,
  `price` int not null default 0,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `company_service_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;*/

CREATE TABLE `company_service` (
  `id` int(11) NOT NULL auto_increment,
  `company_type` int default 0,
  `open_account` int default 0,
  `nominal_director` int default 0,
  `gst_tax` int default 0,
  `virtual_phone` int default 0,
  `forward_mail` int default 0,
  `accounting` int default 0,
  `urgent_registration` int default 0,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `company_service_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

/*CREATE TABLE `company_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `company_info_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;*/

CREATE TABLE `company_shareholder_info` (
  `id` int(11) NOT NULL auto_increment,
  `position_type` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(10),
  `nationality` varchar(100),
  `ic_type` varchar(10),
  `ic_number` varchar(50),
  `email` varchar(100),
  `contact_number` varchar(20),
  `issue_stock_amount` int,
  `actual_stock_amount` int,
  `value_per_stock` int,
  `address` varchar(100),
  `seq` int,
  `signature_name` varchar(200),
  `signature_path` varchar(200),
  `ip` varchar(100),
  `checksum` varchar(100),
  `status` BOOLEAN default true,
  `lock_flag` BOOLEAN default false,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `company_shareholder_info_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `company_othaccess` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) NOT NULL,
  `org_pass_t` varchar(255) NOT NULL,
  `pw_start_date` DATETIME,
  `pw_end_date` DATETIME,
  `response_flag` char(1) default 0,
  `fail_count` int (5) default 0,
  `shareholder_id` int(11),
  `created_date` DATETIME,
  PRIMARY KEY (`id`),
  CONSTRAINT `othaccess_company_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `othaccess_shareholder_fk` FOREIGN KEY (`shareholder_id`) REFERENCES `company_shareholder_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `industry` (
  `id` int(11) NOT NULL auto_increment,
  `ssic` varchar(10) NOT NULL,
  `name_cn` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `category` varchar(5) NOT NULL,
  `flag` int(1) NOT NULL default 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `document_type` (
  `document_type_code` varchar(15) NOT NULL,
  `document_type_desc` varchar(255) NOT NULL,
  `document_type_desc_cn` varchar(255),
  `created_date` DATETIME,
  PRIMARY KEY (`document_type_code`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_1','First Director Meeting Resolution', '', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_2','Secretary Agreement', '秘书协议', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_3','ANNEX B - Notice for Controllers', '', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_4','Application of Shares', '', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_5','Client Acceptance Form', '', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_6','Form 45 / 201', '', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_7','Share Certificate', '', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_8','Nominee+Dir+Authrn_Final', '', sysdate());

INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_9','Constitution of Company', '公司章程', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_10','Attached AML/CFT Report', '', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_11','Certificate of Incorporation', '公司注册证书', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_12','Risk Assessment', '风险评估', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_13','Risk Assessment Checklist', '风险评估清单', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_14','Company info', '公司信息', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_15','Register of Charges', '收费登记册', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_16','Register of Secretary', '秘书名册', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_17','Register of member', '', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_18','Register of director ', '', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_19','Register of Auditor', '', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_20','Register of Controllers', '', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_21','Register of Beneficial Owner', '', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_COM_0','Others', '其他文件', sysdate());
	
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_PER_1','IC Front', 'IC正面', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_PER_2','IC Back', 'IC背面', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_PER_3','Passport', '护照（有照片页）', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_PER_4','Chinese IC', '中国身份证', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_PER_5','Resident Proof', '住所证明', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_PER_6','Selfie With Passport', '持护照（打开有照片页）上半身照', sysdate());
INSERT INTO document_type (document_type_code, document_type_desc, document_type_desc_cn, created_date) value ('TYPE_PER_0','Others', '其他文件', sysdate());

CREATE TABLE `initiate_document` (
  `id` int(11) NOT NULL auto_increment,
  `document_type_code` varchar(15) NOT NULL,
  `category` char(1) NOT NULL,
  `display_sequence` int,
  `created_by` varchar(255) NOT NULL,
  `created_date` DATETIME,
  PRIMARY KEY (`id`),
  CONSTRAINT `initiate_document_type_fk` FOREIGN KEY (`document_type_code`) REFERENCES `document_type` (`document_type_code`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_9', 'C', 1, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_10', 'C', 2, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_11', 'C', 3, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_1', 'C', 4, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_12', 'C', 5, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_13', 'C', 6, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_2', 'C', 7, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_14', 'C', 8, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_15', 'C', 9, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_16', 'C', 10, 'admin', sysdate());

insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_3', 'P', 1, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_4', 'P', 2, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_5', 'P', 3, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_6', 'P', 4, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_7', 'P', 5, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_17', 'P', 6, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_18', 'P', 7, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_19', 'P', 8, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_20', 'P', 9, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_COM_21', 'P', 10, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_PER_1', 'P', 11, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_PER_2', 'P', 12, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_PER_3', 'P', 13, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_PER_4', 'P', 14, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_PER_5', 'P', 15, 'admin', sysdate());
insert into initiate_document (document_type_code, category, display_sequence, created_by, created_date) values ('TYPE_PER_6', 'P', 16, 'admin', sysdate());
/*
CREATE TABLE `dynamic_document` (
  `id` int(11) NOT NULL auto_increment,
  `document_type_code` varchar(15) NOT NULL,
  `user_id` varchar(100),
  `company_id` int(11) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_date` DATETIME,
  PRIMARY KEY (`id`),
  CONSTRAINT `document_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `document_type_fk` FOREIGN KEY (`document_type_code`) REFERENCES `document_type` (`document_type_code`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;
*/
CREATE TABLE `document` (
    `id` int(11) NOT NULL auto_increment,
    `document_type_code` varchar(11),
    `category` char(1) NOT NULL,
    `display_sequence` int,
    `document_desc` varchar(255),
    `document_desc_cn` varchar(255),
    `user_id` varchar(100), -- this is important to differentship different directors and shareholder
	`lock_flag` BOOLEAN default false,
    `company_id` int(11) NOT NULL,
    `created_by` varchar(255) NOT NULL,
    `created_date` DATETIME,
    PRIMARY KEY (`id`),
    CONSTRAINT `document_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
    CONSTRAINT `document_type_fk` FOREIGN KEY (`document_type_code`) REFERENCES `document_type` (`document_type_code`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_9', 'C', 1, 'Constitution of Company','公司章程', 'admin', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_10', 'C', 2, 'Attached AML/CFT Report','', 'admin', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_11', 'C', 3, 'Certificate of Incorporation','公司注册证书', 'admin', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_1', 'C', 4, 'First Director Meeting Resolution','', 'admin', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_12', 'C', 5, 'Risk Assessment','风险评估', 'admin', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_13', 'C', 6, 'Risk Assessment Checklist','风险评估清单', 'admin', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_2', 'C', 7, 'Secretary Agreement','秘书协议', 'admin', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_14', 'C', 8, 'Company info','公司信息', 'admin', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_15', 'C', 9, 'Register of Charges','收费登记册', 'admin', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date)  values ('TYPE_COM_16', 'C', 10, 'Register of Secretary','秘书名册', 'admin', 28, 'admin', sysdate());

insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_3', 'P', 1, 'ANNEX B - Notice for Controllers', '', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_4', 'P', 2, 'Application of Shares','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_5', 'P', 3, 'Client Acceptance Form','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_6', 'P', 4, 'Form 45 / 201','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_7', 'P', 5, 'Share Certificate','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_17', 'P', 6, 'Register of member','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_18', 'P', 7, 'Register of director ','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_19', 'P', 8, 'Register of Auditor','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_20', 'P', 9, 'Register of Controllers','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_COM_21', 'P', 10, 'Register of Beneficial Owner','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_PER_1', 'P', 11, 'IC正面','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_PER_2', 'P', 12, 'IC背面','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_PER_3', 'P', 13, '护照（有照片页）','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_PER_4', 'P', 14, '中国身份证','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_PER_5', 'P', 15, '持护照（打开有照片页）上半身照','', 'test2020122301@gmail.com', 28, 'admin', sysdate());
insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_PER_6', 'P', 16, '住所证明','', 'test2020122301@gmail.com', 28, 'admin', sysdate());

insert into document (document_type_code, category, display_sequence, document_desc, document_desc_cn, user_id, company_id, created_by, created_date) values ('TYPE_PER_0', 'P', 17, '其他文件','', 'test2020122301@gmail.com', 28, 'admin', sysdate());

CREATE TABLE `document_history` (
  `id` int(11) NOT NULL auto_increment,
  `document_path` varchar(255) NOT NULL,
  `document_name` varchar(255),
  `reference_no` varchar(100),
  `created_by` varchar(255) NOT NULL,
  `created_date` DATETIME,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `document_history_fk` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `signature_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_type` varchar(11) NOT NULL,
  `action_desc` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_date` DATETIME,
  PRIMARY KEY (`id`),
  CONSTRAINT `signature_log_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `step_code` (
  `id` int(11) NOT NULL,
  `step_desc` varchar(255) NOT NULL,
  `display_step` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

INSERT INTO step_code (id, step_desc, display_step) value (1,'选择服务', 1);
INSERT INTO step_code (id, step_desc, display_step) value (2,'信息填报', 2);
INSERT INTO step_code (id, step_desc, display_step) value (3,'在线支付', 3);
INSERT INTO step_code (id, step_desc, display_step) value (4,'电子签名', 4);
INSERT INTO step_code (id, step_desc, display_step) value (5,'上传资料', 5);
INSERT INTO step_code (id, step_desc, display_step) value (6,'注册受理中', 0);
INSERT INTO step_code (id, step_desc, display_step) value (7,'注册完成', 0);

CREATE TABLE `company_status_time` (
    `id` int(11) NOT NULL auto_increment,
    `services` DATETIME,
    `information` DATETIME,
    `payment` DATETIME,
    `payment_status` int(11),
    `signature` DATETIME,
    `signature_status` int(11),
    `uploadfile` DATETIME,
    `uploadfile_status` int(11),
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `company_status_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `status_code` (
  `id` int(11) NOT NULL,
  `status_desc` varchar(255) NOT NULL,
  `defunct_flag` char(1) default 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

INSERT INTO status_code (id, status_desc) value (1,'待处理');
INSERT INTO status_code (id, status_desc) value (2,'已完成');

CREATE TABLE `timeline` (
    `id` int(11) NOT NULL auto_increment,
    `service` varchar(20) NOT NULL,
    `registration_date` DATETIME,
    `period` int(11),
    `times` int(11),
    `start_date` DATETIME,
	`comment` varchar(100),
    `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `timeline_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `timeline_addition` (
    `id` int(11) NOT NULL auto_increment,
    `service_progress` varchar(255),
	`service_flag` BOOLEAN DEFAULT false,
    `channel` varchar(255),
	`channel_flag` BOOLEAN DEFAULT false,
    `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `timeline_addition_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

insert into timeline (service, registration, period, times, start_date, company_id) values ('年审','2021-01-29',12,2,null,'23');
insert into timeline (service, registration, period, times, start_date, company_id) values ('ECI申报','2021-01-29',12,2,null,'23');
insert into timeline (service, registration, period, times, start_date, company_id) values ('消费税申报','2021-01-29',12,2,null,'23');
insert into timeline (service, registration, period, times, start_date, company_id) values ('所得税报税','2021-01-29',12,2,null,'23');
insert into timeline (service, registration, period, times, start_date, company_id) values ('所得税缴税','2021-01-29',12,2,null,'23');

CREATE TABLE `timeline_detail` (
    `id` int(11) NOT NULL auto_increment,
    `estimate_date` DATETIME NOT NULL,
    `actual_date` DATETIME,
    `result` BOOLEAN DEFAULT false,
    `comment` varchar(255),
    `timeline_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `timeline_detail_id_fk` FOREIGN KEY (`timeline_id`) REFERENCES `timeline` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `pending_company` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) NOT NULL,
  `due_date` DATETIME,
  `comment` varchar(255),
  `created_date` DATETIME,
  PRIMARY KEY (`id`),
  CONSTRAINT `pending_company_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;