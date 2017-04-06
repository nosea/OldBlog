---
layout: post
title: "linux命令tcpdump"
date: 2015-01-06 17:41
comments: true
categories: Linux
toc: true
---
# Introduction
    tcpdump命令日常使用
<!--more-->
# OPTION
    -i     Listen on interface.
	$ sudo tcpdump -ieth0  // 监听eth0上所有的包
	22:26:20.775096 IP NOSEA-PC.1600 > 192.168.14.16.41732: . ack 98 win 271 ...省略
	
	-c     Exit after receiving count packets.
	
	$ sudo tcpdump -ieth0 -c 10   // 监听eth0上收到的10个包
	22:26:20.775096 IP NOSEA-PC.1600 > 192.168.14.16.41732: . ack 98 win 271 ...省略
	下面只显示抓到的10个包
	
	-n     Don't  convert  addresses  (i.e.,  host addresses, port numbers,
	       etc.) to names.
		   如果不使用-n选项，那么ip会被转变为主机名，端口会被转为相应的服务，如port 22
	       会被转换为ftp。
    $ sudo tcpdump -ieth0 -c 10   
	22:26:20.775096 IP NOSEA-PC.1600 > 192.168.14.16.41732: . ack 98 win 271 ...省略
		
	$ sudo tcpdump -ieth0  -n -c 10   // 不要把地址转换为主机名，不要把端口转换为服务名
	22:26:20.775096 IP 192.168.14.17.1600 > 192.168.14.16.41732: . ack 98 win 271 ...省略
	
	-X     When parsing and printing, in addition to printing  the  headers
	       of  each  packet,  print the data of each packet (minus its link
		   level header)  in  hex  and  ASCII.   This  is  very  handy  for
		   analysing new protocols.
		   打印了包头和包得内容，对于协议的分析很有用。
	$ sudo tcpdump -ieth0 -X -n -c 10
	
	-e     Print  the  link-level  header  on  each dump line.  This can be
	       used, for example, to print MAC layer  addresses  for  protocols
		   such as Ethernet and IEEE 802.11.
		   之前是只有IP的信息，这个会打印链路层的信息，对于查看mac地址挺有用
	$ sudo tcpdump -ieth0 -enX -c10
	
	-l     Make stdout line buffered.  Useful if you want to see  the  data
	       while capturing it. 
		   让标准输出行缓冲后，可以用pipe针对每行做处理，在想实时的看到dump到
		   packet时很有用。比如
		   tcpdump -l | tee dat
		   tcpdump -l > dat & tail -f data
    $ sudo tcpdump -ieth0 -enX -c10
	
	-v     When  parsing and printing, produce (slightly more) verbose out-
	       put.  For example,  the  time  to  live,  identification,  total
		   length  and  options  in an IP packet are printed.  Also enables
		   additional packet integrity checks such as verifying the IP  and
		   ICMP header checksum.
		   -v和-vv都是打印更多的详细的信息，需要时再用吧
	$ sudo tcpdump -ieth0 -enX -c10

    -w     Write  the  raw packets to file rather than parsing and printing
	       them out.  They can later be printed with the -r option.   Stan-
		   dard output is used if file is ``-''.
		   
		   This  output will be buffered if written to a file or pipe, so a
		   program reading from the file or pipe may not see packets for an
		   arbitrary  amount  of  time after they are received.  Use the -U
		   flag to cause  packets  to  be  written  as  soon  as  they  are
		   received.
		   注意，保存到文件里的是raw packets是原始的dump数据，没有经过分析的
		   二进制数据。如果要读这些包文件的话，用-r选项。另外，即使在保存到
		   文件的时候，用了一些匹配选项，保存的也是最原始的日志.
	$ sudo tcpdump -ieth0  -c10 -w dump.data
	tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
	10 packets captured
	22 packets received by filter
	0 packets dropped by kernel
	
	-r     Read  packets  from file (which was created with the -w option).
	       Standard input is used if file is ``-''.
	$ sudo tcpdump -ieth0 -elnX -c10 -rdump.data
	
	-p     Don't  put  the  interface into promiscuous mode.  Note that the
	       interface might be in promiscuous mode for  some  other  reason;
		   hence,  `-p'  cannot  be used as an abbreviation for `ether host
		   {local-hw-addr} or ether broadcast'.
		   不要把网卡置于混杂模式
		   
    -s     Snarf snaplen bytes of data from each  packet  rather  than  the
    	   default  of 65535 bytes.  Packets truncated because of a limited
		   snapshot are indicated in the output  with  ``[|proto]'',  where
		   proto  is the name of the protocol level at which the truncation
		   has occurred.  Note that taking larger snapshots both  increases
		   the amount of time it takes to process packets and, effectively,
		   decreases the amount of packet buffering.  This may cause  pack-
		   ets to be lost.  You should limit snaplen to the smallest number
		   that will capture the protocol information you're interested in.
		   Setting  snaplen to 0 sets it to the default of 65535, for back-
		   wards compatibility with recent older versions of tcpdump.
		   
		   -s0 用以抓取65535字节的包

