---
layout: post
title: "Use virsh to manage kvm virtual machines"
date: 2013-04-14 15:38
comments: true
categories: Linux
toc: true
---
# Introduction
    用virsh管理kvm虚拟机
<!--more-->	
# Content
    # 可以直接运行virsh进入命令行，也可以shell里加virsh运行
    1.查看虚拟机 # 直接list是查看active的
	  list [--inactive] [--all]
		  OPTIONS
		    --inactive       list inactive domains
		    --all            list inactive & active domains
    2.quit, exit
	  退出命令行
	3.version
	  查看版本信息
	4.reboot domain-id
	5.shutdown domain-id
	6.start domain-id
	7.suspend domain-id
	8.resume domain-id
# 克隆虚拟机
    virt-clone --connect=qemu:///system -o Old_vir -n New_vr -f /var/lib/libvirt/images/xxx.img
# Reference
[KVM以及virsh比较详细的说明](http://www.9wy.net/?p=853)
