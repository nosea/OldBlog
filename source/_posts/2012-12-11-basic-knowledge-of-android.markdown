---
layout: post
title: "Android的一些基本概念"
date: 2012-12-11 13:27
comments: true
categories: Android
---
一.Android的体系架构 from: [App Framework](http://developer.android.com/about/versions/index.html)    
{% img /image_tag/system-architecture.jpg %}    
<!-- more -->

二.四个很重要的组件
    1.Activity
	    可以看成容器，构造应用程序界面，里面可以放置各种控件。
	2.Intent
	    在Activity之间或者应用程序之间传输数据
	3.Service
	    提供服务，在后台运行，不可见。
	4.Content Provider
	    为应用程序提供数据
三.关于在Eclipse下建立工程后的几个目录和文件
    1.src:放置源代码
	2.gen:ADT插件自动生成,DO NOT MODIFY.
	3.assets和res目录都可以放资源,但放置在res里,会在gen目录里的R.java自动生成ID.
	  可以通过id来引用相应的文件.
	4.res目录:
	    drawable:分别是高分辨率,低分辨率,中分辨率.
		layout:放置布局文件.
		       每一个Activity都对应有一个xml布局文件,控制Activity控件布局及其属性.
		values:放置一些应用程序所需要的值.
    5.AndroidManifest.xml:整个应用程序的配置文件
	    1.留意根标签的package(包名).
		2.application标签的icon和label.
		3.activity标签里的intent-filter.
		    哪一个activity拥有intent-filter，应用程序启动时，就先启用哪一个activity.
		
