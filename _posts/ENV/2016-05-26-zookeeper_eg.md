---
layout: post
title: zookeeper官方例子及理解
date: 2016-05-26 10:45:15 +0800
category: Zookeeper
tags: [zookeeper, entry]
---

## 索引

* [official](http://zookeeper.apache.org/doc/current/javaExample.html)
* [中文版](http://www.cnblogs.com/haippy/archive/2012/07/20/2600077.html)

## 理解

### ZooKeeper Watcher代码实例

#### 主要的相关类和接口
`Executor` 实现了`Wathcer`接口、`Runnable`接口、`DataMonitorListener`接口。

通过connectString 监视ZooKeeper的一个ZNode。

当ZNode发生事件变化时，通过process(WatchedEvent event)方法调用DataMonitor的process(WatchedEvent event)方法。

`DataMonitor`实现了`Wathcer`接口和`StatCallback`接口。

DataMonitor处理ZNode发生变化时的process，以及处理StatCallback的回调方法。

##### Watcher接口
Watcher接口定义了process(WatchedEvent event) 方法，以及定义了接口Event。

接口Event中定义了KeeperState和EventType。

##### WatchedEvent
WatchedEvent由KeeperState、EventType和path组成。

它代表当前ZooKepper的连接状态，并且提供发生事件的znode路径以及时间类型。

其中KeeperState代表ZooKeeper的连接状态，分别为：

1.	Disconnected
2.	NoSyncConnected
3.	SyncConnected
4.	AuthFailed
5.	ConnectedReadOnly
6.	SaslAuthenticated
7.	Expired


EventType代表node的状态变更，分别为：

1.	None
2.	NodeCreated
3.	NodeDeleted
4.	NodeDataChanged，就算设置重复的数据也会有该事件
5.	NodeChildrenChanged

##### AsyncCallback接口
StatCallback接口是AsyncCallback的一种。

AsyncCallback一共定义了如下几个CallBack

1. DataCallback
2. ACLCallback
3. ChildrenCallback
4. StatCallback
5. StringCallback
6. VoidCallback
7. Children2Callback

### 创建ZooKeeper Session

通过

```java
ZooKeeper(String connectString, int sessionTimeout, Watcher watcher)
```

就可以创建Zookeeper的一个Session。


#### A Simple Watch Client 代码实例

#####过程和原理

1.	Executor 初始化连接到ZooKeeper，并且注册自己为一个监视器Watcher
2.	W在接收到事件后，执行process()方法，调用DataMonitor.process()。
3.  process() 处理连接之后的一切事件
4.  processResult() 处理zk.exists()的callback

###### 连接到客户端

```bash
zkCli.sh -server 127.0.0.1:2181
```

运行后`Executor.main`后，

会得到一个WatchEvent,它的state为SyncConnected,type为null。


如果此时set znode 结点的数据，比如：

```bash
set /yangqi_test new-data
```

会得到一个WatchEvent,它的state为SyncConnected,type为NodeDataChanged 。

相应的，删除结点的时候，将获得类型为NodeDeleted 的Event。创建结点的时候为NodeCreated 。


#### ZooKeeper.exists()

```java
public void exists(final String path, Watcher watcher,
        StatCallback cb, Object ctx)
```

其中:

```java
interface StatCallback extends AsyncCallback {
    public void processResult(int rc, String path, Object ctx, Stat stat);
}
```


StatCallback 中只有一个方法processResult()，用于处理exits()方法后的回调。

#### ZooKeeper.getData()

```java
public byte[] getData(String path, boolean watch, Stat stat)
```

用于获得指定路径的数据。
