package com.school.dao;

import com.school.base.BaseDao;
import com.school.vo.User;

public interface UserMapper extends BaseDao<User,Integer> {

    User selectLogin(User user);

}