---
layout: post
title: flume interceptors
permalink: /:categories/flume_interceptors
date: 2016-06-14 13:20:15 +0800
category: Input
tags: [input, flume]
---

### 索引

[官网](https://flume.apache.org/FlumeUserGuide.html#flume-interceptors)

[regex filter](https://flume.apache.org/FlumeUserGuide.html#regex-filtering-interceptor)

[regex extractor](https://flume.apache.org/FlumeUserGuide.html#regex-extractor-interceptor)

### 需求

在日志传输过程中做初步分类，过滤。

### 摘要

If you have multiple collectors writing to the same HDFS path, then you could also use the HostInterceptor.


### 理解

#### regex extractor

[正则教程](http://www.runoob.com/regexp/regexp-syntax.html)

对于java来说，读取正则字符串，`\d`表示转义`\\d`=>`\d`,所以都会多一个`\`