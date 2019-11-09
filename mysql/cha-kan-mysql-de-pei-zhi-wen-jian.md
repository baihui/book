首先先看看你的mysql在哪，通过which命令

```mysql

which mysql

```

显示出目录比如我的是下面这个

```bash
/usr/bin/mysql
```

接下来就可以针对这个目录通过一些命令查看配置文件在哪了，如下

```bash
/usr/bin/mysql --verbose --help | grep -A 1 'Default options'

```
然后在下面会出现一些信息比如我的

Default options are read from the following files in the given order:
/etc/mysql/my.cnf /etc/my.cnf ~/.my.cnf 


这个信息的意思是： 
服务器首先读取的是/etc/mysql/my.cnf文件，如果前一个文件不存在则继续读/etc/my.cnf文件，如若还不存在便会去读~/.my.cnf文件