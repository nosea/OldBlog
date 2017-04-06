---
layout: post
title: "Django笔记-视图和URL配置"
date: 2012-12-18 15:22
comments: true
categories: Django
---
一.基础知识
    1.什么是视图(view)
	  I.视图(函数)：接受一个Web请求并返回Web响应的Python函数。
	    该响应可以是一份网页的HTML内容、一次重定向、一条404错误、一份XML文档、
	    一幅图片，或其他任何东西。
	  II.每个视图函数都以一个 HttpRequest 对象为第一个参数，该参数通常命名为 request
	  III.每个视图函数都负责返回一个 HttpResponse 对象(也有例外)
    2.将URL映射到视图
	  URLconf像是Django所支撑网站的目录，本质是URL模式以及要为该URL模式调用
	  的视图函数的映射表。即告诉Django，对于某个URL调用哪个视图函数。
	3.修改生成项目目录下的urls.py文件，添加URL和视图的映射。
	  I.里面调用patterns()函数将返回结果保存到urlpatterns变量中，Django从目录下
	    的settings.py中得到这个结果。
    4.添加URLpattern - 这是一个Python元组，第一个元素是url(在书里是简单的正则
	  表达式)，第二个元素是为该模式应用的视图函数。
<!-- more -->
二.Tips
    1.使用HttpResponse类
	  from django.http import HttpResponse
	2.Python标准库的datetime 模块 
	  含几个处理日期和时间的函数（functions）和类(classes)，其中就包括返回当前时间的函数。
	  datetime.datetime.now()  -  得到当前时间
	3.若要从URL中取得数据然后当作参数传递给view函数，用圆括号把参数在URL模式里标识出来
	4.所有的Django项目在创建后都是在调试模式下的
	5.关于常用的正则表达式
	  符号                 匹配
	  .(dot)               任意字符
	  \d                   任意数字
	  [A-Z]                任意字符，A-Z(大写)
	  [a-z]                任意字符，a-z(小写)
	  [A-Za-z]             任意字符，a-z(不区分大小写)
	  +                    匹配一个或更多(例如，\d+ 匹配一个或多个数字字符)
	  [^/]+                不是/的任意字符
	  *                    匹配0个或更多(例如，\d*匹配0个或更多数字字符)
	  {1,3}                匹配1个到3个(包含)
	  $                    行尾
	  ^                    行首
	  
学习书籍：
   [The Django Book](http://djangobook.py3k.cn/)
