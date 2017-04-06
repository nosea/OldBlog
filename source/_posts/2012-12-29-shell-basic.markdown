---
layout: post
title: "shell basic"
date: 2012-12-29 16:34
comments: true
categories: Shell
toc: true
---
# Introduction
    记录一些基本的shell编程知识
<!-- more -->
# 1 基本概念
## 1.1 shell命令的执行
    * 登录系统后，我们会取得一个交互的shell，称为login shell 或 primary shell。
    * 从进程的角度来讲，在shell执行的命令，shell会fork一个子进程执行
	* 若是执行shell script的话，脚本的命令则由另外一个非交互的子shell来执行
## 1.2 常见shell类型
    * sh:
	  burne shell (sh), burne again shell (bash)
	* csh:
	  c shell (csh), tc shell (tcsh), korn shell (ksh)
## 1.3 shell 提示符(prompt)
    $ -- 一般用户
	# -- root用户
    * 在shell中，屏幕上不断闪烁的方块或底线为游标(cursor).
	* 用户在得到shell prompt后才能键入命令，cursor指明命令目前输入位置，
	  用户每输入一个键，cursor往后移动一格，直到遇到CR(Carriage Return,由回车键产生)字符为止
	* 严格讲，命令行就是在shell prompt 和 CR字符之间所输入的文字
## 1.4 shell命令行格式
    * 一个标准的命令行格式为:
	  command_name options argument
	* IFS -- Internal Field Seperator
	  默认分隔符，可以由一个或多个空格(white space), Tab, 回车(Enter)组成
	* 系统可接受的命令来自:
	  - 明确路径所指的外部命令
	  - alias的别名
	  - 自定义的函数名称
	  - shell 内建命令(built-in)
	  - $PATH 之下的外部命令
## 1.5 普通字符与特殊字符
    * literal: 对shell来说没有特殊功能
    * meta: 对shell来说具有特殊功能
     ============================================================
	 #     注释
     IFS   由<space>或<tab>或<enter>三者之一组成(常用space)
	 CR    由<enter>产生
	 =     设定变量
	 $     变量或运算替换
	 >     重定向stdout
	 <     重定向stdin
	 |     管道pipe
	 &     重导向file descriptor ， 或将命令放置后台执行
	 ( )   将其内的命令置于nested subshell执行，或用于运算或命令替换
	 { }   将其内的命令置于non-named function中执行，或用在变量替换的界定范围
	 ;     在前一个命令结束时，忽略其返回值，继续执行下一个命令
	 &&    在前一个命令结束时，若返回值为true，继续执行下一个命令
	 ||    在前一个命令结束时，若返回值为false，继续执行下一个命令
	    -- 注意，在shell中return value只有两种
		   0    -- 为真(true)
		   非0  -- 为假(false)
	 ============================================================
    * 如果想去掉上面meta的特殊功能，需要quoting处理，在bash中，常见的quoting有三种:
	  hard quote -- ''(单引号)，凡在hard quote中的所有meta均被关闭
	  soft quote -- ""(双引号)，在soft quote中的大部分meta被关闭，少数保留，如$
	  escape     -- \(反斜线)，只有紧接在escape之后的单一meta才被关闭
	  注意，引号里的引号，其quoting功能是被关闭的
	  eg: echo "'$xxx'",是可以打印出$xxx的值的
	* 区分shell meta 和 command meta
	  如果命令中作为命令的参数的内容里有shell的meta，一定要quoting掉其特殊功能，否则
	  传给命令的参数就会被shell解释成特殊字符
## 1.6 变量
    * 在bash中可以用"="来设定或重新定义变量的内容: name=value
	  rules:
	  -- 等号两边不能有IFS，也应该避免meta charactor
 	  -- 变量名称不能使用$符号
	  -- 第一个不能是数字
	  -- 大小写有区别的
	* 变量替换
	  shell会根据IFS将command line所输入的文字拆解成"字段"(word)。然后再针对特殊字符(meta)先做
	  处理，最后再重组整行command line。
	* Append变量
	  用${xxx}YYY
	* export
	  在当前shell所定义的变量，均属于本地变量(local variable)
	  用export输出的变量，为环境变量
	* 取消变量用unset，注意unset和export命令行一样，会做变量替换
