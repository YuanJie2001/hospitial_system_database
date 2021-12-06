package com.vector.dao.impl;

import com.vector.dao.UserDao;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

//<bean id="userDao" class="com.vector.dao.impl.UserDaoImpl"/>
//@Component("userDao")
@Repository("userDao")
public class UserDaoImpl implements UserDao {
    @Override
    public void save() {
        System.out.println("save running...");
    }
}

