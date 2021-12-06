package com.vector.service.impl;

import com.vector.dao.UserDao;
import com.vector.service.UserService;


public class UserServiceImpl implements UserService {
    private UserDao userDao;
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
    @Override
    public void save() {userDao.save();}
}
