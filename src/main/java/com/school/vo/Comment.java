package com.school.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class Comment {
    private Integer id;

    private Integer topicId;

    private String topicType;

    private Integer fromUid;

    private Integer toUid;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "UTC+8")
    private Date createTime;

    private String content;

    private String fromUserName;

    private String toUserName;

    private List<Comment> recomment;

    public List<Comment> getRecomment() {
        return recomment;
    }

    public String getFromUserName() {
        return fromUserName;
    }

    public void setFromUserName(String fromUserName) {
        this.fromUserName = fromUserName;
    }

    public String getToUserName() {
        return toUserName;
    }

    public void setToUserName(String toUserName) {
        this.toUserName = toUserName;
    }

    public void setRecomment(List<Comment> recomment) {
        this.recomment = recomment;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public String getTopicType() {
        return topicType;
    }

    public void setTopicType(String topicType) {
        this.topicType = topicType == null ? null : topicType.trim();
    }

    public Integer getFromUid() {
        return fromUid;
    }

    public void setFromUid(Integer fromUid) {
        this.fromUid = fromUid;
    }

    public Integer getToUid() {
        return toUid;
    }

    public void setToUid(Integer toUid) {
        this.toUid = toUid;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", topicId=" + topicId +
                ", topicType='" + topicType + '\'' +
                ", fromUid=" + fromUid +
                ", toUid=" + toUid +
                ", createTime=" + createTime +
                ", content='" + content + '\'' +
                ", fromUserName='" + fromUserName + '\'' +
                ", toUserName='" + toUserName + '\'' +
                ", recomment=" + recomment +
                '}';
    }
}