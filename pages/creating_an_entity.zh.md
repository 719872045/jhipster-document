---
layout: default
title: Creating an entity
permalink: /creating-an-entity/
redirect_from:
  - /creating_an_entity.html
sitemap:
    priority: 0.7
    lastmod: 2014-10-10T00:00:00-00:00
---

# <i class="fa fa-bolt"></i> 创建实体

_**你可以通过这个 [视屏教程]({{site.url}}/video-tutorial/) 建一个 JHipster 应用！**_

**注意** 如果想要你的 JavaScript/TypeScript 代码即时刷新(live reload), 你要运行 `gulp` (for JavaScript/AngularJS 1) 或者 `yarn start` (for TypeScript/Angular 2+)。你可以在 [JHipster 的开发模式]({{site.url}}/development/) 页面查看更多这方面的介绍。

## 介绍

当你创建完一个应用后，你会想创建 _entities_。举个例子，如果你想创建一个 _Author_ 和一个  _Book_ 实体。对于每个实体，你需要：

*   一个数据库表
*   在 Liquibase 记录数据库变更
*   一个 JPA 实体
*   一个 Spring Data JPA Repository
*   一个 Spring MVC REST Controller ，包含了 CRUD 基本的操作
*   前端 AngularJS 路由，包括一个 Controller 和一个 Service
*   HTML 视图
*   整合测试，验证一切是否达到预期
*   性能测试，查看一切是否顺利进行

如果你有多个实体对象，你可能要在它们之间生成映射关系。对此，你需要:

*   建立数据表外键
*   编写特定的 JavaScript 和 HTML 代码去处理它们的关系

entity sub-generator 可以创建上面所需的全部文件，生成的前端代码，为每一个实体提供基本的 CRUD 操作 (可以参见 [项目结构]({{site.url}}/using-angularjs/))。sub generator  可以通过命令 `yo jhipster:entity <entityName> --[options]` 来运行。更多信息参见 `yo jhipster:entity --help`

下面是支持的选项：

*   `--table-name <table_name>` - - 默认 JHipster 会生成名称和实体一样的数据库表，你可以通过这个命令来定制你的表名

*   `--angular-suffix <suffix>` - 如果你想你的 AngularJS 路由有自定义的前缀，你可以用这个选项来实现

*   `--regenerate` - 这个选项允许你对现有的实体类进行操作

*   `--skip-server` - 加上这个选项则仅生成客户端代码

*   `--skip-client` - 加上这个选项则只生成服务端代码

## JHipster UML 和 JDL Studio

这一章节描述如何使命令行界面创建实体。不过如果你想创建大量的实体和映射关系，你可能会喜欢通过图形工具来实现。

针对这种情况，有两个可供选择的工具：

*   [JHipster UML]({{site.url}}/jhipster-uml/)，可以让你使用 UML 编辑器。
*   [JDL Studio]({{site.url}}/jdl-studio/)，我们的可以让你使用 UML 编辑器。 [JDL]({{site.url}}/jdl/) 来创建实体和它们之间的映射关系。

如果你使用 JDL Studio:

*   你可以通过 JDL 文件来生成实体，使用 `import-jdl` sub-generator，通过运行 `yo jhipster:import-jdl your-jdl-file.jh`。
*   如果你像通过 JHipster UML 替代 the `import-jdl` sub-generator, 你需要通过运行 `npm install -g jhipster-uml` 命令来安装 jhipster-uml，然后运行 `jhipster-uml yourFileName.jh`。

## 实体属性

对于每个实体，你可以添加多个属性。你需要输入属性名称和类型，然后 JHipster 会生成你需要的代码和配置，从 AngularJS HTML 视图到 Liquibase 的变更日志。

这些属性的名称不能和你用到的技术的保留关键字相同。 举个例子，如果你用到 MySQL:

*   你不能使用 Java 的保留关键字（因为你的代码不能编译通过）。
*   你不能使用 Mysql 的保留关键字（你更新数据库的时候会失败）。


## 属性类型

