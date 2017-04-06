---
layout: post
title: "在Linux和Windows下同步Octopress"
date: 2012-12-11 16:54
comments: true
categories: Octopress
---
一.需求
    需要在Win7和Ubuntu下写东西，因此需要实时更新。
	
二.按照前面的在Windows下搭建Octopress的步骤。唯一不同的是:
   1.获取版本库时，获取的是自己的版本
    git clone -b source git@github.com:username/username.github.com.git octopress
	cd octopress
	git clone git@github.com:username/username.github.com.git _deploy
   2.安装依赖gems, 记得更改ruby的更新源
    gem install bundler
	bundle install
	rake install
<!-- more -->	
三.每次到一个平台下写文章时    
   1.获取最新数据   
    cd _deploy
	git pull origin master
	cd ..
	git pull origin source
   2.写完后
    rake generate
	rake deploy
	git add .   #这里是点，不是星号
	git commit -a   #commit所有
	git push origin source
	
Referrence:       
  [两台计算机同步octopress](http://note.softrayn.com/blog/2012/07/two-pc-sync-octopress/)   
  Thanks!
