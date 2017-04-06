---
layout: post
title: "Awk Skills"
date: 2013-03-26 16:50
comments: true
categories: Awk
toc: true
---
# Introduction
    Awk 常用技巧
<!--more-->
# Content
## One-liners  
    1、打印行数
	    END {print NR}
	2、打印第N行
	    NR == N
	3、打印每行的最后一个Field
	    {print $NF}
	4、打印最后一行的最后一个Field
	    {field = $NF}
	    END {print field}
	5、打印超过4个field的行
	    NF > 4
	6、打印最后一个field大于4的行
	    $NF > 4
	7、统计所有field的个数
	    {nf = nf + NF}
	    END {print nf}
	8、统计包含xxx的行数
	    /xxx/ {nlines = nlines + 1}
	    END {print nlines}
	9、打印第一个field最大的field和它所在的行(假设$1有大于0的行)
	    $1 > max {max = $1; maxline = $0}
	    END {print max, maxline}
	10、打印至少有一个field的行
	    NF > 0
	11、打印超过80个字符的行
	    length($0) > 80
	12、打印field个数和行
	    {print NF, $0}
	13、打印头两个field，逆序
	    {print $2, $1}
	14、交换每行的头两个field，然后打印行
	    {temp = $1; $1 = $2; $2 = temp; print}
	15、将第一个field替换为行号，然后打印
	    {$1 = NR; print}
	16、将第二个field清空，然后打印
	    {$2 = ""; print}
	17、将每行的field逆序打印
		{   for(i=NF; i>0; i=i-1) printf("%s ", $i)
		    printf("\n")
		}    
	18、计算每行field值的和，并打印(假设都是数字)
        {   sum = 0
            for(i=1; i<=NF; i=i+1) sum = sum + $i
        	print sum
        }
	19、将所有的field值加起来，打印
	    {for(i=1; i<=NF; i=i+1) sum = sum + $i}
	    END {print sum}
	20、将每行的field都换成绝对值后再打印
        {   for(i=1; i<=NF; i=i+1) if($i < 0) $i = -$i
            print 
        }
	21、去除相同的行
	    awk '!a[$0]++'
	22、打印第一个field是以M之后的字母开头的单词的行
	    awk '$1 > "M"'
	23、获取机器的公网IP
		ifconfig | awk -F'[ ]+|:' '/inet addr/{if($4 !~ /^192\.168|^172\.(1[6-9]|2[0-9]|3[0-1])|^10\.|^127|^0/) print $4}' 
    24、去掉每行中的第一个field
	    awk '{print substr($0, index($0, $2))}'
## 在awk中引用shell变量
    $ name='Tom'
	$ awk 'BEGIN{print "'$name'"}'
	Tom
	$ awk -v s_name=$name 'BEGIN{print s_name}'
	Tom
	注意：如果变量中包含空格，应该这样使用, 即两边双引号，中间单引号
    a=$(date  +"%Y-%m-%d %H:%M:%S" -d"3 days")
    b=$(date  +"%Y-%m-%d %H:%M:%S")
    echo "good" | awk  '{if("'"$a"'" != "'"$b"'")print "llll"}'
## 在awk中使用shell命令
    awk 'BEGIN{system("echo \"Enter number:\""); getline num; print "num is: " num}'
	# 注意引号的转义
	awk 'BEGIN{"whoami" | getline ; print "Your name is: " $0}'
# Exercises
    $ cat a.txt 
	111 org
	222 edu
	333 gov 
	444 net 
	$ cat b.txt 
	111 Tom Green.
	444 Ani Teen.
	888 Dany Cross. 
	# 结果要求
	----------------------------------------------------
	111--org--Tom--Green.
	444--net--Ani--Teen.
	----------------------------------------------------
	$ awk -v OFS='--' 'NR==FNR{a[$1]=$2}; NR!=FNR && a[$1]{print $1, a[$1], $2, $3}' a.txt b.txt 
# Reference
The Awk Programming Language
