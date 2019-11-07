安装:

```shell

#安装
sudo apt-get install nfs-kernel-server

#服务操作
/etc/init.d/nfs-kernel-server restart
#服务状态
nfsstat --help

#exportfs命令对配置文件exprots操作
#修改-立刻生效
exportfs /etc/exports
#卸载所有共享目录
exportfs -au
#重新共享所有目录并输出详细信息
exportfs -rv

#rpcinfo 查看rpc执行信息，可以用于检测rpc运行情况的工具
#可以查看出RPC开启的端口所提供的程序有哪些
rpcinfo -p
#查看 RPC 服务的注册状况 
rpcinfo -p localhost 
#showmount
#显示已经于客户端连接上的目录信息
showmount -a
#-e IP或者hostname 显示此IP地址分享出来的nfs目录
showmount -e 127.0.0.1
#显示其他服务器发布注册服务
sudo showmount -e 192.168.1.*
```

配置文件/etc/exports
在Ubuntu中/etc/exports是nfs服务器的全局配置文件,配置文件中一行即为一条配置项，用于指明网络中“哪些客户端”共享“哪些目录资源”。将创建的共享目录添加到其中,如下:

```shell
# /etc/exports: the access control list ....
# Example for NFSv4:
# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)
# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)
# 共享目录 客服端ip(全部:* 限定网段 xxx.xxx.x.* 具体 xxx.xxx.xxx.xxx) (权限,参数...)
/home/baihui/share/nfs 192.168.1.*(rw,sync,no_subtree_check)

```
**常用参数：**
 
* 访问权限选项

  设置输出目录只读：ro
  设置输出目录读写：rw
* 用户映射选项(**客服端用户映射服务端账号**)

  **all_squash**
  将远程访问的所有普通用户及所属组都映射为匿名用户或用户组（nfsnobody）
  **no_all_squash**
  与all_squash取反（默认设置）
  **root_squash**
  将root用户及所属组都映射为匿名用户或用户组（默认设置）
  **no_root_squash**
  与rootsquash取反
  **anonuid=xxx**
  将远程访问的所有用户都映射为匿名用户，并指定该用户为本地用（UID=xxx）
  **anongid=xxx**
  将远程访问的所有用户组都映射为匿名用户组账户，并指定该匿名用户组账户为本地用户组账户（GID=xxx）

* 其它选项

  **secure**
  限制客户端只能从小于1024的tcp/ip端口连接nfs服务器（默认设置）
  **insecure**
  允许客户端从大于1024的tcp/ip端口连接服务器
  **sync**
  将数据同步写入内存缓冲区与磁盘中，效率低，但可以保证数据的一致性；
  **async**
  将数据先保存在内存缓冲区中，必要时才写入磁盘
  **wdelay**
  检查是否有相关的写操作，如果有则将这些写操作一起执行，这样可以提高效率（默认设置）
  **no_wdelay**
  若有写操作则立即执行，应与sync配合使用
  **subtree**
  若输出目录是一个子目录，则nfs服务器将检查其父目录的权限(默认设置)
  **no_subtree**
  即使输出目录是一个子目录，nfs服务器也不检查其父目录的权限，这样可以提高效率
  
**sync和async**
  > 
  * sync适用在通信比较频繁且实时性比较高的场合影响性能。
* async当涉及到很多零碎文件操作时，选用async性能更高。 



自动挂载
网上提供了三种方法：
- 开机自动挂载：/etc/fstab里添加 （不推荐）
server_IP:/remote_dir /local_dir nfs defaults 1 1
例如：192.168.56.101:/home/shareStoreDir /home/shareStoreDir nfs defaults 0 0
第1个1表示备份文件系统，第2个1表示从/分区的顺序开始fsck磁盘检测，0表示不检测。
这种方法不推荐，尝试过程中发现开机很慢，而且开机后并没有挂载成功。后查找原因是开机时,系统还没有完全完成所有服务的启动,包括网络服务:network。在网络无法连入时试图mount NFS当然会失败。
- 开机自动挂载：在/etc/rc.d/rc.local文件中添加记录（不推荐）
mount -t nfs -o nolock hostname(orIP):/directory /mnt
还是会遇到上面的问题，网友提供解决方法可以休眠几秒后尝试，命令修改为：sleep 5;mount -t nfs xx.xx.xx.xx:/home /mnt/nfs
- 自动挂载autofs（推荐）
没有安装autofs可以先进行安装 
 

 