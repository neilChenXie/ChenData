---
layout: post
title: MySQL 创建元数据存储库
permalink: /:categories/mysql_setup_metastore
date: 2016-07-19 13:45:15 +0800
category: MySQL
tags: [mysql, setup, metastore]
---

### 意义

大数据的组件如，Hive，Ambari等都需要MySQL数据库来存储元数据。

### 索引

[夏大教学指南-Hive安装](http://dblab.xmu.edu.cn/blog/hive-in-practice/#more-509)

### 摘抄

> 以Hive为例

```sql
# 创建所需名字的数据库
create database hive;                  

# 创建用户（如果需要）
CREATE USER 'hive'@'%' IDENTIFIED BY '123456';

# 给用户赋权
grant all on hive.* to hive@'%' identified by 'hive';
grant all on hive.* to hive@'localhost' identified by 'hive'; 

# 刷新
flush privileges;
```
   
### 经验

#### 初始化

> 很多情况下，数据库都需要通过官方提供的\*.sql文件进行初始化

```sql
source /path/to/sqlfile.sql;
```
