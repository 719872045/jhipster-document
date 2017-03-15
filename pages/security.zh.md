---
layout: default
title: 安全
permalink: /security/
redirect_from:
  - /security.html
sitemap:
    priority: 0.7
    lastmod: 2015-01-27T00:00:00-00:00
---

# 给应用程序添加安全机制

使用Spring Security和单页应用,就像Jhipster生成的代码,你需要Ajax的登录/退出/错误页面.为了更好的使用,我们已经为这些页面配置好了Spring Security,并且已经为你生成好了所有的Javascript和HTML代码.

默认情况下, JHipster 内置了4中不同的用户:

*   "system",只主要为审计日志
*   "anonymousUser", 匿名用户
*   "user", 拥有 "ROLE_USER" 权限的普通用户. 密码为 "user"
*   "admin", 拥有 "ROLE_USER" 和 "ROLE_ADMIN" 权限的管理员. 默认密码为 "admin"

处于安全因素,你应该修改这些密码

## HTTP Session 认证

这是一个典型的Spring Security认证机制,我们在此基础上做了显著的改善,使用HTTP Session,是一个有状态的机制,如果你计划扩展你的程序,你需要一个粘滞回话的负载均衡器,以便每个用户都在同一个服务器.

### 改进了 `remember-me` 机制

我们改进了Spring Security的 `remember-me` 机制,以便每个用户只有一个独立的Token,它储存在你的数据库 (关系型或非关系型数据库,这取决于你生成项目时候的选择),我们同样也储存了很多信息变准实现.所以你能更好的理解这些Tokens来自那里:IP地址,浏览器,数据...我们已经生成了一个完全的管理员界面,以便你能够注销sessions,比如你在其他终端忘记登出.

### Cookie 防盗保护

我们已经添加了一个非常完善的cookie防窃取保护机制,我们会将用户的安全信息储存在cookie,以及数据库中,用户每一次登录的时候我们都会更新这些值并检查它们是否已经改变.这样的话,如果有人窃取了你的cookie,在大多数情况下他基本只能使用一次.

### CSRF 保护

Spring Security和AngularJS的CSRF保护机制都是开袋即食的,不幸的是它们并没有使用相同的cookie和HTTP headers!在实践中,所有的CSRF攻击都没有得到保护.当然,我们重新配置了两个工具一遍他们能联合并确实的工作在一起.

## 社交登录

JHipster使用Spring Social提供`社交登录`,所以用户可以使用Google, Facebook or Twitter认证应用程序,这个配置在在Spring Boot的启动模块(application.properties or application.yml).

## OAuth2 认证

Oauth2是一个无状态的安全机制,如果在夸多个服务器之间的规模化应用你可能会比较喜欢使用它.我们已经为你配置好了Spring Security对Oauth2提供了的实现.

使用Oauth2最大的问题是,依赖多个数据库表去储存安全令牌.如果你使用关系型数据库,我们提供了Liquibase changlog一遍这些表都能自动为你创建.

Spring Security仅在关系型数据库支持Oauth2,我们也实现了MongoDB版本,我们为你生成了MongoDB对Oauth2的所有实现,以及MongoDB所有的必要配置.

这个解决方案使用一个密钥,应当在application.yml文件里配置,作为身份认证密钥属性.

## JWT 认证

[JSON Web Token (JWT)](https://jwt.io/) 认证, 类似 OAuth2, 它是一个无状态的安全机制,所以它是另一个不错的选择对于规模化的多服务应用.

Spring Security默认没有实现这种认证机制,它是JHipster一个特别的集成[the Java JWT project](https://github.com/jwtk/jjwt),使用和集成起来比Oauth2更简单,因为不需要任何的持久化机制,所以使用JWT可以选择和关系型,非关系型数据库.

这个解决方案使用安全令牌需要保留用户的登录名和权限,如果当前Token被持有,它将不能被用户更改.

密钥的配置应在 `application.yml` 文件, 如 `jhipster.security.authentication.jwt.secret` 属性.