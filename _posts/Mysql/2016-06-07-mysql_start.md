---
layout: post
title: MySQL 第一次启动
permalink: /:categories/mysql_start
date: 2016-06-07 14:45:15 +0800
category: MySQL
tags: [mysql, setup]
---

##启动

```bash
systemctl start  mysqld.service
```

## 设置密码

第一次启动会有一个随机root密码

```bash
sudo grep 'temporary password' /var/log/mysqld.log
```

然后设置密码

```mysql
# MySQL
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';
```

```bash
# Bash
mysql_secure_installation
# 默认是至少8位，大小写，特殊字符，数字都要,e.g. !@QWqw12
```
