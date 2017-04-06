---
layout: post
title: "Linux命令xargs"
date: 2013-11-21 22:32
comments: true
categories: Linux
toc: true
---
# Introduction
    xargs - build and execute command lines from standard input
<!--more-->
# Content
    如果需要将上一条命令的标准输出作为参数传给下一条命令，简单的话可以使用这个
	它默认对输出的分割依据是blanks，可以指定其他的参数
    command_1 | xargs command_2