JHipster 支持多种属性类型。这会依赖你后台所使用数据库，所有我们这里用 Java 的常用类型来表示他们：Java 中 `String` 在 Oracle 和 Cassandra 存储将会不一样，这也是 JHipster 的强项之一：为你生成正确的数据库访问代码。

*   `String`：Java 的 String 对象。它的默认大小依赖你的底层系统（如果你使用 JPA，它默认是 255。 个字符），但是你可以通过校验规则来改变它（举个例子，你可以设置它 `max` 值为 1024）。

*   `Integer`: Java 中的 Integer。

*   `Long`：Java 中的 Long。

*   `Float`：Java 中的 Float。

*   `Double`：Java 中的 Double。

*   `BigDecimal`: Java 中 `java.math.BigDecimal` 对象。 当你需要精确的数学计算时会用到（经常用于财务操作）。

*   `LocalDate`: Java 中 `java.time.LocalDate` 对象， 在 Java 中用来处理日期。

*   `ZonedDateTime`: Java 中 `java.time.ZonedDateTime` 对象, 在 Java 中用来处理日期和时间。

*   `Boolean`：Java 中的 Boolean 对象。

*   `Enumeration`: Java 中的 Enumeration 对象。 当你选择这种类型，sub-generator 将会询问你的 Enumeration 实例需要存储的值，然后它会创建一个 `enum` 类去存储它们。

*   `Blob`: 一个 Blob 对象。用来存储二进制数据。 当你选择这种类型，sub-generator 将问你是否要存储一些二进制数据，或者一个 image 对象。图像将会在 AngularJS 中进行特殊的处理，以便展示给最终用户。

## 校验

你可以为每个属性设置校验规则。这会依赖你的属性类型，每种类型对应不同的校验规则。

校验的代码会自动生成在：

