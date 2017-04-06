---
layout: post
title: "Linux命令vmstat"
date: 2013-11-10 10:38
comments: true
categories: Linux
toc: true
---
# Introduction
    vmstat上报关于进程、内存、内存分页、阻塞IO、traps、CPU活动信息
<!--more-->	
# 说明
    不带参数直接运行默认显示如下
	==============================================================
	procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
	r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
	1  0      0 2591380  98044 645864    0    0    35    14  221  391  4  1 94  1
	==============================================================	
    procs:
	  r —— 正在等待运行的进程数量
	  b —— 进程处在不可中断睡眠状态的数量
	memory:
	  swpd —— 虚拟内存使用总量
	  free —— 空闲内存总量
	  buff —— 内存用作buffer的总量
	  cache —— 内存用作cache的总量
	  +++++++下面的用-a选项可以显示++++++
	  inact —— 非活动内存总量
	  active —— 活动内存总量
	swap:
	  si —— 每秒从交换分区写入内存的总量
	  so —— 每秒从内存写入交换分区的总量
    io:
	  bi —— 块设备每秒接收块的总量
	  bo —— 块设备每秒发送块的总量
	system:
	  in —— 每秒的中断数量，包括时钟中断
	  cs —— 每秒的上下文切换数量
	CPU:
	  us —— 用户CPU时间占比(include nice time)
	  sy —— 系统CPU时间占比
	  id —— 空闲CPU时间占比
	  wa —— IO阻塞CPU时间占比
	  st —— 虚拟机CPU时间占比
