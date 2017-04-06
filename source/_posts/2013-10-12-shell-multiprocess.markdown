---
layout: post
title: "Shell 多进程"
date: 2013-10-12 14:50
comments: true
categories: Shell
toc: true
---
# Introduction
      Shell没有多进程的概念，但是可以通过将任务放在后台以及命名管道实现
	多进程的功能
<!--more-->	
# 后台执行
    进程放在subshell中执行，需要用到()，注意()和{}的区别
``` bash 不放在后台执行
#!/bin/bash

sub_func()
{
    ID=$1
	echo "Start Process ${ID}..."
	sleep 3
	echo "Done Process ${ID}..."
}
				
for pid in $(seq 5)
do
    sub_func ${pid}
done
echo "Done"
```

    执行结果如下：
	$ sh test.sh 
	Start Process 1...
	Done Process 1...
	Start Process 2...
	Done Process 2...
	Start Process 3...
	Done Process 3...
	Start Process 4...
	Done Process 4...
	Start Process 5...
	Done Process 5...
	Done

``` bash 多个同时进行
#!/bin/bash

sub_func()
{
    ID=$1
	echo "Start Process ${ID}..."
	sleep 3
	echo "Done Process ${ID}..."
}
				
for pid in $(seq 5)
do
    sub_func ${pid}
done
wait  ## wait的作用是等待所有子进程都执行完了再执行下面的语句
echo "Done"
```

    执行结果如下
	$ sh test.sh 
	Start Process 1...
	Start Process 3...
	Start Process 4...
	Start Process 5...
	Start Process 2...
	Done Process 4...
	Done Process 3...
	Done Process 2...
	Done Process 5...
	Done Process 1...
	Done
	
# 进程间的通信
    子进程和父进程之间的通信可以通过命名管道(FIFO)来实现.
``` bash 通信示例
#!/bin/bash

sub_func()
{
    ID=$1
    sleep 3
    echo "Start Process ${ID}..."
    sleep 2
    echo "Done Process ${ID}..."
}

FIFO_FILE=./test.$$.fifo
mkfifo ${FIFO_FILE}
for pid in $(seq 5)
do
    (
	sub_func ${pid} > ${FIFO_FILE} 2>&1;
    )&
done
echo "Start Read FIFO..."
while read line
do
    echo $line
done < ${FIFO_FILE}
echo "Done Read FIFO..."
rm -r ${FIFO_FILE}
```
