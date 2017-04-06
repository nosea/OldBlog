---
layout: post
title: "在mac上安装octopress"
date: 2014-12-16 22:30
comments: true
categories: Octopress
toc: true
---
# Introduction
    在Mac上安装Octopress记录
<!--more-->
# Content
    System: OS X Yosemite 10.10.1
	因为之前已经建立仓库了，这次只是简单的同步下环境。
## 生成Key
    cd ~/.ssh   
	ssh-keygen -t rsa -C "your email"
	注意：
	  Enter file in which to save the key -- 这个直接回车
	  Enter passphrase -- 这个可以填一个密码，也可以为空
	同样，下面的也加上
	echo "Host github.com   
	User git   
	Port 443   
	Hostname ssh.github.com   
	PreferredAuthentications publickey   
	identityfile ~/.ssh/id_rsa" >> ~/.ssh/config
	# follow the ways given above put your pub key in github
	# Testing   
	ssh -T git@github.com
## 把key放在github上
    1、访问https://github.com/，登录
	2、点击右上角的齿轮，也就是设置
	3、点击SSH keys
	4、点击Add SSH key，把.ssh/id_rsa.pub里的内容复制进去
	   详细的教程参见
	   https://help.github.com/articles/generating-ssh-keys/
	5、ssh -T git@github.com 来验证即可
## 安装ruby
    1、brew install rbenv
	2、brew install ruby-build
	3、rbenv install 1.9.3-p194  
	   # 最开始安装的时1.9.3-p125，后来出现了如下的错误
	   rbenv: version `1.9.3-p194' is not installed，因此重新安装了这个新的版本
	4、rbenv rehash
	5、把下面的两句加到 ~/.bash_profile  里，否则会出现ruby --version还是系统自带的高版本的
	   export PATH="$HOME/.rbenv/bin:$PATH"
	   eval "$(rbenv init -)"
	 
## clone 现有版本
    git clone -b source git@github.com:nosea/nosea.github.com.git octopress
	cd octopress
	
	修改下默认的源  Gemfile里默认都是修改为淘宝的，去掉原来的
	gem sources -a http://ruby.taobao.org
	gem sources -r https://rubygems.org/
	
	然后安装依赖
	gem install bundler
	bundle install
	因为主题默认都有了，也就不需要rake install了
	
	然后生成页面即可
	rake generate
# Reference
[http://msching.github.io/blog/2014/04/11/starting/](http://msching.github.io/blog/2014/04/11/starting/)    
[http://segmentfault.com/blog/yaashion_xiang/1190000000364677](http://segmentfault.com/blog/yaashion_xiang/1190000000364677)    
[http://samwize.com/2012/09/11/how-to-setup-octopress-on-github-pages/](http://samwize.com/2012/09/11/how-to-setup-octopress-on-github-pages/)    
[ruby版本解决办法](http://stackoverflow.com/questions/10940736/rbenv-not-changing-ruby-version)

	
	
