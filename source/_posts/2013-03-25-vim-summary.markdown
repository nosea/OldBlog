---
layout: post
title: "vim summary"
date: 2013-03-25 17:01
comments: true
categories: Linux
toc: true
---
# Introduction
    vim 备忘录
<!--more-->
# 常用命令
## 1.文件操作
    :w filename        保存文件,filename不指定就保存当前编辑文档
	:q                 退出
	:wq                保存退出
	:e filename        打开一个新文件, 可以使用tab键选择
	:q!                强制退出
	:E                 打开当前目录
## 2.移动
	k                  向上移动一个字符
    j                  向下移动一个字符
	l                  向右移动一个字符
	h                  向左移动一个字符
	e                  跳到单词尾
	A                  在行尾插入
	E                  以空格为分割,跳到尾部
	b                  跳到单词首
	B				   以空格为分割,跳到首部
	0                  跳到行首
    $                  跳到行尾
	H                  跳到当前屏幕的第一行
	M                  跳到当前屏幕的中间行
	L                  跳到当前屏幕的最后一行
	:n                 跳到指定行
## 3.编辑
	i                  光标之前插入
	I                  当前行开始处插入
	a                  光标之后插入
	A                  当前行末尾插入
	o                  在当前行之后新开一行然后插入
	O                  在当前行之上新开一行然后插入
	r                  替换
    R                  在insert模式下替换
    x                  删除光标后一个字符
	X                  删除光标前一个字符
	dd                 删除当前行
	dw                 删除一个word，直到下一个单词(即两个单词间的空格也要删除)
	de                 删除一个word
	d$                 删除从光标到行尾的内容
	v                  选择
	p                  粘贴
	yy                 复制当前行
	c                  剪切选择的部分
## 4.查找
	/str               查找str
	n                  显示下一个查找到的
	N                  显示上一个查找到的
## 5.替换
	:%/org_str/re_str/ 

# Reference
[The Vim commands cheat sheet-1.2](http://www.tuxfiles.org/linuxhelp/vimcheat.html)     
Thanks!
