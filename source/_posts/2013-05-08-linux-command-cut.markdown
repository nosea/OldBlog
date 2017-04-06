---
layout: post
title: "Linux命令之cut"
date: 2013-05-08 09:49
comments: true
categories: Linux
toc: true
---
# Introduction
    Print selected parts of lines from each FILE to standard output
<!--more-->	
# Content
    ===============example 1==============================
	$ cat data 
	a	b	c	d
	$ cut -f 1 data 
	a
	$ cut -f 2- data  
	b	c	d
	$ cut -f 2-3 data 
	b	c
	$ cut -f -3 data 
	a	b	c
	===============example 2==============================
	$ cut -f 1 data 
	thisisalongsentencesthatcontainsalongword
	a
	e f g h
	$ cut -d " " -f 1 data 
	thisisalongsentencesthatcontainsalongword
	a	b	c	d
	e
	$ cut -d " " -f 1-2 -s data 
	e f
	$ cut -d " " -f 1- --output-delimiter="**" data 
	thisisalongsentencesthatcontainsalongword
	a	b	c	d
	e**f**g**h
	$ cut -s -d " " -f 1- --output-delimiter="**" data 
	e**f**g**h
	
	## 这些就足够用了，其他的还是awk吧
	
# Reference
man
