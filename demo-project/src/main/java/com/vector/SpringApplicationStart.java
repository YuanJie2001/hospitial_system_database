package com.vector;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author YuanJie
 * @ClassName SpringApplicationStart
 * @date 2025/1/3 10:59
 */
@SpringBootApplication
@MapperScan("com.vector.mapper")
public class SpringApplicationStart {

    public static void main(String[] args) {
        SpringApplication.run(SpringApplicationStart.class, args);
    }
}
