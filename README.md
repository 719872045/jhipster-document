
* 这是 JHipster 官方文档的中文翻译，始终于官方 master 分支同步。

* 此项目仅在官方原有文档的基础上，添加需要翻译的 markdown 、html  文件，翻译的文件均以 .zh.md 或 .zh.html 文件结尾，不修改原有文件。

* 部署此项目，使用 deploy.sh 脚本，前提是需要自己安装和 ruby 和 jekyll。

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
