package com.school.dao;

import com.school.base.BaseDao;
import com.school.vo.Post;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PostMapper extends BaseDao<Post,Integer> {
    List<Post> selectPostPage(Post post);
    List<Post> selectPost();
    Integer[] selectAllId(@Param("id") Integer id);
    int updateMany(String[] arr);
    int insertlike(@Param("uid") int uid,@Param("post_id") int post_id);
}