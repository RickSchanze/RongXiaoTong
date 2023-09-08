package com.qst.crop.service;

import com.qst.crop.entity.User;

public interface UserService {
    User selectByUserName(String name);
    void addUser(User user);
}
