package com.vector.hospital_information;

import com.vector.config.SpringConfiguration;
import org.junit.Test;

import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {SpringConfiguration.class})
@Component("Update_test")
public class Update_test {
    @Resource(name = "dataSource")
    DataSource dataSource;
    @Resource(name = "Update_test")
    Update_test modify;
    @Test
    /**
     * 测试增删改
     */
    public void TestUpdate() throws SQLException {

        /**
         * 测试增添数据
         */
        String sql1 = "INSERT INTO recipel(doctor_id,drug_id,count,patient_name) VALUES (?,?,?,?,?);";
        modify.update(sql1,"001", "100023", "2","病人1");

        /**
         * 测试修改数据
         */
//        String sql2 = "UPDATE drugs SET drug_name = ? WHERE drug_id = ?";
//        modify.update(sql2,"聪明草","1000237");
//        /**
//         * 测试删除数据
//         */
//        String sql3 = "DELETE FROM drugs WHERE drug_name=?";
//        modify.update(sql3,"聪明草");
    }
    /**
     * 王佳慧
     * 通用增删改
     * @param sql
     * @param args
     * @throws SQLException
     */

    //通用的增删改操作
    public void update(String sql, Object... args) throws SQLException {//sql当中占位符个数与可变形参的长度一致

        Connection conn = null;
        PreparedStatement ps = null;
        //ApplicationContext app = null;
        try {
            //app = new AnnotationConfigApplicationContext(SpringConfiguration.class)
            //1.获取数据库连接
            conn = dataSource.getConnection();
            conn.setAutoCommit(false);
            //2.预编译sql语句，返回PreparedStatement实例
            ps = conn.prepareStatement(sql);
            //3.填充占位符
            for (int i = 0; i < args.length; i++) {
                ps.setObject(i + 1, args[i]);
            }
            //4.执行sql语句
            ps.execute();
            conn.commit();
            System.out.println("添加记录成功");
        } catch (Exception e) {
            conn.rollback();
            e.printStackTrace();
        } finally {
            //5.资源的关闭
            conn.close();
        }
    }

}
