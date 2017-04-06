---
layout: post
title: "Configure配置参数"
date: 2013-01-18 15:26
comments: true
categories: Linux
toc: true
---
# Introduction
      每个GNU软件都应有一个名为configure的shell脚本。可以在编译之前，向这个脚本传递一些
	参数，这些参数描述了软件安装的环境(什么硬件，什么系统，安装在哪个目录之类的)。
<!--more-->
# 目录选项
	--prefix=
	  下面的目录变量默认值都是以这个目录变量为基础的，即下面的目录默认都在这个目录里。
	  用来指定软件安装的主目录，默认值为/usr/local
	--exec-prefix= 
	  与--prefix类似，创建下面某些变量的默认值会用到它。它的默认值是$(prefix)
	--bindir=
	  用户可执行程序存放目录，默认为/usr/local/bin
	--sbindir= 
	  超级用户可执行程序存放目录，默认为/usr/local/sbin
	--libexecdir= 
	  可执行程序存放目录，但它是供程序使用的，不直接由用户使用，默认为/usr/local/libexec
	====================下面是数据文件目录=======================
	程序运行期间所用的数据文件通常被分为两类
	* 一些文件正常情况下会被程序修改；其它的文件则永远不会(当然，用户可能会修改一些)
	* 一些与体系架构无关的文件可以放置于一个站点供所有机器共享
	  体系架构相关的文件只能被同类操作系统所共享，其它的则根本不会共享
	--datarootdir=
	  用来存放与体系架构无关的数据文件的根目录，默认是/usr/local/share
	  datadir, infodir, mandir的默认值都与它有关
	--datadir
	  用来存放与体系架构无关的只读的数据文件。通常情况下默值与datarootdir相同，用
	  两个变量表示以便单独使用而不用影响mandir，infodir之类的值
	--sysconfdir=
	  用来存放只读的配置文件，这些文件只属于单个主机。这个目录里的所有文件通常是文本文件。
	  默认值为/usr/local/etc
	  可执行程序和程序运行时修改的文件都不应该放在这个目录
	--sharedstatedir= 
	  用来存放与体系架构无关的文件，这些文件在程序运行时会被修改，默认值/usr/local/com
	--localstatedir= 
	  用来存放属于特定主机的文件，这些文件在程序运行时会被修改，默认值/usr/local/var
	====================下面的目录用于存放指定类型的文件=====================
	每个GNU安装包都应有Info文件，所以每个程序都需要infodir，但并不是所有都需要libdir或
	lispdir
	--includedir= 
	  C和C++头文件的目录,默认是/usr/local/include，除了GCC，大多数编译器不会在这个目录
	  寻找头文件，所以这个目录只对GCC有用。对于其他的编译器，可以把头文件放到两个地方，
	  一个includedir指定的地方, 一个是oldincludedir指定的地方
	--oldincludedir=
	  存放编译器所用的头文件(除了GCC)，默认值/usr/include
	--docdir=
	  用来存放package的文档文件(不是info文件)，默认值 /usr/local/share/doc/yourpkg
	--infodir=
	  用来存放package的info文件，默认值/usr/local/share/info
	  infodir与docdir分开是为了与现存的惯例兼容
	--htmldir= 
	--dvidir= 
	--pdfdir= 
	--psdir=
	  上面的目录用于存放特定格式的文档文件，默认值均为docdir的值
	--libdir
	  库文件和动态装载模块的目录,默认值/usr/local/lib，注意可执行文件应放在libexecdir
	--lispdir
	  用于存放Emacs Lisp文件，默认是/usr/local/share/emacs/site-lisp
	--localedir
	  存放地区指定信息。默认/usr/local/share/locale
	--mandir
	  man文档存放目录
	--man1dir
	   ...
	--man7dir
    --srcdir=
	  要编译的源代码目录。值通常由configure脚本自动传入
# 其他选项
    1.configure也接受一个代表软件所要安装的系统的参数，类似cpu-company-system
	  如GNU/Linux或许是：i686-pc-linux-gnu
	  同时也可以采用--build=buildtype这样的选项形式
	  例如configure --build=i686-pc-linux-gnu  等价于
	      configure i686-pc-linux-gnu
    2.其他的选项用于更多细节，include或者不include，调整参数命名之类的
	--enable-feature[=parameter]
	  可以让用户选择自己想要的功能，如果想要某个具体的功能，最好明确指出
	--with-packagexx
	  packagexx将会被安装，并且配置能和packagexx共同工作
	variable=value
	  指定变量的值，用来覆盖默认的编译值
	  
# Reference
* [How Configuration Should Work](http://www.gnu.org/prep/standards/html_node/Configuration.html)    
* [PostgreSQL 8.1 中文文档-14.5. 安装过程](http://man.ddvip.com/database/pgsqldoc-8.1c/install-procedure.html)    
* [Autoconf学习——编写configure脚本](http://www.cnblogs.com/flyfish10000/articles/1986054.html)    
Thanks!

	
