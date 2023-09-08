package com.qst.crop.controller;

import com.qst.crop.common.Result;
import com.qst.crop.common.StatusCode;
import com.qst.crop.entity.User;
import com.qst.crop.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.validator.constraints.ScriptAssert;
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
            StringBuffer stringBuffer = new StringBuffer();
            for (ObjectError error : allErrors) {
                System.out.println(error);
                stringBuffer.append(error.getDefaultMessage()).append("; ");
            }
            System.out.println(stringBuffer);
            String errorInfo = stringBuffer.toString();
            return new Result<String>(false, StatusCode.ERROR, "注册失败", errorInfo);
        }
        User uuser = userService.selectByUserName(user.getUserName());
        if (uuser != null) {
            return new Result<>(false, 400, "用户名已存在");
        }
        return new Result<>(true, 200, "注册成功");
    }
}
