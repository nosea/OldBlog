---
layout: post
title: "排序算法"
date: 2012-12-14 16:50
comments: true
categories: Algorithm
---
一.插入排序   
1.直接插入排序    
    基本思路: 依次把待排序的的记录逐一按照关键字的大小插入到已经排好的有序序列中。      
	复杂度：O(n^2)   稳定的排序方法.       
``` c
void insertion_sort(int a[], int n)
{
	int i;
	for (i=1; i<n; i++)
	{
		int key = a[i];
		int j = i - 1;

		while (key < a[j])
		{
			a[j+1] = a[j];
			j--;
		}

		a[j+1] = key;
    }
}
```
<!-- more -->
2.希尔排序   
    又称"缩小增量排序"，也是一种插入类排序算法。   
	复杂度：O(n^1.3)  不稳定排序算法   
``` c
void shell_sort(int a[], int n)
{
	int i;
	int d = n/2;
	while (d >= 1)
	{
		for (i=d+1; i<n; i++)
		{
			int key = a[i];
			int j = i - d;

			while ((j>0) && (key<a[j]))
			{
				a[j+d] = a[j];
				j = j - d;
			}

			a[j+d] = key;
		}

		d = d / 2;
	}
}
```
二.交换排序   
1.冒泡排序   
    通过相邻之间的记录两两比较和交换。
    复杂度：O(n^2)   稳定的排序算法
``` c
void bubble_sort(int a[], int n)
{
	int i = n;
	int j, temp;
	while(i > 1)
	{
		for (j=0; j<i-1; j++)
		{
			if (a[j] > a[j+1])
			{
				temp = a[j+1];
				a[j+1] = a[j];
				a[j] = temp;
			}
		}
		i--;
	}
}
```
2.快速排序
    对冒泡排序的一种改进. 复杂度：最坏情况 O(n^2)   不稳定的排序算法
    所有比关键字小的记录均排在它之前，所有比关键字大的记录都排在它之后，完成一趟排序。
    对剩余的两个部分递归. 
``` c
void quick_sort(int a[],int low,int high)
{
	if (low >= high)
		return ;
	int j, i, key;
	i=low;
	j=high;
	key=a[i];
	while(i < j)
	{
		while(i<j && a[j]>key)
			j--;
		if (i<j) 
			a[i++] = a[j];
		while (i<j && a[i]<key)
			i++;
		if (i<j) 
			a[j--] = a[i];
	}

	a[i] = key;
	if (low < i-1)
		quick_sort(a, low, i-1);
	if (i+1<high)
		quick_sort(a, i+1, high);

}
```
三.选择排序
    指每次从待排序的记录中选择关键字值最小的(或最大的)记录，顺序放在已排序的的子序列.
1.简单选择排序
    复杂度：O(n^2)   不稳定排序
``` c
/*
 * 算法思路：
 * (1)：查找待排序序列中最小的记录，并将它和该区间第一个记录交换。
 * (2)：重复步骤(1)直到第n-1次排序后结束。
 */
void select_sort(int a[], int n)
{
	int i, j, min, k;

	for (i=0; i<n-1; i++)
	{
		k = i;
		min = a[i];
		for (j=i+1; j<n; j++)
		{
			if (a[j] < min)
			{
				min = a[j];
				k = j;
			}
		}

		a[k] = a[i];
		a[i] = min;
	}
}
```
2.堆排序    
    复杂度：O(nlog2n)    不稳定的排序方法
``` c
/* 参考--->   http://zh.wikipedia.org/wiki/%E5%A0%86%E6%8E%92%E5%BA%8F */ 
/*
 * 堆排序算法对于记录数较少的文件来说，其优越性并不明显，但对记录数
 * 较大的文件还是很有效的。它的运行时间主要耗费在建初始堆和调整新建
 * 堆时进行的反复“筛选”上。堆排序只需要一个记录大小的辅助空间，对排序
 * 的时间复杂度为O(nlog2n)，堆排序是一种不稳定的排序方法。
 */
/*
 * 堆在完全二叉树中的解释为：完全二叉树中的任一分支节点的关键字都不大于
 * (或不小于)其左右孩子的值，所以堆顶元素(或完全二叉树的根)K1必为序列中
 * n个元素的最小值(最大值)。
 *
 * 堆排序的基本思路：对一组待排序的记录序列，先将其关键字按堆的定义排列
 * 一个序列(称初建堆)，找到最小(最大)关键字后，将其取出。用剩余的n-1个元
 * 素再重建堆，便可得到次小(次大)值。如此反复，直到全部关键字排好序为止。
 */

/*筛选算法*/
void sift(int d[], int ind, int len)
{
	/*置i为要筛选的节点*/
	int i = ind;


	/*+1的目的就是为了解决节点从0开始而他的左孩子一直为0的问题*/
	int c = i * 2 + 1; /*c中保存i节点的左孩子*/

	while(c < len)/*未筛选到叶子节点*/
	{
		/*如果要筛选的节点既有左孩子又有右孩子并且左孩子值小于右孩子*/
		/*从二者中选出较大的并记录*/
		if(c + 1 < len && d[c] < d[c + 1])
			c++;
		/*如果要筛选的节点中的值大于左右孩子的较大者则退出*/
		if(d[i] > d[c])
			break;
		else
		{
			/*交换*/
			int t = d[c];
			d[c] = d[i];
			d[i] = t;
			/*重置要筛选的节点和要筛选的左孩子*/
			i = c;
			c = 2 * i + 1;
		}
	}

	return;
}

void heap_sort(int d[], int n)
{
	int i;
	/*初始化建堆, i从最后一个非叶子节点开始*/
	for(i = n / 2; i >= 0; i--)
		sift(d, i, n);

	for(i = 0; i < n; i++)
	{
		/* 交换 */
		int t = d[0];
		d[0] = d[n - i - 1];
		d[n - i - 1] = t;

		/* 筛选编号为0 */
		sift(d, 0, n - i - 1);

	}
}
```
