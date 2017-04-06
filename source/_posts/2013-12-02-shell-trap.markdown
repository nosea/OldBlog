---
layout: post
title: "shell trap"
date: 2013-12-02 22:35
comments: true
categories: GAOE
toc: true
---
# Introduction
    有些错误犯一次就够了
<!--more-->
# Content
    1、删除文件
	  rules: 
	    文件 -- 带绝对路径删除，直接rm就行，不要添加-rf参数
		文件夹 —— 先检测文件夹是否存在，再删除
		
	  eg:
	  =============Wrong================
	  cd ~/dir1/dir2/
	  rm -rf *  ## 如果dir1或者dir2不存在，会把当前用户home目录的文件全部删除
	  ==================================
	  
	  =============Correct=============
	  rm /home/xxx/dir1/dir2/*   # 直接如果没有文件
	  
	  if [ -d '/home/xxx/dir1' ]; then
	      rm -r /home/xxx/dir1/dir2
      fi
	  =================================
    2、执行脚本
	  rules: 用绝对路径执行，别"./"，脚本也是绝对路径
	  /bin/bash /xx/xxx/xx/a.sh
	   
	  
