---
layout: post
title: Hive安装
date: 2016-05-19 11:45:15 +0800
category: SekormData
tags: [hive, setup]
---

## Reference

[厦门大学](http://dblab.xmu.edu.cn/blog/hive-in-practice/#more-509)

## 理解及问题

### 安装步骤概要:

> 1. 下载，解压
2. `cp hive-default.xml.template hive-site.xml` under $HIVE_HOME/conf
3. 检查`$HADOOP_HOME`,`$JAVA_HOME`等环境变量，教程中很详细
4. 直接运行 hive，此为Hive命令行模式

**Bug**

> ```
Exception in thread "main" java.lang.RuntimeException: java.lang.IllegalArgumentException: java.net.URISyntaxException: Relative path in absolute URI: ${system:java.io.tmpdir%7D/$%7Bsystem:user.name%7D
	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:522)
	at org.apache.hadoop.hive.cli.CliDriver.run(CliDriver.java:677)
	at org.apache.hadoop.hive.cli.CliDriver.main(CliDriver.java:621)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.apache.hadoop.util.RunJar.run(RunJar.java:221)
	at org.apache.hadoop.util.RunJar.main(RunJar.java:136)
Caused by: java.lang.IllegalArgumentException: java.net.URISyntaxException: Relative path in absolute URI: ${system:java.io.tmpdir%7D/$%7Bsystem:user.name%7D
	at org.apache.hadoop.fs.Path.initialize(Path.java:205)
	at org.apache.hadoop.fs.Path.<init>(Path.java:171)
	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:563)
	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:508)
	... 8 more
Caused by: java.net.URISyntaxException: Relative path in absolute URI: ${system:java.io.tmpdir%7D/$%7Bsystem:user.name%7D
	at java.net.URI.checkPath(URI.java:1823)
	at java.net.URI.<init>(URI.java:745)
	at org.apache.hadoop.fs.Path.initialize(Path.java:202)
```

原因

> 默认设置中的属性：`hive.querylog.location`，`hive.exec.local.scratchdir`， `hive.downloaded.resources.dir`
的默认值`${system:java.io.tmpdir}`等无法正常识别

解决

> 将其改为具体的$HIVE_HOME/iotmp或是其他具体路径即可

### metadata 由MySQL存储

> 1. 创建hive账户，hive数据库，分配权限
2. 下载 mysql-connector-java
3. 配置hive-site.xml连接MySQL
4. JLine 文件加到$HADOOP_HOME/share/hadoop/yarn/lib
5. 创建hive临时文件夹

**订正**

> jdbc连接参数，连接用?不是;
```xml
<property>
    <name>javax.jdo.option.ConnectionURL</name>
    <value>jdbc:mysql://localhost:3306/hive?createDatebaseIfNotExist=true</value>                           
    <description>JDBC connect string for a JDBC metastore</description>
</property>
```
