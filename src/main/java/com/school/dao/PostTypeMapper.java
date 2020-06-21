package com.school.dao;

import com.school.base.BaseDao;
import com.school.vo.PostType;

import java.util.List;

public interface PostTypeMapper extends BaseDao<PostType,Integer> {
    List<PostType> selectPostTypeAll();

}