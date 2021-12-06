package com.vector.hospital_information;

import com.vector.config.SpringConfiguration;
import com.vector.test.DataSourceTest;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.lang.reflect.Field;
import java.sql.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {SpringConfiguration.class})
@Component("PreparedStatementQueryTest")
public class PreparedStatementQueryTest {

    @Resource(name = "dataSource")
    DataSource dataSource;
    @Resource(name = "PreparedStatementQueryTest")
    PreparedStatementQueryTest queryTest ;


    @Test
    /**
     * 测试查询
     */
    public void TestQuery() throws SQLException {


        /**
         * 测试查询一条记录
         */
        String sql = "SELECT * from drugs where drug_name=?";
        Drugs drugs = queryTest.getInstance(Drugs.class,sql,"长生不老丹");
        System.out.println(drugs);


    }
    /**
     * 王佳慧
     * 针对于不同的表的通用查询操作,返回表中的一条记录
     * @param clazz
     * @param sql
     * @param args
     * @param <T>
     * @return
     */
    public <T>T getInstance(Class<T> clazz,String sql,Object ...args) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = dataSource.getConnection();//加载数据库
            ps = conn.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                ps.setObject(i + 1, args[i]);
            }
            //执行,获取结果集
            rs = ps.executeQuery();
            //获取结果集的元数据
            ResultSetMetaData rsmd = rs.getMetaData();
            //获取列数
            int columuCount = rsmd.getColumnCount();
            if (rs.next()) {
                T t = clazz.newInstance();
                for (int i = 0; i < columuCount; i++) {
                    //获取每个列的列值,通过ResultSet
                    Object columnValue = rs.getObject(i + 1);
                    //获取每个列的列名,通过ResultSetMetaData
                    //获取列的列名:getColumnName() ---不推荐使用
                    //获取列的别名:getColumnLabel()
                    String columnLabel = rsmd.getColumnLabel(i+1);
                    //通过反射,将对象指定名columnName的属性值赋值给columnValue
                    Field field = clazz.getDeclaredField(columnLabel);
                    field.setAccessible(true);
                    field.set(t, columnValue);
                }
                return t;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
        }

        return null;
    }


}
