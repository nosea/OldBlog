---
layout: post
title: "Perl Basic"
date: 2013-11-23 00:15
comments: true
categories: Perl
toc: true
---
# Introduction
    Perl —— Practical Extraction and Report Language
<!--more-->	
# 基本
    1、执行
	   为了可移植性，跟python一样，#!/usr/bin/env perl
    2、注释
	   和shell、python等一行，以"#"井号开始的为注释
	3、告警信息
	   $ perl -w my_program  
	   或者 
	   #!/usr/bin/perl -w 
	   或者 
	   #!/usr/bin/perl
	   use warnings;
# 基本类型
## scalar
    Perl用标量(scalar)来称呼单件事物，可以是数字或者字符串,两者大多数在内部是可以转换的。
    1、数字
	   数字可以是整数和浮点数，但在perl内部，总是按照"双精度浮点数"来保存和运算数据
	   literal: 类似C++中的字面值常量(literal constant)，是某个数值在Perl代码的书写方式，
	            只是直接写在源代码里的数据。
	   
	   数字可以有以下几种书写方式:
	   浮点数：1.24， 22.00， 7.23e34(7.23乘以10的34次方), -3.23E-19(负3.23乘以10的负19次方)
	   
	   整数:
		 十进制: 0, 22, 34, 1001, 1094383221
	     八进制: 034 （以0开头）
		 十进制: 0xFF (以0x开头)
		 二进制: 0b11111111 （以0b开头，这个等于十进制255）
		 注意
		   如果太长读起来费力，也可以写成"1_094_383_221"，"ob1111_1111"
		   
	   数字操作符:
	     加(+) 减(-)  乘(*) 除(/） 取模(%) 乘方(**)
	2、字符串
       最短的是不含任何字符的空串，最长没有限制。通常字符串由可输出的字母、数字和标点符号组成，但是
	   也可以包含任何字符，所以对于二进制文件也同样适用，比如，可以将一个二进制文件读进Perl的字符串
	   里，然后修改它的值，再写回去。
	   
	   字符串的literal书写方式有以下两种:
	   单引号 —— 'abc', 'xj_33s' '\'\\' # 单引号，接着反斜杠
       注意:
	     字符串内除单引号和反斜杠，其余均表示本身字符串,要表示反斜线和单引号本身，需要在前面加反斜线
		 另外，在单引号里，反斜线只对反斜线本身和单引号本身起作用，对其他不转义。比如"\n"仅仅表示反斜线和
		 n两个字母
		 
       双引号 —— "good", "test"
	    双引号里反斜线"\"同其他语言一样，可以转义
		
	   字符串操作符:
	     点号(.) —— 字符串自动连接，"a" . "b" <=> "ab"
		 乘号(x) —— 重复，类似python的(*). "a" x 3 <=> "aaa"
    3、标量变量
       标量变量用于存储标量值，以美元$开头，后面是标识符，标识符跟其他语言一样，以字母或下划线开头，后跟
	   数字、字母、下划线
	   eg: $variable1
	   $var_1 = 23;
	   $var_2 = $var_1 + 23
	   $var_3 = "good" * 3
	   $var_4 = $var_3 . " time"
	   $var_5 += $var_1  ## 同其他语言一样，也有双目操作符
	   
	   在字符串里取得变量的值
	   $test = "good bye $var_4"   ## 感觉和shell一样了。。。
	   $test = "good bye ${var_4}" ## 这种较好
    4、比较操作符
	   比较               数字                字符串
	   大于               >                    gt
	   小于               <                    lt
	   等于               ==                   eq
	   不等于             !=                   ne
	   大于等于           >=                   ge
	   小于等于           <=                   le
	5、读取标准输入
	   $input_var = <STDIN>;   ## 遇到回车时结束
	6、chomp操作符
	   功能只有一个，去除字符串变量尾部的回车换行符，它实际是一个函数，返回值是去除的字数
	   chomp($line_var)
	   chomp($line_var = <STDIN>)  ## 从STDIN读取，然后去掉尾部的换行
	   如果尾部有两个换行符，只去除一个，如果没有换行符，则什么都不干，直接返回0
	7、初次使用
	   对于使用没有赋值的标量，数字初始默认为0，字符串默认为空串
	8、defined
	   行输入操作符<STDIN>在没有输入的情况下，会返回undef，判断字符串是空串还是undef，可以用这个
	   if (defined(${line_var})) {
	       statement
	   } else {
	       print "No Input\n."
	   }
## list和array
    列表指的是标量的有序集合，代表数据，数组是存储列表的变量，代表变量
	列表中的每个元素都是单独的标量，并且是有序的，索引是从0开始，每次加1
	因为每个元素不相关，因此每个元素可以是数字，字符串，undef等
	
	赋值
	  ##　单个
	  $array[0] = "astring"
	  $array[1] = "bstring"

	注意：
	  1、下标不一定要是具体的数字，任何可以得到数字的表达式也可以当下标，是小数的话，它会自动取整
	  2、如果对超过数组现有长度赋值，比如目前只有$array[4],那么赋值$array[50]的话，
	     array[5] —— array[49]都会是undef的。
	  3、数组的最后一个值的索引值是 $#array， 取最后一个值 $end = $array[$#array]
	    所以元素的个数为 $#array + 1
		与python类似，可以用负号表示反方向，那么-1就表示倒数第一个，因此
		$array[$#array] <=> $array[-1]
	
    列表字面值
	 (1, 2, 3)  ## 包含三个数字的列表
	 (1, 2, 3,) ## 同上，最后一个逗号忽略
	 ("str1", 3, 4)  ##　可以是不同类型的
	 () ## 空列表
	 (1..100) ## 1-100整数构成的列表，另外".."是范围操作符，每次增加1
	 
	 qw(str1 str2 str3)  <=> ("str1", "str2", "str3")  ## qw加上引号，出了()可以作为分隔符之外，
	    其他的任何标点符号也可以用来做分隔符
		比如:
		qw {
		    str1
		    str2
		    str3
		}
	
	列表的赋值
	  ## 类似python的元组赋值
	  (${var_1}, ${var_2}, ${var_3}) = ("str1", "str2", "str3")
	  (${var_2}, ${var_1}) = (${var_1}, ${var_2})  ## 互换二者的值
	  
	  ## 如果变量的个数不等于给定列表的个数
	  (${var_1}, ${var_2}) = ("str1", "str2", "str3")  ##　"str3"会被自动忽略掉
	  (${var_1}, ${var_2}, ${var_3}) = ("str1", "str2") ## ${var_3}会是undef

    数组赋值	  
	  ## 字符串数组
	  (array[0], array[1], array[2]) = ("str1", "str2", "str3")  
	  (array[0], array[1], array[2]) = qw/str1 str2 str3/                                  
	  
	  ## 引用整个数组
	  @array = qw/str1 str2 str3/   ## 在变量前加@表示整个数组
	  @copy = @array  ## 数组复制
	  
    数组POP和PUSH
	@array = 1..9
	$num = pop(@array)  ##pop去掉数组最后一个值，并且返回该值，跟python一样
# 控制流程
## if statement
    if (expression) {
	    statement
    }
	
	if (expression) {
	    statement
    } else {
	    
    }
## while statement
    while (bool) {
	    statement
	}
	
