---
layout: default
title: 使用Angular2
permalink: /using-angular/
sitemap:
    priority: 0.7
    lastmod: 2015-01-29T23:41:00-00:00
---

# <i class="fa fa-html5"></i> 使用Angular2

**提醒**   如果你使用 AngularJS 1.x, 请查看[使用 AngularJS1.X 文档]({{site.url}}/using-angularjs/).

## 工具

Angular 2+ is 使用 TypeScript 替代了 JavaScript，因此你需要一些特殊的工具，来更加高效的利用它。我们在 [development]({{site.url}}/development/) 提到的 Angular2+ 的工作流程如下：

1. 当你生成一个应用，在所有文件被创建之后，就会触发 `yarn install` 来安装依赖。 
 
2. 当 `yarn install` 完成，它会执行在 `package.json` 中配置的 `postInstall`  的脚本, 这一部会触发 `webpack:build` 任务。

3. 执行完成后，你应该可以看到所有的前端资源文件在 `www` 文件夹中。`www` 文件夹在 `target`或者 `build` 目录下，这依赖于你选择的构建工具是 Maven 还是 Gradle。

4. 现在你可以运行 `./mvnw` 或者 `./gradlew` 来启动后端服务，启动后的默认地址和端口为 [localhost:8080](localhost:8080)，此时项目已经包含了上面一步生成的前端代码。

5. 现在你可以运行 `yarn start` 来启动 Webpack 的 dev-server ，由 BrowserSync 提供。这个可以让你实时编译你的 TypeScript code，并且自动刷新浏览器。

如果你没有运行 `yarn start` ,并且你修改了客户端代码，你不会看到任何效果，你要么运行 `yarn webpack:build:dev`，或者 `yarn start`。
 
你也可以强制 maven/gradle 运行 `webpack:build:dev` 任务，对应命令为， `./mvnw -Pdev,webpack` ，`./gradlew -Pdev -Pwebpack`。 

