package com.vector.config;


import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

//标志该类是Spring的核心配置类
@Configuration
//<!--    配置组件扫描  扫描路径包及其子包-->
//    <context:component-scan base-package="com.vector"/>
@ComponentScan("com.vector")

//<!--    <import resource=""/>-->
@Import(DataSourceConfiguration.class)
public class SpringConfiguration {

}
