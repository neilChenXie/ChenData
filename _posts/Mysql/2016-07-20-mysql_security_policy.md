---
layout: post
title: MySQL 密码安全
permalink: /:categories/mysql_security_policy
date: 2016-07-20 11:45:15 +0800
category: MySQL
tags: [mysql, security]
---

> 实际上是一些全局变量（GLOBAL VARIABLES）

### 索引

[官方文档](https://dev.mysql.com/doc/refman/5.7/en/validate-password-options-variables.html)

### 操作

#### 查看

```bash
SHOW VARIABLES LIKE 'validate_password%';
```

#### 设置

```bash
SET GLOBAL validate_password_policy=LOW;
```
