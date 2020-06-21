package com.school.service;

import com.school.dao.CommentMapper;
import com.school.vo.Comment;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class CommentService {
    @Resource
    private CommentMapper commentMapper;

    public Integer saveCom(Comment comment){
        comment.setCreateTime(new Date());
        return commentMapper.insertSelective(comment);
    }

    public String deleteMany(String[] arr) {
        if (commentMapper.updateMany(arr)==arr.length){
            return "success";
        }
        return "error";
    }
}
