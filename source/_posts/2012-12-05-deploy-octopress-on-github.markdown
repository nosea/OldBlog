---
layout: post
title: "在Github上搭建Octopress"
date: 2012-12-05 16:02
comments: true
categories: Octopress
---
参考：[http://octopress.org/docs/](http://octopress.org/docs/)

1\. install git   
{% codeblock lang:bash %}
sudo apt-get install git
{% endcodeblock %}
<!-- more -->
2\. install libyaml
{% codeblock lang:bash %}
wget -c http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
tar xvf yaml-0.1.4.tar.gz 												 
cd yaml*
sudo ./configure   
sudo make    
sudo make install
{% endcodeblock %}

3\. install ruby
{% codeblock lang:bash %}
wget -c http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p327.tar.gz
tar xvf ruby-1.9.3-p327.tar.gz   
cd ruby*
sudo ./configure  
sudo make    
sudo make install    
# check the ruby version  
ruby -v   
# if you have trouble like this: 
#`require: cannot load such file -- openssl (LoadError)`   
# after installed octopress    
# means you need install libssl-dev   
sudo apt-get install libssl-dev   
# and enter the ruby source directory    
cd ruby*/ext/openssl   
sudo ruby extconf.rb   
sudo make   
sudo make install	
# tips: no need to rebuild the ruby, it works well	  
{% endcodeblock %}
   
4\. Generate ssh_key
{% codeblock lang:bash %}
# -> https://help.github.com/articles/generating-ssh-keys
# make sure you've installed ssh and have a *.ssh* directory    
# in your home    
cd ~/.ssh   
ssh-keygen -t rsa -C "yourmail"   
# f**k gfw   
echo "Host github.com   
User git   
Port 443   
Hostname ssh.github.com   
PreferredAuthentications publickey   
identityfile ~/.ssh/id_rsa" >> ~/.ssh/config   
# follow the ways given above put your pub key in github
# Testing   
ssh -T git@github.com
{% endcodeblock %}   


5\. install octopress
{% codeblock lang:bash %}
git clone git://github.com/imathis/octopress.git octopress    
cd octopress/    
# install dependencies   
gem install bundler    
bundle install    

# Install the default Octopress theme.     
rake install    

# Deploying to Github Pages    
rake setup_github_pages     
rake generate     
rake deploy     

# commit the source for your blog    
git add .    
git commit -m 'your message'    
git push origin source     
{% endcodeblock %}   

注：    
   注意权限问题，不要一会儿以root push 一会儿又以user push，会产生错误。   
   若出现其他错误，多半是没有安装编译依赖项等。   
   
   
   
   
   
   
