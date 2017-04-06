---
layout: post
title: "python编码规范"
date: 2012-12-31 17:27
comments: true
categories: Python
toc: true
---
# Introduction
    常用的python编码规范
<!-- more -->
# 内容
## 命名
    1.模块名 - 不含下划线，简短的，全小写的名字
	2.类名 - 首字母大写的单词串(eg - GetName)
	3.全局变量名 - 同函数名
	  前面加下划线表示不会被 from M import * 导入  eg：_get_name
	4.函数名 - 全小写，下划线分割单词  eg：get_name
	5.方法名 - 同函数名   加下划线表示不打算作为类的公共接口的内部方法或实例变量
	  两个下划线表示类的私有成员
## 关于空格
## 关于空行
    1.顶层函数的分割间距为2行
	2.类之间的分割间距为2行
	3.类内的方法间距为1行
	4.额外的空行用于区分不同的相关函数群
## 导入
    1.导入一个模块单独占一行
	eg:  import os     ----> ok
	     import os, sys    --->  No
		 from types import StringType, ListType   -->这样是可以的
	2.Imports通常放置与文件的顶部，仅在模块注释和文档字符串之后，在模块全局变量和常量之前
	3.Imports安放顺序
	  标准库的导入
	  相关主包的导入
	  特定应用的导入
	4.应该在上面的每组之间放置空行
	5.对于内部包的导入不推荐使用相对导入，对所有的导入都要使用包的绝对路径
# Reference
* Python Coding Rule
