---
layout: post
title: "Mysql Basic"
date: 2013-04-08 15:31
comments: true
categories: MySQL
toc: true
---
# Introduction
    MySQL 笔记
<!--more-->	
# Content
## 速览
    mysql> show databases; # 显示数据库
	mysql> create database temptest; # 创建数据库
	mysql> create database game default character set utf8 collate utf8_general_ci;
	mysql> use temptest; # 使用数据库
	mysql> drop database temptest; # 删除数据库
	mysql> show tables; # 有多少个表
	mysql> describe table_name; # 显示表结构
	mysql> select version(); # 显示MySQL版本
	mysql> select current_date, current_time; # 显示当前日期和时间
	mysql> insert into mysql.user(host,user,password)values("localhost","username",password("your passwd"));
	       # 如果要新建一个用户，可以不用insert，直接grant一个用户适合的权限，然后mysql.user表里会添加这个
		   # 用户，如果赋予权限有指定的数据库，那么这个数据库如果没有创建，这个user可以自己去创建
		  
	mysql> flush privileges; # 刷新
	mysql> grant all privileges on db_name.* to username@localhost identified by 'user_pass';
	       # 关键是"username@localhost" 要当成一个整体来看
	       # grant 与 on之间的是各种权限，如insert, select, update
		   # on 之后是数据库和表名
		   # @之后的ip是登录ip，这里设置的是localhost，那么只能通过本地登录		   
	mysql> grant all privileges on *.* to 'username'@'%' identified by 'user_pass';
	       # 这个就是任何ip都可以登录了
    # REVOKE privileges ON 数据库名[.表名] FROM user_name[@ip]
	mysql> revoke all privileges on *.* from username@xx;
	mysql> delete from user where user="username" and host="hostname";
	mysql> alter table 原表名 rename 要修改的表名; # 修改表名
	$ mysqldump -h localhost -u username -p dbname > dbbackup.sql # 备份数据库
	$ mysqldump -h localhost -u username -p dbname < dbbackup.sql # 恢复数据库，前提先建好数据库
## 远程访问
    1、查看3306端口状态
	$ netstat -an | grep 3306
	tcp        0      0 127.0.0.1:3306            0.0.0.0:*               LISTEN 
	# 3306只在127.0.0.1上可以访问
	2、修改/etc/mysql/my.cnf
	将"bind-address  = 127.0.0.1" 注释掉或者ip填成其他的ip，这里注释掉
	3、重启mysqld服务，再次查看
	$ netstat -an | grep 3306
	tcp        0      0 0.0.0.0:3306            0.0.0.0:*               LISTEN
## 使用
    1、连接服务器
    shell> mysql -h host -u user -p # host和user分别代表MySQL服务器运行的主机名和MySQL账户用户名
	Enter password: ********
	2、退出服务器
	mysql> QUIT   # <=> Ctrl+d 
	3、MySQL当前版本和当前日期
	mysql> SELECT VERSION(), CURRENT_DATE;   # 还有函数now()
	4、将mysql用作一个简单的计算器
	mysql> SELECT SIN(PI()/4), (4+1)*5;
	5、\c可以取消正在输入过程中的命令
	6、test数据库存在，尝试访问它
	mysql> USE test # USE，类似QUIT，不需要一个分号,当然，加了也没错
## 查询
    1、Unix时间戳和日期的相互转换
	  mysql> select now();
	  +---------------------+
	  | now()               |
	  +---------------------+
	  | 2013-04-22 14:52:04 |
	  +---------------------+
	  1 row in set (0.00 sec)
	  
	  日期转换为UNIX时间戳用函数： UNIX_TIMESTAMP()
	  mysql> SELECT UNIX_TIMESTAMP(NOW());
	  +-----------------------+
	  | UNIX_TIMESTAMP(NOW()) |
	  +-----------------------+
	  |            1366613937 |
	  +-----------------------+
	  1 row in set (0.00 sec)
	  
	  UNIX时间戳转换为日期用函数： FROM_UNIXTIME()
	  mysql> SELECT FROM_UNIXTIME(1366614028);
	  +---------------------------+
	  | FROM_UNIXTIME(1366614028) |
	  +---------------------------+
	  | 2013-04-22 15:00:28       |
	  +---------------------------+
	  1 row in set (0.00 sec)
	
## ERROR
    1、ERROR 1148 (42000): The used command is not allowed with this MySQL version
	   mysql -u user -p --local-infile your_database
# Reference
MySQL 5.1官方简体中文参考手册    
Thanks!
	
