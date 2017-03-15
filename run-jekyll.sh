#!/bin/sh
##  杀死所有的 jekyll 进程ps -ef |grep jekyll |awk '{print $2}'|xargs kill -9
JEKYLL_ENV=production bundle exec jekyll serve
