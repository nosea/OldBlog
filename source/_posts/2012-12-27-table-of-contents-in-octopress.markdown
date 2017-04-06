---
layout: post
title: "Table of Contents in Octopress"
date: 2012-12-27 19:12
comments: true
categories: Octopress
toc: true
---
# 1.安装jQuery
## 1.1 下载
{% codeblock %}
wget -c http://code.jquery.com/jquery-1.8.3.min.js
wget -c http://fuelyourcoding.com/scripts/toc/jquery.toc.zip
{% endcodeblock %}
<!-- more -->
## 1.2 安装
    I.将jquery-1.8.3.min.js放置于source/javascripts/目录
	II.将jquery.toc.zip解压,取出jquery.tableofcontents.min.js
	   同样放置于source/javascripts/目录
## 1.3 配置
I.修改source/_includes/custom/head.html，添加下面的内容
{% codeblock lang:html %}
{% raw %}
<script src="{{ root_url }}/javascripts/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="{{ root_url }}/javascripts/jquery.tableofcontents.min.js" type="text/javascript"></script>
<script type="text/javascript">
	  jQuery.noConflict();
</script>
<script src="{{ root_url }}/javascripts/generate-toc.js" type="text/javascript"></script>
{% endraw %}
{% endcodeblock %}
II.把下面的内容保存为generate-toc.js放置于source/javascripts/目录
{% codeblock generate-toc.js lang:js %}
{% raw %}
function generateTOC(insertBefore, heading) {
  var container = jQuery("<div id='tocBlock'></div>");
  var div = jQuery("<ul id='toc'></ul>");
  var content = $(insertBefore).first();

  if (heading != undefined && heading != null) {
    container.append('<span class="tocHeading">' + heading + '</span>');
  }

  div.tableOfContents(content);
  container.append(div);
  container.insertBefore(insertBefore);
}
{% endraw %}
{% endcodeblock %}
III.在source/_includes/custom/after_footer.html文件里添加如下内容
{% codeblock lang:html %}
{% raw %}
{% comment %}
------------------------------------------------------------------------------
Table of contents generator
------------------------------------------------------------------------------
{% endcomment %}

{% if index %}
  {% comment %}
  No table of contents on the index page.
  {% endcomment %}

{% elsif page.toc == true %}
<script type="text/javascript">
jQuery(document).ready(function() {
  // Put a TOC right before the entry content.
  generateTOC('.entry-content', 'Table of Contents');
});
</script>
{% endif %}
{% endraw %}
{% endcodeblock %}
IV.将下面内容保存为_mixins.scss放置于sass/custom/目录下
{% codeblock lang:css %}
{% raw %}
@mixin rounded-border($radius: 10px) {
    border-radius: $radius;
    -moz-border-radius: $radius;
   padding: $radius;
}

@mixin centered($width: auto) {
    width: $width !important;
    margin-left: auto !important;
    margin-right: auto !important;
}

@mixin drop-shadow-right-bottom($width: 5px, $color: #999) {
    box-shadow: $width $width $width $color;
    -moz-box-shadow: $width $width $width $color;
    -webkit-box-shadow: $width $width $width $color;
}
{% endraw %}
{% endcodeblock %}
V.然后修改sass/custom/_styles.scss添加如下内容
{% codeblock lang:css %}
{% raw %}
@import "mixins";
{% endraw %}
{% endcodeblock %}
VI.将下面内容保存为_screen.scss放置于sass/custom/目录下
{% codeblock lang:css %}
{% raw %}
$toc-bg: #dfdfdf;

$toc-incr: 5px;

div#tocBlock {
    @include drop-shadow-right-bottom(5px, #999);
    @include rounded-border(10px);
    float: right;
    font-size: 10pt;
    width: 300px;
    padding-left: 20px;
    padding-right: 10px;
    padding-top: 10px;
    padding-bottom: 0px;

    background: $toc-bg;
    border: solid 1px #999999;
    margin: 0 0 10px 15px;

    .tocHeading {
        font-weight: bold;
        font-size: 125%;
    }

    #toc {
        background: $toc-bg;
        ul {
            list-style: disc;
            li {
                margin-left: $toc-incr !important;
                padding: 0 !important;
            }
        }
    }
}
{% endraw %}
{% endcodeblock %}
VII.保存下面内容为_print.scss放置于sass/custom/
{% codeblock lang:css %}
{% raw %}
@import "mixins";

$toc-incr: 1em;

div#tocBlock {
    font-size: 10pt;
    padding-left: 20px;
    padding-right: 10px;
    padding-top: 10px;
    padding-bottom: 0px;

    background: white !important;
    border: solid 1px #999999;
    margin: 0 0 10px 15px;

    .tocHeading {
        font-weight: bold;
        font-size: 125%;
    }

    #toc {
        background: white !important;
        ul {
            list-style: disc;
            li {
                margin-left: $toc-incr !important;
                padding: 0 !important;
            }
        }
    }
}
{% endraw %}
{% endcodeblock %}
VIII.在sass/screen.scss里添加如下内容
{% codeblock lang:css %}
{% raw %}
@import "custom/screen";
@import "custom/print";
{% endraw %}
{% endcodeblock %}
# 2.使用
设置toc为true即可
```
layout: post
title: "Table of Contents in Octopress"
date: 2012-12-27 19:12
comments: true
categories: Octopress
toc: true
```
# 3.Reference
* [Generating a Table of Contents in Octopress](http://brizzled.clapper.org/blog/2012/02/04/generating-a-table-of-contents-in-octopress/)    
Thanks!
