package com.qst.crop.service.impl;

import com.qst.crop.entity.User;
import com.qst.crop.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class UserServiceImpl implements UserService {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public User selectByUserName(String name) {
        String sql = "select * from tb_user where userName = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), name);
        } catch (Exception e) {
            log.info("数据库未找到名称为{}的用户", name);
            return null;
        }
    }

    @Override
    public void addUser(User user) {
        String sql = "insert into tb_user(userName, password, nickName, phone, identityNum, address, role, createTime, updateTime, integral, realName, credit, avatar) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, user.getUserName(), user.getPassword(), user.getNickName(), user.getPhone(), user.getIdentityNum(), user.getAddress(), user.getRole(), user.getCreateTime(), user.getUpdateTime(), user.getIntegral(), user.getRealName(), user.getCredit(), user.getAvatar());
    }
}
