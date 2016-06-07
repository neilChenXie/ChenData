---
layout: post
title: MySQL 安装
permalink: /:categories/mysql_setup
date: 2016-06-07 13:45:15 +0800
category: MySQL
tags: [mysql, setup]
---

代码针对CentOS 7

## 源

[Package Source](https://dev.mysql.com/downloads/repo/)

* apt
* yum

```bash
# CentOS 7 choose RedHat Linux 7
rpm -ivh *.rpm
```

## Step

```bash
sudo yum update
sudo yum install mysql-server
```

