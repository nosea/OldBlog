---
layout: post
title: "Linux下的压缩文件"
date: 2013-04-13 15:42
comments: true
categories: Linux
toc: true
---
# Introduction
    tar, unrar
<!--more-->	
# Content
## tar
    1.解压缩
	  tar xvf xxx.tar.gz  # 或者tar xvf xxx.tar
	2.打包+压缩
	  tar cvzf xxx.tar.gz   xxx   # xxx是要压缩的文件(夹), xxx.tar.gz是压缩后的文件名
	3.查看
	  tar tvf xxx.tar.gz
	4.解压部分文件
	  tar xvf xxx.tar.gz  xxx/xxxx  # xxx/file file要解压的文件,其必须为在压缩文件内的完整路径名
	5.如果要添加到压缩文件
	  tar rf xxx.tar   file  # 这个只能添加在打包的文件里，压缩的不行
## unrar
    unrar <e|l|p|t|v|x> xxx.rar [path]
	# 如果不指定path，那么就在当前文件夹解压
	unrar l xxx.rar   # 查看文件内容
	unrar e xxx.rar   # 解压到当前文件夹
	unrar x xxx.rar   # 按照压缩包里的完整路径解压  => 最常用
	unrar t xxx.rar   # Test file
## 7z, unzip
    7z e | unzip   xxx.zip
