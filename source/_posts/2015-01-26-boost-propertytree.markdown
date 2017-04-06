---
layout: post
title: "Boost PropertyTree"
date: 2015-01-26 23:08
comments: true
categories: Boost
toc: true
---
# Introduction
    The Property Tree library provides a data structure that stores an arbitrarily deeply nested tree of values, 
    indexed at each level by some key. 
    可以很方便的解析xml，ini，json，info文件
<!--more-->
# Content
``` c++
#include <iostream>
#include <string>
#include <set>
#include <boost/foreach.hpp> // for BOOST_FOREACH
#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/xml_parser.hpp>

/*
 * 例子来自boost property的five minute tutorial，我稍微修改了下
 *  <debug>
 *      <filename>debug.log</filename>
 *    <modules>
 *        <module>Finance</module>
 *        <module>Admin</module>
 *        <module>HR</module>
 *    </modules>
 *    <level>2</level>
 *  </debug>
 */
class xml_demo
{
public:
    void load();
    void save();
    xml_demo(std::string& config_name):
        config_(config_name){}

    void show();

private:
    const std::string config_;
    std::string log_; // log filename
    int level_;  // log level
    std::set<std::string> modules_; // modules where logging is enabled
};

void xml_demo::show()
{
    std::cout << "the config info is below: \n";
    std::cout << "log file name is: " << log_ << std::endl;
    std::cout << "log level is: " << level_ << std::endl;
    std::cout << "the module info is : \n";
    for (std::set<std::string>::iterator it=modules_.begin();
         it!=modules_.end(); it++)
    {
        
        std::cout << "\t" << *it << std::endl;
    }
}

void xml_demo::load()
{
    boost::property_tree::ptree pt; // Create an empty property tree object

    // Load the XML file into the property tree. If reading fails
    // (cannot open file, parse error), an exception is thrown.
    boost::property_tree::read_xml(config_, pt);

    // Get the filename of log and store it in the level_ variable
    // if the debug.filename key is not found, an exception is thrown.
    log_ = pt.get<std::string>("debug.filename");

    // Get the debug level and store it in the level_ variable.
    // This is another version of the get method; if the value is not
    // found, the default value (specified by the second parameter) is
    // returned instead.
    // 注意，因为抽取的数据类型与默认值一致，因此使用了get(...)而不是
    // get<int>(...)
    level_ = pt.get("debug.level", 0);

    // 遍历读取 debug.modules 的值
    BOOST_FOREACH(boost::property_tree::ptree::value_type& v,
                  pt.get_child("debug.modules"))
    {
        modules_.insert(v.second.data());
    }
}

void xml_demo::save()
{
    log_ = "new_debug.log";
    level_ = 10;
    
    boost::property_tree::ptree pt;

    pt.put("debug.filename", log_);
    pt.put("debug.level", level_);

    BOOST_FOREACH(const std::string& name, modules_)
    {
        pt.add("debug.modules.module", "NEW " + name);
    }

    boost::property_tree::write_xml(config_, pt);
}


int main(int argc, char* argv[])
{
    std::string conf_file("config.xml");
    
    xml_demo demo(conf_file);

    demo.load();
    demo.show();

    std::cout << "Now modifing... \n";
    demo.save();
    demo.load();
    demo.show();
    
    return 0;
}
```

# Reference
Boost propertytree tutorial