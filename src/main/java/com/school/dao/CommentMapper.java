package com.school.dao;

import com.school.base.BaseDao;
import com.school.vo.Comment;

public interface CommentMapper extends BaseDao<Comment,Integer> {

    int updateMany(String[] arr);
}