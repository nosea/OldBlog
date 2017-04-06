---
layout: post
title: "Unix/Linux相关标准"
date: 2013-01-17 11:11
comments: true
categories: Linux
toc: true
---
# Introduction
    Unix/Linux相关标准介绍
<!--more-->
# Content
## POSIX
    1.基本上是Portable Operating System Interface的简称
	  X则表明其对Unix API的传承
	2.是一系列由IEEE制定的标准，原来指的只是IEEE标准1003.1-1998(操作系统接口)，
	  后来则扩展成包括很多标记为1003的标准及标准草案，包括shell和实用程序
	  其正式称呼为IEEE 1003，而国际标准名称为ISO/IEC 9945
	3.Linux基本上逐步实现了POSIX兼容，但并没有参加正式的POSIX认证。
	  --不知道现在加入没有
	4.POSIX这个名称是由Richard Stallman应IEEE的要求而提议的一个易于记忆的名称。
    5.该标准的目的是提高应用程序在各种UNIX系统环境之间的可移植性
	6.POSIX在15份不同的文档中对操作系统与用户软件的接口进行了规范，主要内容包括3个部分
	  POSIX 系统调用
	  POSIX 命令和工具
	  POSIX 兼容测试
	  同时还提供了一套 POSIX 兼容性测试工具，称为 PCTS（POSIX Conformance Test Suite）
## SUS
    1.Single UNIX Specification(单一UNIX规范)，是一套UNIX系统的统一规格书。
	2.扩充了POSIX标准，定义了标准UNIX操作系统。
	3.由IEEE与The Open Group所提出，目前由Austin Group负责维持。
## TOG
    1.The Open Group(国际开放标准组织,又译为国际标准化组织)
	2.以制定电脑架构的共通标准为目的而成立的国际性非营利组织，在英国登记注册。
	  在1996年，由 X/Open 与开源软件基金会（Open Software Foundation）合组而成，拥有Unix的商标权
	3.制定并且发布了单一UNIX规范（Single UNIX Specification）
## Austin Group
    1.Austin Group是在1998年成立的一个合作技术工作组，其使命是开发并维护POSIX.1和SUS规范。
	2.Austin Group 开发规范的方法是"write once, adopt everywhere"，即由 Austin Group 制定
	  的规范既会成为 IEEE POSIX 规范，又会成为 Open Group 的 技术标准规范，以后又会被采纳
	  为 ISO/IEC 的标准。
## X/Open
    1.X/Open是1984年由多个公司联合创建的一个用于定义和推进信息技术领域开放标准的公司
	2.X/Open和开源软件基金会合并为The Open Group，并在1993-1996管理UNIX这个商标
## LSB
    1.Linux Standard Base(Linux标准规范)
	2.是一个在Linux Foundation(Linux基金会)结构下对Linux发布版的联合项目
	  使Linux操作系统符合软件系统架构,或文件系统架构标准的规范及标准
	3.LSB基于POSIX,统一UNIX规范及其他开放标准,共在某些领域扩展它们。
	4.LSB是Free Standards Grou（FSG）的一个工作组
## FHS
    1.Filesystem Hierarchy Standard(文件系统层次标准)
	2.是LSB标准中的一个组件
	2.Linux 社区中第一个标准化努力是文件系统层次标准
## FSB
    1.Free Standards Group(自由标准组织)
	2.是一个非盈利性的全球性组织，它成立的目的在于推动开放源代码的标准建立。
	3.这个组织推动的标准都是在GPL授权条款下成立
	4.在2007年1月22日，自由标准组织与开源码发展实验室联合成立了Linux基金会。
# Reference
 * [LSB 简介](http://www.ibm.com/developerworks/cn/linux/l-lsb-intr/index.html)  
 * [wikipedia](http://zh.wikipedia.org/)
