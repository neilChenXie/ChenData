---
layout: post
title: eclipse调试远程Hadoop集群
date: 2016-05-17 18:44:15 +0800
category: Hadoop
tags: [hadoop, eclipse, setup]
---

网上有不少资料，但是不清楚eclipse是否和Hadoop在同一台机器上，而我需要的是Master和Eclipse不
在同一机器上的编程环境。

## 参考

[厦门大学教程](http://dblab.xmu.edu.cn/blog/hadoop-build-project-using-eclipse/)

步骤概要：

一、eclipse装插件

> 启动需`eclipse -clean`:

> * 当eclipse owner不是root时，需要sudo运行，但这样跑WordCount的时候，程序会用**root用户名**去链接Hadoop集群，而Hadoop集群一般不开放root账号，导致连接不上
  * 解决，`sudo chown -R root:root eclipse`把owner给root，不用`sudo`也可运行，并且用**当前用户名**链接hadoop集群
  * 因为用**当前用户名**，所以应该用**hadoop**用户开发

二、链接HDFS

> 需要在hadoop的hdfs-site.xml增加, permission问题

```xml
<property>
    <name>dfs.permissions.enabled</name>
    <value>false</value>
</property>
```

三、跑WordCount  

> * 将`$HADOOP_HOME/etc/hadoop/`下所有有修改的文件放到`src`文件夹下
* 把HDFS的Output文件夹清空，否则，会报错。
* 在master和所有slave上允许开发机自动登陆，连接master安排任务，连接slave看进度；
  * 只增加master不增加slave，可以正常跑任务，但是开发机console会显示，slave连接超时或refused，无法查看到任务进度。

**Bug**

>一般为 **连接** 问题， **权限** 问题，仔细分析即可

* `cannot find TokenizerMapper` wordCount例子包名需要是`org.apache.hadoop.examples`
