package com.school.controller;

import com.school.service.NoteService;
import com.school.service.TypeService;
import com.school.utils.BaseResult;
import com.school.vo.Comment;
import com.school.vo.Post;
import com.school.vo.PostType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 校园资讯模块
 */
@RequestMapping("note")
@Controller
public class NoteController {
    @Autowired
    private NoteService noteService;
    @Autowired
    private FileController fileController;
    @Resource
    private TypeService typeService;
    //校园资讯显示
    @ResponseBody
    @RequestMapping("list")
    public BaseResult list(Post post, Model model){
        if (!StringUtils.isEmpty(post.getPostTypeId())){
            if (post.getPostTypeId()==0){
                post.setPostTypeId(null);
            }
        }
        if (!StringUtils.isEmpty(post.getUid())&&post.getUid()==1){
            post.setUid(null);
        }
        return noteService.search(post);
    }
    //资讯显示的到添加页面
    @RequestMapping("saveshow")
    public String saveshow(Post post, Model model){
        BaseResult baseResult = noteService.search(post);
        List<PostType> notelists = typeService.noteTypeAll();
        model.addAttribute("type", notelists);
        model.addAttribute("msg", "帖子修改");
        model.addAttribute("note",baseResult);
        model.addAttribute("changePage","updatenote.ftl");
        return "index";
    }
    //校园资讯显示
    @RequestMapping("show")
    public String show(Model model,String changePage,Integer postTypeId){
        model.addAttribute("changePage",changePage);
        model.addAttribute("postTypeId",postTypeId);
        return "index";
    }
    //上传校园资讯内容
    @RequestMapping("saveNote")
    public String saveNote(Post post, HttpServletRequest request){
            String fileName = fileController.uploadFile(request);
            post.setPicture(fileName);
        noteService.savepost(post);
        request.setAttribute("changePage","note.ftl");
        return "index";
    }
    //更新内容
    @RequestMapping("upNote")
    public String upNote(Post post, HttpServletRequest request){
        String fileName = fileController.uploadFile(request);
        post.setPicture(fileName);
        noteService.uppost(post);
        request.setAttribute("changePage","note.ftl");
        request.setAttribute("postTypeId","0");
        return "index";
    }
    //校园资讯显示
    @ResponseBody
    @RequestMapping("aaa")
    public List<Comment> aaa(Comment comment){
        return noteService.aaa(comment);
    }
    //帖子批量删除
    //批量删除
    @ResponseBody
    @RequestMapping("deleteManyPro")
    public String deleteMany(String[] arr){
        return noteService.deleteMany(arr);
    }
}
