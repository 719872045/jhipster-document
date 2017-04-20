
## 介绍

* 这是 JHipster 官方文档的中文翻译，始终于官方 master 分支同步。

* 此项目仅在官方原有文档的基础上，添加需要翻译的 markdown 、html  文件，翻译的文件均以 .zh.md 或 .zh.html 文件结尾，不修改原有文件。

* 此项目已经部署在，可以通过 www.jhipster.cc 来访问。
 
* JHipster qq 交流群：58612944。

* 感谢Q群中所有参与翻译人员,感谢二把刀提供的域名。

* 如何部署此项目？

    * 先安装 rvm,ruby,jekyll。
    * 使用 *./create-deploy-project.sh* 脚本 copy 整个项目，并且替换 *.zh.* 文件，然后 *cd ..* 就可以见到一个带部署的项目
    * 进入到新生成的项目中，*./run-jekyll.sh* 启动项目



## 进度

#### 未翻译
- video_tutorial.md
- using_cassandra.md
- using_cache.md
- thanks.md
- team.md
- showcase.md
- setting_up_ci_windows.md
- setting_up_ci.md
- setting_up_ci_linux.md
- setting_up_ci_jenkins2.md
- setting_up_ci_jenkins1.md
- running_tests.md
- releases.md
- profiles.md
- production.md
- policies.md
- openshift.md
- oh-my-zsh.md
- monitoring.md
- kubernetes.md
- jhipster_uml.md
- jhipster-ide.md
- jhipster-app.md
- jdl.md
- heroku.md
- help.md
- fisherman.md
- docker_hub.md
- development.md
- customizing-bootstrap-4.md
- customizing-bootstrap-3.md
- configuring-ide-visual-studio-code.md
- configuring_ide_netbeans.md
- configuring_ide_idea.md
- configuring_ide_eclipse.md
- configuring_ide_eclipse_gradle.md
- configuring_a_corporate_proxy.md
- common-application-properties.md
- code-quality.md
- cloudfoundry.md
- boxfuse.md
- aws.md
- artwork.md

#### 已翻译或正在翻译
- using_websockets.md
- using-uaa.md
- using_oracle.md
- using_mongodb.md
- using_kafka.md
- using_elasticsearch.md
- using_dtos.md
- using_angular.md
- using_angularjs.md
- upgrading_an_app.md
- training.md
- tips.md
- tech_stack.md
- shell-plugins.md
- security.md
- screenshots.md
- microservices_architecture.md
- managing_relationships.md
- installing_new_languages.md
- installation.md
- docker_compose.md
- creating_a_service.md
- creating_an_entity.md
- creating_an_app.md
- consulting.md
- configuring_ide.md

---


This is the source of JHipster's public [Web site](http://jhipster.github.io/).
=======

This Web site is rendered with GitHub pages.

To run this locally

* [Fork this](https://github.com/jhipster/jhipster.github.io/fork) repo and clone to your file system
* [Install Jekyll](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/)
* Run `bundle install` if you are running it for the first time
* Run `bundle exec jekyll serve` in the cloned repo folder
* you will be able to access the site at http://localhost:4000

Or with Docker (recommended way on Windows)
* [Fork this](https://github.com/jhipster/jhipster.github.io/fork) repo and clone to your file system
* `docker container run --rm --label=jekyll --volume=$(pwd):/srv/jekyll -it -p 4000:4000 jekyll/jekyll:pages bundle exec jekyll serve`
* or on Windows: `docker container run --rm --label=jekyll --volume=%CD%:/srv/jekyll -it -p 4000:4000 jekyll/jekyll:pages bundle exec jekyll serve`
* you will be able to access the site at http://localhost:4000
