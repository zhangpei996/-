package com.school.controller;

import com.school.service.UserService;
import com.school.utils.BaseResult;
import com.school.vo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {
    @Resource
    private UserService userService;
    /**
     * 用户注册
     * @param user
     * @param request
     * @return
     */
    //用户添加
    @RequestMapping("saveuser")
    public String saveuser(User user, HttpServletRequest request){
        user.setSex(1);
        Integer flag = userService.saveuser(user,request);
        if (flag >= 1){
            return "forward:selectProductAll";
        }else {
            return "forward:show/login.jsp";
        }
    }
    //登录
    @RequestMapping("login")
    public String login(User user,HttpServletRequest request,Model model){
        Integer flag = userService.login(user,request);
        if(flag ==1){
            return "forward:selectProductAll";
        }else if (flag == 2) {
            model.addAttribute("changePage","main.ftl");
            return "index";
        }else
            return "forward:show/login.jsp";
        }

    //信息修改界面展示
    @RequestMapping("updateshow")
    public String usershow(Model model){
        model.addAttribute("changePage","personinfor.ftl");
        return "index";
    }
    //用户信息修改
    @RequestMapping("update")
    public String update(User user,HttpServletRequest request){
        Integer flag = userService.login(user,request);
        if(flag ==1){
            return "forward:selectProductAll";
        }else {
            return "forward:show/login.jsp";
        }
    }
    @ResponseBody
    @RequestMapping("judgeName")
    public String judgeName(User user){
        return userService.judgeName(user);
    }
    @ResponseBody
    @RequestMapping("selectUsers")
    public BaseResult selectUsers(User user){
        return userService.selectUsers(user);
    }

    @RequestMapping("user/show")
    public String usermanage(Model model){
        model.addAttribute("changePage","usermanage.ftl");
        return "index";
    }
    @ResponseBody
    @RequestMapping("user/update")
    public String updateuser(User user){
        return userService.updateuser(user);
    }

}
