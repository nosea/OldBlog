---
layout: post
title: "cron配置"
date: 2013-03-27 20:16
comments: true
categories: Linux
toc: true
---
# Introduction
    cron详解
<!--more-->
# Content
## cron 开启、停止、重新启动
    1、Fedora, CentOS
	  # /etc/init.d/crond start
	  # /etc/init.d/crond stop
      # /etc/init.d/crond restart
	  如果要开机启动
	  # chkconfig --levels 35 crond on
	2、Ubuntu
	  是/etc/init.d/cron  start|stop|restart
	3、通用
	  # pgrep crond  注：判断crond 是否在运行；
	  # pkill crond  注：杀掉正在运行中的crond；
	  # pgrep crond  注：查看是否被杀掉了；
	  # /usr/sbin/crond  注：运行crond；
## 配置文件
    cron是一个服务器程序 - a daemon to execute scheduled commands
	CentOS, Ubuntu等的全局性配置文件在/etc/crontab
	每个用户都有自己的cron配置文件，可以通过crontab -e 来编辑
	在CentOS下
	$ cat /etc/crontab
	SHELL=/bin/bash
	PATH=/sbin:/bin:/usr/sbin:/usr/bin
	MAILTO=root
	HOME=/
	
	# For details see man 4 crontabs
	
	# Example of job definition:
	# .---------------- minute (0 - 59)
	# | .------------- hour (0 - 23)
	# | | .---------- day of month (1 - 31)
	# | | | .------- month (1 - 12) OR jan,feb,mar,apr ...
	# | | | | .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
	# | | | | |
	# * * * * * command to be executed
	
	对于全局性配置文件，需要root权限来更改，一般通过crontab -e来修改
	====================总的来说就是====================
	分 时 日 月 周 [用户名] 执行命令
	====================================================
	说明:
	分钟 -- 表示每小时的第几分钟来执行，范围是0-59
	小时 -- 表示每天的第几小时来执行，范围是0-23
	日期 -- 表示从每个月的第几天来执行，范围是1-31
	月份 -- 表示每年的第几个月来执行，范围是1-12
	周   -- 表示每周的第几天来执行，范围是0-6，0表示周日
	用户 -- 表示执行程序要通过哪个用户来执行，一般可省略
	命令 -- 执行的命令和参数
	
	修改了配置文件，为了让配置文件生效，需要重启cron，非root用户修改了，也要重启
## 特殊字符
    *(星号) 代表全部，即每天，每周，每小时等都要执行
    ,(逗号) 代表分隔时段
	-(减号) 代表一段时间范围
	/n      n是数字，代表每隔n单位个时间
## 命令
    $ crontab -e   # 编辑用户的cron配置文件
	$ crontab -l   # 查看当前用户的计划
    $ crontab -r   # 删除
## 说明
	每次执行完crontab -e后，都会在/var/spool/cron/里的tabs或者crontabs目录里生成一个与该用户同名的文件，
	文件的内容就是编辑的内容，这个文件不可以直接编辑，必须通过crontab -e来编辑。cron每过一分钟读一次
	这个文件，检查是否需要执行里面的命令。因此文件修改后不需要重新启动crond。
	除此之外，cron每分钟还要读一次/etc/crontab文件，这个文件是针对系统的，
## 注意
    1、每一条cron job执行后，系统会自动将输出以邮件的形式发给当前用户，可以通过mail命令查看
	   但是邮件占用存储空间，如果不需要输出的话，最好全部重定向输出： >/dev/null 2&1
	2、cron是无法识别当前的环境变量的，比如在login shell下调试是可以运行的，但是一放到cron下就运行失败
	   防止这个问题的出现可以有以下方法:
	   1) 所有可执行的文件都使用绝对路径
	   2) 在脚本里export
	      PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
## 例子
    # 每天晚上22:15 执行/usr/bin/下的update.sh
    15 22 * * * /usr/bin/update.sh 
	
	# 每个月的5号，10号，15号的晚上22:15执行/usr/bin/的update.sh
	15 22 5,10,15 * * /usr/bin/update.sh 
	
	# 每周三、周六晚上22:15执行/usr/bin/的update.sh
	15 22 * * 3,6 /usr/bin/update.sh
	
	# 每隔五分钟执行/usr/bin/的update.sh
	*/5 * * * * /usr/bin/update.sh  # */5 <=> 0-59/5
	
	# 每个月的4号和每周1到周3的早上11点
	0 11 4 * 1-3 command line
	
	晚上11点到早上7点之间，每隔一小时重启lighttpd
	* 23-7/1 * * * /usr/local/etc/rc.d/lighttpd restart
	
	
	The following lists an example of a user crontab file.
	
	# use /bin/bash to run commands, instead of the default /bin/sh
	SHELL=/bin/bash
	# mail any output to `paul', no matter whose crontab this is
	MAILTO=paul
	#
	# run five minutes after midnight, every day
	5 0 * * *       $HOME/bin/daily.job >> $HOME/tmp/out 2>&1
	# run at 2:15pm on the first of every month -- output mailed to paul
	15 14 1 * *     $HOME/bin/monthly
	# run at 10 pm on weekdays, annoy Joe
	0 22 * * 1-5    mail -s "It's 10pm" joe%Joe,%%Where are your kids?%
	23 0-23/2 * * * echo "run 23 minutes after midn, 2am, 4am ..., everyday"
	5 4 * * sun     echo "run at 5 after 4 every sunday"
	# Run on every second Saturday of the month
	0 4 8-14 * *    test $(date +%u) -eq 6 && echo "2nd Saturday"
	--> from man 5 crontab
	
	注:
	  当crontab运行shell脚本时，要由用户指定脚本的绝对路径，设置相应的环境变量.
# Reference
[计划任务工具 cron 的配置和说明](http://www.linuxsir.com/main/node/209)
