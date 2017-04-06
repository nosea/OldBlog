---
layout: post
title: "Linux 实用工具 - Wget"
date: 2012-12-30 16:31
comments: true
categories: Linux
toc: true
---
# Introduction
    wget的使用
<!-- more -->
# 使用
## 常用选项
``` bash
# 断点续传 -c
wget -c link
# 递归下载整个目录 默认深度是5，想改变深度,用-l选项
wget -r linkdir
```
## 使用代理
### http代理
    1.配置文件方式
      编辑$HOME/.wgetrc文件(没有就创建一个)，添加如下内容
      http_proxy = your_proxy_server:port  #如果不写端口，默认为80端口
	  # 默认开启代理
	  use_proxy = on  # 默认不开启，改为off
	2.直接命令方式
	  wget 没有设置代理的命令行选项，但是"-e"参数可以实现.wgetrc的功能
	  wget -e "http_proxy=your_proxy_server:port"
	
	
	
