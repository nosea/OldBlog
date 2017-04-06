---
layout: post
title: "Linux命令ps"
date: 2013-05-08 14:11
comments: true
categories: Linux
toc: true
---
# Introduction
    ps - report a snapshot of the current processes
<!--more-->	
# Content
    1、ps aux 和 ps -aux的区别
	   ps -aux 中的x代表用户名，这个打印属于这个用户的所有进程
	   eg: ps -aunosea   # nosea 是我的用户名
	   如果后面跟一个不存在的用户名会报错:ERROR: User name does not exist.
	   如果使用x，且不存在名为x的用户，ps自动将命令解析为ps aux，并给个提示：
	   Warning: bad ps syntax, perhaps a bogus '-'? See http://procps.sf.net/faq.html
	2、默认，不带参数的ps只打印当前用户在当前terminal所调用的进程，并且只显示
	   PID   TTY   TIME   CMD
	3、标准打印风格是
	   UID        PID  PPID  C STIME TTY          TIME CMD
	   通常这些命令为：
	   ps -e
       ps -ef
       ps -eF
       ps -ely
	4、BSD 打印风格的是
	   USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
	   通常这些命令为：
	   ps ax
       ps axu
	5、打印进程树
	   ps -ejH  # standard syntax
	   ps axjf  # BSD syntax ---- 这种信息更多一点
	6、进程信息
	   ps -eLf  # 这个还好
	   ps axms  # 这个信息就太多了
	====================man 里还有更多的信息，不过目前用不到==================   
	7、常用
	   ps fx

# Reference
man
