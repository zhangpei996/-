package com.school.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.school.dao.UserMapper;
import com.school.utils.BaseResult;
import com.school.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;
    public Integer saveuser(User user, HttpServletRequest request) {
        user.setCreateDate(new Date());
        user.setFlag(1);
        Integer flag = userMapper.insertSelective(user);
        if (flag != 0){
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
        }
        return flag;
    }

    public String updateuser(User user){
         if (userMapper.updateByPrimaryKeySelective(user)>0){
             return "success";
         }else {
             return "error";
         }
    }
    public Integer login(User user, HttpServletRequest request) {
        User u = userMapper.selectLogin(user);
        if (u !=null){
            HttpSession session = request.getSession();
            session.setAttribute("user",u);
            if (u.getId()==1){
                return 2;
            }
            return 1;
        }else {
            return 0;
        }

    }
    public String judgeName(User user){
        User user1 = userMapper.selectLogin(user);
        if (StringUtils.isEmpty(user1)){
            return "success";
        }
        return "error";
    }
    //商品管理 分页
    public BaseResult selectUsers(User user){
        //开启分页
        PageHelper.startPage(user.pageNum,user.pageSize);
        List<User> products = userMapper.selectAll(user);
        PageInfo<User> pageInfo = new PageInfo<>(products);
        return BaseResult.success(pageInfo);
    }
}
