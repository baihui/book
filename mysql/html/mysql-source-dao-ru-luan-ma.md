** 数据库备份数据-指定编码**

> mysqldump -uroot -p --default-character-set=gbk dbname &gt; /root/newsdata.sql
>
> 或
>
> mysqldump -uroot -p --default-character-set=utf8 dbname &gt; /root/newsdata.sql

**导入数据库-设置编码**

> mysql -uroot -p --default-character-set=gbk  
>  use dbname  
>  source /root/newsdata.sql

或

> mysql -uroot -p --default-character-set=utf8  
>  use dbname  
>  source /root/newsdata.sql

---

**mysql数据库设置编码命令 **

> SET character\_set\_client = utf8;  
>  SET character\_set\_connection = utf8;  
>  SET character\_set\_database = utf8;  
>  SET character\_set\_results = utf8;/\*这里要注意很有用\*/  
>  SET character\_set\_server = utf8;
>
> SET collation\_connection = utf8\_bin;  
>  SET collation\_database = utf8\_bin;  
>  SET collation\_server = utf8\_bin;
>
> my.ini中配置默认编码  
>  default-character-set=utf8



