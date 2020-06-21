package com.school.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.school.base.BaseDao;
import com.school.dao.CommentMapper;
import com.school.dao.PostMapper;
import com.school.utils.BaseResult;
import com.school.vo.Comment;
import com.school.vo.Post;
import com.school.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Service
public class NoteService {
    @Autowired
    private PostMapper postMapper;
    @Autowired
    private CommentMapper commentMapper;
    //添加帖子
    public Integer savepost(Post post) {
        if (!StringUtils.isEmpty(post.getDescribes())) {
            String escape = HtmlUtils.htmlEscape(post.getDescribes(), "UTF-8");
            post.setDescribes(escape);
        }
        post.setCreateDate(new Date());
        if (StringUtils.isEmpty(post.getId())){
            post.setFlag(1);
            post.setLookNum(0);
        }
        postMapper.insertSelective(post);
        return postMapper.insertlike(4,post.getId());
    }
    //更新帖子
    public Integer uppost(Post post){
        if (!StringUtils.isEmpty(post.getDescribes())) {
            String escape = HtmlUtils.htmlEscape(post.getDescribes(), "UTF-8");
            post.setDescribes(escape);
        }
        return postMapper.updateByPrimaryKeySelective(post);
    }
    //帖子 分页
    public BaseResult search(Post post){
/*        if (post.getPostTypeId()==0){
            post.setPostTypeId(null);
        }*/
        //开启分页
        PageHelper.startPage(post.pageNum,post.pageSize);
        List<Post> postList = postMapper.selectPostPage(post);
        List<Comment> comments = aaa(new Comment());
        postList.forEach(t->{
            if (!StringUtils.isEmpty(t.getDescribes())){
                t.setDescribes(HtmlUtils.htmlUnescape(t.getDescribes()));
            }
            List<Comment> c1 = new ArrayList<Comment>();
            comments.forEach(m->{
                if (t.getId()==m.getTopicId()&&m.getToUid()==null){
                    c1.add(m);
                }
            });
            t.setComments(c1);
        });
        PageInfo<Post> pageInfo = new PageInfo<>(postList);
        return BaseResult.success(pageInfo);
    }
    //查出所有的评论
    public List<Comment> bbb(Comment comment){
        //查出来的索引集合
        List<Comment> comments = commentMapper.selectAll(comment);
        return comments;
    }
    public List<Comment> aaa(Comment comment){
        List<Comment> comments = bbb(comment);
        //自己创建的集合
        List<Comment> commentList = new ArrayList<>();
        //获取第一层数据
        for (Comment comment1:comments){
            if (comment1.getToUid() == null) {
                commentList.add(comment1);
            }
        }
        //获取第二层数据
        List<Comment> recomments = new ArrayList<>();
        commentList.forEach(t->{
            comments.forEach(m->{
                if (m.getToUid() == t.getFromUid() && t.getTopicId() == m.getTopicId()){
                    recomments.add(m);
                    t.setRecomment(recomments);
                }
            });
        });
        return commentList;
    }
    //查询出所有某个用户的评论
    public List<Comment> selectAll(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        Integer id = user.getId();
        Integer[] postIds = postMapper.selectAllId(id);
        List<Comment> comments = bbb(new Comment());
        List<Comment> commentList = new ArrayList<>();
        for (Integer postId : postIds) {
            comments.forEach(t->{
                if (postId==t.getTopicId()){
                    commentList.add(t);
                }
            });
        }
        return commentList;
    }

    public String deleteMany(String[] arr) {
        if (postMapper.updateMany(arr)==arr.length){
            return "success";
        }
        return "error";
    }

}
