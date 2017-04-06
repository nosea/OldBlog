---
layout: post
title: "Python Error Log"
date: 2012-12-24 19:49
comments: true
categories: Python
---
列表:
    1.TypeError: 'module' object is not callable
	  出现这种错误，说明忘记在某个地方加上模块名了
	  Python导入模块的方法有两种：import module 和 from module import，
	  区别是前者所有导入的东西使用时需加上模块名的限定，而后者不要
	2.socket.error: [Errno 98] Address already in use
	  官方解释:Running an example several times with too small delay between executions, 
	  could lead to this error
