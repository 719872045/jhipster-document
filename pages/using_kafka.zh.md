---
layout: default
title: 使用 Kafka
permalink: /using-kafka/
redirect_from:
  - /using_kafka.html
sitemap:
    priority: 0.7
    lastmod: 2016-09-22T00:00:00-00:00
---

# <i class="fa fa-envelope"></i> 使用 Kafka

__注意!__ 这是一个新的特性，处在 <b>BETA</b> 阶段。 使用它你要自己承担风险！非常欢迎提供反馈意见！


## Features

[Kafka](http://kafka.apache.org/) 是一个流行的发布-订阅消息传递系统。 JHipster 提供了对 Kafka 的支持:

- 在 JHipster 中配置 [Spring Cloud Stream](https://cloud.spring.io/spring-cloud-stream/)。

- 当你添加一个 `topic-jhipster` topic 时，它会在 `application-*.yml` 文件中添加必要的配置，以实现对 Kafka 的监控，你可以在后台 admin 的界面中看到。

- 生成 Docker Compose 配置文件，并且提供一个简单的 `topic-jhipster` topic，然后你就可以通过 `docker-compose -f src/main/docker/kafka.yml up -d` 来使用 Kafka 了.

- 当你使用 Docker 时，在微服务环境下，有提供 Kafka 的支持。 Docker Compose sub-generator 可以生成特殊的 Kafaka 配置。Kafka 的 broker 将代理所有微服务应用及其网关的消息。
 

## 限制
- 我们目前没有提供一个完整的使用 kafka 示例，我们也没有前端代码使用到 Kafka。
 
