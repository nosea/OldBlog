---
layout: post
title: "把本地项目放到Github"
date: 2012-12-18 18:01
comments: true
categories: Linux
---
一.到[Github](https://github.com/)新建一个repo，例如example-repo    
二.到你的项目根目录
``` bash
git init     # 初始化
git add .    # 跟踪所有文件
git commit -a  # 提交
git remote add alias_name git@github.com:username/example-repo.git
# 上面的alias_name可以随便取，是给远程版本库取的别名
git push alias_name master   
# 上面也可以 git push git@github.com:username/example-repo.git master
```

Referrence:    
[github:help](https://help.github.com/articles/create-a-repo)    
[添加已存在工程到远程版本库](http://jiangli.easymorse.com/?p=504)    
Thanks!


