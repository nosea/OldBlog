---
layout: post
title: "mysql statistical analysis exercise"
date: 2013-04-17 10:26
comments: true
categories: MySQL
toc: true
---
# Introduction
    MySQL查询练习题
<!--more-->	
# Content
## 第一题
    I:环境准备
      $ mysql -h localhost -u root -p
	  		
	  mysql> CREATE DATABASE learn DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
	  Query OK, 1 row affected (0.00 sec)
	
	  mysql> grant all privileges on learn.* to 'tiger'@'localhost' 
	      -> identified by '123456' with grant option;
	  Query OK, 0 rows affected (0.00 sec)
	
	  mysql> select * from mysql.user \G;
	
	  mysql> flush privileges;
	  Query OK, 0 rows affected (0.00 sec)
	
	  $ mysql -u tiger -p
	
	  mysql> show databases;
	  +--------------------+
	  | Database           |
	  +--------------------+
	  | information_schema |
	  | learn              |
	  | test               |
	  +--------------------+
	  3 rows in set (0.00 sec)
	
	  mysql> use learn;
	  Database changed
	  mysql> show tables;
	  Empty set (0.00 sec)
	
	  mysql> create table event(
	      -> event_time date,
	      -> type int(11),
	  	-> uid int(11),
	  	-> score int(11));
	  Query OK, 0 rows affected (0.19 sec)
	
	  mysql> show tables;
	  +-----------------+
	  | Tables_in_learn |
	  +-----------------+
	  | event           |
	  +-----------------+
	  1 row in set (0.01 sec)
	
	  mysql> load data local infile 'data1.txt' into table event;
	  ERROR 1148 (42000): The used command is not allowed with this MySQL version
	
	  $ mysql -u tiger -p --local-infile=1
	
	  mysql> load data local infile 'data1.txt' into table event;
	  Query OK, 30 rows affected (0.08 sec)
	  Records: 30  Deleted: 0  Skipped: 0  Warnings: 0
	
	  mysql> select * from event limit 3;
	  +------------+------+------+-------+
	  | event_time | type | uid  | score |
	  +------------+------+------+-------+
	  | 2013-04-01 |    1 | 2344 |    34 |
	  | 2013-04-02 |    2 | 2122 |    21 |
	  | 2013-04-03 |    3 | 6744 |     9 |
	  +------------+------+------+-------+
	  3 rows in set (0.00 sec)
	
	  mysql> create table work(test_time date, test_type int(11), uid int(11));
	  Query OK, 0 rows affected (0.16 sec)

	  mysql> load data local infile 'data2.txt' into table work;
	  Query OK, 35 rows affected (0.08 sec)
	  Records: 35  Deleted: 0  Skipped: 0  Warnings: 0

	  mysql> select * from work limit 3;
	  +------------+-----------+------+
	  | test_time  | test_type | uid  |
	  +------------+-----------+------+
	  | 2013-04-01 |        12 | 2344 |
	  | 2014-04-01 |        13 | 2122 |
	  | 2014-04-02 |        14 | 6744 |
	  +------------+-----------+------+
	  3 rows in set (0.00 sec)
      
	   
    II:说明
	  event表里存放事件发生时间， 发生的种类，user的id，以及user的分数
	  work表里存放测试时间，测试类型的编号，user的id
	  题目: 
	    1.在event表里找出4月4号到4月29号的user，统计他们发生event的次数以及总的分数(score),和
		socre的最大值
		
		mysql> select uid as '用户', count(*) as '事件发生次数',
		    -> sum(score) as '总成绩', max(score) as '最高分'
		    -> from event where event_time >= '2013-04-04' &&
		    -> event_time <= '2013-04-29' group by uid;
		+--------+--------------------+-----------+-----------+
		| 用户   | 事件发生次数       | 总成绩    | 最高分    |
		+--------+--------------------+-----------+-----------+
		|   2122 |                  3 |        44 |        23 |
		|   2123 |                  1 |        23 |        23 |
		|   2134 |                  1 |        45 |        45 |
		|   2189 |                  2 |       159 |        87 |
		|   2342 |                  1 |        24 |        24 |
		|   2344 |                  5 |        84 |        34 |
		|   3111 |                  1 |        23 |        23 |
		|   3211 |                  2 |       281 |       272 |
		|   3232 |                  1 |        76 |        76 |
		|   3412 |                  1 |        21 |        21 |
		|   3444 |                  1 |        32 |        32 |
		|   4522 |                  3 |        75 |        45 |
		|   5422 |                  1 |        65 |        65 |
		|   6522 |                  1 |        76 |        76 |
		|   6744 |                  2 |        24 |        22 |
		+--------+--------------------+-----------+-----------+
		15 rows in set (0.00 sec)
	
      2.在event表里找出4月4号到4月29号的user，统计他们发生event的次数以及总的分数(score),和
		socre的最大值，以及这个user在work表里这段时间参加test为11，12的次数
		
		
		mysql> select event.uid as '用户', count(*) as '事件发生次数', 
		    -> sum(event.score) as '总成绩', max(event.score) as '最高分', 
			-> count(case when  work.test_type = 11 then 1 else NULL end) as 'TEST11次数', 
			-> count(case when work.test_type = 12 then 1 else NULL end) as 'TEST12次数'  
			-> from event left join work on event.uid = work.uid where 
			-> event.event_time >= '2013-04-04' && event.event_time <= '2013-04-29' 
			-> group by event.uid;
		+--------+--------------------+-----------+-----------+--------------+--------------+
		| 用户   | 事件发生次数       | 总成绩    | 最高分    | TEST11次数   | TEST12次数   |
		+--------+--------------------+-----------+-----------+--------------+--------------+
		|   2122 |                  9 |       132 |        23 |            0 |            0 |
		|   2123 |                  1 |        23 |        23 |            0 |            1 |
		|   2134 |                  1 |        45 |        45 |            0 |            1 |
		|   2189 |                  4 |       318 |        87 |            0 |            2 |
		|   2342 |                  1 |        24 |        24 |            0 |            1 |
		|   2344 |                 25 |       420 |        34 |            5 |            5 |
		|   3111 |                  1 |        23 |        23 |            0 |            0 |
		|   3211 |                  2 |       281 |       272 |            0 |            0 |
		|   3232 |                  1 |        76 |        76 |            0 |            0 |
		|   3412 |                  1 |        21 |        21 |            0 |            0 |
		|   3444 |                  1 |        32 |        32 |            0 |            0 |
		|   4522 |                  9 |       225 |        45 |            0 |            3 |
		|   5422 |                  1 |        65 |        65 |            0 |            0 |
		|   6522 |                  1 |        76 |        76 |            0 |            1 |
		|   6744 |                  4 |        48 |        22 |            0 |            0 |
		+--------+--------------------+-----------+-----------+--------------+--------------+
		15 rows in set (0.00 sec)
