---
layout: post
title: "Android的布局"
date: 2012-12-19 16:43
comments: true
categories: Android
---
一.关于一些属性
   	android:id - 为控件指定id
   	android:text - 指定控件中显示的文字，这里尽量用string.xml
   	android:gravity - 指定控件中的内容的基本位置，比如居中，居右
   	android:textSize - 指定控件当中的字体大小
   	android:width - 指定控件的宽度
   	android:height - 指定控件的高度
   	android:padding* - 指定控件的内边距，调整内容和边框之间的距离
	  也可以之用padding来用
   	android:singleLine - 如果设置为真的话，则控件的内容将在同一行显示 
   	android:background - 设置背景色
	android:layout_margin* - 设置控件之间的距离 px
<!-- more -->
二.LinearLayout - 线性布局
    1.可以使所有的控件按照单一的方向摆放(垂直或水平)
	2. android:layout_weight属性可以设置控件所占空间比例，默认值为0
	3.android:layout_gravity属性设置控件的基本位置
三.TableLayout - 表格布局
    1.继承自LinearLayout
	2.包含很多TableRow对象，一个TableRow就是一行，每个TableRow里有多少控件，就有多少列
	3.可以使控件放在行或列中
	4.android:stretchColumns属性设置某一列为拉伸列，列顺序是从0开始
``` xml
<?xml version="1.0" encoding="utf-8"?>
<TableLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent"
    android:stretchColumns="1">
    
	<TableRow >
	    <TextView 
			android:padding="3dip"
			android:background="#aa0000"
	        android:text="@string/first_column"/>
	    <TextView 
			android:padding="3dip"
			android:background="#00aa00"
			android:layout_gravity="center"
	        android:text="@string/second_column"/>  
	          
	    <TextView
			android:padding="3dip"
			android:layout_gravity="right"
			android:background="#0000aa"
	        android:text="@string/third_column"/>
	</TableRow>	
	
	<TableRow >
	    <TextView 
			android:padding="3dip"
	        android:text="@string/first_column"/>
	    <TextView
			android:padding="3dip"
			android:gravity="right"
			android:background="#00aa00"
	        android:text="@string/second_column"/>
	</TableRow>	
	<TableRow >
	    <TextView 
			android:padding="3dip"
	        android:text="@string/first_column"/>
	    <TextView
			android:padding="3dip"
			android:gravity="center"
			android:background="#00aa00"
	        android:text="@string/second_column"/>
	</TableRow>	
</TableLayout>
```
    1.从上面的程序结果可以看出，每行的列数不均匀时，每一列都不可越过另一列的界限
	2.android:stretchColumns最好设置，否则排列很难看
	
四.RelativeLayout - 相对布局
     android:layout_above 将该控件的底部至于给定ID的控件之上
     android:layout_below 将该控件的顶部至于给定ID的控件之下
     android:layout_toLeftOf 将该控件的右边缘和给定ID控件的左边缘对齐
     android:layout_toRightOf 将该控件的左边缘和给定ID控件的右边缘对齐
     
     android:layout_alignBaseline 将该控件的baseline和给定ID控件的baseline对齐
     android:layout_alignBottom 将该控件的底部边缘和给定ID控件的底部边缘对齐
     android:layout_alignLeft 将该控件的左边缘和给定ID控件的左边缘对齐
     android:layout_alignRight 将该控件的右边缘和给定ID控件的右边缘对齐
     
     android:layout_alignParentBottom 如果该值为true，则将该控件的底部和父控件的底部对齐
     android:layout_alignParentLeft 如果该值为true，则将该控件的左边和父控件的左边对齐
     android:layout_alignParentRight 如果该值为true，则将该控件的右边和父控件的右边对齐
     android:layout_alignParentTop 如果该值为true，则将该控件的顶部和父控件的顶部对齐
     
     android:layout_centerHorizontal 如果值为真，该控件被置于水平方向的中央
     android:layout_centerInParent 如果值为真，该控件被置于父控件水平方向和垂直方向的中央
     android:layout_centerVertical 如果值为真，该控件被置于垂直方向的中央
	 
``` xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="fill_parent"
    android:layout_height="fill_parent"
    android:paddingLeft="16dp"
    android:paddingRight="16dp" > 
    <Button
        android:id="@+id/one"
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:text="@string/strOne"/>
    <Button
        android:id="@+id/two"
        android:layout_below="@id/one"
        android:layout_width="100dp"
        android:layout_height="wrap_content"
        android:text="@string/strTwo"/>
    <Button
        android:id="@+id/three"
        android:layout_toRightOf="@id/two"
        android:layout_below="@id/one"
        android:layout_width="100dp"
        android:layout_height="wrap_content"
        android:text="@string/strThree"/>
    <Button
        android:id="@+id/four"
        android:layout_toRightOf="@id/three"
        android:layout_below="@id/one"
        android:layout_width="100dp"
        android:layout_height="wrap_content"
        android:text="@string/strFour"/>
</RelativeLayout>
```
	
五.关于嵌套布局
    1.当嵌套多个布局文件时，比如多个LinearLayout时，注意android:layout_weight的分配
    2.当内容不同时，即使android:layout_weight一样，占用的空间也不同
	3.各种布局文件的嵌套可以实现较实用和美观的界面


Reference:    
[mars的视频教程](http://www.marschen.com/)   
Thanks!
