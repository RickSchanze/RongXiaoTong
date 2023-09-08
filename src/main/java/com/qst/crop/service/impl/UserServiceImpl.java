package com.qst.crop.service.impl;

import com.qst.crop.entity.User;
import com.qst.crop.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Override
    public User selectByUserName(String name) {
        return new User();
    }
}
