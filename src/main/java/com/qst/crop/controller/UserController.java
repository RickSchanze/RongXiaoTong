package com.qst.crop.controller;

import com.qst.crop.common.Result;
import com.qst.crop.common.StatusCode;
import com.qst.crop.entity.User;
import com.qst.crop.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/user")
@CrossOrigin("*")
@Slf4j
public class UserController {
    @Autowired
    UserService userService;
    @PostMapping("/register")
    public Result<String> register(@Valid @RequestBody User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            StringBuilder stringBuilder = new StringBuilder();
            for (ObjectError error : allErrors) {
                System.out.println(error);
                stringBuilder.append(error.getDefaultMessage()).append("; ");
            }
            log.info("注册失败，原因：{}", stringBuilder);
            String errorInfo = stringBuilder.toString();
            return new Result<>(false, StatusCode.ERROR, "注册失败", errorInfo);
        }
        User uuser = userService.selectByUserName(user.getUserName());
        if (uuser != null) {
            return new Result<>(false, 400, "用户名已存在");
        }
        userService.addUser(user);
        return new Result<>(true, 200, "注册成功");
    }
}
