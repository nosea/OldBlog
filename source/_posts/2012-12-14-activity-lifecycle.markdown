---
layout: post
title: "Activity 生命周期"
date: 2012-12-14 12:38
comments: true
categories: Android
---
一.基本生命周期    
{% img /image_tag/basic-lifecycle.png %}
<!-- more -->
    关于各种状态的说明
    Resumed
        In this state, the activity is in the foreground and the user can interact with it. 
		(Also sometimes referred to as the "running" state.)
    Paused
        In this state, the activity is partially obscured by another activity—the other activity 
		that's in the foreground is semi-transparent or doesn't cover the entire screen. The paused 
		activity does not receive user input and cannot execute any code.
    Stopped
        In this state, the activity is completely hidden and not visible to the user; it is considered 
		to be in the background. While stopped, the activity instance and all its state information 
		such as member variables is retained, but it cannot execute any code.
    The other states (Created and Started) are transient and the system quickly moves from them to the 
	next state by calling the next lifecycle callback method. That is, after the system calls onCreate(), 
	it quickly calls onStart(), which is quickly followed by onResume().
二.之间的转换  
{% img /image_tag/activity_lifecycle.png %}    
1.第一次运行程序时, 函数运行顺序是： 
    onCreate() -> onStart() ->  onResume().    
{% img /image_tag/launch_activity.png %}    
2.程序运行时按下Back键后, 从onResume()状态：
    onPause() -> onStop() -> onDestory().    
{% img /image_tag/press_back.png %}    
3.程序运行时按下Home键后，从onResume()状态：
    onPause() -> onStop().    
{% img /image_tag/press_home.png %}    
4.按下Home键后，在菜单中运行程序或者长按Home键，从onStop()状态：
    onRestart() -> onStart() -> onResume().    
{% img /image_tag/re_launch.png %}    
5.当前Activity跳转到另外的Activity的时候(注意，是全部覆盖), 从第一个Activity的 onResume()状态：    
    First's onPause() -> Second's C-S-R -> First's onStop()
	如果是部分覆盖，则不调用onStop()方法
{% img /image_tag/one-to-another.png %}    
6.返回到先前的Activity时，从当前Activity的onResume()状态：    
    Second's onPause() -> First's R-S-R -> Second's S-D     
{% img /image_tag/activity_reback.png %}    
Reference:    
[官网](http://developer.android.com/training/basics/activity-lifecycle/index.html)    
[两分钟彻底让你明白Android Activity生命周期(图文)!](http://blog.csdn.net/android_tutor/article/details/5772285)     
感谢原作者！
