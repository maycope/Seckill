# Seckill
Java秒杀系统方案优化与高性能并发实战

## miaosha_2
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

### 重点部分学习

对于第二部分，主要涉及的就是登录功能的验证，如何对密码进行加密处理，如何在代码里就实现参数的校验，判断格式的正确性（位数），而不是传到了数据库查询没有发现才进行错误的返回。第二个涉及的部分就是Redis封装类的学习，对于key值的处理，以及如何封装数据自己的redis封装类，觉得在日后的工作中也都会用到，所以这里进行一个记录。将所有的记录都记录在自己的**CSDN**博客，可以跳转查看。

#### 登录验证学习

[登录功能设计](https://blog.csdn.net/weixin_44015043/article/details/105658287)

#### Redis封装类学习

[Redis封装类设计](https://blog.csdn.net/weixin_44015043/article/details/105892713)


## miaosha_3

对于miaosha_3部分的设计是关于秒杀页面的具体设计，设计到了多个表，可以查看**miaosha_3/db**,其中有具体字段的解释及表的介绍，结合**miaosha_3**进行初级的学习。具体可参看[秒杀页面设计](https://blog.csdn.net/weixin_44015043/article/details/105907535)其中有关键信息的讲解与介绍。
**5-8修改记录：**

1. 可能是由于数据库的设计问题，在**模块三**后面的立即秒杀时候就会出现一些小的问题，大家将数据库导入到本地以后记得修改数据库表id字符的**自动递增**属性,这里虽然设置了一个默认值，但是由于没有默认递增可能在表字段的插入上还是有问题的。
2. 对于订单的创建时间问题不大，但是对于付款时间，由于没有设置默认值问题，所以一直会提示默认值有问题。这里我们在`createOrder`中添加一条设置付款时间为当前时间（在这里可能不正确，但是我们的重点不在增删改查上）。

```java
	@Transactional
	public OrderInfo createOrder(MiaoshaUser user, GoodsVo goods) {
		OrderInfo orderInfo = new OrderInfo();
		orderInfo.setPayDate(new Date());// 添加这样一条记录。
		orderInfo.setCreateDate(new Date());
		orderInfo.setDeliveryAddrId(0L);
		orderInfo.setGoodsCount(1);
		orderInfo.setGoodsId(goods.getId());
		orderInfo.setGoodsName(goods.getGoodsName());
		orderInfo.setGoodsPrice(goods.getMiaoshaPrice());
		orderInfo.setOrderChannel(1);
		orderInfo.setStatus(0);
		orderInfo.setUserId(user.getId());
		orderDao.insert(orderInfo);
		MiaoshaOrder miaoshaOrder = new MiaoshaOrder();
		miaoshaOrder.setGoodsId(goods.getId());
		miaoshaOrder.setOrderId(orderInfo.getId());
		miaoshaOrder.setUserId(user.getId());
		orderDao.insertMiaoshaOrder(miaoshaOrder);
		
		redisService.set(OrderKey.getMiaoshaOrderByUidGid, ""+user.getId()+"_"+goods.getId(), miaoshaOrder);
		 
		return orderInfo;
	}
```

同时对于**sql**语句而言记得增加对应的**pay_date**数据库字段和对应的**#{payDate}**以上就可以正确执行。

```sql
	@Insert("insert into order_info(user_id, goods_id, goods_name, goods_count, goods_price, order_channel, status, create_date,pay_date)values("
			+ "#{userId}, #{goodsId}, #{goodsName}, #{goodsCount}, #{goodsPrice}, #{orderChannel},#{status},#{createDate},#{payDate})")
	@SelectKey(keyColumn="id", keyProperty="id", resultType=long.class, before=false, statement="select last_insert_id()")
	public long insert(OrderInfo orderInfo);
```

## miaosha_4

参看CSDN学习[JMeter压测学习](https://blog.csdn.net/weixin_44015043/article/details/105685163)

##  miaosha_5

参看CSDN学习[页面优化技术](https://blog.csdn.net/weixin_44015043/article/details/105899679)

## miaosha_6

参看CSDN学习[接口优化](https://blog.csdn.net/weixin_44015043/article/details/105923594)

注意： 若是在对于我们设置的**Miaosha_Queue**出现不存在等问题，将**Miaosha_Queue**更换为第一次使用到的`Direct`模式下的**QUEUE**。猜测是不能够识别。

## miaosha_7

参看CSDN学习[图形验证码及接口防刷](https://blog.csdn.net/weixin_44015043/article/details/105961594)
