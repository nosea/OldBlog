---
layout: post
title: "Linux命令之find"
date: 2013-03-27 19:15
comments: true
categories: Linux
toc: true
---
# Introduction
    find命令的日常使用
<!--more-->	
# Main
    概要
	   find [-H] [-L] [-P] [-D debugopts] [-Olevel] [path...] [expression]    -->来自man文档
	-P     是默认的，不跟随软链接
	-L     跟随软链接
	-H     不跟随软链接,除了处理命令行参数的时候
	上面参数多个指定的时候，后一个会覆盖前一个
	expression
	-name pattern
	  pattern 为shell pattern
	  * 匹配0或者多个
	  ? 匹配1个
	  [string] 匹配属于string的字符，这个被称为character class
	  例如：[a-z0-9]匹配所有小写字母和数字
	        [!A-Z]或者[^A-Z]匹配所有非大写字母
	-amin  n
	  查找系统中最后n分钟访问的文件
	-atime n
	  查找系统中最后n*24小时访问的文件
	-cmin n
	  查找系统中最后n分钟被改变状态的文件
	-ctime n
	  查找系统中最后n*24小时被改变状态的文件
	-iname pattern
	  与-name类似，只不过忽略文件名的大小写
	-inum n
	  查找制定inode number的文件
	-maxdepth n
	  n为深度，1为当前文件夹
	-type c
	  指定查找文件的类型
	  b(块文件), c(字符文件), d(文件夹), p(命名管道), f(普通文件), l(链接文件), s(socket文件)
	-empty
	  查找系统中空白的文件，或空白的文件目录，或目录中没有子目录的文件夹
	-false
	  查找系统中总是错误的文件
	-fstype type
	  查找系统中存在于指定文件系统的文件，如ext2
	-gid n
	-group groupname
	eg:
	最常用的
	$ find path -name file_to_find
	查找文件长度为0的普通文件
	$ find path -type f -size 0
	查找目录中属主具有读写权限，并且属组和其他有读权限的文件
	$ find path -type f -perm 644
	查找目录中更改时间在7日以前的普通文件，并在删除之前询问他们
	$ find path -type f -mtime +7 -ok rm {} \;
	查找目录中组是root的
	$ find path -group root
# Example
    1、查找当前文件夹内10天前的文件(不是目录)
	  find . -mtime +10 -type f
	2、查找当前文件夹内10内的文件(不是目录)
	  find . -mtime -10 -type f
	3、查找当前文件名字为"test.c"的文件，且不区分大小写
	  find . -type f -iname "test.c"
	4、查找目录深度为2，且名字为a.c的文件
	  $ find -maxdepth 1 -type f -name 'a.c' 
	  ./a.c
	  $ find -maxdepth 2 -type f -name 'a.c' 
	  ./a.c
	  ./test/a.c
	5、对于每个查找到的文件执行命令(可以用xargs和exec)
	  $ find . -name 'a.c' | xargs md5sum
	  d41d8cd98f00b204e9800998ecf8427e  ./a.c
	  d41d8cd98f00b204e9800998ecf8427e  ./test/a.c
	  d41d8cd98f00b204e9800998ecf8427e  ./test/a/a.c
	  d41d8cd98f00b204e9800998ecf8427e  ./test/a/b/a.c
	  $ find . -name 'a.c' -exec md5sum {} \;
	  d41d8cd98f00b204e9800998ecf8427e  ./a.c
	  d41d8cd98f00b204e9800998ecf8427e  ./test/a.c
	  d41d8cd98f00b204e9800998ecf8427e  ./test/a/a.c
	  d41d8cd98f00b204e9800998ecf8427e  ./test/a/b/a.c
	  $ find . -name 'a.c' -exec md5sum {} +;
	  d41d8cd98f00b204e9800998ecf8427e  ./a.c
	  d41d8cd98f00b204e9800998ecf8427e  ./test/a.c
	  d41d8cd98f00b204e9800998ecf8427e  ./test/a/a.c
	  d41d8cd98f00b204e9800998ecf8427e  ./test/a/b/a.c
	
# Reference
[查找技巧,find及xargs的使用](http://bbs.chinaunix.net/thread-441883-1-1.html)   
[15个实用的Linux find命令示例](http://blog.jobbole.com/48856/)    
[15个极好的Linux find命令示例](http://blog.jobbole.com/48931/)
Thanks!
	
