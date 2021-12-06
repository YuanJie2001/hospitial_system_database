package com.vector.dao.factory;

import com.vector.dao.UserDao;
import com.vector.dao.impl.UserDaoImpl;
import com.vector.service.UserService;
import com.vector.service.impl.UserServiceImpl;

public class FactoryStatic {
    public static UserDao getUserDao(){
        return new UserDaoImpl();
    }
    public static UserService getUserService(){return new UserServiceImpl();}

}
