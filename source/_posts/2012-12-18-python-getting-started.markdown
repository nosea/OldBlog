---
layout: post
title: "Python笔记-快览"
date: 2012-12-18 16:41
comments: true
categories: Python
---
	1、变量的内容可以用print输出，也可以仅使用变量名查看该变量的原始值。
	2、print语句调用str()函数显示对象，交互解释器用repr()函数显示对象。
	3、下划线(_)在解释器中表示最后一个表达式的值。
	4、print与字符串格式化：print "%s and %d !" % ("I", 2)
	5、print语句支持将输出重定向到文件
		 eg：重定向到标准输出
		 import sys
		 print >> sys.stdout, "aaaaaaaaaaaaaaaa"
		 eg：重定向到文件
		 testfile = open('E:/WorkSpace/SE/test/b.txt', 'a')  #注意windows默认是"\"，要该为"/"
		 print >> testfile, 'bbbbbbbbbbbbbbbbb'
		 testfile.close()
<!-- more -->
	6、获得交互输入数据最简单使用raw_input()内建函数。
		 eg：name = raw_input("please input your name: ")
		 eg：num = raw_input("Enter your number: ")
		         print "after calculation,the number is %d" % (int(num) * 2)
		         # 可以使用内建函数int()将用户输入的字符串转换为整型。
	7、关于注释："#"用于单行注释，多行可用文档字符串注释: """ """
	8、标准算术操作符：+   -   *   /   //   %   **
		  单斜杠"/"和双斜杠"//"在2和3版有区别。使用时验证一下即可。
	9、标准比较操作符：<   <=   >   >=   ==   !=   <>
		  注：<>  等效于 !=  ，但逐渐被淘汰。
	10、逻辑操作符：and   or   not
		 注：python支持 "3 < 4 < 5" 的写法，其等效于"3 < 4 and 4 < 5"
	11、变量名大小写敏感并且不需要事先声明变量类型。
	12、支持增量赋值：eg n *= 10   不支持自增和自减运算。
	13、python支持五种基本数字类型
		    * 有符号整型
		        * 长整型
		        * 布尔值
		    * 浮点值
		    * 复数
		    注：3中整型和长整型已经合并。
	14、""和'' 均可用于字符串。 使用索引操作符([ ])和切片操作符([ : ])可以得到子串。
		   "+"号用于字符串连接运算，星号(*)用于字符串重复。
	15、注意列表[]和元组()的区别。
	16、字典{}，类似哈希表，由键值对构成。几乎所有的对象都可以用作键，不过数字和字符串最常用。
		    值可以为任意类型对象。
	17、if格式：
		    if expression:
		           if_suite
		    elif expression:
		           elif_suite
		    else:
		         else_suite
	18、while 格式：
		    while expression:
		          while_suite
	19、for 和内建range()函数  注：range常和len()函数一起用于字符串索引。
		    for x in range(10):
		          ..........
		    eg:   var = 'abcd'
		            for i in range(len(var)):
		                   print var[i]
	20、列表解析：
		    表示可以在一行中使用一个for循环将所有的值放到一个列表中
		    eg：var = [x ** 2 for x in range(6)]
		            mon = [x ** 2 for x in range(8) if not x % 2]    #选出了能整除2的
	21、文件操作：
		   eg：打开    file_handle = open(file_name, 'access_mode')，access_mode默认值为"r"。
	22、错误和异常：try-except语句     #新版异常有别，注意。
		    try之后为管理的代码，except之后为处理错误的代码
		    eg：
		    try:
		         file_handle = open(filename, 'r')
		     except IOError, error：     #将异常的信息保存到error
		          print 'file open error':  error
	23、函数
		   函数在使用之前必须先定义。若函数中没有return语句，自动返回None对象。
		   可以有默认值。详情后见。
	24、类
		   使用class关键字定义类。可以提供一个可选的基类，没有合适的基类，就使用object作为基类。
		   class行之后，是可选的文档字符串、静态成员定义及方法定义。
		   当一个类实例被创建时，__init__()方法会自动执行，类似构造函数。
	25、创建一个python源文件，模块的名字就是不带.py后缀的名字。一个模块创建后，可以从另一个模块
		   使用import语句导入这个模块来使用。

    

