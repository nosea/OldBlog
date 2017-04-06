---
layout: post
title: "Use Of SecureCRT"
date: 2013-04-14 12:07
comments: true
categories: Linux
toc: true
---
# Introduction
     SecureCRT， sz, rz
<!--more-->	 
# Content
## 上传和下载文件
    1、菜单--Options--Session Options--X/Y/Zmodem
	   Directories
	   Upload:    --->  此处设置上传文件夹目录
	   Download:  --->  此处设置下载存放目录
	2、下载文件
	   sz filename   # 完了之后，在Download目录就可以看到了
	   sz -qye  # 常用
	3、上传文件
	   rz   # 弹框选择文件即可
	   为了防止乱码和以外中断
	   rz -qye 
	   rz -be # 常用
## 颜色配置
    1、options -> session options -> emulation 
	   terminal选择linux 并且 ansi color 打上勾
	2、options -> global option -> appearance ANSI COLOR
	   1) Bold colors
	      修改第五个蓝色为(RGB): 114, 159, 207
	   2) Normal colors
	      修改第一个黑色为(RGB): 48, 10, 36 --> 这个是背景颜色，可选修改
## 防止自动掉线
    Options —> Global Options —> General —> Default Session
	Edit Default Settings —> Terminal —> Anti-idle
	选中Send protocol NO-OP 时间120s或者更长
	或者
	options -> session options -> Terminal -> Anti-idle
	选中Send protocol NO-OP 

## 使用整个屏幕
    options -> global options -> Terminal -> appearance 
	设置 maximuml columns  设置成180
	
## BackSpace正常使用	
    Session Options -> Terminal -> Emulation -> Mapped Keys
	Other mappings: 勾选 "Backspace sends delete"
## 标签显示主机IP
    Session Options -> Terminal -> Emulation
	terminal 选择Xterm
## 双击克隆
    global session --> Terminal --> Tabs
	Options --> Double-click action  选择Clone Tab
## 右键复制
    Global session --> Terminal
	Mouse -->:
	选中：Copy on select
	选中: Paste on right button
