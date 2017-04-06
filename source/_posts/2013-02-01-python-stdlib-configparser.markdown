---
layout: post
title: "python标准库configparser"
date: 2013-02-01 16:47
comments: true
categories: Python
toc: true
---
# Introduction
    模块作用：读取/写入配置文件
<!--more-->
# 说明
    ConfigParser模块共有三个类
	RawConfigParser、ConfigParser、SafeConfigParser，关系为依次继承
``` cfg example.cfg
[user] ; <-- []括起来的是section，下面的是option键值对
first_name = vin
last_name = swan
age = 30
weight = 80kg
height = 180cm ; 这种注释可以不独占一行
# tel = xxxx 这种注释只能单独一行

; 重写之后，好像所有的注释被去掉了以及用name: value格式的都变成了name = value
[tool]
database: mysql ; 这种格式也可以
editor: emacs

[env]
os = Linux
lang = en_us
```
``` python
#!/usr/bin/env python
#coding:utf-8

"""
ConfigParser模块使用示例
模块作用：读取/写入配置文件，配置文件的格式类似windows的ini配置文件
在3.0中ConfigParser模块改名为configparser。
"""
from ConfigParser import ConfigParser

CONF = "example.cfg"

# 创建实例
config = ConfigParser()

# 读取配置文件
config.read(CONF)

# sections函数返回所有section名字列表，不包括DEFAULT
st = config.sections()
print "section:", st

# 每个section所有的options
for i in st:
    print "the options of section %s:" % i
    print config.options(i)
    
# items函数返回指定section的所有键值对
for i in st:
    print "list of (name, value) pairs for each option in the section %s" % i
    print config.items(i)

# 获得每个option的值
for i in st:
    for j in config.options(i):
        print "%s = %s" % (j, config.get(i, j))

# 添加一个section
config.add_section("env")
# 添加键值对
config.set("env", "os", "Linux")
config.set("env", "lang", "en_us")
# 写入文件
config.write(open(CONF, "wb"))
```
