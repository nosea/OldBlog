---
layout: post
title: "Linux目录结构"
date: 2013-01-17 19:07
comments: true
categories: Linux
toc: true
---
# Introduction
    Linux系统目录结构的一些说明
<!--more-->
# Content
## 概览
    * /bin        --     Essential command binaries
	* /boot       --     Static files of the boot loader
	* /dev        --     Device Files
	* /etc        --     Host-specific system configuration
	* /home       --
	* /lib        --     Essential shared libraries and kernel modules
	* /lib64      --
	* /lost+found
	* /media      --     Mount point for removeable media
	* /mnt        --     Mount point for mounting a filesystem temporarily
	* /opt        --     Add-on application software packages
	* /proc       --     Process Information
	* /root
	* /sbin       --     Essential system binaries
	* /srv        --     Service Data
	* /tmp        --     Temporary Files
	* /usr        --     Secondary hierarchy
	* /var        --     Variable Files
## 详细
    /bin
	* 存放二进制可执行文件，bin是binary的缩写，表示二进制文件，通常为可执行文件
	* 放置了供所有用户常用的基本命令  
	* 例如: cp, ls, cat
    /boot
	* 存放Linux启动时使用的一些的文件，如操作系统内核，引导程序
	* 存放Kernel initrd, vmlinux, grub文件
	* 例如：initrd.img-2.6.32-24-generic, vmlinuz-2.6.32-24-generic
	/dev
	* 存放系统所有的设备文件，从此目录可以访问各种系统设备
	  无论是系统本身还是连接到系统的终端设备
	* 在该目录中还包含有各种实用功能，如用于创建设备文件的MAKEDEV
    /etc
	* 存放系统程序和应用软件的配置文件
	* 也包含了系统开关机的shell脚本
	/home
	* 用来存放所有用户的个人文件
	/lib
	* 存放系统最基本的共享链接库和内核模块
	* 存放/bin和/sbin所需的库文件
	* 库文件的名字是ld* 或者 lib*.so.*
	* 例如：ld-2.11.1.so, libncurses.so.5.7	
	/lib64
	* 64位系统有这个文件夹，存放64位程序的库
	/lost+found
	* 并不是Linux目录结构的组成部分，而是ext3文件系统用于保存丢失文件的地方。
	/media
	* 可移动设备的临时挂载点
	/mnt
	* 文件系统的临时挂载目录
	* 在GNOME中，只有挂载到/media的文件夹才会显示在“计算机”中，
	  挂载到/mnt不会做为特殊设备显示
	/opt
	* opt代表optional
	* 多数第三方软件默认安装到此位置，如Adobe Reader、google-earth等。
	  并不是每个系统都会创建这个目录。
	/proc
	* 它是存在于内存中的虚拟文件系统。
	* 里面保存了内核和进程的状态信息。多为文本文件，可以直接查看。
	* 例如：/proc/{pid}包含了指定pid的进程的信息
	        /proc/cpuinfo保存了有关CPU的信息
    /root
	* 根用户的主目录。
	* 与/home下的目录很相似，该目录中还包含仅与根用户有关的条目。
    /sbin
	* 跟/bin一样，放置二进制可执行文件
	* 跟/bin的区别是，这里的命令是给系统管理员(超级用户)使用的
	* 例如：reboot，fdisk，shutdown等
	/tmp
	* 系统和用户临时文件的存放点
	* 这里面的文件在关机或重启时被删除	
	* 该目录具有Sticky特殊权限，所有用户都可以在这个目录中创建、编辑文件。
	  但只有文件拥有者才能删除文件
	/usr
	* /usr通常是一个庞大的文件夹，其下的目录结构与根目录相似，但根目录中的文件
	  多是系统级的文件，而/usr中是用户级的文件，一般与具体的系统无关
	* 注意，程序的配置文件、动态的数据文件等都不会存放到/usr，所以除了安装、
	  卸载软件外，一般无需修改/usr中的内容。说在系统正常运行时，/usr甚至可以
	  被只读挂载。由于这一特性，/usr常被划分在单独的分区，甚至有时多台计算机
	  可以共享一个/usr
	* 存放二进制程序，库，文档和源代码
	  /usr/bin
	  * 存放一般用户可执行二进制程序，如果在/bin下找不到，则在/usr/bin
	  /usr/include
	  * 存放C/C++头文件的目录
	  /usr/lib
	  * 存放/usr/bin和/usr/sbin所需的库文件
	  /usr/local
	  * 存放用户从源代码编译安装的程序	
	  * 新装的系统中这个文件夹是空的，可以用于存放个人安装的软件。
	    安装了本地软件的/usr/local里的目录结构与/usr相似
	  /usr/sbin
	  * 存放系统管理员可执行二进制程序，如果在/sbin下找不到，则在/usr/sbin
	  /usr/share
	  * 用于存放各种软件包共享的辅助文件，图标，文档，运行描述文件等
	  /usr/doc 和 /usr/share/doc
	  * 用于存放软件的说明文档
	  /usr/man 和 /usr/share/man
	  * 用于存放各种命令、文件、函数等的使用手册
	  /usr/src
	  * 存放源代码
	  /usr/X11R6
	  * 用于保存运行X-Window所需的所有文件,还包含用于运行GUI要的配置文件和
	    二进制文件
	/var
	* var 代表可变文件
	* 包含了一些数据文件，内容可能会增长的文件会在这里找到
	* /var的存在使得/usr被只读挂载成为可能
	  /var/cache
	  * 应用程序的缓存文件
	  /var/lib 
	  * 应用程序的信息、数据。如数据库的数据等都存放在此文件夹
	  /var/local
	  * /usr/local中程序的信息、数据
  	  /var/lock
	  * 锁文件
 	  /var/log
	  * 系统日志文件
	  /var/opt
	  * /opt中程序的信息、数据
	  /var/run
	  * 正在执行着的程序的信息，如PID文件应存放于此
	  /var/mail
	  * 存放邮件
	  /var/spool
      * 存放程序的假脱机数据（即spool data）
	  /var/tmp
	  * 存放临时文件
	/srv
	* srv代表service
	* 存放与指定服务相关的文件
		
# Reference
* [Linux Directory Structure](http://my.oschina.net/hmj/blog/80129)    
* [Linux目录结构](http://linux-wiki.cn/wiki/zh-hans/Linux%E7%9B%AE%E5%BD%95%E7%BB%93%E6%9E%84)    
Thanks!
