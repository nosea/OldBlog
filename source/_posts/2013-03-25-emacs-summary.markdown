---
layout: post
title: "emacs summary"
date: 2013-03-25 17:01
comments: true
categories: Linux
toc: true
---
# Introduction
    Emacs 个人备忘录
<!--more-->
# 常用按键
## 1.移动
    C-n        单行向下
	C-p        单行向上
	C-v        向下翻页
	M-v        向上翻页 
	C-f        向右移动一个字符 
	C-b        向左移动一个字符
	M-f        移动到词尾 
	M-f        移动到词首 
	C-a        跳到行首 
	C-e        跳到行尾 
	M-<        跳到文章首 
	M->        跳到文章尾 
	M-g g      跳到指定行
	C-l        当前行居中
	C-M-n      跳到与括号对应的下个括号
	C-M-p      跳到与括号对应的上个括号
	M-g-g      跳到指定的行 # or M-g g
## 2.编辑
    C-g        停止当前执行的命令
    C-@        Set Mark: 
	M-w        复制
	C-w        剪切
	C-d        删除光标所在字符
	M-d        从光标处剪切到词尾
	C-k        光标处到行尾剪切
	C-y        粘贴 
	C-x h      全选 
	-----------------------------
	c-/        撤销
	C-_        撤销 
	C-x u      撤销
	C-g C-x u  重做
	C-g C-/    重做
	C-g C-_    重做
	-----------------------------
	C-s        向前搜索
	C-r        向后搜索
	C-s C-w    搜索当前光标所在单词
	C-r C-w    同上
	-----------------------------
	M-%        替换(逐个确认)   
	M-x replace-string    替换(不确认)
	M-x replace-regexp    替换
	C-M-%      正则表达式替换
    ==================列编辑=====================
	C-x r d    删除列区域  # 删除后原位置不留空白
	C-x r c    删除列区域  # 删除后原位置保留空白
	C-x r k    剪切列区域 
	C-x r y    粘贴列区域 
	C-x r r    复制矩形区域
	C-x r i    粘贴之前复制的矩形区域
	C-x r o    插入空白的矩形区域
	C-x r t    在所有列前插入同样的字符  ==> 这个可以用来批量注释，
	                                         但是不如M-x comment-region好用
## 3.窗口
    C-x 0      关闭当前窗口
    C-x 1      关闭所有其他的窗口
    C-x 2      上下分割窗口
	C-x 3      左右分割窗口
	C-x o      跳到下一个窗口
## 4.文件，缓冲区
    C-x C-f    打开 
    C-x C-s    保存 
	C-x C-c    退出 
	---------------
	C-x C-b    列出所有缓冲区
	C-x C-w    当前缓冲区另存为
	C-x k      关闭当前缓冲区
	C-x s      保存所有缓冲区
	C-x b      跳转buffer
## 5.Just For Fun
    M-x  animate-birthday-present
	M-x  doctor
	M-x  snake
	M-x  tetris
	M-x  gomoku
	M-x  pong
# Reference
[Emacs Command](https://sites.google.com/site/caikelun/emacs/emacs-command)    
Thanks!

    
	
