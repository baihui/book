**shell环境是可以继承**
如下：
```shell

#定义一个变量
export aaa=10

echo $aaa
10


#在当前bash新建一个子bash 
bash
echo $aaa
10

```
> export 修饰的变量成为全局变量，也成成为环境变量