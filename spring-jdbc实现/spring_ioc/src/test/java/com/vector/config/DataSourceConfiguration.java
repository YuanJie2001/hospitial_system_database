package com.vector.config;

import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import javax.sql.DataSource;
import java.sql.SQLException;

//<!--    加载外部的properties文件-->
//<context:property-placeholder location="classpath:druid.properties"/>
@PropertySource("classpath:druid.properties")
public class DataSourceConfiguration {
    @Value("${jdbc.driverClassName}")
    private String driver;
    @Value("${jdbc.url}")
    private String url;
    @Value("${jdbc.username}")
    private String username;
    @Value("${jdbc.password}")
    private String password;
    @Value("${filters}")
    private String filters;
    @Value("${initialSize}")
    private String initialSize;
    @Value("${maxActive}")
    private String maxActive;
    @Value("${maxWait}")
    private String maxWait;
    @Value("${timeBetweenEvictionRunsMillis}")
    private String timeBetweenEvictionRunsMillis;
    @Value("${minEvictableIdleTimeMillis}")
    private String minEvictableIdleTimeMillis;
    @Value("${validationQuery}")
    private String validationQuery;
    @Value("${testWhileIdle}")
    private String testWhileIdle;
    @Value("${testOnBorrow}")
    private String testOnBorrow;
    @Value("${testOnReturn}")
    private String testOnReturn;
    @Value("${poolPreparedStatements}")
    private String poolPreparedStatements;
    @Value("${maxPoolPreparedStatementPerConnectionSize}")
    private String maxPoolPreparedStatementPerConnectionSize;

    @Bean("dataSource") // Spring会将当前方法的返回值以指定名称存储到Spring容器中
    public DataSource getDataSource() throws SQLException {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName(driver);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        dataSource.setFilters(filters);
        dataSource.setInitialSize(Integer.parseInt(initialSize));
        dataSource.setMaxActive(Integer.parseInt(maxActive));
        dataSource.setMaxWait(Long.parseLong(maxWait));
        dataSource.setTimeBetweenEvictionRunsMillis(Long.parseLong(timeBetweenEvictionRunsMillis));
        dataSource.setMinEvictableIdleTimeMillis(Long.parseLong(minEvictableIdleTimeMillis));
        dataSource.setValidationQuery(validationQuery);
        dataSource.setTestWhileIdle(Boolean.parseBoolean(testWhileIdle));
        dataSource.setTestOnBorrow(Boolean.parseBoolean(testOnBorrow));
        dataSource.setTestOnReturn(Boolean.parseBoolean(testOnReturn));
        dataSource.setPoolPreparedStatements(Boolean.parseBoolean(poolPreparedStatements));
        dataSource.setMaxPoolPreparedStatementPerConnectionSize(Integer.parseInt(maxPoolPreparedStatementPerConnectionSize));

        return dataSource;
    }
}
