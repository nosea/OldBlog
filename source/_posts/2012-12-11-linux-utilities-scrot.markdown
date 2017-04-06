---
layout: post
title: "Linux 实用工具 - scrot"
date: 2012-12-11 18:37
comments: true
categories: Linux
---
屏幕截图工具    
一.安装
    Ubuntu: sudo apt-get install scrot
	Fedora: yum install scrot  #有点久没用了，一般情况是这样子
	自己编译: 到这个网址下载-->http://linuxbrit.co.uk/downloads/
<!-- more -->
二.使用
    scrot [options] [file]
    -c, --count
	     配合-d选项使用，用来显示倒计时
    -d, --delay NUM
	     延时NUM 秒抓取图像
	-e, --exec APP
	     由APP对抓取的图像进行操作
	-q, --quality NUM
	     更改抓取图像质量. NUM取值范围(1-100), 值越高质量越好. 
		 默认值：75
	-s, --select
	     用鼠标选择一个窗口
三.范例
    scrot a.png  #截下整个屏幕
	scrot -s a.png #自己选择范围
	
Reference:[scrot 从入门到精通](http://linuxtoy.org/archives/mastering-scrot.html)    
   Thanks!
   
