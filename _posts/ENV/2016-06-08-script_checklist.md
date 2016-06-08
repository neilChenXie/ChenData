---
layout: post
title: script小手册
permalink: /:categories/script_checklist
date: 2016-06-08 09:17:15 +0800
category: Environment
tags: [checklist]
---

### Hadoop

start

```bash
# $HADOOP_HOME/sbin/
start-dfs.sh
start-yarn.sh
mr-jobhistory-daemon.sh start historyserver
# check log to see wether startup successfully
```

### HBase

start

```bash
# $HBASE_HOME/bin
start-hbase.sh
# check log to see wether startup successfully
```

stop

```bash
stop-hbase.sh
```
