---
layout: post
title: "Linux命令iwconfig"
date: 2013-10-20 23:16
comments: true
categories: Linux
toc: true
---
# Introduction
    iwconfig用于无线网络的连接
<!--more-->
# 说明
	1.启用/关闭无线网卡
	ifconfig wlan0 up/down	
	2.显示能够搜索到的无线网络
	iwlist wlan0 scan
	3.连接无线网络
	iwconfig wlan0 essid WLAN_ESSID key WLAN_KEY	
	4. 查看连接的情况
	iwconfig wlan0
	5. 如果已经保存，使用dhcpcd或者dhclient获取ip地址
	dhclient wlan0 或者 dhcpcd wlan0
