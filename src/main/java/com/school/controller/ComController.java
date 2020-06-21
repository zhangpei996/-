package com.school.controller;

import com.school.service.CommentService;
import com.school.service.NoteService;
import com.school.vo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("comment")
public class ComController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private NoteService noteService;
    @ResponseBody
    @RequestMapping("savecom")
    public String saveCom(Comment comment){
        return commentService.saveCom(comment)+"";
    }
    @ResponseBody
    @RequestMapping("selectCom")
    public List<Comment> selectCom(HttpServletRequest request){
        List<Comment> commentList = noteService.selectAll(request);
        return commentList;
    }
    @RequestMapping("show")
    public String show(Model model){
        model.addAttribute("changePage","commanage.ftl");
        return "index";
    }
    //批量删除
    @ResponseBody
    @RequestMapping("deleteManyPro")
    public String deleteMany(String[] arr){
        return commentService.deleteMany(arr);
    }
}
