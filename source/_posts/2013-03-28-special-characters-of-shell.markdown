---
layout: post
title: "Special Characters of Shell"
date: 2013-03-28 23:53
comments: true
categories: Shell
toc: true
---
# Introduction
    shell 特殊字符
<!--more-->	
# Content
## # 
    1、注释
	   在同一行写注释注意命令尾和#之间要有空格分开
	   eg: 
	   $ echo Test#This is not a comment
	   Test#This is not a comment
	   $ echo Test #This is not a comment
	   Test
	2、被quoted或者escaped则后面不表示注释
	   eg: "#", '#'  or \#
	3、用于参数替换结构中
	   eg:
	4、用于数值常量表达式
## ;                    semicolon
    command separator，允许多个命令在同一行上
## ;;                    double semicolon
    用于case语句中
## .                    dot
   	1、同source
   	2、隐藏文件的名称前缀
   	3、代表当前目录  <=> $PWD
   	4、regexp里匹配单个字符
## "                    double quote
    partial quoting，weak quoting
## '                    single quote
    full quoting, strong quoting
## ,                    comma operator
    1、逗号操作符，用于连接一系列运算，但只返回最后一个运算的值
	   eg:  let "a=((4+1, 5+1, 7+3))"
	2、串联字符串
	   eg:
	   $ mkdir -p test{,1}/{a,b,c}
	   t$ tree 
	   .
	   ├── test
	   │   ├── a
	   │   ├── b
	   │   └── c
	   └── test1
	       ├── a
		   ├── b
		   └── c
## \                    backslash
    escape[backslash]
## /                    forward slash
    1、文件路径分隔符
	2、除法
## `
    command substitution
## :                    colon
    1、null command -- "NOP", 不做任何操作, 其exit status是true(0)
	  eg:
	  while :
	      xxx
	      ...
	  done
	2、作为一个placeholder
	  eg:
	  : ${username=`whoami`}
	  
	  # 如果有个变量没有设定的话，会打印出错信息
	  : ${HOSTNAME?} ${USER?} ${MAIL?} 
	  
	  # 清空一个文件
	  : > data.log
	  # 等效于
	  cat /dev/null > data.log
	3、field分隔符，在/etc/passwd里，在$PATH变量里
## !
    取反
## *                    asterisk
    1、wild card，本身匹配目录里的每个文件
	2、在regexp里匹配位置前面的0~多个
	3、乘号
## ?
    1、test operator
	   eg:((a=b<4?5:6))
	2、wild card，匹配单个
	3、regexp里匹配前面是null 或者string
## $
    1、variable substitution
	2、regexp里指末尾
## ${}
    parameter substitution
## $*, $@
    positional parameters
## $?
    exit status variable,包括command，function，script
## $$
    process ID variable
## ()                    parentheses
    1、command group
	  注意:
	    圆括号里的命令在subshell里执行
	2、数组的初始化
	  array=(1 2 3)
	  echo ${array[0]}
## {xxx,yyy,zzz,...}	  
    Brace expansion
	echo "It's gonna be"\ {alright,ok}!
## {1..4}，{a..z}	
    Extended Brace expansion
## {}                    curly brackets  
    1、Block of code
	   as an inline group，事实上，这个生成了一个没有名字的函数，
	   在{}里的命令是自动运行的，而函数，是你必须手动调用才运行，
	   而且函数运行后，里面的变量在外面也可见
	   {}是在当前shell中执行的，而不是subshell
       注意格式必须是
	   { command_to_execute; }  # 前后的空格是必须的
	2、{} placeholder for text
## []
    1、Test
	   在里面的是测试表达式，这个是shell内置的测试表达式,而不是/usr/bin/test
	2、取数组的值
	3、range of characters
	   regexp里的[]表示其中的任意一个
## [[]]	
    比[]更加灵活的测试表达式
## $[]                    integer expansion
    计算位于$[]的整数表达式
	eg:
	$ echo $[4+5]
	9
## (())                    integer expansion
    计算位于(())的整数表达式
## > &> >& >> < <>
    1、重定向
	   eg:
	   command &> fd  # 是将命令的stdout和stderr重定向到fd
	   command >&2  # 将命令的stdout重定向到stderr
	2、比较操作
## <<
    redirection used in a here document
## <<<	
    redirection used in a here string
## \\<, \\>
    regexp里的word boundary
	grep '\<time\>' file
## |                    pipe
    将上一个命令的stdout发送到下一个命令的stdin
## >|
    force redirection
## ||, &&
    逻辑操作符OR
    逻辑操作符AND
## &
    Run job in background
## -
    1、option, prefix
    2、redirection from/to stdin or stdout [dash]
	3、上一个工作目录
	   eg: cd -
	4、减号
## =
    赋值
## +
    1、加号
	2、regexp里
## %
    modulo(取模)
## ～
    home directory <=> $HOME
## ~+
    current working directory <=> $PWD
## ~-
    previous working directory <=> $OLDPWD
## ^
    regexp里表示行首
## whitespace
    作为commands或者variables的分隔符
	$IFS 默认为whitespace，作为命令的分隔符
# Reference	
ABS-guide CHA-3    
Thanks!	
