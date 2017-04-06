---
layout: post
title: "shell color format"
date: 2014-01-01 21:59
comments: true
categories: Shell
toc: true
---
# Introduction
    终端颜色打印
<!--more-->
# Preview
    通过转义序列(escape sequences)来实现颜色的输出，这些序列需要搭配转义字符，
	用"^[" 或者"<Esc>"来表示。在bash里，转义字符通过如下语法获取
	* \e
	* \033
	* \x1B
	通过man 7 ascii可以看出
	Oct   Dec   Hex   Char           
    ------------------------------
	033   27    1B    ESC (escape)
    
	格式：
	    echo -e "\e[XXmString\e[0m"  
	    or
	    echo -e "\033[XXmString\033[0m"
    说明：
	    echo的-e选项是开启解析转义序列
		"\e[0m"序列是去掉所有颜色输出属性
		"XX"代表颜色打印控制码
# Set Code
    ----------------Set----------------
    Code    说明                    
    1       加粗和明亮(Bold/Bright)       
	2       变暗(Dim)
	4       加下划线(Underlined)
	5       闪烁(Blink)
	7       取反(Reverse)，将字体颜色(前景)和背景互换
	8       隐藏(Hidden)，可以用于密码隐藏
	        PS: 密码的隐藏可以 stty -echo后再stty echo
    ----------------Reset--------------	
    Code    说明   # 全部加2    
    0       重置所有属性(Reset all attributes)
	21      重置加粗和明亮(Reset bold/bright)
	22      重置变暗(Reset dim)
	24      重置加下划线(Reset underlined)
	25      重置闪烁(Reset blink)
	27      重置取反(Reset reverse)
	28      重置隐藏(Reset hidden)
# Color Code
## 8/16位颜色
    适用大多数terminal
    ----------------Foreground--------------		
    Code    说明                    
	39      默认前景颜色(Default foreground color)
	30      黑色(Black)
	31      红色(Red)
	32      绿色(Green)
	33      黄色(Yellow)
	34      蓝色(Blue)
	35      品红(Magenta)
	36      青色(Cyan)
	37      浅灰(Light gray)
	90      深灰(Dark gray)
	91      淡红(Light red)
	92      淡绿(Light green)
	93      淡黄(Light yellow)
	94      淡蓝(Light blue)
	95      淡品红(Light magenta)
	96      淡青(Light cyan)
	97      白色(White)
    ----------------Background--------------		
    Code    说明                    
	49      默认背景色(Default background color)
	40      黑色(Black)
	41      红色(Red)
	42      绿色(Green)
	43      黄色(Yellow)
	44      蓝色(Blue)
	45      品红(Magenta)
	46      青色(Cyan)
	47      淡灰(Light gray)
	100      深灰(Dark gray)
	101      淡红(Light red)
	102      淡绿(Light green)
	103      淡黄(Light yellow)
	104      淡蓝(Light blue)
	105      淡品红(Light magenta)
	106      淡青(Light cyan)
	107      白色(White)	

# Reference
译自[Bash tips: Colors and formatting (ANSI/VT100 Control sequences)](http://misc.flogisoft.com/bash/tip_colors_and_formatting)
