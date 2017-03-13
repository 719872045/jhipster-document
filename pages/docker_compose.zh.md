---
layout: default
title: Docker and Docker Compose
permalink: /docker-compose/
redirect_from:
  - /docker_compose.html
sitemap:
    priority: 0.7
    lastmod: 2016-06-19T00:00:00-00:00
---

# <i class="fa fa-music"></i> Docker 和 Docker Compose

## 摘要

我们推荐在开发环境下和生产环境上使用 Docker 和 Docker Compose。


1. [介绍](#1)
2. [前提](#2)
3. [Differences when using a microservices architecture](#microservices)
4. [为你的应用构建 Docker 镜像](#3)
5. [Working with databases](#4)
6. [Elasticsearch](#5)
7. [Sonar](#6)
8. [公共命令](#7)
9. [内存调整](#8)

## <a name="1"></a> 介绍

_注意事项: 这个 Docker 配置是用于在 docker 容器镜像中运行你的应用。要区别与使用 [Docker setup]({{ site.url }}/installation/)  安装 JHipster，那个是在容器中运行 JHipster 的生成器。_


JHipster 提供了对 Docker 的完整支持：

- 促进开发，你可以很容易开始一个全栈应用，即便使用了负责的微服务架构

- 对于使用了 Docker Swarm 的用户，可以直接部署应用。

使用 Docker Compose 的一大特色是，你可以使用`docker-compose scale` 来设置同一个服务运行的容器个数。如果你用 JHipster 来构建 [a microservices architecture](#3)，这会非常有趣。

当你生产了一个应用，JHipster 也会为你生成：

- 一个 `Dockerfile` 文件用于构建 Docker 镜像，以及在 容器中运行你的应用。

- 几个 Docker Compose 配置，帮助你运行第三方应用，比如数据库。

这些文件在放在  `src/main/docker/` 目录下。


## <a name="2"></a> 前提

你必须安装了 Docker 和 Docker Compose:

- [Docker](https://docs.docker.com/installation/#installation)
- [Docker Compose](https://docs.docker.com/compose/install)

<div class="alert alert-info"><i>Tip: </i>

在 Windows 和 Mac OS X 上, Kitematic 是一个非常容易使用的图形界面工具，它使我们在使用 Docker 时变得非常容易。

</div>

<div class="alert alert-warning"><i>Warning: </i>

如果你是在 Mac 和 Windows 上使用 Docker，你的 Docker daemon(守护进程) 只有有限的权限去访问你的 OS X 或者 Windows 文件系统。Docker 会尝试使用你的 /Users (OS X) or C:\Users\&lt;username&gt; (Windows) 文件夹。所以你必须在这个文件夹下创建你的项目文件夹，一避免一些问题，特别是如果你使用了 <a href="{{ site.url }}/monitoring/">JHipster Console</a> 来作为监视器。

</div>


当你安装 JHipster UNL(或者其它的一些依赖包) 的时候遇到了  `npm ERR! Error: EACCES: permission denied` 错误时，你的容器可能没有使用 `sudo` 去安装(比如说，Ubuntu Xenial 就没有绑定 sudo )。

__解决方案 1__

NPM 官方文档建议我们不要使用 root  去安装 任何 NPM 的包，参见 [official documentation](https://docs.npmjs.com/getting-started/fixing-npm-permissions) 可以修复此问题。 

__解决方案 2__

  - `docker exec -u root -it jhipster bash`,
  - `npm install -g YOUR_PACKAGE`,
  - 然后按照正常的方式退出，: `docker exec -it jhipster bash`

## <a name="microservices"></a> 构建微服务时注意事项

_如果你的是单体应用，你可以跳过这一节_

如果你选择了生成 [微服务架构]({{ site.url }}/microservices-architecture/) 应用，每一个应用（网关，微服务实例） 都有一个 `Dockerfile` 和 Docker Compose 配置文件，想一个普通的单体应用。

但是你可以使用特殊的  `docker-compose` 子生成器，可以为你的所以网关、微服务实例，生成一个全局的 Docker Compose 配置。这可以让你用一个命令去部署容器，以及设置运行容器的个数。
 

- 你需要把你的网关和微服务实例放在同一个文件夹下。
 
- 创建另外一个文件夹，比如说 `mkdir docker-compose`。

- 进入目录 `cd docker-compose`。
- 运行子生成器， `yo jhipster:docker-compose`。
- 然后子生成器会问你哪些应用需要包含在你的架构中，以及问你是否需要使用 ELK 来监控。

这会生成一个全局的 Docker Compose 配置，输入 `docker-compose up` 就可以运行，然后所有应用都会一次性运行起来。 

这个配置有个预先配置好的 JHipster 注册中心，这会自动配置你全部的 services：

- 这些 services 会等 JHipster Registry 运行起来才启动（这个可以在你的 `bootstrap-prod.yml` 文件中通过 `spring.cloud.config.fail-fast` 和 `spring.cloud.config.retry` 这两个key  来配置）

- 注册中心会配置你的应用，比如说它会在所有的 services 中自动分享 JWT 的密钥。 
- 你可以通过 Docker Compose 来增加或者减少你的服务个数，比如说运行  `docker-compose scale test-app=4` 会有4个 "test" 实例运行。这些实例会自动在网关中被加载，也会自动加入到同一个 Hazelcast cluster (如果 Hazelcast 是你的 Hibernate 2 级缓存)。

## <a name="3"></a> 构建和运行你的 Docker 镜像应用

为了构建你的 Docker 镜像应用，并且发布到 Docker 的仓库：

- 使用 Maven，运行: `./mvnw package -Pprod docker:build`
- 使用 Gradle，运行: `./gradlew bootRepackage -Pprod buildDocker`

这会使用 `prod` 的配置去打包你的应用，并生成镜像。

为了运行镜像，需要使用到在你应用的  `src/main/docker` 目录下的 Docker Compose 的配置。

- `docker-compose -f src/main/docker/app.yml up`

这个命令会启动你的应用，以及它的依赖（数据库，搜索引擎，JHipster 注册中心等等）

## <a name="4"></a> 使用数据库

### MySQL, MariaDB, PostgreSQL, MongoDB or Cassandra

运行 `docker-compose -f src/main/docker/app.yml up` 会自动开启你的数据库。

如果你只是想运行你的数据库，不想运行其它的 services，使用 Docker Compose 中数据库的配置：

- 使用 MySQL: `docker-compose -f src/main/docker/mysql.yml up`
- 使用 MariaDB: `docker-compose -f src/main/docker/mariadb.yml up`
- 使用 PostgreSQL: `docker-compose -f src/main/docker/postgresql.yml up`
- 使用 MongoDB: `docker-compose -f src/main/docker/mongodb.yml up`
- 使用 Cassandra: `docker-compose -f src/main/docker/cassandra.yml up`

### MongoDB 集群模式

如果你想使用 MongoDB 的副本集或者分片配置，你需要手动构建 Mongo 镜像。使用下面的步骤：

- 构建镜像: `docker-compose -f src/main/docker/mongodb-cluster.yml build`
- 运行数据库: `docker-compose -f src/main/docker/mongodb-cluster.yml up -d`
- 缩放你的  mongodb 节点数 service (你需要选择一个奇数的节点个数): `docker-compose -f src/main/docker/mongodb-cluster.yml scale <name_of_your_app>-mongodb-node=X`

- 初始化副本集(param 是节点数， folder 是 YML 文件的位置，默认实在 `docker` 文件夹下): `docker exec -it <yml_folder_name>_<name_of_your_app>-mongodb-node_1 mongo --eval 'var param=X, folder="<yml_folder_name>"' init_replicaset.js`

- Init the shard: `docker exec -it <name_of_your_app>-mongodb mongo --eval 'sh.addShard("rs1/<yml_folder_name>_<name_of_your_app>-mongodb-node_1:27017")'`
- Start your application: `docker-compose -f src/main/docker/app.yml up -d <name_of_your_app>-app`

如果你想添加或者移除 MongoDB 的节点数，只需要重复步骤3、4。

### Cassandra

Cassandra  与其他数据库不同的是，schema 迁移是由应用程序本身执行的，而 Cassandra 则是有专门的容器来完成。
 

#### <a name="cassandra-in-development"></a>在开发环境下使用 Cassandra 
为了在本地启动 Cassandra cluster 集群去运行你的应用，你可以在开发环境下运行：

`docker-compose -f src/main/docker/cassandra.yml up -d`


Docker-compose 会启动2个 service:

- `<name_of_your_app>-cassandra`:  一个包含 Cassandra 节点的容器 

- `<name_of_your_app>-cassandra-migration`: 一个自动运行所有 CQL 脚本的容器。 (create the Keyspace, create the tables, all data migrations, ...)

参考 [Cassandra page]({{ site.url }}/using-cassandra/) 去实现不需要重启本地集群来添加新的 CQL 脚本。

#### 在生产环境下使用 Cassandra 

要注意 `app.yml` 是通过使用    `cassandra-cluster.yml` 来配置集群的。

应用将在 Cassandra 集群启动后几秒启动(参考 _JHIPSTER_SLEEP_  变量)

Cassandra 和 其它数据库的一大不同点是，它可以通过 Docker Compose 来拓展你的集群，运行

- `docker-compose -f src/main/docker/cassandra-cluster.yml scale <name_of_your_app>-cassandra-node=X`


## <a name="5"></a> Elasticsearch

运行 `docker-compose -f src/main/docker/app.yml up` 会自动启用你的搜索服务。

如果你只想运行你的 Elasticsearch 节点，而不需要运行其它服务，使用下面的 Docker Compose 配置：

- `docker-compose -f src/main/docker/elasticsearch.yml up`

## <a name="6"></a> 代码分析工具之 Sonar

你可以通过 Docker  Compose 提供的配置来运行 Sonar:
- `docker-compose -f src/main/docker/sonar.yml up`

想分析你的 code，可以在你的项目下运行：

- With Maven: `./mvnw sonar:sonar`
- With Gradle: `./gradlew sonar`

Sonar 生产的报告可以在 [http://localhost:9000](http://localhost:9000) 预览。

## <a name="7"></a> 通用的命令

### 列出所有容器
 你可以运行 `docker ps -a` 列出所有容器
 
    $ docker ps -a
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
    fc35e1090021        mysql               "/entrypoint.sh mysql"   4 seconds ago       Up 4 seconds        0.0.0.0:3306->3306/tcp   sampleApplication-mysql

### 查看 Docker 容器的状态  
`docker stats` 或者 {% raw %}`docker stats $(docker ps --format={{.Names}})`{% endraw %}  命令会列出所有容器的  CPU, Memory, Networking I/O and Block I/O 的状态

    $ docker stats {% raw %}$(docker ps --format={{.Names}}){% endraw %}
    CONTAINER                 CPU %               MEM USAGE / LIMIT     MEM %               NET I/O               BLOCK I/O             PIDS
    jhuaa-mysql               0.04%               221 MB / 7.966 GB     2.77%               66.69 kB / 36.78 kB   8.802 MB / 302.5 MB   37
    00compose_msmongo-app_1   0.09%               965.6 MB / 7.966 GB   12.12%              121.3 kB / 54.64 kB   89.84 MB / 14.88 MB   35
    00compose_gateway-app_1   0.39%               1.106 GB / 7.966 GB   13.89%              227.5 kB / 484 kB     117 MB / 28.84 MB     92
    jhipster-registry         0.74%               1.018 GB / 7.966 GB   12.78%              120.2 kB / 126.4 kB   91.12 MB / 139.3 kB   63
    gateway-elasticsearch     0.27%               249.1 MB / 7.966 GB   3.13%               42.57 kB / 21.33 kB   48.16 MB / 4.096 kB   58
    00compose_jhuaa-app_1     0.29%               1.042 GB / 7.966 GB   13.08%              101.8 kB / 78.84 kB   70.08 MB / 13.5 MB    68
    msmongo-mongodb           0.34%               44.8 MB / 7.966 GB    0.56%               49.72 kB / 48.08 kB   33.97 MB / 811 kB     18
    gateway-mysql             0.03%               202.7 MB / 7.966 GB   2.54%               60.84 kB / 31.22 kB   27.03 MB / 297 MB     37

### Scale a container

运行 `docker-compose scale test-app=4` 会有 4 个 "test" 的实例应用运行。

### Stop 停止容器

`docker-compose -f src/main/docker/app.yml stop`

你也可以直接运行

`docker stop <container_id>`

当你停止容器，数据不会被删除，除非你删除了容器。

### 删除容器

注意，这会删除所有数据

`docker rm <container_id>`


## <a name="8"></a> 内存调整

在容器中，为了调整你的应用的运行内存，你可以在 `Dockerfile` 或者 `docker-compose.yml` 中设置 Java  内存参数。

### 在 Dockerfile 添加内存参数

设置环境变量

```
    environment:
      - (...)
      - JAVA_OPTS=-Xmx512m -Xms256m
```

### 在 docker-compose.yml 设置内存参数

这种方案会覆盖 Dockerfile 的配置。使用这种方式，你可以在一个地方控制你所有容器中，你应用的运行内存。 

在 `environment` 添加 JAVA_OPTS.


```
    environment:
      - (...)
      - _JAVA_OPTIONS=-Xmx512m -Xms256m
```
