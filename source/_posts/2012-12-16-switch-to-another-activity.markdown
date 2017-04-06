---
layout: post
title: "Activity的切换"
date: 2012-12-16 22:02
comments: true
categories: Android
---
一.同个Activity的view
    1.添加view在布局文件中添加，一般注意宽高属性
	  layout_width, layout_height
	  有fill_parent，wrap_content，match_parent三种
	2.每个view均可添加ID来引用
	  @+id/view_name
	3.EditText显示默认编辑提示字符
	  android:hint="@string/edit_message"
	  edit_message需在string中定义
	4.TextView显示默认字符
	  android:text="@string/Text_message"
	  同上要在string中定义
	5.Button显示名称
	  android:text="@string/button_name"
	  同上
<!-- more -->
二.操纵
    1.findViewById(int id)函数取得一个view的引用，记得强制转换
	2.TextView和Button的setText方法可以设置显示字符
	3.响应Button的点击操作
	    I.定义内部类实现OnClickListener接口
		II.调用Button的setOnClickListener((OnClickListener l)函数
	4.从this Activity跳转that activity
	    I.Intent intent = new Intent(this_Activity.this, that_Activity.class);
		 --> android.content.Intent.Intent(Context packageContext, Class<?> cls)
          或者Intent intent = new Intent();
		     intent.setClass(this_Activity.this, that_Activity.class);
	    II.// 使用这个Intent来启动that Activity
		   this_Activity.this.startActivity(intent);	
	5.菜单
	   // 当用户点击Menu这个按钮的时候，调用这个方法
	   public boolean onCreateOptionsMenu(Menu menu)  重写这个方法
	   调用menu的add方法
	   MenuItem android.view.Menu.add(int arg0, int arg1, int arg2, int arg3)
	   分别是groupId itemId order titleRes
	   eg: menu.add(0, 1, 1, R.string.exit);
   		   menu.add(0, 2, 2, R.string.about);
	
	  
