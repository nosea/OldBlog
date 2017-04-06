---
layout: post
title: "用scp远程拷贝文件"
date: 2012-12-27 15:47
comments: true
categories: Linux
---
    假设远程主机已经安装了SSH服务器服务
    本地主机 文件/目录 的位置 : localfile.txt
    远程主机 : 192.168.0.1
    远程主机上要存放的位置 : /home/username/ 
    ======================================================
    scp -r localfile.txt username@192.168.0.1:/home/username/
    ======================================================
	将本地主机文件localfile.txt上传到远程服务器
