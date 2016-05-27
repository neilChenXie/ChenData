---
layout: post
title: zookeeper历程
date: 2016-05-23 11:45:15 +0800
category: Zookeeper
tags: [zookeeper, entry]
---

## Time-Line

### 第一天理解

提供了基础的元数据（metadata）同步，及元数据相关API，由此提供集群相关应用的基础。

### 第三天理解

实际提供了一个变化广播机制，在单点修改znode值时，通知所有Watcher，像node.js的socket.io

下一步学习资料：
* [学习经验](https://github.com/neilChenXie/zookeeper)
* [配置文件同步例子](https://github.com/neilChenXie/syncconf)

### 第四天理解

zookeeper一次watch机制，通过getDate，getChildren，exists注册.

已入门，后续经验直接记录在其他博文中
