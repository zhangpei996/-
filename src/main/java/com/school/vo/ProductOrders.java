package com.school.vo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ProductOrders extends PageVo{
    private Integer id;

    private String orderNo;

    private Integer uid;
    //-2:未付款的订单 -1：用户取消 0:待发货 1:配送中 2:用户确认收货
    private String orderStatus;

    private Double goodsMoney;

    private String userName;

    private String userAddress;

    private String userPhone;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "UTC+8")
    private Date createTime;

    private String flag;

    private Integer pid;

    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus == null ? null : orderStatus.trim();
    }

    public Double getGoodsMoney() {
        return goodsMoney;
    }

    public void setGoodsMoney(Double goodsMoney) {
        this.goodsMoney = goodsMoney;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress == null ? null : userAddress.trim();
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    @Override
    public String toString() {
        return "ProductOrders{" +
                "id=" + id +
                ", orderNo='" + orderNo + '\'' +
                ", uid=" + uid +
                ", orderStatus='" + orderStatus + '\'' +
                ", goodsMoney=" + goodsMoney +
                ", userName='" + userName + '\'' +
                ", userAddress='" + userAddress + '\'' +
                ", userPhone='" + userPhone + '\'' +
                ", createTime=" + createTime +
                ", flag='" + flag + '\'' +
                ", pid=" + pid +
                ", title='" + title + '\'' +
                '}';
    }
}