**引用定义**：

> 用一个文件来保存 SHA-1值（[提交对象key](/object/ti-jiao-dui-xiang.md)），并给文件起一个名字，该名子指针来替代原始的SHA-1值。这样的文件称为 ‘引用’，该文件保存在.git/refs/ 目录下

* commit更新引用文件的内容

```
➜  tex git:(master) ✗ cat .git/refs/heads/master
903dfeaae7aa6c3bbd586a4f85b8ba3519bf3acf

echo '引用对象' > a.md
git commit -a -m '引用对象'
[master 4332b5f] 引用对象
 2 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 b.md

cat .git/refs/heads/master
4332b5f16a5f830065b9a4c327a9dc08f89fc819
```

> master引用文件中保存的是最后一次提交对象的key：903dfeaae7aa6c3bbd586a4f85b8ba3519bf3acf ，通过再次提交 master 文件指向了（update-ref）新的提交对象。

* 手动更新修改

```
echo '4332b5f16a5f830065b9a4c327a9dc08f89fc819' > .git/refs/heads/master
```

* update-ref（推荐）

```
git update-ref refs/heads/master 4332b5f16a5f830065b9a4c327a9dc08f89fc819
```

> 引用和分支
>
> [**引用文件是通过提交或者update-ref指定具体的提交对象来更新内容，而创建一个引用文件也就是创建一个分支，所以分支就是指向引用文件的指针，一个指向某一系列提交之首的指针或引用称为分支。**](/branch.md)

---

#### [分支](/branch.md)



