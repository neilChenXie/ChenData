# Stage

Draft plan

## Data Process Overview

* 业务 3 阶段
    1. 统计
    2. 分析
    3. 挖掘

* 主流环境
    * Hadoop：入门
    * Spark: 针对机器学习优化——挖掘阶段
    * Storm：实时处理——业务需求待定

* 架构组成
    * kafka——日志传输
    * HBase/Mongo/Cassandra——Schemed Log & Result
    * HDFS——Original Log Storage
    * Hive and similar framework——统计
    * Data Model Design——数据仓库构建

## Build Stage

主要业务目标是统计，考虑分析和挖掘的扩展；
环境为Hadoop；
在实验中深化对各组件的理解，在实验后决定使用的组件。

1. 概念入门
2. Demo系统搭建
3. 简单统计Demo
4. 制定适合世强的数据仓库设计构建计划
5. 日志规范化计划
6. 实际架构调研和决定
7. 实际系统搭建
