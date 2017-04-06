---
layout: post
title: "Tcl note one"
date: 2013-08-04 23:07
comments: true
categories: Tcl
toc: true
---
# Introduction
    Tcl 学习笔记1
<!--more-->
# Cotent
``` tcl
#!/usr/bin/tclsh

# Print
puts "print statement"
puts "comment after statement"; # notice, ";" is needed.

# Assignment
set num 100; # assignment statement
puts "the number is $num"; # use the varible
puts {dddd"ddd"ddd"ddd"$num $sss}; # remmember this.
# all content in [] is just a string, will not escape or reference

# Execute command
# "[]" just like " `` " or " $() " in shell, execute the content it contains and return the result of the command.
puts [set num 200]
puts "the number is [set num 300]"

set var_1 10
set var_2 20
puts "the sum of var_1 and var_2 is [expr $var_1 + $var_2]"
puts "the square root of var_2 is [expr sqrt($var_2)]"

# switch
set var_3 300
# see the above, content in {} will not escape or reference
switch $var_3 \
    "$num" {puts "the sum of a and b is [expr $var_2 + $var_1]"}\
    "300" {set var_1 100; puts "oh, the var_1 is $var_1"}\
    "abc" {puts "abc"}\
    "default" {puts "this is the default value."}

switch $var_3 {
    "$num" {puts "the sum of a and b is [expr $var_2 + $var_1]"}
    "300" {set var_1 100; puts "oh, the var_1 is $var_1"}
    "abc" {puts "abc"}
    "default" {puts "this is the default value."}
}

# if statement
puts "$num, $var_1"
if {$num == $var_1} {
    puts "oh, this is unbelievable"
} else {   # the space around the else is need.
    puts "shit, damn you."
}

# if statement
puts "$num, $var_1"
if "$num == $var_1" {
    puts "oh, this is unbelievable"
} else {   # the space around the else is need.
    puts "shit, damn you."
}


# while loop
while {$var_2 >= 1} {
    puts "$var_2"
    set var_2 [expr $var_2 - 1]
}

# for loop
# set x [expr $x + 1] is equal to incr x
for {puts "start:"; set i 0} {$i < 3} {incr i; puts "i after incr: $i"} {
    puts "ok"
}

# proc
# format -- proc name args body
proc sum_total {arg_1 arg_2} {
    set dax [expr $arg_1 + $arg_2]
    puts $dax
    return $dax
}

# how to call the proc
sum_total $var_1 $var_2
puts [sum_total $var_1 $var_2]
```

# Reference
TCL 脚本入门教程
