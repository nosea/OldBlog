---
layout: post
title: "把Emacs添加到右键菜单"
date: 2012-12-21 19:49
comments: true
categories: Linux
---
    1.打开regedit
	2.HKEY_CLASSES_ROOT\*\shell\下新建Edit with Emacs
	3.在Edit with Emacs下新建command
	4.command的default值为
	  "path\to\emacsclientw.exe" --no-wait --alternate-editor="path\to\runemacs.exe" "%1"

Reference:    
[windows平台Emacs单实例原理、设置及右键菜单的添加](http://www.cnblogs.com/ini_always/archive/2012/04/28/2475741.html)   
Thanks!
