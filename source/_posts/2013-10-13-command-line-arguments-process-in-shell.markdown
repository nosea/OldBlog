---
layout: post
title: "Shell 命令行参数解析"
date: 2013-10-13 15:31
comments: true
categories: Shell
toc: true
---
# Introduction
        命令行参数的处理是最常用的需求，主要处理长选项和短选项
	目前常用的是getopt和getopts
<!--more-->	
# getopt
``` bash getopt的使用
#!/bin/bash
:<<EOF
 $ type getopt
 getopt is /usr/bin/getopt
 ## 通过下面的可以看出getopt是外部命令

 使用:
   getopt optstring parameters
   optstring:
   -o 后跟单个字符的短选项，如-o ab:c::
      单个字符，表示选项
      1 后跟一个冒号，表示后面必须紧跟一个参数，选项后或者
        以空格隔开
      2 后跟两个冒号，表示后面必须跟一个参数，且不能以空格隔开
	  ############# 在我测试的情况中发现，两个冒号如果没有带参数，并不会报错
      ############# 但是单个冒号的情况会报错

   --long 后跟长选项，如--long a-long,b-long:,c-long::
      冒号的说明跟短选项一致
   -n 出错时的信息
   -- 作用是让后面的不被解释成选项，因为"$@"带有'-'等参数
      eg: 比如想touch一个名为“-x”的文件
         touch -x  ## 这样会出现：touch: invalid option -- 'x'，因为解释成选项了
         touch -- -x ## 这样就可以了
         当然，删除也是：rm -- -x
 ## 下面的例子参照了/usr/share/doc/util-linux/examples/getopt-parse.bash
EOF

TEMP=$(getopt -o ab:c:: --long along,blong:,clong:: -n 'Error:' -- "$@")

if [ $? != 0 ]; then
    exit 1
fi
# Note the quotes around `$TEMP': they are essential!
eval set -- "$TEMP"

while true
do
    case "$1" in
	-a|--along)
	    echo "Option a:"
	    shift
	    ;;
	-b|--blong)
	    echo "Option b: Argument is: $2"
	    shift 2
	    ;;
	-c|--clong)
	    echo "Option c: argument is: $2"
	    shift 2
	    ;;
	--)
	    shift
	    break
	    ;;
	*)
	    echo "Internal error!"
	    exit 1
    esac
done

echo "Remaining arguments:"
for arg
do
    echo '--> '"\`$arg'"
done

```
# getopts
``` bash getopts使用示例
#!/bin/bash
:<<EOF
  $ type getopts
  getopts is a shell builtin
  ## 从上面可以看出getopts是shell内置的
  getopts只能处理短选项，使用相对getopt简单点,我把s看成simple

  OPTIND:
    变量存储$*中下一个要处理的位置，对于没有参数的选项，getopts
将OPTIND加1，对于有参数的选项，将OPTIND加2

  OPTARG:
    变量存储选项的参数值
  eg:
  -a -b s arg1
  $#值为4，当

  当getopts遇到一个非选项参数时，会将OPTINT设置为
这个参数的索引，并且停止解析
EOF

declare -a NOA ## 声明一个数组，用来存储非选项参数

while [ $# -ne 0 ]
do
   OPTIND=0 # 索引为0

   ## 处理选项参数
   while getopts ":abc:d::" opt
   do
       case $opt in
	a)
	    echo "Option a"
	    ;;
   	b)
   	    echo "Option b"
   	    ;;	   
   	c)
   	    echo "Option c: Argument is: $OPTARG"
   	    ;;
   	d)
   	    echo "Option d: Argument is: $OPTARG"
   	    ;;
   	\?)
   	    echo "Invalid option: -$OPTARG" >&2
   	    exit 1
   	    ;;
   	:)
   	    echo "Option: -$OPTARG requires an argument." >&2
   	    exit 1
   	    ;;
       esac
   done

   ## 处理非选项参数
   if [ $OPTIND -ne $(($#+1)) ]
   then
       shift $(($OPTIND-1)) ## 把前面的都去掉
       ## 把参数加入数组
       NOA=(`echo ${NOA[*]}` $1)
       shift
   else
       break; 
   fi  
done

echo "Remaining arguments:"
for arg in ${NOA[*]}
do
	echo '-->' "${arg}"
done

```
# Reference
[Bash Shell中命令行选项/参数处理](http://www.cnblogs.com/FrankTan/archive/2010/03/01/1634516.html)    
Thanks!
