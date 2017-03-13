---
layout: default
title: Installing JHipster
permalink: /installation/
redirect_from:
  - /installation.html
sitemap:
    priority: 0.7
    lastmod: 2016-12-21T00:00:00-00:00
---

# <i class="fa fa-cloud-download"></i> 安装JHipster

## 安装方法

我们提供了4种 JHipster 的工作方式:

* 使用 Yarn 进行本地安装，这是一个经典的方式使用JHipster。所有都安装在你本机，可能设置起来比较复杂，但确是大多数人通常选择的方式。没什么问题的话，选择这个安装。

* 使用 NPM 进行安装，这个和使用 Yarn 安装差不多，只是用 NPM 替代了 [Yarn](https://yarnpkg.com/)。

*   一个基于Vagrant的"[开发工具箱](https://github.com/JHipster/JHipster-devbox)"，在一个基于Ubuntu的虚拟机上集成并配置好了开发所需的所有工具(STS，Yeoman，NODE，NPM，Genterator，JAVA8，Atom，MySQL)。

*   一个"[Docker](https://www.docker.io/)"容器版，一个安装JHipster的轻量级虚拟化的容器.

## 本地安装 (推荐给一般用户OSX 类Linux)

1.  安装JAVA8 [Oracle官网](http://www.oracle.com/technetwork/java/javase/downloads/index.html)。

2.  (选择) 安装一个Java构建工具。。
    *   无论你选择使用 [Maven](http://maven.apache.org/) 或者 [Gradle](http://www.gradle.org/)， 一般情况下你不需要安装任何东西， 因为 JHipster将会自动为你安装[Maven Wrapper](https://github.com/takari/maven-wrapper)或者[Gradle Wrapper](http://gradle.org/docs/current/userguide/gradle_wrapper.html)。
    
    *   如果你不想使用这些wrappers，去[Maven website](http://maven.apache.org/)或者[Gradle website](http://www.gradle.org/)官网下载自己的安装包。
    
3.  安装[git-scm.com](http://git-scm.com/). 如果你刚接触Git，我们建议你使用 [SourceTree](http://www.sourcetreeapp.com/)。

4.  安装[the Node.js website](http://nodejs.org/) (推荐Long Time Support版本).这也会安装NPM，NODE的包管理工具，将会在接下来的命令中使用。

5.  安装 Yarn，参见 [the Yarn website](https://yarnpkg.com/en/docs/install)

6.  安装 Yeoman: `yarn global add yo`

7. 如果是使用 AngularJS 1，安装 Bower: `yarn global add bower`

8. 如果是使用 AngularJS 1，安装 Bower: `yarn global add gulp-cli`

8.  安装 JHipster: `yarn global generator-JHipster`

注意：如果你在全局安装这些工具的时候遇到问题，请确保 `$HOME/.config/yarn/global/node_modules/.bin` 在你的环境变量中。(linux 下通过　`echo $PATH` 查看)

在  Mac 或者  linux 下使用导入环境变量 ```export PATH="$PATH:`yarn global bin`:$HOME/.config/yarn/global/node_modules/.bin"```


想要获取更多的信息， 提示和帮助，请参阅 [the Yeoman "getting starting" guide](http://yeoman.io/learning/index.html) 和 [NPM documentation](https://docs.npmjs.com/) 之后提交Issues [submitting a bug](https://github.com/JHipster/generator-JHipster/issues?state=open).

现在 JHipste r已经安装，下一步将是创建一个应用 [create an application]({{site.url}}/creating-an-app/)

## Vagrant 工具箱安装

[JHipster development box](https://github.com/JHipster/JHipster-devbox) 项目为你提供了开发JHipster 所必须工具的一个虚拟化环境.

它一个极简而快捷启动 JHipster的方式.

除了JHipster，这个虚拟化环境还包含了Spring Tool Suite， the Atom text editor and MySQL Workbench开发工具.

请到 [JHipster development box page](https://github.com/JHipster/JHipster-devbox) 获取安装和配置信息.

## Docker 安装 (高级用户)

_注意:这个Docker镜像在容器内部运行着JHipster生成器.它与JHipster生成器[Docker and Docker Compose configurations]({{site.url}}/docker-compose/)不同的是运行生成在内部容器的程序._

### 信息

JHipster有一个特别的 [Dockerfile](https://github.com/JHipster/generator-JHipster/blob/master/Dockerfile)， 能够提供一个 [Docker](https://www.docker.io/) 镜像.

它将提供一个Docker的自动构建: [https://hub.docker.com/r/JHipster/JHipster/](https://hub.docker.com/r/JHipster/JHipster/)

这个镜像将允许你运行JHipster在Docker内部.

### 准备工作

这取决于你的操作系统。

1.  **Linux:** Linux 为Docker提供了开箱即用. 请跟随Docker官网提供的教程 [Docker](https://docs.docker.com/installation/#installation).
2.  **Mac & Windows:** 安装 [Docker 工具箱](https://www.docker.com/docker-toolbox) 更简便的为你提供安装.

生成的文件在你的共享目录下，它们不会因为Docker容器的停止而被删除.无论怎样，如果你不想让总是让Dokcer去下载所有Maven和NPM的依赖，你应当挂载到本地的磁盘卷.

<div class="alert alert-warning"><i>警告: </i>
操作系统不同， 你的 <code>DOCKER_HOST</code> 将会不同. 在Linux上， 就简单的是你主机地址.
对于Mac/Windows， 你可以通过以下命令获取IP: <code>docker-machine ip default</code>
</div>

<div class="alert alert-info"><i>提示: </i>
Kitematic是一个Docker提供的开袋即食的图形化管理工具箱，这将会是安装的工作更加简单.
</div>

在Linux上，你可能需要以root用户运行`docker`命令，如果当前用户不属于容器组.建立将当前用户加入容器组以便运行容器命令的时候可以使用非root用户.按照这个步骤去实现 [http://askubuntu.com/a/477554](http://askubuntu.com/a/477554).

### 在Linux/Mac Windows 上使用(Docker 工具箱)

#### 拉取镜像

拉取JHipster最新版本的Docker镜像:

`docker pull JHipster/JHipster`

拉取JHipster开发环境Docker镜像:

`docker pull JHipster/JHipster:master`

这里你可以看到所有的标签 [here](https://hub.docker.com/r/JHipster/JHipster/tags/)

#### 运行镜像

<div class="alert alert-warning"><i>警告: </i>

如果你在Mac或者Win上使用Dokcer虚拟机在，你的Docker守护进程只限于访问你本机OS X或者Win文件系统.Docker虚拟机试图自动共享/Users(OS X)或者C:\Users\&lt;username&gt;(Win)文件夹，所以你需要将项目文件创建在这些文件夹下以避免卷挂载的问题.

</div>


在你Home目录下创建一个"JHipster"文件夹:

`mkdir ~/JHipster`

选择一下方式运行docker镜像:

*   Docker "/home/JHipster/app" 文件夹共享在本地的 "~/JHipster" 文件夹下
*   为Docker暴露这些端口 (8080 for Tomcat， 3000 for BrowserSync from the "gulp serve" task， 3001 for the BrowserSync UI)

`docker run --name JHipster -v ~/JHipster:/home/JHipster/app -v ~/.m2:/home/JHipster/.m2 -p 8080:8080 -p 3000:3000 -p 3001:3001 -d -t JHipster/JHipster`

<div class="alert alert-info"><i>提示: </i>

如果你已经启动过一次容器，你就不需要再运行上面那行命令了，你可以直接启动/停止已经存在的容器.

</div>

#### 检查容器是否已经运行

用 `docker ps` 命令检查你的容器是不是处于运行状态:

    CONTAINER ID    IMAGE               COMMAND                 CREATED         STATUS          PORTS                                                       NAMES
    4ae16c0539a3    JHipster/JHipster   "tail -f /home/jhipst"  4 seconds ago   Up 3 seconds    0.0.0.0:3000-3001->3000-3001/tcp， 0.0.0.0:8080->8080/tcp    JHipster

####常用操作

*   执行: `docker stop JHipster` 停止容器
*   执行: `docker start JHipster` 重新启动

如果你更新你的Docker镜像(重新构建或者从DockerHub拉取)，最好是删除现有的容器，然后运行上面的之前的命令.

1.  `docker stop JHipster`
2.  `docker rm JHipster`
3.  `docker pull JHipster/JHipster`
4.  `docker run --name JHipster -v ~/JHipster:/home/JHipster/app -v ~/.m2:/home/JHipster/.m2 -p 8080:8080 -p 3000:3000 -p 3001:3001 -d -t JHipster/JHipster`

### 访问容器

执行下面的命令是最简单的方法登录到运行容器中的方法:

`docker exec -it <container_name> bash`

如果你复制黏贴下面的命令去运行容器，意味着你必须指定`JHipster` 为容器名:

`docker exec -it JHipster bash`

你将以"JHipster"用户登陆.如果你需要 `sudo` ，密码和用户名一样为(`JHipster`).

### 你的第一个项目

你可以去容器下 `/home/JHipster/app` 目录，在容器内部此目录下开始构建你的程序:

`cd /home/JHipster/app`

`yo JHipster`

一旦你的程序创建好，你可以运行常规的 `gulp/bower/maven` 命令，如下:

`./mvnw`

**恭喜!你已经在容器内部启动了你的JHipster程序!**

在你本机，你应该能够 :

*   通过 `http://DOCKER_HOST:8080` 访问运行着的程序
*   在共享目录下获取所有生成的文件
