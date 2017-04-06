---
layout: post
title: "Python中文编码问题"
date: 2013-10-10 21:26
comments: true
categories: Python
toc: true
---
# Introduction
    因折腾过好几次python在中文的处理乱码的情况，特此记录
<!--more-->	
# 说明
    1、Python本身对各种语言支持都很好，字符串在python内部是用unicode编码表示的。
	   python支持两种编码格式，一个是UCS-2，一个是UCS-4，可以通过如下方式查看是那种：
	>>> import sys
	>>> print sys.maxunicode
	65535   ## 这个就是UCS-2
	1114111  ## 这个就是UCS-4
	
	2、如果要做编码转换，需要借助内部编码(unicode)作为中转来转换，通常过程是这样的：
	   原编码 --decode--> 内部编码(unicode) --encode--> 要转换的编码
	   str.decode的作用是将其他编码的字符串转换为unicode编码
	   unicode.encode的作用是将unicode编码转为其他编码
	  
	3、在转为unicode时，首先得知道原来字符串的编码是什么，否则将会提示decode异常，例如：
      >>> a="非常好"  ## 这里默认的字符串是gb2312编码
	  >>> a.decode('utf-8')  ## 如果用'utf-8' 就会提示错误

	  Traceback (most recent call last):
	    File "<pyshell#9>", line 1, in <module>
	      a.decode('utf-8')
	    File "D:\Python27\lib\encodings\utf_8.py", line 16, in decode
	      return codecs.utf_8_decode(input, errors, True)
	  UnicodeDecodeError: 'utf8' codec can't decode byte 0xb7 in position 0: invalid start byte
	  >>> a.decode('gb2312')  ## 参数为正确的编码，就没有出错
	  u'\u975e\u5e38\u597d'

    4、但是在很多情况下，并不知道字符串到底是何种编码，如果不能知道字符串正确的编码，就不能把它转为
	   需要的编码，要查询字符串的编码，可以使用chardet这个字符串编码识别模块，因为是python第三方库，
	   默认没有安装，所以需要手动安装下。
	   下载地址：https://pypi.python.org/pypi/chardet
	   安装方法：
	       （1）：python setup.py install  ## 使用setup.py安装文件
		   （2）：将解压后目录下chardet文件夹放在应用程序目录下，就可以使用
		         import chardet开始使用chardet了。## 这种不用安装
				 
	   使用：
	    >>> a="非常好"
		>>> import chardet
		>>> chardet.detect(a)
		{'confidence': 0.99, 'encoding': 'GB2312'}
		>>> a.decode(chardet.detect(a)['encoding']).encode('UTF-8')  ## 字符串用GB2312转为UTF-8
		'\xe9\x9d\x9e\xe5\xb8\xb8\xe5\xa5\xbd'

    5、有些时候，需要读文本文件，需要将读出来的数据转为unicode，比如文本文件是utf-8的文件，这个时候可以
	   使用codecs模块，codecs是标准库，提供了许多方法和类，用于编码转换。
	   例子：
	   （1）先用enca -L zh xx.txt 检测文件的编码类型
	   （2）然后
	       fd = codecs.open("dddd.txt", 'r', "UTF-8") ##UTF-8就是文件的编码
		   print fd.readlines()   ## 从打印的字符串就可以看出了

# Reference
[Python chardet 字符编码判断](http://www.pythonclub.org/modules/chardet)    
[python模块之codecs: 自然语言编码转换](http://blog.csdn.net/zhaoweikid/article/details/1642015)    
Thanks!
