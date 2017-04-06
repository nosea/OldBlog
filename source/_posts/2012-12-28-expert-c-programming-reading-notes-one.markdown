---
layout: post
title: "《C专家编程》读书笔记(一)"
date: 2012-12-28 12:04
comments: true
categories: C\C++
toc: true
---
# 第1章
## 1.1 C语言的史前阶段
    1.C 语言的产生源自于一个失败的项目-Multics工程.(一个巨大的操作系统)
	2.Ken Thompson和Dennis Ritchie想把Thompson的“太空旅行”软件移植到不太常用的PDP-7系统上，
	  为此，Thompson为PDP-7编写了一个简易的新型操作系统，整个系统用汇编编写。
	  ——Brian Kernighan在1970年给它取名为UNIX.
<!-- more -->
    3.语言
	  (1965-7)BCPL --> (1969)B --> (1971)New B --> (1972-3)早期的C
	  UNIX
	  用PDP-7汇编语言编写 --> 用PDP-11汇编语言编写 --> 用C语言编写
    4.确切的说，UNIX比C语言早(这就是为什么UNIX系统时间从1970年1月1日起按秒计算的)
	5.汇编编写UNIX太困难，Thompson创建了B语言，B语言是无类型的
	6.在编译器中，效率几乎就是一切
	6.B语言不算成功，Dennis Ritchie创建的New B却获得了成功，充分验证编译器设计信条
	  --> 这个名字很快变成了“C”，它采用编译模式而不是解释模式
	7.Thompson发明了++和--操作符
## 1.2 C语言的早期体验
    1.C语言引入了类型系统，每个变量在使用前必须声明
	  增加类型系统的主要目的是帮助编译器设计者区分新型PDP-11机器所拥有的不同数据类型
	2.C语言排斥强类型，它允许程序员可以在不同的类型之间赋值
	3.C的很多其它特征也是为了方便编译器设计者而建立的(因为开始几年C的主要客户就是编译器设计者)
	  * 数组下标从0开始而不是从1开始
	  * C语言的基本数据类型直接与底层硬件相对应
	  * auto关键字成了摆设，这个只对编译器设计者有意义
	  * 表达式中的数组名可以看作是指针
	  * float被自动扩展为double (在ANSI C中已不是)
	  * 不允许嵌套函数
	  * register关键字
## 1.3 标准I/O库和C预处理器
    1.C语言中，绝大多数库函数和辅助程序都需要显示调用
	2.C语言原先并没有定义I/O，而是由库函数提供，可移植I/O最初由Mike Lesk编写，最初出现在1972年左右
	3.C预处理器大约在这个时候被加入，它所实现的3个主要功能为:
	  * 字符串替换 - 通常用于为常量提供一个符号名，类似“把所有的foo替换为baz“
	  * 头文件包含 - 一般性的声明可以放到头文件中，被多源文件使用
	  * 通用代码模板的扩展 - 与函数不同，宏调用所接受的参数类型可以不同，宏的实际参数只是按照
	    原样输出 - 这里容易出错，尽量少用
	4.Steve Bourne 在编写Unix shell时，采用C预处理器使其有显示的结束语句
	  PS: 难怪有fi esac
	5.宏最好只用于命名常量，并为一些适当的结构提供简洁的记法
	  宏名应大写，容易与函数调用区分开
## 1.4 K&R C
    1.20世纪70年代中期，C语言已经很接近目前的形式，更多的改进仍然存在，但只是细节
	2.Steve Johnson编写了pcc这个可移植的C编译器，源码对外开放，广泛移植，形成整整一代C编译器基础
	3.1978年C语言经典名著《The C Programming Language》出版，作者为Brian Kernighan 和 Dennis Ritchie
	  这个版本的C语言被称为"K&R"
	  PS:查了下Brian Kernighan，贝尔实验室的研究员，参加了UNIX系统、C语言、AWK语言和许多其他系统的开发
## 1.5 今日之ANSI C
    1.20世纪80年代，C语言被业界广泛使用
	2.1983年ANSI(美国国家标准化组织)成立了C语言工作小组，开始了C语言的标准化工作。
	3.应当学习使用ANSI C 而不是K&R C
	4.
