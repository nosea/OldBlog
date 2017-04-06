---
layout: post
title: "Boost filesystem"
date: 2015-01-26 12:46
comments: true
categories: Boost
toc: true
---
# Introduction
    The Boost.Filesystem library provides facilities to manipulate files and 
    directories, and the paths that identify them.
    可移植，不用为不同平台编写不同的代码。
<!--more-->
# Content
``` c++
#include <iostream>
#include <boost/filesystem.hpp>

void handle_file(const boost::filesystem::path& p)
{
    try
    {
        if (boost::filesystem::exists(p))
        {
            if (boost::filesystem::is_regular_file(p)) // p 是一个普通的文件
                std::cout << p << " size is " << boost::filesystem::file_size(p) << "\n";
            else if (boost::filesystem::is_directory(p)) // p 是一个目录
                std::cout << p << " is a directory \n";
            else
                std::cout << p << " exists, but is neither a reqular file nor a direcotry\n";
        }
        else
            std::cout << p << " does not exist\n";
    }
    catch (const boost::filesystem::filesystem_error& e)
    {
        std::cout << e.what() << "\n";
    }
}

int main(int argc, char* argv[])
{
    if (argc < 2)
    {
        std::cout << "usage: " << argv[0] << " filepath\n";
        return -1;
    }

    boost::filesystem::path p(argv[1]);
    handle_file(p);

    return 0;
}
```
# Reference
boost filesystem tutorial 
