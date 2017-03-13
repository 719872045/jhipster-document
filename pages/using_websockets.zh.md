---
layout: default
title: Using Websockets
permalink: /using-websockets/
redirect_from:
  - /using_websockets.html
sitemap:
    priority: 0.7
    lastmod: 2015-08-31T18:40:00-00:00
---

# <i class="fa fa-envelope"></i> 使用 WebSockets

WebSockets 在动态应用中是非常有用的，数据可以近乎实时的在客户端和服务端传递。

JHipster 目前使用 Spring WebSockets 来作为 WebSockets 的一种实现，所有你可以可以在  [Spring WebSockets website](http://docs.spring.io/spring/docs/current/spring-framework-reference/html/websocket.html)获取更多信息。

这个功能有一些限制：

- 默认情况下，我们使用 WebSockets 的 dispatcher ，它是常驻在内存中的。明显的，如果你使用了多个服务，这就会比较难拓展，如果真的有这样的需要，你就需要参考 Spring WebSockets 文档来，它会告诉你如何来配置一个外部代理。
 

##   "Tracker" 案例

JHipster 提供了一个简单的 "tracker" 案例。在 `admin` 的菜单中，它会追踪其它用户的行为：你可以看到你们登录IP 信息，以及他们目前在浏览的页面。

- 这个简单的案例可以让你快速开始使用 WebSockets，虽然距离生成环境下的要求还差一点距离，但是已经很不错了。

 
- 它展示了如何整合 WebSockets 和 Spring Security，当然这是一个比较复杂的话题。
- It will show you how to integrate WebSockets with Spring Security, which is quite a complex topic

- 这个可以正常工作，源于 JHipster 的客户端是一个单页应用，所以 WebSockets 连接不用在各个页面创建连接，这也是从 JHipster 架构优良的一个体现。

