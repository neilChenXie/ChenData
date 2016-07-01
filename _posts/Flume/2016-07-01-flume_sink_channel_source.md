---
layout: post
title: flume source channel sink索引
permalink: /:categories/flume_source_sink_channel
date: 2016-07-01 09:20:15 +0800
category: Input
tags: [input, flume]
---

### source

#### Exec source

[![exec source]({{ site.baseurl }}/image/Flume/Flume_Exec_Source.png)]({{ site.baseurl }}/image/Flume/Flume_Exec_Source.png)

#### spool directory source

> 监控文件夹，传输不文件不可修改，否则异常

#### avro source

[avro source](https://flume.apache.org/FlumeUserGuide.html#avro-source)

special attr

> ipFilter, ipFilterRules

### channel

#### Memory channel

[offical](https://flume.apache.org/FlumeUserGuide.html#memory-channel)


#### File channel

[official](https://flume.apache.org/FlumeUserGuide.html#file-channel)

处理问题

> * 备份文件位置，第二备份文件位置
* 最大文件大小，最小磁盘空间
* 恢复配置
* 加密

### sink

#### avro sink

[avro sink](https://flume.apache.org/FlumeUserGuide.html#avro-sink)

#### file_roll sink

[file_roll sink](https://flume.apache.org/FlumeUserGuide.html#file-roll-sink)

#### HDFS sink

[HDFS sink](https://flume.apache.org/FlumeUserGuide.html#hdfs-sink)

理解

> * 文件前后缀，临时文件前后缀
* file_roll阈值
