---
layout: default
title: Using Elasticsearch
permalink: /using-elasticsearch/
redirect_from:
  - /using_elasticsearch.html
sitemap:
    priority: 0.7
    lastmod: 2016-11-21T00:00:00-00:00
---

# 使用 Elasticsearch

在你选择数据库的基础上，Elasticsearch 是一个为你的应用提供搜索能力的选项。

这个选项有一定的局限性：

*  你只能在 SQL 数据库的基础上运行，因为它是一个新的特性，所以先支持了主流的 SQL 数据库，暂时没有添加对 Cassandra 和 MongoDB 的支持。
*  不保证你的数据库和 elasticsearch 的数据一致性，因此你需要自己写代码同步数据。这也是正常的，毕竟 Elasticsearch 并不是真正意义上的数据库。当你在异步同步数据库的时候，你有可能需要使用到 Spring 的 `@Scheduled`` 注解。

当你选择了 Elasticsearch :

*   Spring Data Elasticsearch 将会被使用，并且会在 Spring Boot 中自动配置好。([这是文档](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-nosql.html#boot-features-elasticsearch))。
*   默认情况下，我们在开发环境中使用嵌入式的 Elasticsearch ，在生成环境中则连接到一个 Elasticsearch 集群。 你可以在 `application.yml` 文件中配置。
    当使用开发的配置，嵌入式的 Elasticsearch 将数据存储在 target 文件夹下，你可以通过 `mvn clean` 来清除这些数据。
*   在 "repository" 包目录下有个名为 "search" 的子包，它存在着所有的 ElastiSearch repositories。
*   Elasticsearch 获取了 "User" 实体的索引，你可以在 RESET 的接口列表里面找到 `/api/_search/users/:query` 并使用它。
*   当你使用 [实体生成器]({{ site.url }}/creating-an-entity/) ，Elasticsearch 会自动从新生成的实体中获取索引，并且添加到 REST 接口中。搜索功能也加入到 AngularJS 的用户界面，你可以在 CRUD 的页面搜索你的实体对象。
*   在开发环境下（使用 dev profile），你需要在 `application-dev.yml` 中添加以下配置来开启 http 的支持：
```
elasticsearch:
  properties:
      http:
          enabled: true
```