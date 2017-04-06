---
layout: post
title: "python note I"
date: 2013-02-04 15:10
comments: true
categories: Python
toc: true
---
# Introduction
    Dictionary, List, Tuple
<!--more-->
# Dictionary
``` python
>>> d = {'name':'Tom', 'age':16} 
>>> d
{'age': 16, 'name': 'Tom'}
>>> d.keys()
['age', 'name']
>>> d.values()
[16, 'Tom']
>>> d.items()
[('age', 16), ('name', 'Tom')]
>>> d['name']
'Tom'
>>> d['name'] = 'Tony' # 修改值
>>> d
{'age': 16, 'name': 'Tony'}
>>> d['gender'] = 'male' # 添加
>>> d
{'gender': 'male', 'age': 16, 'name': 'Tony'}
>>> del d['age'] # 删除一个key-value
>>> d
{'gender': 'male', 'name': 'Tony'}
>>> d.clear() # 清除所有key-value
>>> d
{}
```	
# List
``` python
>>> li = ['mom', 'dad', 'son', 'sky', 'blue']
>>> li
['mom', 'dad', 'son', 'sky', 'blue']
>>> li[0]
'mom'
>>> li[-1]
'blue'
>>> li[1:4]
['dad', 'son', 'sky']
>>> li[:4]
['mom', 'dad', 'son', 'sky']
>>> li[1:]
['dad', 'son', 'sky', 'blue']
>>> li[:]
['mom', 'dad', 'son', 'sky', 'blue']
>>> li.append('new') # 在末尾追加
>>> li
['mom', 'dad', 'son', 'sky', 'blue', 'new']
>>> li.append(18)
>>> li
['mom', 'dad', 'son', 'sky', 'blue', 'new', 18]
>>> li.insert(2, 'boy') # 在任意位置插入
>>> li
['mom', 'dad', 'boy', 'son', 'sky', 'blue', 'new', 18]
>>> si = ['tiny', 'huge']
>>> li.extend(si) # 扩展(连接一个list)
>>> li
['mom', 'dad', 'boy', 'son', 'sky', 'blue', 'new', 18, 'tiny', 'huge']
>>> li.remove('tiny') # 删除一个值(若有相同值，仅删除首次出现)
>>> li
['mom', 'dad', 'boy', 'son', 'sky', 'blue', 'new', 18, 'huge']
>>> li.pop() # 删除最后一个元素，并返回其值
'huge'
>>> li
['mom', 'dad', 'boy', 'son', 'sky', 'blue', 'new', 18]
>>> li[-1] = 20 # 修改值
>>> li
['mom', 'dad', 'boy', 'son', 'sky', 'blue', 'new', 20]
>>> li = ['mom', 'dad']
>>> li
['mom', 'dad']
>>> li = li + si # 约等于 li.extend(si)，但'+'返回新list，而extend修改原值
                 # 因此对于大型list，extend速度快于'+'
>>> li
['mom', 'dad', 'tiny', 'huge']
>>> li.index('mom')
0
>>> 'dad' in li
True
>>> li += ['small', 'large'] # '+=' 等同于extend
                             # '+=' 可用于string list 数字 和用户自定义类
>>> li
['mom', 'dad', 'tiny', 'huge', 'small', 'large']
>>> li = [1, 2] * 2 # 等同于 li = [1, 2] + [1, 2]
>>> li
[1, 2, 1, 2]
```
# Tuple
``` python
>>> tu = (1, 2, 3, 4, 5)
>>> tu
(1, 2, 3, 4, 5)
>>> tu[0]
1
>>> tu[-1]
5
>>> tu[1:4]
(2, 3, 4)
>>> 2 in tu
True
```
# List Tuple 相互转换
``` python
>>> tu = (1, 2, 3, 4, 5)
>>> li = list(tu)
>>> li
[1, 2, 3, 4, 5]
>>> li = ['a', 'b', 'c', 'd']
>>> li
['a', 'b', 'c', 'd']
>>> tu = tuple(li)
>>> tu
('a', 'b', 'c', 'd')
```
