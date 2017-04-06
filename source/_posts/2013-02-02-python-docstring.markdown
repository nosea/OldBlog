---
layout: post
title: "python docstring"
date: 2013-02-02 16:10
comments: true
categories: Python
toc: true
---
# Introduction
    docstring 使用
<!--more-->
# Specification
    1.docstring(文档字符串)位于module，function，class，method定义后，即":"之后。
	  它是上述object要定义的第一个内容
	2.object的__doc__属性为docstring
	3.模块正常情况下应有docstring
	4.All functions and classes exported by a module should also have docstrings
	  -->~_~不知道给如何翻译exported，悲剧
	5.公有方法(包括__init__constructor)应该有docstring
	6.一个package的docstring应位于package目录下的__init__.py文件里
	7.两个概念
	 * 紧随模块或类等声明之后的字符串为"attribute docstrings"
	 * 紧随"attribute docstrings"的字符串为"additional docstrings"
	8.文档字符串通常用三引号括起来
	  如果字符串里有任何反斜杠，用r"""xxxx"""防止转义
	  对于Unicode docstring，用u"""xxx"""
	9.有两种形式的文档字符串:单行和多行
	  单行 -- 针对仅单行的字符串就足够了
	  * 在docstring前后不要有空格，三引号在同一行，字符串结束时应有句号
	  * 应该用command的方式指出函数或者方法的作用而不是以说明的方式
        eg:
	    """简要的说明."""
	  多行 
	  * 包含一行类似单行的总结字符串，总结行之后应有一空行，空行之后时更详细的说明
	  * 三引号的缩进要一致
	  * 对于类的文档字符串，类的成员函数应与docstring有一个空行隔开，对称起见，
	    文档字符串开头也空一行.eg:
		class Example:
		
		"""Multi-line Docstrings
		
		xxxxxxxxxxxxxxxxxxxx
		....
		"""
		
		    def foo():
			...
    10.一段脚本的docstring应该位于其usage中
	11.模块的docstring应该列出其类，异常，函数或者任何其他对象，每个对象以一行总结
	   包的docstring也应该在__init__.py如上列出
	12.函数或方法的docstring应
	   总结其行为、说明其参数以、返回值、影响、引发的异常和调用的限制条件
	13.类的docstring应
	   总结其行为、列出公有方法和实例变量
	   如果类被设计来继承而且对子类含有额外的接口，那么接口应在docstring中分别列出
	   如果子类与父类行为差不多，docstring应指出不同点
	       用"override"指明子类方法覆盖父类方法
		   用"extend"指明子类方法调用父类方法
# Reference
[PEP 257 - docstring 规范](http://www.python.org/peps/pep-0257.html)  