*   HTML 视图代码中，使用 [AngularJS validation mechanism](https://docs.angularjs.org/guide/forms)。
*   Java domain 对象中，使用 [Bean Validation。](http://beanvalidation.org/)

在下面几种情况，Bean validation 将会被自动用来校验 domain 对象：

*   Spring MVC REST controllers （使用 `@Valid` 注解）。

*   Hibernate/JPA （实体对象在存储前将会被自动验证）。

验证信息也将被用于生成更精确的数据库元数据：

*   必填字段将会被标记为非空。

*   有一个最大长度限制的字段，将具有与之相同的列长度。

JHipster 的校验有些局限性：

*   我们并不支持所有的 AngularJS 和 Bean Validation 的校验规则，因为我们只是支持两者有相同 API 的部分。

*   正则表达式在 JavaScript 和 Java 中的处理方式并不一样，所有你在对一个属性使用正则表达式进行校验时，你需要调整下你生成的表达式。

*   JHipster 生成的单元测试是针对普通的实体对象，就是没有加上校验规则的。如果你生成的实体具有校验规则，你的单元测试可能不通过，需要你手动更新下默认生成的测试的值，让它符合你的校验规则以便通过单元测试。

## 实体间映射关系

实体间映射关系要基于 SQL 数据库。这个比较复杂，你可以查到文档 [Managing relationships]({{site.url}}/managing-relationships/)。

## 数据传输对象 (DTOs)

JHipster 实体默认不使用 DTOs，但是它们也是一个可选项。这里是相关文档：[Using DTOs]({{site.url}}/using-dtos/)。

## 分页

请注意分页现在不支持 [Cassandra]({{site.url}}/using-cassandra/)。当然这会在未来的版本中添加。

分页使用了 [the Link header](http://tools.ietf.org/html/rfc5988)。 正如 [GitHub API](https://developer.github.com/v3/#pagination)。JHipster 基于这个规范，提供了一个自定义实现，可以用在服务端（Spring MVC REST）和 客户端（AngularJS）。

当实体对象被生成后，JHipster 提供了4个分页选项：

*   没有分页 （这种情况下后台不提供分页）。

*   简单的分页， 基于 [Bootstrap 默认的分页](http://getbootstrap.com/components/#pagination-pager)。

*   复杂的分页， 基于 [Bootstrap 的分页组建](http://getbootstrap.com/components/#pagination)。

*   无限滚动的分页，基于 [ngInfiniteScroll（一个支持无限滚动的 AngularJS 组件）](http://sroze.github.io/ngInfiniteScroll/)。

## 更新已有的实体

实体的配置信息是存放在 `.jhipster` 目录下的 `.json` 文件中。所有你可以再次运行 sub-generator，利用现有的实体名称，更新或者重新生成实体。

当你对已存在的实体使用 sub-generator ，你需要回答问题 `Do you want to update the entity? This will replace the existing files for this entity, all your custom code will be overwritten` 有下面几个选项:

*   `Yes, re generate the entity` - 这意味着你利用现有的文件重新生成实体及它相关代码。 小技巧：你可以在命令后面加上 `--regenerate` 来达到这种效果。

*   `Yes, add more fields and relationships` - 这个选项会继续询问你添加属性的名称，以及是否添加更多映射关系。

*   `Yes, remove fields and relationships` - 这个选项会询问你要移除的实体中的属性名称和映射关系。

*   `No, exit` - 这个不会改变任何代码。

你可能因为下面几个原因想更新实体：

*   你想添加或者移除实体中的属性和映射关系。

*   你希望将实体代码重置为其原始状态。

*   你更新了 JHipster，你想采用新的模板生成的实体。

*   你修改了 `.json` 配置文件（这文件很容易看到，不复杂）, 所有你想以此生成新的模板。

*   你复制了 `.json。` 文件，想生成一个和之前文件想近的实体。

小提示：为了快速重新生成你的全部实体，你可以用下面的命令（带上 `--force` 移除询问实体属性的相关问题）：

*   Linux & Mac: ``for f in `ls .jhipster`; do yo jhipster:entity ${f%.*} --force ; done``
*   Windows: `for %f in (.jhipster/*) do yo jhipster:entity %~nf --force`

## 教程

这是一个简短的教程，创建两个实体（一个 Author 实体和一个 Book 实体），两者间存在一对多的映射关系。
 

### 生成 "Author" 实体

因为我们想在 Authors 和 Books 间构建一对多的映射关系 （一个作者有多本书），我们需要先创建 Author 实体。在数据库的层面，JHipster 才可以在 Booke 表中添加外键连接 Author 表。

`yo jhipster:entity author`

回答下面关于实体属性的问题，一个作者有：

*   一个 "String" 类型的 "name" 属性。
*   一个 "LocalDate" 类型的 "birthDate" 属性。

然后回答它们间映射关系的问题，一个作者可能：

*   和 "book" 实体存在一对多的映射关系（当然也可以是其它类型）。

### 生成 "Book" 实体

`yo jhipster:entity book`

回答下面关于实体属性的问题，一本书有:

*   "String" 类型的 "title" 的属性。
*   "String" 类型的 "description" 的属性。
*   "LocalDate" 类型的 "publicationDate" 的属性。
*   "BigDecimal" 的 "price" 的属性。

然后回答它们间映射关系的问题，book 实体:

*   和 "Author" 存在多对一的映射关系。
*   映射关系，使用 "name" (Author 实体的属性) 以用作前端展示。

### 检查生成的代码

可以通过 `mvn test` 来进行单元测试。

启动应用，登陆后在菜单 "entities" 查看 "Author" 和 "Book"。

检查数据库表，查看它们是否正确插入。

### 修改生成的代码

所生成的文件中包含的实体对象基本的 CRUD 操作，如果你的需求简单，则不需要怎么修改。

如果你想修改生成的代码或者数据库声明，你可以查看我们的 [开发指南]({{site.url}}/development/)。

如果你希望实现更加复杂的业务逻辑，你可能需要为 Spring 添加 `@Service` 类，可以使用 [service sub-generator]({{site.url}}/creating-a-service/)。

### 看到这里，恭喜你已经完成了本节的简单教程！

你生成的 CRUD 操作页面将会是如下效果:

![]({{site.url}}/images/screenshot_5.png)
