---
layout: post
title: "shell for loop"
date: 2012-12-29 20:01
comments: true
categories: Shell
---
# Introduction
    shell for 循环详解
<!-- more -->
``` bash
#!/bin/bash
#example of 'for'
# 相对与while和until的循环方式，for循环则是适用于循环次数已经知道
# 的情况
# bash for 循环总的来说有两种方式，一种是C语法for循环，另一种是自身的。
:<<EOF
for 循环的语法：
for var in con1 con2 con3 ...
do
      程序段
done
  其中con1 con2 con3 ...可以就是普通的变量，也可以是命令的运行结果
如`ls`, 当然也可以是文件夹内的文件。
EOF
for var in `ls` 
do
    echo "We have $var files"
done

:<<EOF
类似C的写法：
for (( 变量初始化; 条件判断; 变量自变 )); do 要执行的命令; done;
注意是用两个括号。
EOF
for (( i = 0; i < 10; i++))
do
    echo $i
done
```
# Reference
[鸟哥](http://linux.vbird.org/)
