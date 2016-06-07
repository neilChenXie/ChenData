---
layout: post
title: Hive Debug经验
date: 2016-05-19 17:14:15 +0800
category: Hive
tags: [hive, debug]
---

## hiveserver2

```bash
beeline -u jdbc:hive2://$HS2_HOST:$HS2_PORT
```
客户端访问执行MapReduce任务，user=anonymous导致任务被拒

解决

```xml
<!--hive-site.xml-->
<property>  
    <name>hive.server2.enable.doAs</name>
    <value>false</value>
</property>
```
[索引](http://blog.zhaishidan.cn/2015/05/15/jie-jue-beelinelian-jie-hiveserver2zhi-xing-sqlbao-cuo-de-wen-ti/)
