package com.yzj.core.controller;

import com.yzj.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 用户控制器类
 */
@Controller
public class UserController {
    // 依赖注入
    @Autowired
    private UserService userService;

    /**
     * 用户登录
     */
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(String usercode, String password, Integer RadioOptions, Model model,
                        HttpSession session) {
        Object user = userService.findUser(usercode, password, RadioOptions);
        if (user != null) {
            session.setAttribute("USER_SESSION", user);
            session.setAttribute("USER_TYPE", RadioOptions);
            // RadioOptions：0为部门 1为学生 2为老师
            if (RadioOptions == 0)
                return "redirect:admin/profile.do";
            else if (RadioOptions == 1)
                return "redirect:student/profile.do";
            else if (RadioOptions == 2)
                return "redirect:teacher/profile.do";
        }
        session.setAttribute("W_USERNAME",usercode);
        model.addAttribute("msg", "账号或密码错误，请重新输入！");
        // 返回登录界面
        return "login";
    }

//    /**
//     * 模拟其他类中跳转到成绩管理页面的方法
//     */
//    @RequestMapping(value = "/toMark.action")
//    public String toMark() {
//        return "mark";
//    }

    /**
     * 退出登录
     */
    @RequestMapping(value = "/logout.do")
    public String logout(HttpSession session) {
        // 清除Session
        session.invalidate();
        // 重定向到登录页面的跳转方法
        return "login";
    }

//    /**
//     * 向用户登陆页面跳转
//     */
//    @RequestMapping(value = "/login.action", method = RequestMethod.GET)
//    public String toLogin() {
//        return "login";
//    }
//


    /**
     * 修改密码
     */
    @RequestMapping(value = "updatepw.do", method = RequestMethod.POST)
    @ResponseBody
    public String updatePw(String usercode, String newpassword) {
        int rows = userService.updatePw(usercode, newpassword);
        if (rows > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

}
