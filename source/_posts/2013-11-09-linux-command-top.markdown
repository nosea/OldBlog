---
layout: post
title: "Linux命令top"
date: 2013-11-09 16:29
comments: true
categories: Linux
toc: true
---
# Introduction
    top -- display Linux tasks
<!--more-->
# 说明
    以光标为界分为两个部分，上面是显示的系统有关的整体性能信息的Summary Area
	下面显示的是各个进程的相关信息的Task Area。光标处用于输入命令
## Summary Area
	eg:
	=============================================================================
	top - 19:44:55 up 31 min,  6 users,  load average: 0.92, 0.62, 0.52
	Tasks: 200 total,   1 running, 198 sleeping,   0 stopped,   1 zombie
	Cpu(s):  5.5%us,  2.1%sy,  0.0%ni, 91.7%id,  0.6%wa,  0.0%hi,  0.1%si,  0.0%st
	Mem:   4099360k total,  1377388k used,  2721972k free,    57820k buffers
	Swap:  2097148k total,        0k used,  2097148k free,   582564k cached
	=============================================================================
	  第一行 —— 等同于uptime命令
	     系统当前时间
		 系统运行时间
		 当前登录用户数
		 系统负载
	  第二行 —— 进程概览
	     总进程数
		 正在运行的进程数
		 正在睡眠的进程数
		 已停止的进程数
		 僵尸进程数
	  第三行 —— CPU信息
	     us <=> user cpu time, CPU time spent in user space
		 sy <=> system cpu time, CPU time spent in kernel space
		 ni <=> user nice cpu time，CPU time spent on low priority processes
		        processes with priority upgrade nice
		 id <=> idle cpu time, CPU time spent idle
		 wa <=> io wait cpu time, CPU time spent in wait (on disk)
		 hi <=> hardware irq, CPU time spent servicing/handling hardware interrupts
		 si <=> software irq, CPU time spent servicing/handling software interrupts
		 st <=> steal time, CPU time stolen from a virtual machine
      第四行 —— 物理内存
	     物理内存总量
		 物理内存使用量
		 物理内存空闲量
		 用于内核缓存的量
	  第五行 —— 交换空间，可以使用free命令
	     交换空间总量
		 交换空间使用量
		 交换空间空闲量
		 交换空间缓冲总量
    
## Task Area
	=============================================================================
	PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
	2761 nosea     20   0  474m  95m  15m S   11  2.4   5:28.17 chrome 
    2042 nosea     20   0  337m 138m  48m S   10  3.5   8:10.84 compiz
    3562 nosea     20   0  256m  80m  28m S    8  2.0   2:44.51 chrome 
    2288 nosea     20   0  651m 118m  45m R    6  3.0   8:27.07 chrome 
    2844 nosea     20   0  409m 222m  40m S    6  5.6   5:51.43 chrome        
	...
	=============================================================================	
	PID: 进程ID
	USER: 进程所有者
	PR: 优先级
	NI: nice值，负数表示高优先级，正数表示低优先级
	VIRT: 进程使用的虚拟内存总量
	RES: 进程使用的物理内存总量
	SHR: 进程使用的共享内存总量
	S: 进程状态
	   D —— Sleeping(不可中断的睡眠状态)
	   R —— Running
	   S —— Sleeping
	   T —— Traced or stopped
	   Z —— Zombie 
	%CPU: 进程的CPU时间占比
	%MEM: 进程的物理内存占比
	TIME+: 进程和其子进程所用CPU时间总和
	COMMAND: 进程名或者是开启进程所运行带路径和参数的命令(按C可以展开)
	++++++++++下面的是默认不显示的，按f键可以选择需要显示的列++++++++++++++
   	PPID  = Parent Process Pid
   	RUSER = Real user name
   	UID   = User Id
   	GROUP = Group Name
   	TTY   = Controlling Tty
   	P     = Last used cpu (SMP)
   	SWAP  = Swapped size (kb)
   	TIME  = CPU Time
   	CODE  = Code size (kb)
   	DATA  = Data+Stack size (kb)
   	nFLT  = Page Fault count
   	nDRT  = Dirty Pages count
   	WCHAN = Sleeping in Function
   	Flags = Task Flags <sched.h>
## Interactive Commands
    Global Commands
      Enter/Space: 立即刷新
	  ?/h: help
	  =: 
	  A: 4个列组同时显示
	  B: 加粗显示
	  d/s: 改变刷新时间
	  G: 切换列组(1-4显示不同的field)
	  I:Irix/Solaris Mode开关
	  k: kill一个进程
	  q: 退出
	  r: 改变一个进程的优先级
	  W: 保存当前的top设置
	  Z: 改变页面颜色
    SUMMARY Area Commands
      l: Load Average/Uptime的显示开关
	  m: Memory/Swap Usage的显示开关
	  t: Memory/Swap Usage的显示开关
	  1: Single/Separate Cpu States的显示开关，如果想看每个CPU的信息的话
    TASK Area Commands
      Appearance:  b, x, y, z
      Content:     c, f, H, o, S, u
      Size:        #, i, n
      Sorting:     <, >, F, O, R
    COLOR Mapping
      <Ret>, a, B, b, H, M, q, S, T, w, z, 0 - 7
    COMMANDS for Windows
      -, _, =, +, A, a, G, g, w
# Reference		 
[In Linux “top” command what are us, sy, ni, id, wa, hi, si and st (for CPU usage)?](http://unix.stackexchange.com/questions/18918/in-linux-top-command-what-are-us-sy-ni-id-wa-hi-si-and-st-for-cpu-usage)    
Thanks!
	     
			 