# expression
    The filter expression consists of one or more  primitives.   Primitives
	usually consist of an id (name or number) preceded by one or more qual-
	ifiers.  There are three different kinds of qualifier: type, dir, proto

    表达式用于过滤要dump的packets。理解了awk得过滤，这个也差不多。
	详见 man 7 pcap-filter。
	
	格式：tcpdump -elnX -c 10 'expression'
	expression的格式为：qualifier id(id是一个数字或者名字).
	
##	qualifiers
### type
    type qualifiers say what kind of thing the  id  name  or  number
	refers  to. 通常的types是host(主机), net(网络), port(端口)和portrange(连续的端口)
	
	// dump与192.168.9.73的包
	$ sudo tcpdump -enl -c10 'host 192.168.9.73'
	
	// 在上面的基础上，加上端口为10001的限制
	$ sudo tcpdump -enl -c10 'host 192.168.9.73 and port 10001'
	
### dir
    dir qualifiers specify a particular transfer direction to and/or
	from id
	指定方向了，这个相当有用，常用的就是src, dst了
	
	// dump来自192.168.9.73的包，并且目标的端口是10001
	$ sudo tcpdump -enl -c10 'src host 192.168.9.73 and dst port 10001'
	
	// dump来自192.168.9.73的包，并且目标的端口是10001到10100之间的包
	$ sudo tcpdump -enl -c10 'src host 192.168.9.73 and dst portrange 10001'

### proto
    proto qualifiers restrict the match to  a  particular  protocol.
	Possible  protos are: ether, fddi, tr, wlan, ip, ip6, arp, rarp,
	decnet, tcp and udp.
	估计常用到的就是tcp和udp了。。
	
	// dump来自192.168.9.73的包，并且目标的端口是10001的tcp包
	$ sudo tcpdump -enl -c10 'tcp and src host 192.168.9.73 and dst port 10001'

### 其他常用的
    In addition to the above, there are some special  `primitive'  keywords
	that  don't  follow  the pattern: gateway, broadcast, less, greater and
	arithmetic expressions.  All of these are described below.jjjjkkkk
	
	less length
	    True  if  the  packet has a length less than or equal to length.
		This is equivalent to:
		len <= length.
		
	// dump来自192.168.9.73的tcp包，且包大小小于100，greater的用法一样
	// 注意，用-v选项才可以看到包的大小，如果想看的话
	$ sudo tcpdump -nlv -c10 'tcp and src host 192.168.9.73 and less 100'
	
	
# Reference
man tcpdump    
[Linux tcpdump命令详解](http://www.cnblogs.com/ggjucheng/archive/2012/01/14/2322659.html)
	
    
	
	
	