- 为了方便在浏览器上进行调试，我们推荐使用 [Angular Augury](https://augury.angular.io/),因此你可以看见你的路由，并且很轻松的进行 debug 调试。 

## 项目结构

JHipster 客户端代码在 `src/main/webapp` 文件夹下， 代码风格遵循  [John Papa Angular 2 style guide](https://github.com/johnpapa/angular-styleguide/blob/master/a2/README.md)。请先阅读这篇指南，如果你对我们的应用架构有任何疑问，包含文件名字，TypeScript 风格... 

这篇编码风格指南由 Angular 团队所认可，提供了最佳实践，所有的 Angular 项目都应该遵从。

对应 Angular 路由，我们遵循 a dash cased naming 的命名约定，这样可以让 URLs 看起来简洁一致。

For Angular routes we follow a dash cased naming convention so that the URLs are clean and consistent.

When you generate an entity the route names, route URLs and REST API endpoint URLs are generated according to this convention, also entity names are automatically pluralized where required.

这个是前端项目的主要文件结构：

    webapp
    ├── app                               - Your application
    │   ├── account                       - User account management UI
    │   ├── admin                         - Administration UI
    │   ├── blocks                        - Common building blocks like configuration and interceptors
    │   ├── entities                      - Generated entities (more information below)
    │   ├── home                          - Home page
    │   ├── layouts                       - Common page layouts like navigation bar and error pages
    │   ├── shared                        - Common services like authentication and internationalization
    │   ├── app.main.ts                   - Main application class
    │   ├── app.module.js                 - Application modules configuration
    │   ├── app.route.js                  - Main application router
    ├── content                           - Static content
    │   ├── css                           - CSS stylesheets
    │   ├── images                        - Images
    ├── i18n                              - Translation files
    ├── scss                              - Sass style sheet files will be here if you choose the option
    ├── swagger-ui                        - Swagger UI front-end
    ├── 404.html                          - 404 page
    ├── favicon.ico                       - Fav icon
    ├── index.html                        - Index page
    ├── robots.txt                        - Configuration for bots and Web crawlers

使用[entity sub-generator]({{site.url}}/creating-an-entity/) 来创建一个名为 `Foo` 的实体，这里是生成在 `src/main/webapp` 目录下的前端代码： :

    webapp
    ├── app
    │   ├── entities
    │       ├── foo                                    - CRUD front-end for the Foo entity
    │           ├── foo.component.html                 - HTML view for the list page
    │           ├── foo.component.ts                   - Controller for the list page
    │           ├── foo.model.ts                       - Model representing the Foo entity
    │           ├── foo.module.ts                      - Angular module for the Foo entity
    │           ├── foo.route.ts                       - Angular Router configuration
    │           ├── foo.service.ts                     - Service which access the Foo REST resource
    │           ├── foo-delete-dialog.component.html   - HTML view for deleting a Foo
    │           ├── foo-delete-dialog.component.ts     - Controller for deleting a Foo
    │           ├── foo-detail.component.html          - HTML view for displaying a Foo
    │           ├── foo-detail.component.ts            - Controller or displaying a Foo
    │           ├── foo-dialog.component.html          - HTML view for editing a Foo
    │           ├── foo-dialog.component.ts            - Controller for editing a Foo
    │           ├── foo-popup.service.ts               - Service for handling the create/update dialog pop-up
    │           ├── index.ts                           - Barrel for exporting everything
    ├── i18n                                           - Translation files
    │   ├── en                                         - English translations
    │   │   ├── foo.json                               - English translation of Foo name, fields, ...
    │   ├── fr                                         - French translations
    │   │   ├── foo.json                               - French translation of Foo name, fields, ...

请注意 'fr' 文件夹取决于你在生成代码时选择的语音。
 
## 授权-Authorizations

JHipster 使用 [the Angular router](https://angular.io/docs/ts/latest/guide/router.html) 来组织管理客户端各个不同的 part.


For each state, the required authorities are listed in the state's data, and when the authority list is empty it means that the state can be accessed anonymously.

The authorities are also defined on the server-side in the class `AuthoritiesConstants.java`, and logically the client and server-side authorities should be the same.


In the example below, the 'sessions' state is designed to be accessed only by authenticated users who have `ROLE_USER` authority:

    export const sessionsRoute: Route = {
        path: 'sessions',
        component: SessionsComponent,
        data: {
            authorities: ['ROLE_USER'],
            pageTitle: 'global.menu.account.sessions'
        },
        canActivate: [UserRouteAccessService]
    };

Once those authorities are defined in the router, they can be used through `jhiHasAnyAuthority` directive within its 2 variants based on type of argument:

- for a single string, the directive only displays the HTML component if the user has the required authority
- for an array of strings, the directive displays the HTML component if the user has one of the listed authorities

For example, the following text will only be displayed to users having the `ROLE_ADMIN` authority:

    <h1 *jhiHasAnyAuthority="'ROLE_ADMIN'">Hello, admin user</h1>

For example, the following text will only be displayed to users having one of the `ROLE_ADMIN` or `ROLE_USER` authorities:

    <h1 *jhiHasAnyAuthority="`['ROLE_ADMIN', 'ROLE_USER']">Hello, dear user</h1>

*Please note* that those directives only show or hide HTML components on the client-side, and that you also need to secure your code on the server-side!

##  ng-jhipster 库

ng-jhipster 是一个免费开源的库， 具体参见 [https://github.com/jhipster/ng-jhipster](https://github.com/jhipster/ng-jhipster)。


ng-jhipster 库包含了一些有用的函数和常见的组件，他们包括：

- Validation directives
- Internationalization components
- Commonly-used pipes like capitalization, ordering and word truncation
- Base64, date and pagination handling services
- A notification system (see below)

### 通知系统
JHipster 使用自定义的通知系统，来实现从服务端推送事件到客户端。

JHipster uses a custom notification system to send events from the server-side to the client-side, and has i18n-capable `JhiAlertComponent` and `JhiAlertErrorComponent` components which can be used throughout the generated applications.

By default JHipster will show error notifications when there is an error caught from an HTTP response.

To show a custom notification or alert, use the below methods after injecting the `AlertService` to your controller, directive or service.

The shorthand methods `success`, `info`, `warning` and `error` will have a default timeout of 5 seconds, which can be configured:

    this.alerts.push(
        this.alertService.addAlert(
            {
                type: 'danger',
                msg: 'you should not have pressed this button!',
                timeout: 5000,
                toast: false,
                scoped: true
            },
            this.alerts
        )
    );
