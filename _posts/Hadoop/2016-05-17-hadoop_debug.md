---
layout: post
title: Hadoop 调试经验
date: 2016-05-17 15:44:15 +0800
category: Hadoop
tags: [hadoop, debug]
---

此只为Hadoop，即HDFS和MapReduce。

## 遇到Bug

### 错误信息说明token过期

```
Container launch failed for container_1463468712850_0003_02_000006 : org.apache.hadoop.yarn.exceptions.YarnException: Unauthorized request to start container.
This token is expired. current time is 1463501809339 found 1463470009005
Note: System times on machines may be out of sync. Check system time and time zones.
```
问题：各系统间时区设置不同

解决

```bash
#查看可选时区
timedatectl list-timezones | grep Asia

#设置时区
timedatectl set-timezone Asia/Hong_Kong
```
