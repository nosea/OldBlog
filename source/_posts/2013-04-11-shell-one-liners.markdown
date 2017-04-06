---
layout: post
title: "Shell One-liners"
date: 2013-04-11 15:52
comments: true
categories: Shell
toc: true
---
# Introduction
    单行脚本备忘
<!--more-->	
# Content
    1.统计一个文件的行数
	  $ wc -l < data
	  $ sed -n '$=' < data
	  $ awk 'END{print NR}' < data
	  $ grep -Fc "" data
	  NOTE: 若要查看性能，用time
		$ time wc -l < data
		4768600
		
		sys    0m0.141s
		user   0m0.100s
		real   0m0.036s
	2.显示wlan0的ip地址
	  $ ifconfig wlan0 | sed -n '/inet /{s/.*addr://;s/ .*//;p}'
	  $ ifconfig wlan0 | awk -v FS='[ :]' '/inet addr/{print $13}'
	  
	  
