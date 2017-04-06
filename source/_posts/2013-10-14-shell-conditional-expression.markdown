---
layout: post
title: "shell 条件表达式"
date: 2013-10-14 22:40
comments: true
categories: Shell
toc: true
---
# Introduction
    Shell条件测试
<!--more-->
# 说明
    常用的测试主要有文件状态测试、字符串测试、数值测试
## 测试表达式
	## 使用"if" + "[]"
    if [ -f /etc/rc.local ]; then
		echo "OK"
	fi
	## 使用"if" + "test"命令
	if test -f /etc/rc.local; then
		echo "OK"
	fi
	## 使用"[]" + "&&"
	[ -f /etc/rc.local ] && echo "OK"
## 逻辑表达式
    ## 测试连接
	-a : 逻辑与
	-o : 逻辑或
	!  : 逻辑非
	## 外部连接
	&& : 逻辑与
	|| : 逻辑或
	eg:
	  [ -z ${MSG} -a -z ${USER} ] && echo "OK"	
## 文件状态
    -b FILE
        文件存在，并且是块文件，返回True
	-c FILE
	    文件存在，并且是字符文件，返回True
	-d FILE
	    文件存在，并且是目，返回True录
	-e FILE
	    文件存在，返回True
	-f FILE
	    文件存在，并且是普通文件，返回True
	-g FILE
	    文件存在，并且是set-group-ID，返回True
	-G FILE
	    文件存在，并且属于有效组ID，返回True
	-h FILE
	    文件存在，并且是软链接(Symbolic Links)，等于-L，返回True
	-k FILE
	    文件存在，并且设置了粘住位，返回True
	-L FILE
	    同-h
	-O FILE
	    文件存在，并且属于有效用户ID，返回True
	-p FILE
	    文件存在，并且是命名管道，返回True
	-r FILE
	    文件存在，并且赋予了读权限，返回True
	-s FILE
	    文件存在，并且文件大小大于0，返回True
	-S FILE
	    文件存在，并且是socket文件，返回True
	-t FD
	    文件描述符在终端中打开，返回True
	-u FILE
	    文件存在，并且set-user-ID位被设置了，返回True
	-w FILE
	    文件存在，并且赋予了写权限，返回True
	-x FILE
	    文件存在，并且赋予了执行(搜索)权限，返回True
	FILE1 -nt FILE2
	    FILE1比FILE2新(根据最新修改时间)，或者FILE1存在，但是FILE2不存在，返回True
	FILE1 -ot FILE2
	    FILE1比FILE2旧，或者FILE2存在而FILE1不存在，返回True
	FILE1 -ef FILE2
	    FILE1和FILE2引用同一个设备或者同一个inode数字，返回True
## 字符串测试		
    -z string
	    字符串的长度为0，返回True
	-n string
	    字符串的长度不为0，返回True
	string1 == string2
	    字符串相等，返回True
	string1 != string2
	    字符串不相等，返回True
	string1 < string2
	    这个比较按照通用字符串比较
	string1 > string2
	    同上
## 数字测试
    arg1 OP arg2  ##arg1和arg2可以是正负数
	  OP:
	    -eq ## 相等
		-ne ## 不相等
		-lt ## 小于
		-le ## 小于等于
		-gt ## 大于
		-ge ## 大于等于
		
