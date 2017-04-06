---
layout: post
title: "awk常用函数"
date: 2013-11-24 14:52
comments: true
categories: Awk
toc: true
---
# Introduction
    收集些我觉得有用的函数
<!--more-->	
# Content
```awk
#!/usr/bin/awk -f

############################################################
# description: print column sums
# parameter:
#     filename: the file to be processed
#     sum: Local variable
#     maxln: Local variables
# return value: None
############################################################
function sum_col(filename, sum, maxln)
{
    while (getline < filename > 0)
    {
	for (i=1; i<=NF; i++)
	    sum[i] += $i
	if (NF > maxln)
	    maxln = NF
    }

    for (i=1; i<=maxln;  i++)
        printf("%d ", sum[i]);
    print ""
    close(filename)
}
############################################################
# description: print row sums
# parameter:
#     filename: the file to be processed
#     sum: Local variable
#     maxln: Local variables
# return value: None
############################################################
function sum_row(filename, sum, N)
{
    while (getline < filename > 0)
    {
	N++
	for (i=1; i<=NF; i++)
	    sum[N] += $i
    }
    for(i=1; i<=N; i++)
	printf("row %d: %d\n", i, sum[i]);
    close(filename)
}


function isnum(n)
{
    # Note: in awk, xx.0 <=> xx
    # so, '4.0' will be automatically transformed '4'
    return n ~ /^[+-]?[0-9]+$/
}


function isdecnum(n)
{
    return n ~ /^[+-]?[0-9]+[.]?[0-9]*$/
}


function isfloatnum(n)
{
    return n ~ /^[+-]?([0-9]+[.]?[0-9]*|[.][0-9]+)([eE][+-]?[0-9]+)?$/
}

BEGIN {
    testfile = "data"
    sum_col(testfile)
    sum_row(testfile)
    
    print isnum(45.0)
    print isnum(-45.01)
    print isdecnum(-45.234)
    print isfloatnum(-42.2e8)
}
```
