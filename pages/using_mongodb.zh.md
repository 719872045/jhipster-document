---
layout: default
title: Using MongoDB
permalink: /using-mongodb/
redirect_from:
  - /using_mongodb.html
sitemap:
    priority: 0.7
    lastmod: 2015-02-24T00:00:00-00:00
---

# <i class="fa fa-leaf"></i> 使用 MongoDB
你在生成应用的时候可以选择 MongoDB，当你选择 MongoDB 的时候：

* 采用 Spring Data Mongo 来访问数据库，它和 Spring Data JAP 很相似。

* 使用 [Mongobee](https://github.com/mongobee/mongobee) 来代替 [Liquibase](http://www.liquibase.org/) 来管理数据库的变更。
 
* [entity sub-generator]({{ site.url }}/creating-an-entity/) 不会在询问你实体间的映射关系，因为NoSQL 不需要这种管理映射关系。

 
* 当你运行单元测试的时候，将会使用 [de.flapdoodle.embed.mongo](https://github.com/flapdoodle-oss/de.flapdoodle.embed.mongo) 来运行一个内存数据库。

