---
layout: post
title: "install octopress on windows"
date: 2012-12-08 13:01
comments: true
categories: Octopress
---
*  Environment:   
   OS: Windows 7 SP1   
   Lang: en  
<!-- more -->
*  Install software           
   *  Install git  
      *  Get the latest [msysgit](http://code.google.com/p/msysgit/downloads/list) and install.   
   *  Install ruby for windows  -1.9.2 or 1.9.3    
      *  Get [RubyInstaller](http://rubyforge.org/frs/?group_id=167) and install.   
      	 Add the bin path to the System environment's path where ruby installed   
	 eg: `C:\Ruby192\bin`   
      *  Get [RubyInstaller DevKit](https://github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe)  
      	 It is a self-extracting file and extract it in a place, such as `C:\DevKit`   
	 run the CMD, enter the `C:\DevKit`   
	 execute command `ruby dk.rb init`   
	 execute command `ruby dk.rb install`  
   *  Install python   
      *  For windows platform, the [ActivePython](http://www.activestate.com/activepython) may be a better choice, get it and install.   
      	 Put the `D:\Python27` and the `D:\Python27\Scripts` to the Os-env-path.   
	 That's where I choose to install python.  
      *  In CMD, run `easy_install pygments`    

*  Configuration   
   *  Configure git  
      `git config --global user.name "yourname"`   
      `git config --global user.email yourname@some.com`    
   *  Add env value   
      `LANG=zh_CN.UTF-8`   
      `LC_ALL=zh_CN.UTF-8`   
   *  Change gem upgrade source   
      `gem sources --remove http://rubygems.org/`  
      `gem sources -a http://ruby.taobao.org/`   
      `gem sources -l`  check if it is right.   

*  Generating ssh keys
{% codeblock %}   
cd ~/.ssh   
ssh-keygen -t rsa -C "your email"   
put your pub kes to github    
{% endcodeblock %}    
      
*  Install octopress   
{% codeblock %}
# Enter a directory where you want to put octopress
git clone git://github.com/imathis/octopress.git octopress
cd octopress
#vim Gemfile and change the source
turn: source "http://rubygems.org/"
to: source "http://ruby.taobao.org/"
gem install rdoc bundler
bundle install
rake install
{% endcodeblock %}    


* Error log
{% codeblock Error %}
$ rake generate
(in e:/WorkSpace/Blog/octopress)
## Generating Site with Jekyll
unchanged sass/screen.scss
Configuration from e:/WorkSpace/Blog/octopress/_config.yml
c:/Ruby192/lib/ruby/gems/1.9.1/gems/blankslate-3.1.2/lib/blankslate.rb:51: warning: undefining `object_id' may cause serious problems
Building site: source -> public
c:/Ruby192/lib/ruby/gems/1.9.1/gems/jekyll-0.11.2/lib/jekyll/convertible.rb:29:in `read_yaml': invalid byte sequence in UTF-8 (ArgumentError)
        from c:/Ruby192/lib/ruby/gems/1.9.1/gems/jekyll-0.11.2/lib/jekyll/post.rb:39:in `initialize'
        from e:/WorkSpace/Blog/octopress/plugins/preview_unpublished.rb:23:in `new'
        from e:/WorkSpace/Blog/octopress/plugins/preview_unpublished.rb:23:in `block in read_posts'
        from e:/WorkSpace/Blog/octopress/plugins/preview_unpublished.rb:21:in `each'
        from e:/WorkSpace/Blog/octopress/plugins/preview_unpublished.rb:21:in `read_posts'
        from c:/Ruby192/lib/ruby/gems/1.9.1/gems/jekyll-0.11.2/lib/jekyll/site.rb:128:in `read_directories'
        from c:/Ruby192/lib/ruby/gems/1.9.1/gems/jekyll-0.11.2/lib/jekyll/site.rb:98:in `read'
        from c:/Ruby192/lib/ruby/gems/1.9.1/gems/jekyll-0.11.2/lib/jekyll/site.rb:38:in `process'
        from c:/Ruby192/lib/ruby/gems/1.9.1/gems/jekyll-0.11.2/bin/jekyll:250:in `<top (required)>'
        from c:/Ruby192/bin/jekyll:19:in `load'
        from c:/Ruby192/bin/jekyll:19:in `<main>'
{% endcodeblock %}    
   Make sure you've add this:   
      # Add env value   
      `LANG=zh_CN.UTF-8`   
      `LC_ALL=zh_CN.UTF-8`
   Or edit convertible.rb    
   turn the `self.content = File.read(File.join(base, name))`    
   to `self.content = File.read(File.join(base, name), :encoding => "utf-8")`

   *  About ssh
{% codeblock %}
$ ssh -vT git@github.com
# ...
# Agent admitted failure to sign using the key.
# debug1: No more authentication methods to try.
# Permission denied (publickey).      
{% endcodeblock %}
[Resolution](https://help.github.com/articles/error-agent-admitted-failure-to-sign)
{% codeblock Tips %}
1. make sure you've generated the ssh keys correctly
2. run: ssh-add
{% endcodeblock %}


Reference:    
1.[http://sinosmond.github.com/blog/2012/03/12/install-and-deploy-octopress-to-github-on-windows7-from-scratch/](http://sinosmond.github.com/blog/2012/03/12/install-and-deploy-octopress-to-github-on-windows7-from-scratch/)   
2.[http://www.freehao123.com/github-pages/](http://www.freehao123.com/github-pages/)    
Thanks!  
