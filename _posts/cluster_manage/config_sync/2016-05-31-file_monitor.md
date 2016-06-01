---
layout: post
title: Java 文件监控
date: 2016-05-31 17:17:15 +0800
category: 集群管理-配置同步
tags: [java, zookeeper， monitor]
---

## common-io

### Know First

* 设计模式-观察者模式

### Class 详解

FileAlterationObserver(String directory, FileFilter filter, IOcase caseSensitivity)

> FileAlterationObserver represents the state of files below a root directory, checking the filesystem and notifying listeners of create, change or delete events.

> 检查一个文件夹下，通过file filter之后的文件

Input:

* directory: 文件夹目录

* filter: 用于筛选文件, 默认null, 即整个文件夹

> ``java
IOFileFilter directories = FileFilterUtils.and(
                              FileFilterUtils.directoryFileFilter(),
                              HiddenFileFilter.VISIBLE);
IOFileFilter files = FileFilterUtils.and(
                              FileFilterUtils.fileFileFilter(),
                              FileFilterUtils.suffixFileFilter(".java"));
IOFileFilter filter = FileFilterUtils.or(directories, files);
```
* IOcase: 用于默认null,

FileAlterationListener

## jdk watcher
