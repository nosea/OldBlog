---
layout: post
title: "Ubuntu Error Log"
date: 2012-12-28 13:45
comments: true
categories: Ubuntu
toc: true
---
# error list
## 1. E: Unable to locate package xxxxxx
``` bash 
# version: 12.04
# lang: en
sudo apt-get install phpmyadmin 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
E: Unable to locate package phpmyadmin
```
<!-- more -->
    分析:
	    1.如果修改了source.list还没有update，请update后再install
		2.你要安装的软件是属于社区维护的开源软件(universe)和有版权和合法性问题的软件(multiverse)
		  而source.list这两者的状态是restricted，修改其状态即可.
``` bash 这里我用的是电子科大ubuntu的源
deb http://ubuntu.dormforce.net/ubuntu/ precise main restricted universe multiverse
deb http://ubuntu.dormforce.net/ubuntu/ precise-backports main restricted universe multiverse
deb http://ubuntu.dormforce.net/ubuntu/ precise-proposed main restricted universe multiverse
deb http://ubuntu.dormforce.net/ubuntu/ precise-security main restricted universe multiverse
deb http://ubuntu.dormforce.net/ubuntu/ precise-updates main restricted universe multiverse
deb-src http://ubuntu.dormforce.net/ubuntu/ precise main restricted universe multiverse
deb-src http://ubuntu.dormforce.net/ubuntu/ precise-backports main restricted universe multiverse
deb-src http://ubuntu.dormforce.net/ubuntu/ precise-proposed main restricted universe multiverse
deb-src http://ubuntu.dormforce.net/ubuntu/ precise-security main restricted universe multiverse
deb-src http://ubuntu.dormforce.net/ubuntu/ precise-updates main restricted universe multiverse
```
    说明:
	    1.如上，默认universe和multiverse被限制
		2.如要启用universe，每行像如下修改 eg：
		 deb http://ubuntu.dormforce.net/ubuntu/ precise main universe restricted multiverse
		3.若都要启用
		 deb http://ubuntu.dormforce.net/ubuntu/ precise main universe multiverse
