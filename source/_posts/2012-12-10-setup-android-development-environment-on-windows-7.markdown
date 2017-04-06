---
layout: post
title: "在win7上搭建Android开发环境"
date: 2012-12-10 22:13
comments: true
categories: Android
---
一.System Requirements, 来[自官方文档](http://developer.android.com/sdk/index.html)   
    *Eclipse IDE
        *Eclipse 3.6.2 (Helios) or greater
        *Note: Eclipse 3.5 (Galileo) is no longer supported with the latest version of ADT.
    *Eclipse JDT plugin (included in most Eclipse IDE packages)
    *JDK 6 (JRE alone is not sufficient)
    *Android Development Tools plugin (recommended)
    *Not compatible with GNU Compiler for Java (gcj)
<!-- more -->
二.安装Java SDK   
   1.下载[Java SDK](http://java.sun.com/), 找到最近更新JDK 6即可.   
   2.安装目录自选，建议路径不留空格, 留意安装程序是否设置了环境变量等, 没有则自己设置.
   
三.安装Eclipse    
   1.下载[Eclipse Helios](http://eclipse.org/downloads/packages/release/helios/sr2), 下载Eclipse IDE for Java Developers.       
   2.安装目录自选, 解压到一个目录就行了. 简单起见, 建议根目录.
   
四.安装Android SDK    
   1.下载[Android SDK](http://developer.android.com/sdk/index.html).    
   2.有两种方法可以安装: ADT Bundle 和 SDK Tools Only. 还是直接下SDK Tools Only吧.    
   3.下载后解压到任意目录, 建议根目录.    
   4.进入android-sdk-windows, 运行SDk Setup.exe, 全接受, 安装.    
   5.把android-sdk-windows下tool目录加入环境变量.    

五.配置Eclipse    
   1.安装ADT插件, 参考方法见[官方文档](http://developer.android.com/sdk/installing/installing-adt.html)    
   2.按照自己需求, 增加所需的虚拟机即可.    
   
   
