---
layout: post
title: flume 安装
permalink: /:categories/flume_setup
date: 2016-06-08 16:44:15 +0800
category: Input
tags: [input, flume]
---

### Step

下载

写配置文件

> 随意命名，启动时会声明位置

启动

```bash
# under $FLUME_HOME/
./bin/flume-ng agent --conf./conf/ --conf-file ./conf/flumetest2 --name a1-Dflume.root.logger=INFO,console
```
