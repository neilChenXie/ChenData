---
layout: post
title: MySQL 添加User
permalink: /:categories/mysql_adduser
date: 2016-06-07 15:45:15 +0800
category: MySQL
tags: [mysql, setup]
---

## 创建用户

```mysql
# @ 前面是用户名，后面是访问方式， 最后是密码
CREATE USER 'name'@'%' IDENTIFIED BY '123456';
```

### 访问方式

本地

> `'localhost'`


远程

> `'%'`

### 授权

```mysql
grant <权限> on <数据库>.* to '<用户名>'@'<登录主机>' identified by "<密码>";
flush privileges;
```

权限

> ALL, SELECT, DELETE, UPDATE, CREATE, DROP

### check

```mysql
show grants for '<username>'@'<hots>';
```
