package com.school.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class Post extends PageVo{
    private Integer id;

    private String title;

    private String describes;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "UTC+8")
    private Date createDate;

    private Integer uid;

    private Integer postTypeId;

    private Integer flag;

    private Integer likeNum;

    private Integer lookNum;

    private Integer comNum;

    private String picture;

    private List<String> headImages;

    private List<Comment> comments;
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public List<String> getHeadImages() {
        return headImages;
    }

    public void setHeadImages(List<String> headImages) {
        this.headImages = headImages;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes == null ? null : describes.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPostTypeId() {
        return postTypeId;
    }

    public void setPostTypeId(Integer postTypeId) {
        this.postTypeId = postTypeId;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Integer getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(Integer likeNum) {
        this.likeNum = likeNum;
    }

    public Integer getLookNum() {
        return lookNum;
    }

    public void setLookNum(Integer lookNum) {
        this.lookNum = lookNum;
    }

    public Integer getComNum() {
        return comNum;
    }

    public void setComNum(Integer comNum) {
        this.comNum = comNum;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", describes='" + describes + '\'' +
                ", createDate=" + createDate +
                ", uid=" + uid +
                ", postTypeId=" + postTypeId +
                ", flag=" + flag +
                ", likeNum=" + likeNum +
                ", lookNum=" + lookNum +
                ", comNum=" + comNum +
                ", picture='" + picture + '\'' +
                ", headImages=" + headImages +
                ", comments=" + comments +
                ", user=" + user +
                ", pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                '}';
    }
}