package com.vector.generator;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.querys.MySqlQuery;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.baomidou.mybatisplus.generator.query.SQLQuery;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;


/**
 * @description: 代码生成器
 * @author: YuanJie
 * @create: 2022-1-31 16:22
 **/

// 演示例子，执行 main 方法控制台输入模块表名回车自动生成对应项目目录中
public class Generator {
    public static void main(String[] args) {
        //获取项目所在路径

        String path = System.getProperty("user.dir");
        String url = "jdbc:mysql://127.0.0.1:3306/hospital?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true&remarks=true&useInformationSchema=true";
        String username;
        String password;
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入username: ");
        username = sc.nextLine();
        System.out.println("请输入password: ");
        password = sc.nextLine();
        // 数据库配置(DataSourceConfig)
        FastAutoGenerator.create(url, username, password)
                .dataSourceConfig(builder -> {
                    builder.databaseQueryClass(SQLQuery.class)
                            .typeConvert(new MySqlTypeConvert())
                            .dbQuery(new MySqlQuery());
                })
                // 全局配置(GlobalConfig)
                .globalConfig(builder -> {
                    builder.author("YuanJie") // 设置作者
                            .outputDir(path + "/src/main/java")
                            .build(); // 指定输出目录
                })
                // 包配置(PackageConfig)
                .packageConfig(builder -> {
                    builder.parent("com.vector") // 设置父包名
                            .mapper("mapper")
                            .entity("entity")
                            .controller("controller")
                            .service("service")
                            .pathInfo(Collections.singletonMap(OutputFile.xml, path + "/src/main/resources/mapper"))
                            .build(); // 设置mapperXml生成路径;
                })
                .strategyConfig((scanner, builder) -> {
                    builder.entityBuilder() // 实体层操作
                            .naming(NamingStrategy.underline_to_camel) //数据库表映射到实体的命名策略.默认下划线转驼峰命名:NamingStrategy.underline_to_camel
                            .enableTableFieldAnnotation() // 开启生成实体时生成字段注解
                            .enableRemoveIsPrefix() //开启 Boolean 类型字段移除 is 前缀
                            .enableLombok(); //开启 lombok 模型

                    builder.controllerBuilder() // controller层操作
                            .enableRestStyle(); //开启生成@RestController 控制器

                    builder.mapperBuilder()
                            .enableBaseResultMap() // 启用 BaseResultMap生成
                            .enableBaseColumnList(); //启用 BaseColumnList

                    builder.addTablePrefix("t_"); //增加过滤表前缀
                    builder.addInclude(getTables(scanner.apply("请输入表名，多个英文逗号分隔？所有输入 all")))
                            .build(); // 设置需要生成的表名
                })
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }

    // 处理 all 情况
    protected static List<String> getTables(String tables) {
        return "all".equals(tables) ? Collections.emptyList() : Arrays.asList(tables.split(","));
    }
}
