---
layout: post
title: Hive HBase 结合
date: 2016-07-07 14:45:15 +0800
category: Hive
tags: [hive, hbase]
---

### 索引

一、[official](https://cwiki.apache.org/confluence/display/Hive/HBaseIntegration#HBaseIntegration-AvroDataStoredinHBaseColumns)

hbase.columns.mapping

> 多列 "hbase.columns.mapping" = "info:col1,info:col2,city:nu"

hbase.table.name

> hbase中的表名

hbase.mapred.output.outputtable

> TBA

### 摘抄

HBase TO Hive

```
CREATE EXTERNAL TABLE hbase_table_2(key int, value string) 
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = "cf1:val")
TBLPROPERTIES("hbase.table.name" = "some_existing_table", "hbase.mapred.output.outputtable" = "some_existing_table");
```

Hive TO HBase

> 两者由是否EXTERNAL区分

```
CREATE TABLE hbase_table_1(key int, value string) 
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf1:val")
TBLPROPERTIES ("hbase.table.name" = "xyz", "hbase.mapred.output.outputtable" = "xyz");
```
