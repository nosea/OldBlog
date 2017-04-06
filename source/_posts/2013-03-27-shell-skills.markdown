---
layout: post
title: "Shell Skills"
date: 2013-03-27 10:06
comments: true
categories: Shell
toc: true
---
# Introduction
    常用备忘录
<!--more-->
# Content
    1.清空一个文件
      cat /dev/null > file
    2.关于exit
      如果exit后没有跟任何参数，那么其退出值就是其之前执行命令的退出值
	3.关于UID
	  当前环境的UID保存在值$UID里，root的UID为0
	4.脚本中执行命令
	  `command_to_execute` 或者 $(command_to_execute)
    5.为什么当前脚本的执行要./scriptname 而不是直接scriptname?
	  处于安全原因，当前目录(./)默认不在$PATH变量里
	6.当输入密码时，不希望终端显示，可以这样子做
	  stty -echo  ## 隐藏终端打印
	  read xxxxx
	  stty echo  ## 显示终端打印
