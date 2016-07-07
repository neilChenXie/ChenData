---
layout: post
title: script小手册
permalink: /:categories/script_checklist
date: 2016-06-08 09:17:15 +0800
category: 索引
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

### Zookeeper

start/stop

```bash
zkServer.sh start/stop
```

check

```bash
zkServer.sh status
```

cli

```bash
zkCli.sh -server <host>:<port>
```

### Flume

```bash
flume-ng agent --conf ./conf/ --conf-file=./conf/flumetest --name a1 -Dflume.root.logger=INFO,console1
```

### Flume

start

```bash
# under $FLUME_HOME

#bin/flume-ng agent \
#--conf ./conf \
#--conf-file ./conf/{properties file} \
#--name a1 \
#-Dflume.root.logger=INFO,console

bin/flume-ng agent --conf ./conf --conf-file ./conf/{agent.properties} --name {agentName} -Dflume.root.logger=INFO,console
```

### Hive

```bash
# local
hive
# Server
hiveserver2
# Hive local Client
beeline -u jdbc:hive2://
# Hive Remote Client
beeline -u jdbc:hive2://$HS2_HOST:$HS2_PORT
```
