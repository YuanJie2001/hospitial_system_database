package com.vector.dao.impl;

import com.vector.dao.UserDao;

public class UserDaoImpl implements UserDao {
    public UserDaoImpl() {
        System.out.println("UserDaoImpl被创建...");
    }
    @Override
    public void save() {
        System.out.println("save running...");
    }

    public void init(){
        System.out.println("初始化方法...");
    }

    public void destory(){
        System.out.println("销毁方法...");
    }
}