## 1.7 exec, fork和source的区别
    1.fork
	  当子进程产生的时候会从父进程那里继承资源，如环境变量
	  环境变量其实就是那些会传给子进程的变量，简单而言，"遗传性"就是区分本地变量与环境变量的决定性
	  指标，另外一点，环境变量只能从父进程到子进程单向继承。
	2.source
	  所谓source就是让script在当前shell内完成，而不是产生一个sub-shell来执行
	  ./xx.sh  ===>   source ./xx.sh
	3.exec
	  exec也是让script在同一个进程上执行，但是原有的进程则被结束了。
## 1.8 () 和 {} 的差别
    ()  是将command group置于sub-shell去执行，也称为nested sub-shell
	{}  是在同一个shell内完成，也称为 non-named command group
	所谓function，就是用一个名字去命名一个command group，然后再调用这个名字去执行command group
## 1.9 $(()) 、 $() 与 ${} 的区别
    1.在bash shell里，$() 与 ``(反引号)都是用来做命令替换的  
	  -- 完成括号里的命令行，然后将其结果替换出来，再重组命令行
	2.${} 会比较精确的界定变量名称的范围
	  一般情况下 $var 和 ${var}并没有什么不一样
	3.$(())
	  在bash中，$(())用来作整数运算的
## 1.10 test的用法
    1.用法
	 test expression
	 or:
	 [ expression ] # 注意[]之间的空格键
	2.测试对象支持
	 string: 字符串，也就是纯文字
	 integer：整数(0或正正整数，不含负数或者小数点)
	 file：文件
## 1.11 > 和 <区别
    shell里最常用的FD有三个:
	0: stdin    ==>   keyboard
	1: stdout   ==>   monitor
	2: stderr   ==>   monitor
	< 符号之前需要指定一个FD(之间不能有空白)，因为0是<的默认值，因此< 和 0< 是一样的
	<< 是Here Document，允许输入一段文本，直到读到<<后指定的字符串.
	1>  ==> 改变stdout的输出信道，由于1是>的默认值，因此 1> 和 > 是相同的
	2>  ==> 改变stderr的输出信道
	2>&1 是将stderr并进stdout作输出
	1>&2 是将stdout并进stderr作输出
	全部屏蔽
	command >/dev/null 2>&1  <=> command &>/dev/null  <=> command >&/dev/null
# 2 控制结构
## 2.1 条件语句
### if...then语句
``` bash
if [ test_command ] # [ ]两边的空格一定要留着，否则语法错误
then
    commands
fi
``` 
### if...then...else语句
``` bash
if [ test_command ]
then
    commands
else
    commands
fi
```
### if...then...elif...else语句
``` bash
if [ test_command ] 
then
    commands
elif [ test_command ]
then
    commands
    .
    .
    .
else(optional)
    commands
fi
```
## 2.2 循环语句
### for...in语句
``` bash
for loop_variable in argument_list
do
   commands
done
```
### while语句
``` bash
while test_condition_is_true   # 当condition条件成立时，就进行循环
do
    commands
done
```
### until语句
``` bash
until test_condition_is_true  # 当condition条件成立时，不进行循环，与while相反
do
    commands
done
```
## 1.3 case语句
``` bash
case $variable in
match_1)
	commands_to_execute_for_1
	;;
match_2)
	commands_to_execute_for_2
	;;
match_3)
	commands_to_execute_for_3
	;;
.
.
.
*) # 可选的，任何其它的情况
	commands_to_execute_for_no_match
	;;
esac
```
# 3 函数
## 3.1 定义
```
函数的两种形式：
function function_name           function_name ()
{                                {
    commands to execute     或       commands to execute
}                                }
```
# 4 注释
## 4.1 块注释
``` bash
:<< EOF
此处是你想注释的内容
EOF
```
# Reference
* Mastering UNIX shell Scripting SECOND EDITION
* NetMan - 《shell 13 问》
