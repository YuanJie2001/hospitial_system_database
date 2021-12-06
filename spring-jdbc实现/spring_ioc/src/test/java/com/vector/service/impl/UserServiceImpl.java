package com.vector.service.impl;

import com.vector.dao.UserDao;
import com.vector.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

//<bean id="userService" class="com.vector.service.impl.UserServiceImpl">
//@Component("userService")
@Service("userService")
public class UserServiceImpl implements UserService {
//    <property name="userDao" ref="userDao"/>
//    @Autowired //自动注入 按照数据类型从Spring容器中进行匹配的
//    @Qualifier("userDao") //要被注入的对象 按照id的名称从容器中进行匹配@Qualifier要结合@Autowired一起使用
    @Resource(name = "userDao") //相当于@Qualifier+@Autowired
    private UserDao userDao; //以反射调用无参构造器赋值
//    public void setUserDao(UserDao userDao){
//        this.userDao = userDao;
//    }
    @Value("${jdbc.driverClassName}")
    private String driver;
    @Override
    public void save() {
        System.out.println(driver);
        userDao.save();
    }
}
