/*DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS role_user;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS users;


CREATE TABLE employee (
  empId varchar(10) NOT NULL,
  empName varchar(100) NOT NULL
);

create table users (
    id int(11) not null primary key AUTO_INCREMENT,
    username varchar(50) not null UNIQUE,
    password varchar(120) not null,
    status varchar(50),
    enabled tinyint(1) default 1,
    expireDate date,
    loginDate date,
    fail_count int
);

create table roles (
	id int(11) not null primary key,
    role_name varchar(50) not null
);

create table role_user (
	id int(11) not null primary key,
	user_id int(11),
	role_id int(11),
    foreign key (user_id) references users (id),
    foreign key (role_id) references roles(id)
);

create table authorities (
    username varchar(50) not null,
    authority varchar(50) not null,
    foreign key (username) references users (username)
);

insert into roles value (1, 'USER');
insert into roles value (2, 'ADMIN');

-- insert into 
*/