## 1.6 它很棒, 但它符合标准吗
    1.ANSI C定义了一些术语，用于描述某种编译器的特点
	  I.unportable code(不可移植的代码):
	    * implementation-defined(由编译器定义的):
		  在不同的编译器中所采取的行为可能不同，但它们都是正确的
		* unspecified(未确定的):
		  在某些正确的情况下的做法，标准并未明确规定应该怎么做
	  II.bad code(坏代码)
	    * undefined(未定义的):
		  在某些不正确的情况下的做法，但标准并未规定应该怎么做
		* a constraint(约束条件)
		  这是一个必须遵守的限制或要求，如果不遵守，那么程序的行为很有可能就是undefined的
	  III.portable code(可移植代码)
	    * strictly-conforming(严格遵循标准的):
		  一个严格遵循标准的代码应该是:
		  + 只使用已确定特性
		  + 不突破任何由编译器实现的限制
		  + 不产生任何依赖由编译器定义的或未确定的或未定义的特性的输出
		* conforming(遵循标准的):
		  一个遵循标准的程序可以依赖一些某种编译器特有的不可移植的特性
    2.有趣的情况
	  标准规定编译器只有在违反语法规则和约束条件的情况下才产生错误信息，这意味着所有不属于约束条件的语义
	  规则都可以不遵守，而且这种行为属于未定义行为，编译器可以采取任何行动，甚至不必通知你。
	  eg:
	  c标准头文件的中声明的标识符均保留，so, 你不能声明一个malloc()函数，因为头文件已有同名函数，但这个规定
	  不是约束条件，因此可以违反，编译器甚至可以不警告你
## 1.7 编译限制
    对编译器编译限制做了些说明
## 1.8 ANSI C标准的结构
    主要分四个部分
	  第4节：介绍。对术语进行介绍和定义
	  第5节：环境。描述了支持C语言的系统
	  第6节：C语言。标准的这部分基于Dennis Ritchie出版的《The C Reference Manual》和K&R C的附录A
	  第7节：C运行库。提供了一个遵循标准的编译器必须提供的库函数列表
	K&R C 和 ANSI C的区别 
	  第1类区别：指一些新的，非常不同的，并且很重要的东西。
	      原型——把形参的类型作为函数。(这是惟一属于这类区别的，方便编译器根据函数定义检查函数的用法)
		  这个是ANSI C最重要的新特性
	  第2类区别：ANSI C正式增加了些关键字
	  第3类区别：有些语言特性仍然合法，但意思有些轻微的改变
	  第4类区别：前面三类之外的所有区别
``` c eg strcpy
/*K&R C*/
char *strcpy();
/*ANSI C*/
char *strcpy(char *dst, const char *src);
/*这样写也可以，但不推荐*/
char *strcpy(char *, const char *);
```
## 1.9 阅读ANSI C标准，寻找乐趣和裨益
``` c
foo(const char **p) 
{

}

main(int argc, char **argv)
{
    foo(argv);
}
/*
cc test.c 
test.c: In function ‘main’:
test.c:6:5: warning: passing argument 1 of ‘foo’ from incompatible pointer type [enabled by default]
test.c:3:1: note: expected ‘const char **’ but argument is of type ‘char **’
*/

/*
g++ test.c 
test.c: In function ‘int main(int, char**)’:
test.c:8:13: error: invalid conversion from ‘char**’ to ‘const char**’ [-fpermissive]
test.c:5:6: error:   initializing argument 1 of ‘void foo(const char**)’ [-fpermissive]
*/
```
左定值，右定向
    1.ANSI C标准中的两句话
	  * 每个实参都应该具有自己的类型，这样它的值就可以赋值给与它所对应的形参类型的对象
	  （该对象类型不能含有限定符）
	  * 要使赋值形式合法，必须要满足下列条件之一： 两个操作数都是指向有限定符或无限定符的相容类型的指针，
	  左边指针所指向的类型必须具有右边指针所指向类型的全部限定符
    2.const是一个C语言的关键字，它限定一个变量不允许被改变。
    3.const int num 和 int const num 是一样的，const只修饰其后的变量，而在类型前后没有区别
	4.char const *p 可以理解为char const (*p), 即*p是const的，但是p却是可变的
	5 例子：
	  int const *p1, p2;  --> (*p1)和p2 不可变，但p1却是可变的
	  int const *const p1, p2; --> p2是const，是前一个const修饰的，*p1也被前一个const修饰，
	  而p1被后一个const修饰
	  int *const p1, p2; --> p1是const，（*const p1）是整体，所以const不修饰p2。
	6.const在*的左边，则指针指向的变量的值不可变；在*的右边，则指针的指向不可变。简记为“左定值，右定向”。
	7.在c中，对于const定义的指针，不赋初值编译不报错
	8.强烈建议在初始化时说明指针的指向，防止出现野指针！
    实参char *s与形参const char *p相容，而为什么char **argv与形参const char **p不相容呢
    1.首先分析下为什么char *s与形参const char *p相容
	  s指针指向char类型，p指针也指向char类型，只不过无法通过(*p)改变它的值
	  const char *p1 = char *p2
	  二者指向类型相同，左边指针拥有右边指针全部限定符，满足赋值条件
	2.为什么char **argv与形参const char **p不相容
## 1.10 “安静的改变”究竟有多安静
    1.算术转换
	  任何类型为char或者short的操作数被转为int
	  任何类型为float的操作数被转为double
	  其他的为升序(即int->float->double, signed -> unsigned)
## 1.11 轻松一下——由编译器定义的Pragmas效果
    1.Free Software Foundation(自由软件基金会)是一个独立的组织，由MIT顶级黑客Richard Stallman所创立
    2.FSF最好的作品之一就是GNU C编译器系列
