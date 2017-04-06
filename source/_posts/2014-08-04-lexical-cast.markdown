---
layout: post
title: "Lexical_Cast"
date: 2014-08-04 23:21
comments: true
categories: Boost
toc: true
---
# Introduction
    数值与字符串转换之用，更方便，安全，有效。
<!--more-->	
# 使用
``` c++
#include <boost/lexical_cast.hpp>
#include <boost/random.hpp>
#include <iostream>
#include <vector>

using namespace std;

string number_to_string(const vector<int> &ivec);
vector<int> gen_ivec(const int &low, const int &top);
vector<int> string_to_number(const string &s);

int main(int argc, char **argv)
{
	vector<int> ivec = gen_ivec(1, 100);
	

	cout << "Begin int to string..." << endl;
	string res = number_to_string(ivec);
	cout << res << endl;

	cout << "Begin string to int..." << endl;
	vector<int> ivec_handle = string_to_number(res);

	for (vector<int>::iterator iter=ivec_handle.begin();
		iter!=ivec_handle.end(); ++iter)
	{
		cout << *iter;
	}
	cout << endl;

	return 0;
}

/*
*	convert an array of integers to string whiche divided by "="
*/
string number_to_string(const vector<int> &ivec)
{
	string ret;

	for (vector<int>::const_iterator iter=ivec.begin(); 
		iter!=ivec.end(); ++iter)
	{
		ret = ret + boost::lexical_cast<string>(*iter) + "=";
	}

	return ret;
}


/*
*	convert string to an array of integers
*/
vector<int> string_to_number(const string &s)
{
	vector<int> ivec;

	for (string::const_iterator iter=s.begin();
		iter!=s.end(); ++iter)
	{
		try
		{
			ivec.push_back(boost::lexical_cast<int>(*iter));
		}
		catch (const boost::bad_lexical_cast&){} // skip it
	}

	return ivec;
}


/*
* generate random number
*/
vector<int> gen_ivec(const int &low, const int &top)
{
	vector<int> ivec; 

	boost::uniform_int<> distribution(low, top) ;
	boost::mt19937 engine;
	boost::variate_generator<boost::mt19937, boost::uniform_int<>> irandom (engine, distribution);

	for (int i=low; i<top; ++i)
	{
		ivec.push_back(irandom());
		//cout << irandom() << ", ";
	}

	return ivec;
}
```

# Reference    
[boost](http://www.boost.org/doc/libs/1_55_0/doc/html/boost_lexical_cast.html)
