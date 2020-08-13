CREATE TABLE `role_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `role_user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  KEY `username` (`username`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `users` (
	  `id` int(11) NOT NULL,
	  `first_name` varchar(50) DEFAULT NULL,
	  `last_name` varchar(50) DEFAULT NULL,
	  `email` varchar(50) DEFAULT NULL,
	  `password` varchar(120) NOT NULL,
	  `status` varchar(50) DEFAULT NULL,
	  `enabled` tinyint(1) DEFAULT '1',
	  `expire_date` date DEFAULT NULL,
	  `login_date` date DEFAULT NULL,
	  `fail_count` int(11) DEFAULT NULL,
	  `country` varchar(50) DEFAULT NULL,
	  `province` varchar(50) DEFAULT NULL,
	  `city` varchar(50) DEFAULT NULL,
	  `postal_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARACTER SET = utf8;

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  KEY `username` (`username`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `company` (
  `id` int(11) NOT NULL auto_increment,
  `status` varchar(10) NOT NULL,
  `total_shareholder` int not null default 0,
  `shareholder_comfirm` int not null default 0,
  `created_date` DATETIME,
  PRIMARY KEY (`id`)  
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `company_service` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(10) NOT NULL,
  `price` int not null default 0,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `company_service_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `company_info` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `company_info_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE `company_shareholder_info` (
   `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
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