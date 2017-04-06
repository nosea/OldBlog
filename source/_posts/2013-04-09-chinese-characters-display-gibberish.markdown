---
layout: post
title: "Linux下中文乱码问题"
date: 2013-04-09 15:36
comments: true
categories: Linux
toc: true
---
# Introduction
    用cat, more, head等显示乱码的问题
<!--more-->	
# Content
    # 本着谨慎原则，建议不改变原文件
	# 先安装enca, 默认是没有安装的
	# 例如文档为data
	$ enca -L zh data.txt
	Simplified Chinese National Standard; GB2312
	  CRLF line terminators
	$ enca -L zh -x UTF-8 < data.txt > data-UTF-8.txt
	# 接下来就可以在data-UTF-8.txt上进行操作
	-----------------------------------
	$ enca -L zh -x UTF-8  data.txt # 这个是直接在源文件上改，不建议
# Reference	
[在linux下进行文本字符编码转换和断行格式转换](http://www.sysdb.org/2011/07/14/language-encoding-and-line-break.html)    
Thanks!

	  
