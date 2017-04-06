---
layout: post
title: "修复win7的引导"
date: 2015-01-25 14:47
comments: true
categories: Windows
toc: true
---
# Introduction
    案例：装有双系统(win7 和 Linux)，其中引导由linux得grub引导，且win7和linux的引导
	分别在不同的磁盘分区，如果删除了Linux， 如何修复win7的mbr引导
<!-- more -->
# Content
    正常情况下:
	1、制作一个win7的启动U盘，或者PE也行，进入修复界面，启动cmd窗口
	bootrec /fixmbr     //执行这个即可修复
	
	2、如果还是不行，比如出现了"找不到元素", 执行下面的命令
	Diskpart
	LIST DISK
	SELECT DISK (followed by the number of the disk . most likely 0)
	LIST PARTITION
	SELECT PARTITION (followed by your partition number. most likely 0)
	ACTIVE
	EXIT
	
	Windows startup recovery should now work.
	
# Reference
[bootmgr not found. bootrec /rebuildbcd and /fixboot give 'Element not found" error](https://social.technet.microsoft.com/Forums/zh-CN/7791044e-db7f-4144-a96c-945299811f58/bootmgr-not-found-bootrec-rebuildbcd-and-fixboot-give-element-not-found-error)
