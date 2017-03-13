---
layout: default
title: Using Oracle
permalink: /using-oracle/
redirect_from:
  - /using_oracle.html
sitemap:
    priority: 0.7
    lastmod: 2015-06-08T18:40:00-00:00
---

# <i class="fa fa-archive"></i> 使用 Oracle 数据库

使用JPA时，你可以选择使用Oracle数据库.

_仅支持  Oracle 12c 和以上版本._

因为 Oracle 有专有的 JDBC 驱动，由于专利问题，我们不能把它和 JHipster 绑定在一起。这个驱动可以使用 Oracle 的 Maven 仓库，需要专门的配置，并且不能公开，当然前提是需要一个 Oracle 的账号。

 你的 Maven 和 Gradle 文件已经添加了对 Oracle Maven 仓库的支持，当然你需要自己配置你的身份认证信息。可以参考[Oracle 的这篇 blo](https://blogs.oracle.com/dev2dev/entry/how_to_get_oracle_jdbc).

当你在 JHipster 中使用 Oracle 的时候，会有以下限制：
- 实体的名称不能超过26个字符，这是因为Oracle对象的命名限制为30个字符的，还有，我们将预留剩下的4个字符，用于为已经生成的表创建主键的序列。
- 实体的属性名称也不能超过30个字符。
- 创建映射关系时，外键名称不能超过30个字符，如果太长，它们将被截断。
- 当创建多对多的映射关系时，关联表名也将遵循 JPA 的规范，按照 表名1_表名2 的格式，如果太长，也会被截断。
- Oracle的保留关键字不能用作实体和属性的名称。

