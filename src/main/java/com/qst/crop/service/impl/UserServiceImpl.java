package com.qst.crop.service.impl;

import com.qst.crop.entity.User;
import com.qst.crop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public User selectByUserName(String name) {
        return jdbcTemplate.queryForObject("select * from tb_user where user_name = ?", new Object[]{name}, (rs, rowNum) -> {
            User user = new User();
            user.setUserName(rs.getString("user_name"));
            user.setPassword(rs.getString("password"));
            return user;
        });
    }
}
