package com.example.dao;

import com.example.domain.User;
import com.example.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.util.DigestUtils;

import java.nio.charset.StandardCharsets;

public class UserDao {
    /**
     * 创建并初始化一个JdbcTemplate对象。
     * 这个JdbcTemplate对象将使用JDBCUtils类中获取到的数据源（DataSource）。
     * 该对象主要用于方便地执行数据库操作。
     */
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    //用户注册
    public boolean add(String username, String pwd, String realname,String email,String phone,String address){
        int affectRows = 0;
        try {
            //1.编写sql, deposit默认为0
            String sql = "insert into users(username, pwd, realname,email,phone,address) values(?,?,?,?,?,?)";
            //2.密码文本使用MD5加密
            String pwdMD5= DigestUtils.md5DigestAsHex(pwd.getBytes(StandardCharsets.UTF_8));
            //3.调用update方法，写入数据库
            affectRows = template.update(sql,username, pwdMD5, realname,email,phone,address);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }
    //用户登录
    public User getByEmailAndPwd(String email, String pwd){
        User user = null;
        try {
            //1.编写sql
            String sql = "select * from users where email = ? and pwd = ?";
            //2.密码文本使用MD5加密
            String pwdMD5= DigestUtils.md5DigestAsHex(pwd.getBytes(StandardCharsets.UTF_8));
            //3.调用query方法
            /**
             * 根据电子邮件和密码的MD5值查询单个用户信息。
             * 使用BeanPropertyRowMapper将查询结果直接映射到User对象中。
             *
             * @param email 用户的电子邮件地址，作为查询条件之一。
             * @param pwdMD5 用户密码的MD5值，作为查询条件之一。
             * @return 返回查询到的User对象。如果没有匹配的记录，则返回null。
             */
            user = template.queryForObject(sql, new BeanPropertyRowMapper<User>
                    (User.class), email,pwdMD5);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return user;
        }
    }
    //用户修改
    public boolean edit(int id,String username, String realname,String email,String phone,String address){
        int affectRows = 0;
        try {
            //1.编写sql
            String sql = "update users set username=?, realname=?, email=?, phone=?, address=? where id=?";
            //2.调用update方法，写入数据库
            affectRows = template.update(sql,username, realname,email,phone,address,id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }
    //密码修改
    public boolean setPwd(int id,String oldPwd,String newPwd){
        int affectRows = 0;
        try {
            //1.编写sql
            String sql = "update users set pwd=? where id=? and pwd=?";
            //2.密码文本使用MD5加密
            String oldPwdMD5= DigestUtils.md5DigestAsHex(oldPwd.getBytes(StandardCharsets.UTF_8));
            String newPwdMD5= DigestUtils.md5DigestAsHex(newPwd.getBytes(StandardCharsets.UTF_8));
            //3.调用update方法，写入数据库
            affectRows = template.update(sql,newPwdMD5,id,oldPwdMD5);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }
    //用户充值
    public boolean recharge(int id,double money){
        int affectRows = 0;
        try {
            //1.编写sql
            String sql = "update users set deposit=deposit+? where id=?";
            //2.调用update方法，写入数据库
            affectRows = template.update(sql,money,id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }
}
