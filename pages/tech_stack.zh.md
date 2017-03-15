---
layout: default
title: JHipster 技术栈
permalink: /tech-stack/
redirect_from:
  - /tech_stack.html
sitemap:
    priority: 0.8
    lastmod: 2014-05-16T00:00:00-00:00
---

# 技术栈

## 客户端技术栈

单页面Web应用:

*   响应式页面设计
*   [HTML5 Boilerplate](http://html5boilerplate.com/)
*   [Twitter Bootstrap](http://getbootstrap.com/)
*   [AngularJS](http://angularjs.org/)
*   兼容 IE9+ 和其他现代浏览器
*   完整的国际化支持，基于 [Angular Translate](https://github.com/angular-translate/angular-translate)
*   可选 [Sass](https://www.npmjs.com/package/node-sass) 用于 CSS 设计
*   可选 Spring Websocket 来实现 WebSocket

强大的 [Yeoman](http://yeoman.io/) 开发工作流:

*   使用 [Bower](http://bower.io/) 可以轻松的安装 JavaScript 类库
*   使用 [Gulp.js](http://www.gulpjs.com) 构建, 优化项目, 支持 live reload
*   使用 [Karma](http://karma-runner.github.io/) and [PhantomJS](http://phantomjs.org/) 进行测试

那么，如果单页面应用不能满足你的需求呢？

*   支持 [Thymeleaf](http://www.thymeleaf.org/) 模板引擎, 用于在服务端渲染页面

## 服务端技术栈

一个完整的 [Spring 应用](http://spring.io/):

*   [Spring Boot](http://projects.spring.io/spring-boot/) 用于简化应用配置
*   [Maven](http://maven.apache.org/) 或者 [Gradle](http://www.gradle.org/) 用于构建，测试和运行应用
*   ["development" 和 "production" 配置文件]({{ site.url }}/profiles/) (支持 Maven 和 Gradle)
*   [Spring Security](http://docs.spring.io/spring-security/site/index.html)
*   [Spring MVC REST](http://spring.io/guides/gs/rest-service/) + [Jackson](https://github.com/FasterXML/jackson)
*   可选的 WebSocket 支持 -- 基于 Spring Websocket
*   [Spring Data JPA](http://projects.spring.io/spring-data-jpa/) + Bean 验证
*   使用 [Liquibase](http://www.liquibase.org/) 实现数据库自动更新
*   [Elasticsearch](https://github.com/elastic/elasticsearch) 支持对数据库的搜索功能
*   支持像[MongoDB](http://www.mongodb.org) 这样的 document-oriented NoSQL 数据库
*   支持像[Cassandra](http://cassandra.apache.org/) 这样的 column-oriented NoSQL 数据库
*   支持[Kafka](http://kafka.apache.org/) ，如果你想使用订阅-发布消息系统


支持生产环境：

*   Monitoring with [Metrics](http://metrics.dropwizard.io/) 监控运行状态
*   支持 [ehcache](http://ehcache.org/) (本地缓存) 或者 [hazelcast](http://www.hazelcast.com/) (分布式缓存)
*   可选的 HTTP session 集群 -- 基于 [hazelcast](http://www.hazelcast.com/)
*   优化的静态资源(gzip filter, HTTP cache headers)
*   日志管理 [Logback](http://logback.qos.ch/), 可在运行时配置
*   [HikariCP](https://github.com/brettwooldridge/HikariCP) 连接池，用于性能优化
*   可以将应用构建成一个标准的 WAR 文件或者一个可执行的 JAR 文件
*   支持所有主流云服务：AWS, Cloud Foundry, Heroku, Kubernetes, Docker...
