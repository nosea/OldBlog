---
layout: post
title: "python基础(三章)"
date: 2012-12-24 19:22
comments: true
categories: Python
---
说明:
    1.目前只能实现一对一聊天
	2.python的多重赋值: x = y = z = 1
	2.python的"多元"赋值: x, y, z = 1, 2, 'some' #为了可读性，加小括号
	3.不同于c语言，表达式不返回值：eg, y = (x=z+1) ->这句错误
	4.专用下划线标识符：
	  _xxx    不用'from module import *' 导入
	  _xxx_   系统定义名字
	  _xxx    类中的私有变量名
	
<!-- more -->
``` python server.py
#! /usr/bin/env python
# coding:utf-8
# Author: Nosea Shawn
# Date: Mon Dec 24 13:18:52 CST 2012
# Version: 0.001
# 
# Describe: 用一个聊天程序来总结一下第三章
#
# 模块名应该是不包含下划线，简短的，小写的名字

# 模块的文档字符串
"""这个是服务模块的文档字符串"""      

# 导入模块
import socket
from time import ctime
import sys

# 全局变量定义，除非必须，否则应尽量用局部变量代替全局变量
# 不希望被from M import * 来使用的全局变量，函数和类在前面加“_”
_DEBUG = True  
_PORT = 21567
_BUFSIZ = 1024
_LISTEN_NUM = 1

# 类定义 - 类名总是应该首字母大写的单词串
class DemoServer:
    """这个服务部分类的文档字符串，跨行写一般用反斜线'\'，但在
    使用闭合操作符时，单一语句可以跨多行，比如小括号，花括号，中
    括号，还有就是这里的三引号"""
    def __init__(self, port):
        """初始化"""
        self.host = ''
        self.port = port

    # 函数名和变量名一样，全部小写，多个单词以下划线分隔
    def start_server(self):  
        """开启服务"""
        try:
            self.srv_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            # 防止出现socket.error: [Errno 98] Address already in use
            self.srv_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        except socket.error, msg:
            self.srv_sock = None
            if _DEBUG:
                print msg
            
        try:    
            self.srv_sock.bind((self.host, self.port))
            self.srv_sock.listen(_LISTEN_NUM)
        except socket.error, msg:
            self.srv_sock.close()
            self.srv_sock = None
            if _DEBUG:
                print msg

        if self.srv_sock is None:
            print 'could not open socket.'
            sys.exit(1)
            
    def run_server(self):
        """等待连接"""
        while True:
            print 'waiting for connection...'
            cli_sock, addr = self.srv_sock.accept()
            print '...connected from:', addr
            print "=" * 50

            while True:
                recv_data = cli_sock.recv(_BUFSIZ)
                if not recv_data:
                    break
                print '%s: %s' % (addr[0], recv_data)
                send_data = raw_input('You: ')
                cli_sock.send('%s: %s' % (ctime(), send_data))
                
        self.srv_sock.close()
        

if __name__ == "__main__":
    srv = DemoServer(_PORT)
    srv.start_server()
    srv.run_server()
```

```python client.py
#! /usr/bin/env python
# coding:utf-8
# Author: Nosea Shawn
# Date: Mon Dec 24 13:18:52 CST 2012
# Version: 0.001
# 
# Describe: 用一个聊天程序来总结一下第三章
#
# 模块名应该是不包含下划线，简短的，小写的名字

# 模块的文档字符串
"""这个是client模块的文档字符串"""      

import socket

_DEBUG = True
HOST = '127.0.0.1'
PORT = 21567
BUFSIZ = 1024
ADDR = (HOST, PORT)


class DemoClient:
    """用户类"""
    def __init__(self, host, port):
        """初始化"""
        self.host = host
        self.port = port

    def con_srv(self):
        """连接服务器"""
        try:
            self.cli_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        except socket.error, msg:
            self.cli_sock = None
            if _DEBUG:
                print msg
            
        try:
            self.cli_sock.connect((self.host, self.port))
        except socket.error, msg:
            self.cli_sock.close()
            self.cli_sock = None
            if _DEBUG:
                print msg
            
        if self.cli_sock is None:
            print 'could not open socket'
            sys.exit(1)

    def run(self):
        """与服务器通信"""
        while True:
            send_data = raw_input('You:')    
            if not send_data:
                break
            self.cli_sock.send(send_data)
            recv_data = self.cli_sock.recv(BUFSIZ)
            if not recv_data:
                break
            print 'Server: %s' % recv_data

        self.cli_sock.close()


if __name__ == "__main__":
    client = DemoClient(HOST, PORT)
    client.con_srv()
    client.run()
```
