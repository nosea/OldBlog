---
layout: post
title: "frequently-used command"
date: 2012-12-26 16:41
comments: true
categories: Linux
---
1.kill process
``` bash
# killall - kill processes by name
killall process_name
# kill
kill process_id
kill -9 process_id

# 配合查找进程命令使用
ps ax|grep keywords
```
<!-- more -->
2.前台和后台
``` bash
# 暂停当前运行的程序
Ctrl + z
# 查看被暂停的程序
jobs
# 恢复到前台
fg [可选的job id,默认是最近暂停的程序]
# 恢复到后台
bg [可选的id,注意后台的输出还是出现]
# 从后台恢复到前台
fg [id]
# 最开始运行就放到后台
command & # 坏处就是关闭这个终端时，后台的程序也可能关闭
# 远程作业时，不希望出现上面的情况，可以用screen命令
```
3.输出重定向
``` bash
command fd> somefile
command >/dev/null    # 此处的文件描述符默认为1，标准输出
command 2>/dev/null   # 屏蔽出错信息
command >/dev/null 2>&1 # 屏蔽标准输出和出错
```
4.关于网络
``` bash
# ===============================ifconfig==========================
# 单纯的查询
ifconfig
# shut down and active interfaces
ifconfig wlan0 up
ifconfig wlan0 down
# 配置ip之类的
ifconfig eth0 xxx.xxx.xxx.xxx netmask xxx.xxx.xxx.xxx

# ===============================route============================
# 添加默认网关
route add default gw xxx.xxx.xxx.xxx
# 查看配置
route -n

# ==============================iwconfig==========================
# 扫描接入点
iwlist wlan0 scanning
# 连接无线
iwconfig wlan0 essid essid key password
```
5.关于权限
``` bash
# file
chown nosea:nosea file_name
# directory
chown -R nosea:nosea directory_name/
```
