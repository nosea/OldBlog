---
layout: post
title: "git 学习笔记(一)"
date: 2012-12-16 22:51
comments: true
categories: Linux
---
一.理论
    1.集中式版本控制系统(Centralized Version Control Systems, 简称CVCS)
	  eg: CVS, Subversin, Perforce
	  由一个单一的集中管理的服务器，保存所有文件修订版本.
	2.分布式版本控制系统(Distributed Version Control Systems, 简称DVCS)
	  eg: Git, Mercurial, Bazaar, Darcs
	  客户端并不只提取最新版本的的文件快照，而是把原始代码仓库完整的镜像下来.
	3.Git和其他版本控制系统的主要差别在于:
	  I.Git只关心文件数据的整体是否发生变化
	    大多数其他系统只关心文件内容的具体差异
<!-- more -->
	4.三种状态
	  对于任何一个文件，在Git内都只有三种状态
	  I.committed - 已提交
	    表示该文件已经被安全地保存在本地数据库中了.
	  II.modified - 已修改
	    表示修改了某个文件, 但是还没有提交保存.
	  III.staged - 已暂存
	    表示把已修改的文件放在下次提交时要保存的清单中.
	5.基本Git工作流程
	   I.在工作目录中修改某些文件
	   II.对这些修改了的文件作快照，并保存到暂存区域
	   III.提交更新，将保存在暂存区域的文件快照转存到git目录中.
	6.初次运行配置
	   I.git config命令配置或读取相应的工作环境变量
	   II.这些变量可以存放在三个不同的地方
	     * /etc/gitconfig文件: 对所有用户都生效
		   使用git config --system 时，读写此文件
		 * ~/.gitconfig文件: 只适用当前用户
		   使用git config --global 时，读写此文件
		 * 使用当前项目的git目录的配置文件: .git/config文件
		   仅对当前项目有效
	   每个级别的配置会覆盖上层相同的配置
    7.用户信息 - 配置用户名和电子邮件
	  每次提交时git会引用这两条信息, 说明是谁提交了更新
	  $ git config --global user.name "your name"
	  $ git config --global user.email your@example.email
    8.其他
	  $ git config --global core.editor emacs #或vim等你喜欢的编辑器
	  $ git config --global merge.tool vimdiff  #在解决合并冲突时用何种差异分析工具
	9.查看配置信息
	  $ git config --list
	  也可以直接查看某个环境变量的设定，后面添加特定的名字
	  $ git config user.name
	10.获取帮助
	  $ git help <verb>
	  $ git <verb> --help
	  $ man git-<verb>
	  eg:
	  $ git help config
二.基础
    1.取得项目的git仓库 - 两种方法
	  I.在现存的目录下，通过导入所有文件来创建新的Git仓库。
	  II.从已有的Git仓库克隆出一个新的镜像仓库。
    2.从当前目录初始化
	  要对现有的某个项目开始用Git管理，到此项目所在目录，执行
	  $ git init
	  初始化后，在当前目录下生成.git目录，所有Git需要的数据和资源都放在这个目录中。
	3.如果当前目录下有几个文件想要纳入版本控制，需要用git add命令告诉git开始对这些文件进行跟踪,然后提交.
	  $ git add somefile
	  $ git commit -m "some message"
	4.从现有仓库克隆 - git clone
	  克隆仓库的命令格式: git clone [url]
	  eg: 克隆ruby语言git代码仓库
	  $ git clone git://github.com/schacon/grit.git
	  这会在当前目录下创建一个名为“grit”的目录，其中包含一个.git的目录，并从同步后的仓
	  库中拉出所有的数据，取出最新版本的文件拷贝。在克隆的时候，若要自定义新建项目的名称:
	  $ git clone git://github.com/schacon/grit.git mygrit
      现在新建的项目名称为mygrit
	5.git支持多种数据传输协议： git:// 协议， http(s):// 或者 user@server:/path.git ssh 传输协议
	6.工作目录下的所有文件不外乎两种状态：已跟踪和未跟踪
	  已跟踪：本来就纳入版本控制管理的文件，工作一段时间后状态可能是未更新，已修改或已放入暂存区.
	  其他文件属于未跟踪文件。初次克隆某个仓库时，工作目录中的所有文件都属于已跟踪文件，且状态为未修改。
	  在编辑过后，这些文件被标为未修改。
	7.检查当前文件状态
	  $ git status
	8.$ git add
	  对于未跟踪文件，用此来跟踪新文件
	  对于已跟踪文件，用此来放入暂存区，还能用于合并时把有冲突的文件标为已解决状态。
	9.忽略某些文件
	  编辑.gitignore文件
	  格式：
	  *  #后被忽略
	  *  使用标准的glob模式匹配
	  *  匹配模式后跟反斜杠(/)说明要忽略的目录
	  *  要忽略指定模式以外的文件或目录，可以在模式前加上"!"取反
	  $ cat .gitignore
	  *.[oa]  #忽略以.o或.a结尾的文件
	  *~      #忽略以波浪符(~)结尾的文件
	  !lib.a  #但lib.a除外
	  /TODO   #仅仅忽略项目根目录下的TODO文件，不包括subdir/TODO
	10.查看具体修改了什么地方，用git diff命令
	   查看已经暂存起来的文件和上次提交时的快照之间的差异，用git diff --canched命令
	11.提交更新  -  每次提交之前，用git add确认下是否修改过的和新建的文件已经被git add 过
	   $ git commit # 这种方式会启动文本编辑器以便输入本次提交的说明
	   $ git commit -m 参数后跟提交说明，在一行命令中提交更新
	     git 会自动把所有已经跟踪过的文件暂存起来一并提交，从而跳过git add步骤
		 注意：只是跳过暂存，但是未跟踪的文件还是必须要用git add 添加的
-----目前就用到这些    
学习文档：Pro Git 简体中文版
	   
