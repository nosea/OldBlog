---
layout: post
title: "MySQL Skills"
date: 2013-12-08 11:02
comments: true
categories: MySQL
toc: true
---
# Introduction
    纯记录
<!--more-->	
# Content
    1、对一个网段赋权限
	  grant all privileges on testdb.* to 'testuser'@'192.168.1.%'  identified by 'test123';
