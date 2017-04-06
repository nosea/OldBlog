---
layout: post
title: "boost program options"
date: 2015-01-25 18:12
comments: true
categories: C\C++
toc: true
---
# Introduction
    program_options主要用于方便的从命令行或者配置文件获取程序选项。
<!--more-->	
# Content
## example
``` c++
#include <boost/program_options.hpp>
#include <iostream>

namespace po =  boost::program_options;
using namespace std;

/*
 * @brief: 四个步骤
 *    1) 创建一个options_description对象
 *    2) 调用options_description对象的add_options方法
 *    3) 创建一个variables_map对象
 *    4) 调用parse_command_line函数生成basic_parsed_options
 *    4) 调用program_options的全局函数store
 *    5) 调用notify全局函数
 * @{
 */
int main(int ac, char* av[])
{
	int add_times = 10;
	po::options_description desc("Allowed options");
	desc.add_options()
		("help", "produce help message")
		("addtimes", po::value<int>(&add_times)->default_value(10), "Add Times")
		("name", po::value<string>(), "Your name")
		("compression", po::value<int>(), "set commpresson level")
		;

	po::variables_map vm;
	po::store(po::parse_command_line(ac, av, desc), vm);
	po::notify(vm);

	if (vm.count("help"))
	{
		cout << desc << "\n";
		return -1;
	}

	if (vm.count("compression"))
	{
		cout << "Compression level was set to "
			 << vm["compression"].as<int>() << ".\n";
	}
	else if (vm.count("name"))
	{
		cout << "Your name  was set to "
			 << vm["name"].as<string>() << ".\n";
	}
	else
	{
		cout << "Compression level was not set.\n";
	}

	return 0;
}
```
## add_options函数
``` c++
#include <iostream>
#include <string>
#include <vector>
#include <boost/shared_ptr.hpp>

namespace program_options
{
	class option_description
	{
	public:
		option_description(const char* name, const char* description):
			name_(name), description_(description) {}
		
		const std::string& name() const {return name_;}	
		const std::string& description() const {return description_;}

	private:
		std::string name_;
		std::string description_;		
	};

	class options_description;
	
	class options_description_easy_init
	{
	public:
		options_description_easy_init(options_description* owner):
			owner_(owner) {}
		
		options_description_easy_init& operator()
			(const char* name, const char* descrition);
			
	private:
		options_description* owner_;
	};

	class options_description
	{
	public:
		void add(boost::shared_ptr<option_description> desc)
		{
			options_.push_back(desc);
		}

		options_description_easy_init add_option()
		{
			return options_description_easy_init(this);
		}

		friend std::ostream& operator << (std::ostream&, options_description&);

	private:
		std::vector< boost::shared_ptr<option_description> > options_;
	};

	options_description_easy_init& options_description_easy_init::operator()
		(const char *name, const char *description)
	{
		boost::shared_ptr<option_description> item(new option_description(name, description));
		owner_->add(item);

		return *this;
	}

	std::ostream& operator << (std::ostream& o, options_description& p)
	{
		for (int i=0; i<p.options_.size(); i++)
		{
			o << p.options_[i]->name() << ": " << p.options_[i]->description() << std::endl;
		}

		return o;
	}
}

int main(int argc, char* argv[])
{
	using namespace program_options;
	program_options::options_description set;
	set.add_option()
		("--help", "help message")
		("--version", "version message")
		;
	std::cout << set;

	return 0;
}
```
