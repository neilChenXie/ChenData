---
layout: post
title: flume avro架接
permalink: /:categories/flume_memchan
date: 2016-06-12 16:30:15 +0800
category: Input
tags: [input, flume]
---

### 多节，由avro连接

agent

```bash
agent1.sources= r1
agent1.sinks= k1 k2 k3
agent1.channels= c1

# link together
agent1.sources.r1.channels= c1
agent1.sinks.k1.channel= c1
agent1.sinks.k2.channel= c1
agent1.sinks.k3.channel= c1


# source config
agent1.sources.r1.type= netcat
agent1.sources.r1.bind= localhost
agent1.sources.r1.port= 12345
#agent1.sources.r1.type= exec
#agent1.sources.r1.command= tail -F /home/hadoop/zookeeper.out

# sink1 config
agent1.sinks.k1.type= avro
agent1.sinks.k1.hostname= 172.16.2.51
agent1.sinks.k1.port= 4141

# sink2 config
agent1.sinks.k2.type= avro
agent1.sinks.k2.hostname= 172.16.2.52
agent1.sinks.k2.port= 4141

# sink3 config
agent1.sinks.k3.type= avro
agent1.sinks.k3.hostname= 172.16.2.53
agent1.sinks.k3.port= 4141

# channel config
agent1.channels.c1.type= memory
agent1.channels.c1.capacity= 1000
agent1.channels.c1.transactionCapacity= 100

# sinkgroup
a1.sinkgroups = g1
a1.sinkgroups.g1.sinks = k1 k2 k3
a1.sinkgroups.g1.processor.type = load_balance
a1.sinkgroups.g1.processor.backoff = true
a1.sinkgroups.g1.processor.selector = round_robin
```

collector

```bash
a1.sources= r1
a1.sinks= k1
a1.channels= c1

# link together
a1.sources.r1.channels= c1
a1.sinks.k1.channel = c1

# source config
a1.sources.r1.type= avro
a1.sources.r1.bind= 0.0.0.0
a1.sources.r1.port= 4141

# sink config
#a1.sinks.k1.type = logger
a1.sinks.k1.type = file_roll
a1.sinks.k1.sink.directory = /home/hadoop/flume/logs

# channel config
a1.channels.c1.type= memory
a1.channels.c1.capacity= 1000
a1.channels.c1.transactionCapacity= 100
```
