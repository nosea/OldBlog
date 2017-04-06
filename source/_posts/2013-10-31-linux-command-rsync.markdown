---
layout: post
title: "Linux命令rsync"
date: 2013-10-31 22:21
comments: true
categories: Linux
toc: true
---
# Introduction
    rsync —— remote sync
<!--more-->	
# 说明
    rsync通常有两种方式：
	1、通过远程shell(ssh、rsh)
		Pull: rsync [OPTION...] [USER@]HOST:SRC... [DEST]
		Push: rsync [OPTION...] SRC... [USER@]HOST:DEST
	2、通过rsync daemon：
		Pull: rsync [OPTION...] [USER@]HOST::SRC... [DEST]
    	    rsync [OPTION...] rsync://[USER@]HOST[:PORT]/SRC... [DEST]
		Push: rsync [OPTION...] SRC... [USER@]HOST::DEST
    	    rsync [OPTION...] SRC... rsync://[USER@]HOST[:PORT]/DEST
## 选项
	如下几个选项是常用的:
    -q, --quiet                 suppress non-error messages
	-a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
		                        -a <==> -rlptgoD就能满足绝大多数需求
	-r, --recursive             recurse into directories
	-t, --times                 preserve modification times
	-z, --compress              compress file data during the transfer
	-e, --rsh=COMMAND           specify the remote shell to use
	--delete                	delete extraneous files from dest dirs
	--progress              	show progress during transfer
	--bwlimit=KBPS          	limit socket I/O bandwidth
	
## 远程shell方式
    一、push
	1、镜像
		rsync -az --delete -e "ssh -l tommy -p 22" /home/tommy/srcfile 192.168.1.2:/home/danny/
	or:
		rsync -az --delete /home/tommy/srcfile tommy@192.168.1.2:/home/danny/
	注意：如果srcfile是文件夹，记住不能加"/"
	
	2、增量同步
		rsync -az -e "ssh -l tommy -p 22" /home/tommy/srcfile 192.168.1.2:/home/danny/
	or:
		rsync -az /home/tommy/srcfile tommy@192.168.1.2:/home/danny/

	二、pull
	1、镜像
		rsync -az --delete -e "ssh -l danny -p 22" 192.168.1.1:/home/tommy/srcfile /home/danny/
	or:
		rsync -az --delete danny@192.168.1.1:/home/tommy/srcfile /home/danny/
	注意：如果srcfile是文件夹，记住不能加"/"
	
	2、增量同步
		rsync -az -e "ssh -l danny -p 22" 192.168.1.1:/home/tommy/srcfile /home/danny/
	or:
		rsync -az danny@192.168.1.1:/home/tommy/srcfile /home/danny/
## Tips
    1、镜像test目录，但是想排除test目录里的log目录
		rsync -az --delete --exclude='test/log' test danny@192.168.8.2:/home/danny/  
	2、传输过程中限速500K/s
		rsync -az --delete --exclude='test/log' --bwlimit=500 test danny@192.168.8.2:/home/danny/  

# Reference
[Rsync使用注意事项](http://haili.me/archives/638.html)    
Thanks!
