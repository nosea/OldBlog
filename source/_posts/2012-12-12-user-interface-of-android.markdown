---
layout: post
title: "Android的用户界面"
date: 2012-12-12 11:19
comments: true
categories: Android
---
一.概览
        The graphical user interface for an Android app is built using a hierarchy 
	of View and ViewGroup objects. View objects are usually UI widgets such as buttons 
	or text fields and ViewGroup objects are invisible view containers that define how 
	the child views are laid out, such as in a grid or a vertical list.
	    All user interface elements in an Android app are built using View and ViewGroup
	objects. A View is an object that draws something on the screen that the user can 
	interact with. A ViewGroup is an object that holds other View (and ViewGroup) objects 
	in order to define the layout of the interface.
	    --> 来自官方文档
<!-- more -->
{% img  /image_tag/viewgroup.png %}    
二.Activity, ViewGoup, View
    1.从API上看,ViewGroup继承View.
	2.Activity: Activity class takes care of creating a window for you in which you can 
	  place your UI.
