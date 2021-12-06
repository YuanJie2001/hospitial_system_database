package com.vector.test;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.alibaba.druid.pool.DruidPooledConnection;
import com.vector.config.SpringConfiguration;
import com.vector.dao.UserDao;
import com.vector.hospital_information.Update_test;
import com.vector.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.sql.DataSource;
import java.sql.Connection;

public class DataSourceTest {
    @Test
    public void test1() {
        ApplicationContext app = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserDao userDao = (UserDao) app.getBean("userDao");
        System.out.println(userDao);
        //app.close();
    }

    @Test
    public void test2() {
        ApplicationContext app = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userService = (UserService) app.getBean("userService");
        System.out.println(userService);
        //app.close();
    }

    @Test
    /**
     * spring代理druid配置文件连接池
     */
    public void getDruidProerties() throws Exception {
        //ApplicationContext app = new ClassPathXmlApplicationContext("applicationContext.xml");
        ApplicationContext app = new AnnotationConfigApplicationContext(SpringConfiguration.class);
        DataSource dataSource = (DataSource) app.getBean("dataSource");
        Connection conn = dataSource.getConnection();
        System.out.println(conn);
        conn.close();
    }

}

