---
layout: post
title: "HTML Basic"
date: 2014-01-05 22:44
comments: true
categories: Html
toc: true
---
# Introduction
    html基础
<!--more-->
# Content
## Basic terminology
    HTML —— HyperText Markup Language(超文本标记语言),
	       Hypertext means "text with links in it."
    <!DOCTYPE html>  —— 放在第一行，用于告诉浏览器是什么类型的文件		   
	Tag —— 由尖括号包围的词，如<html>,<body>，几乎总是成对出现
	       <html> —— 类似这种的为开始标签(opening tag)
		   </html> —— 类似这种的为结束标签(closing tag）
		   标签可以有属性
		   标签可以嵌套
	element —— 标签和标签之间内容合起来为元素，
	    即element = <opening tag> + content + <closing tag>
    注释 —— <!--  这个之间的为注释  -->
## Attribute
    style —— 修饰字体颜色，大小，页面背景等，多个以分号相隔
	    eg: style="font-size:20px; color:green"
	    style="font-size:10px" -- 字体大小
		style="color:green" —— 字体颜色
		style="font-family:Garamond" —— 字体类型
		style="background-color:green" —— 背景颜色，设置body对应整个网页，其他则局部
		style="text-align:center" —— 居中，也可以是左对齐或者右对齐
	colspan -- 表格头占用格数
	    eg: <th colspan="3">xxxx<th>  ## 占用3格
    height -- 高度
    width -- 宽度
	border -- 边框
	text-decoration: none   —— 去掉链接的下划线
	margin: auto; -- div居中
	
## Tags
	<html> —— 用于开始html文件，所有的内容都应在html标签内
	<head> -- 里面的文本描述网页的重要信息，如标题等
	<title> -- 网页标题，在标题栏可见
	<body> -- 里面的内容为可见的页面内容
	<p> —— 里面的内容为段落
	<h1> —— 里面的内容显示为标题，html提供了6个标题标签，即<h1>到<h6>，<h1>最高
	<img> —— 显示图片，必须包含src属性告诉html哪里去获得图片，即<img src="url"/> ，注意是自关闭的
	<a> —— 显示链接，用href属性说明链接是哪一个，即<a href="url">
	       href stands for "hypertext reference." 
		   里面的内容可以是文本或者图片之类的
    <ol> —— 顺序列表
	<li> —— 列表项
	<ul> —— 无序列表
	<strong> —— 加粗
	<em> —— 强调(倾斜)
	<table> -- 定义表格
	  <thead> -- table head
	    <th> -- table head data
	  <tbody> -- table body
	  <tr> -- 创建表的行
	    <td> -- table data  # 多个td即多个列
	<div> -- divide webpage into pieces
	<span> -- control styling for smaller parts
## CSS
    1、放置的方式有两种:
	  I、放置在style里 eg:
	  <head>
	  	<style>
	  	    p {
	  		    color: red
	  		}
	  	</style>
	  </head>
	  II、使用<link>标签，并且link标签必须包含三个属性 # 自关闭标签
	  type="text/css"  # 必须为这样
	  rel="stylesheet" # 必须为这样
	  href="" # 指定CSS文件地址
	  eg:
	  <head>
	  	<link type="text/css"; rel="stylesheet"; href="stylesheet.css"/>
	  </head>
	2、CSS语法
	  1) 通用语法
	  selector {
          property: value;
      }
	  2) 注释
	  /* This is a comment */
    3、class
	  .name {
	      color: red
      }
    4、id
	  #name {
	      color: red
      }
	5、pseudo-class selectors
	  selector:pseudo-class_selector {
          property: value;
      }
	  1) for a:
	    link -- unvisited
		visited -- visited
		hover -- 鼠标经过时
	  2) first child
	    p:first-child {
		    color: red
        }
	  3) nth child
	    p:nth-child(3) {
		    color: red
        }
	6、margin --> border --> pandding --> content
	7、float:left/right
	8、clear:left/right/both
	9、z-index: 1  # 一直在页面前
	

