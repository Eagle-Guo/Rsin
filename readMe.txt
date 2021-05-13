ssh -i "rsin.pem" ec2-user@ec2-13-212-176-13.ap-southeast-1.compute.amazonaws.com

scp -i "rsin.pem" target\\rsin-company-project-1.0.0.war ec2-user@ec2-13-212-176-13.ap-southeast-1.compute.amazonaws.com:~/rsin-company-project-1.0.0.war


mysql -h database-1.cteq9chmtyma.ap-southeast-1.rds.amazonaws.com -P 3306 -u admin -padministrator

CREATE USER 'huanping'@'localhost' IDENTIFIED BY 'guohuanping';
mysql -h database-1.cteq9chmtyma.ap-southeast-1.rds.amazonaws.com -P 3306 -u huanping -pguohuanping
ALTER USER 'huanping'@'database-1.cteq9chmtyma.ap-southeast-1.rds.amazonaws.com' IDENTIFIED WITH mysql_native_password BY 'guohuanping';
