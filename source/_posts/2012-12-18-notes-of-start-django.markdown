---
layout: post
title: "Django笔记 - 开始Django"
date: 2012-12-18 10:11
comments: true
categories: Django
---
一.到[官网](https://www.djangoproject.com/)下载最新稳定版,关于哪个版本好, 官网右侧有说明，安装    
Linux
``` bash
tar xzvf Django-1.4.3.tar.gz
cd Django-1.4.3
sudo python setup.py install
```
Windows
     If you're using Windows, start a command shell with administrator privileges 
	 and run the command python setup.py install
安装好后，检查下
``` bash
$ python
>>> import django
>>> django.VERSION
```
<!-- more -->
二.新建一个项目
    1.在想要新建项目的地方运行命令
	  django-admin.py startproject project_name
	  $ django-admin.py startproject mydjsite
	  $ ls
	  manage.py  mydjsite 
	  mydjsite目录里包含
	  __init__.py  __init__.pyc  settings.py  settings.pyc  urls.py  urls.pyc  wsgi.py  wsgi.pyc文件
	  关于这些文件:
	  *  __init__.py ：让 Python 把该目录当成一个开发包 (即一组模块)所需的文件。
	  *  manage.py ：一种命令行工具，可让你以多种方式与该 Django 项目进行交互。
	  *  settings.py ：该 Django 项目的设置或配置。
	  *  urls.py ：该 Django 项目的 URL 声明，即 Django 所支撑站点的内容列表
	2.开发服务器 - 调试的话，默认即可
	   $ python manage.py runserver   
	   如要更改主机或端口
	   $ python manage.py runserver 8080   # 默认是8000
	   改变服务器监听的 IP 地址。要和其他开发人员共享同一开发站点的话，该功能特别有用
	   # 下面会让 Django 监听所有网络接口，因此也就让其它电脑可连接到开发服务器了
	   $ python manage.py runserver 0.0.0.0:8080   
	   

学习书籍:    
   [The Django Book](http://djangobook.py3k.cn/)
