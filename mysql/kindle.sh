#!/bin/sh
echo "解析:\n"
bookfile=$(gitbook parse|grep 'Book located in'|sed 's/ //g')
bookfile="${bookfile##*/}"
echo "获取书名:\n${bookfile}"
echo "安装插件:\n${bookfile}"
gitbook install
echo "build:\n${bookfile}"
gitbook build
bookp=~/books
if [ ! -d ${bookp} ]; then
  mkdir ${bookp}
  echo "目录创建完成${bookp}"
fi

gitbook mobi ./ ${bookp}/${bookfile}.mobi
echo "创建完成:\n${bookp}/${bookfile}.mobi" 