---
layout: post
title: Hadoop 配置
date: 2016-05-17 11:44:15 +0800
category: Hadoop
tags: [hadoop, configuration]
---

此只为Hadoop，即HDFS和MapReduce。

配置都在/etc/hadoop下

## 基本配置


slaves

> Slave列表

```
slave1
slave2
```

core-site.xml

> 接入点信息，临时文件总位置

```xml
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://Master:9000</value>
    </property>
    <property>
        <name>hadoop.tmp.dir</name>
        <value>file:/usr/local/hadoop/tmp</value>
        <description>Abase for other temporary directories.</description>
    </property>
</configuration>
```

hdfs-site.xml

> HDFS配置, secondary namendoe 信息，备份数量，临时文件具体位置

```xml
<configuration>
    <property>
        <name>dfs.namenode.secondary.http-address</name>
        <value>Master:50090</value>
    </property>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
    <property>
        <name>dfs.namenode.name.dir</name>
        <value>file:/usr/local/hadoop/tmp/dfs/name</value>
    </property>
    <property>
        <name>dfs.datanode.data.dir</name>
        <value>file:/usr/local/hadoop/tmp/dfs/data</value>
    </property>
</configuration>
```

mapred-site.xml(默认文件名为 mapred-site.xml.template)

> MapReduce信息, 当分布式时才需要

```xml
<configuration>
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
    </property>
    <property>
        <name>mapreduce.jobhistory.address</name>
        <value>Master:10020</value>
    </property>
    <property>
        <name>mapreduce.jobhistory.webapp.address</name>
        <value>Master:19888</value>
    </property>
</configuration>
```

 yarn-site.xml

 > MapReduce 资源管理配置

```xml
<configuration>
    <property>
        <name>yarn.resourcemanager.hostname</name>
        <value>Master</value>
    </property>
    <property>
        <name>yarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
    </property>
</configuration>
```

## 环境配置

JAVA_HOME

> CentOS在.bashrc下配好即可；但在Ubuntu下，hadoop-env.sh中的`JAVA_HOME=${JAVA_HOME}`
没有正常赋值，改为具体的/path/to/jdk


## 高级配置

高级配置将基于实用