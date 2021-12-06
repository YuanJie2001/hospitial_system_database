package com.vector.service;

import com.vector.dao.UserDao;

public interface UserService {
    public void save();

    public void setUserDao(UserDao userDao);
}
