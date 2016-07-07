---
layout: post
title: Hive Debug经验
date: 2016-05-19 17:14:15 +0800
category: Hive
tags: [hive, debug]
---

#### 客户端访问执行MapReduce任务，user=anonymous导致任务被拒

解决

```xml
<!--hive-site.xml-->
<property>  
    <name>hive.server2.enable.doAs</name>
    <value>false</value>
</property>
```
[索引](http://blog.zhaishidan.cn/2015/05/15/jie-jue-beelinelian-jie-hiveserver2zhi-xing-sqlbao-cuo-de-wen-ti/)

#### Hive 2.\* 远程连接

Bug

```bash
Error: Failed to open new session: java.lang.RuntimeException: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.security.authorize.AuthorizationException): User: hadoop is not allowed to impersonate anonymous (state=,code=0)
```

安全策略，不能匿名远程连接
