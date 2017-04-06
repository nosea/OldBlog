---
layout: post
title: "配置 Octopress"
date: 2012-12-10 17:09
comments: true
categories: Octopress 
---
一.给Octopress添加评论  
    1.到DISQUS:http://disqus.com/ 注册一个账号，并且把你的博客地址添加到DISQUS.  
    2.编辑_config.xml, 修改如下两行   
        disqus_short_name: your_disqus_short_name   
        disqus_show_comment_count: true    
    Tips:
        只有rake generate之后，rake priview才能看到效果.   
<!-- more -->		
二.给Octopress添加分类  
   参考:[http://codemacro.com/2012/07/18/add-category-list-to-octopress/](http://codemacro.com/2012/07/18/add-category-list-to-octopress/)  
   Thanks！  
   添加category_list插件, 将下列代码保存到plugins/category_list_tag.rb;  
``` ruby
module Jekyll
  class CategoryListTag < Liquid::Tag
    def render(context)
      html = ""
      categories = context.registers[:site].categories.keys
      categories.sort.each do |category|
        posts_in_category = context.registers[:site].categories[category].size
        category_dir = context.registers[:site].config['category_dir']
        category_url = File.join(category_dir, category.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase)
        html << "<li class='category'><a href='/#{category_url}/'>#{category} (#{posts_in_category})</a></li>\n"
      end
      html
    end
  end
end

Liquid::Template.register_tag('category_list', Jekyll::CategoryListTag)
```    
   添加到侧边栏:复制以下代码到source/_includes/asides/category_list.html    
{% codeblock lang:html %}
{% raw %}
<section>
  <h1>Categories</h1>
  <ul id="categories">
    {% category_list %}  
  </ul>
</section>
{% endraw %}
{% endcodeblock %}

   修改_config.xml
``` 
default_asides: [asides/category_list.html, asides/recent_posts.html]
```   