## 第一题数据
	#===========data2.txt========   	===============data1.txt=========
	2013-04-01      12      2344   |	2013-04-01      1       2344    34
	2014-04-01      13      2122   |	2013-04-02      2       2122    21
	2014-04-02      14      6744   |	2013-04-03      3       6744    09
	2014-04-02      14      2344   |	2013-04-04      2       2344    11
	2014-04-03      15      3214   |	2013-04-05      2       3211    9
	2014-04-03      12      2384   |	2013-04-06      3       2344    7
	2014-04-03      15      6744   |	2013-04-07      2       6744    2
	2014-04-06      16      2142   |	2013-04-08      1       2122    4
	2014-04-09      18      2344   |	2013-04-09      4       2344    10
	2014-04-11      15      4522   |	2013-04-10      5       4522    12
	2014-04-11      13      2122   |	2013-04-11      1       2122    17
	2014-04-14      12      4522   |	2013-04-12      3       4522    18
	2014-04-15      11      2344   |	2013-04-13      2       2344    34
	2014-04-18      12      6774   |	2013-04-14      1       6744    22
	2014-04-18      12      2189   |	2013-04-15      5       2189    87
	2014-04-19      14      5422   |	2013-04-16      3       5422    65
	2014-04-19      16      4522   |	2013-04-17      4       4522    45
	2014-04-22      17      2189   |	2013-04-18      1       2189    72
	2014-04-24      13      3211   |	2013-04-19      2       3211    272
	2014-04-24      12      2134   |	2013-04-20      3       2134    45
	2014-04-25      16      2344   |	2013-04-21      8       2344    22
	2014-04-25      18      3111   |	2013-04-22      9       3111    23
	2014-04-28      15      3432   |	2013-04-23      6       3232    76
	2014-04-28      13      3412   |	2013-04-24      1       3412    21
	2014-04-29      12      2123   |	2013-04-25      4       2123    23
	2014-04-30      14      2122   |	2013-04-26      5       2122    23
	2014-04-30      12      6522   |	2013-04-27      6       6522    76
	2014-04-30      16      2242   |	2013-04-28      3       2342    24
	2014-04-30      17      3444   |	2013-04-29      5       3444    32
	2014-05-01      12      2342   |	2013-04-30      2       2342    23
	2014-05-02      14      4834   |
	2014-05-02      18      8379   |
	2014-05-03      13      8373   |
	2014-05-04      19      2277   |
	2014-05-04      16      8631   |

	
	
	
	
