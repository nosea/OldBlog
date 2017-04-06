---
layout: post
title: "Python多线程无法接收Keyboard interrupt信号"
date: 2013-10-11 13:25
comments: true
categories: Python
toc: true
---
#  Introduction
    如何让线程相应Keyborad interrupt信号
<!--more-->	
#  说明
    在写通信程序时，当在线程里监听时，对父线程进行Ctrl+C是无法停掉程序的，
	每次都只能用kill -9来杀掉，后发现网上有人用如下的方法实现，感觉挺好：
	原来的情况：main  --开启--> 线程
	现在的情况：main --fork--> 子进程 --开启-->线程
	                       --> main监听keyborad interrupt
						       --> 有 --> kill 子进程
							   --> 无 --> 等待
#  例子
``` python 
#!/usr/bin/env python  
#_*_ coding: utf-8 _*_
# nosea 2013-05-03

"""Use this demo to show how to exit in multithread case
when Ctrl+c are pressed."""

import sys
import socket
import threading
import signal,traceback,os
  
SERVER = '127.0.0.1'   
PORT = 8280  
MAXTHREADS = 10
RECVBUF = 1024

class EchoMsg(threading.Thread):
    def __init__(self, cs, addr):
        threading.Thread.__init__(self)
        self.socket = cs
        self.addr = addr
        print 'Establish a connection with %s with port %s' % self.addr
    
    def run(self):
        while True:
            data = self.socket.recv(RECVBUF)
            if not data:
                break
            self.socket.send('Message has been recieved.')
            
        # I could not find a way to detect whether a connection is closed.
        print "Connection from %s:%s has been broken" % self.addr
        self.socket.close()

class ListenSvr(threading.Thread):
    """Listen thread.
    Once a new connection established, will use EchoMsg to start
    a new thread to handle this connection."""
    def __init__(self):
        threading.Thread.__init__(self)
        self.socket = None
        print 'Start Listen...'
        
    def run(self):
        try:
            self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            # reuse a local socket in TIME_WAIT state
            # if not-->socket.error: [Errno 98] Address already in use
            self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            self.socket.bind((SERVER,PORT))
            self.socket.listen(2)
        except socket.error, msg:
            self.srv_sock = None
            print "[Listen Error:] %s" % msg
            sys.exit(1)

        while True:
            cs,addr = self.socket.accept()
            cs_td = EchoMsg(cs, addr)
            cs_td.setDaemon(True)
            cs_td.start()

        self.socket.close()



class Watcher:
    """this class solves two problems with multithreaded
    programs in Python, (1) a signal might be delivered
    to any thread (which is just a malfeature) and (2) if
    the thread that gets the signal is waiting, the signal
    is ignored (which is a bug).

    The watcher is a concurrent process (not thread) that
    waits for a signal and the process that contains the
    threads.  See Appendix A of The Little Book of Semaphores.
    http://greenteapress.com/semaphores/

    I have only tested this on Linux.  I would expect it to
    work on the Macintosh and not work on Windows.
    """

    def __init__(self):
        """ Creates a child thread, which returns.  The parent
            thread waits for a KeyboardInterrupt and then kills
            the child thread.
        """
        self.child = os.fork()
        if self.child == 0:
            return
        else:
            self.watch()

    def watch(self):
        try:
            os.wait()
        except KeyboardInterrupt:
            # I put the capital B in KeyBoardInterrupt so I can
            # tell when the Watcher gets the SIGINT
            print 'KeyBoardInterrupt'
            self.kill()
        sys.exit()

    def kill(self):
        try:
            os.kill(self.child, signal.SIGKILL)
        except OSError: pass

        
if __name__ == '__main__':
    Watcher()          
    asvr = ListenSvr()
    asvr.start()
```
# Reference
[http://greenteapress.com/semaphores/](http://greenteapress.com/semaphores/)    
Thanks!
