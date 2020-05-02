# Seckill
Java秒杀系统方案优化与高性能并发实战

##　miaosha_2
### 前言

1. 在将项目下载到本地之后需要先进入到*application.properties*将数据库的连接改成自己创建连接的名字，密码也进行修改为自己的数据连接的密码，对于redis一般不用进行修改，**注意**这里本地redis数据库有密码的修改为自己的密码，没有密码自行进行将上面的redis数据库连接密码去掉。后台系统中有对redis的密码部分进行一个设计，所以这部分不用担心会出现冲突问题。

2. 将位于*miaosha_2/src/main/db*下的两个数据库文件用本地的MySql工具进行存储与运行，注意名字和自己建立连接时候的名字保持一致，端口是**3306**不用进行更改。



### 登录

将项目成功导入到本地并修改运行之后，可以访问如下地址：http://localhost:8080/login/to_login

![图片：](http://maycope.cn/Seckill-2-1.png)

注意若是在运行我给大家的sql文件时候，同时使用到我个人插入的一条数据，id为**18812345678**，密码为**123456**（未加密的原始密码），这个时候就可以直接填入到前端的页面进行验证登录。登录成功以后的页面为：

![图二:](http://maycope.cn/Seckill-2-2.png)

其中的maycope就是你填入到数据库中nickname，表示项目启动没有问题。

若是大家想自行填入数据，id一定要填写为11位的电话号码，对于数据库端的密码是已经进行了两次加密过的（这个时候大家可能就要问，若是我想设置密码为abc123456 ，那么数据库端该填写什么密码呢？）

![图三](http://maycope.cn/Seckill-2-3.png)

![](http://maycope.cn/Seckill-2-4.png)



如此大家就可以在前端页面上填写如自己更改的电话号码与密码，也可以填写自己的用户名，就会进行显示。

###重点部分学习

对于第二部分，主要涉及的就是登录功能的验证，如何对密码进行加密处理，如何在代码里就实现参数的校验，判断格式的正确性（位数），而不是传到了数据库查询没有发现才进行错误的返回。第二个涉及的部分就是Redis封装类的学习，对于key值的处理，以及如何封装数据自己的redis封装类，觉得在日后的工作中也都会用到，所以这里进行一个记录。将所有的记录都记录在自己的**CSDN**博客，可以跳转查看。

#### 登录验证学习

[登录功能设计](https://blog.csdn.net/weixin_44015043/article/details/105658287)

#### Redis封装类学习

[Redis封装类设计](https://blog.csdn.net/weixin_44015043/article/details/105892713)
