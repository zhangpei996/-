<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <base href="/web/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>新院生活网</title>
    <link rel="stylesheet" href="static/css/pintuer.css">
    <link rel="stylesheet" href="static/css/admin.css">
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
    <script src="static/js/jquery.js"></script>

</head>
<!-- <body style="background-color:#f2f9fd;"> -->
<body>

<div class="header bg-main container-layout">
    <div class="line-middle line-small">
        <div class="xm5 xs4">
            <div class="logo">
                <h1><img src="images/log1.png" class="radius-circle rotate-hover" height="50" alt="" />新院校园生活网</h1>
            </div>
        </div>
        <div class="xm4 xs4">
            <div class="head-l input-help">
                <input type="text" class="input border-yellow" placeholder="搜索商品" style="padding: 6px;" />
            </div>
            <span class="icon-search" style="top: 25px; position: absolute; left: 160px; color: gray;"></span>
        </div>
        <div class="xm3 xs4">
            <div class="head-l">
                <c:if test="${user !=null}">
                    <a class="button button-little bg-red" href="login.html"><span class="icon-power-off"></span> 退出</a>
                </c:if>

                <c:if test="${user ==null}">
                    <a class="button button-little bg-green" href="show/login.jsp" target="_parent"><span class="icon-qrcode"></span> 登录</a> &nbsp;&nbsp;
                    <a class="button button-little bg-blue"  href="show/login.jsp" target="_parent"><span class="icon-pencil"></span> 注册</a> &nbsp;&nbsp;
                </c:if>
            </div>
        </div>
    </div>
</div>

<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>

    <h2><span class="icon-home"></span>跳蚤市场</h2>
    <ul><!-- style="display:block" -->
        <li><a href="index.html" target="right"><span class="icon-caret-right"></span>全部商品</a></li>
        <li><a href="supermarket.html" target="right"><span class="icon-caret-right"></span>书籍</a></li>
        <li><a href="supermarket.html" target="right"><span class="icon-caret-right"></span>生活用品</a></li>
        <li><a href="supermarket.html" target="right"><span class="icon-caret-right"></span>3C数码</a></li>
        <li><a href="supermarket.html" target="right"><span class="icon-caret-right"></span>鞋帽美妆</a></li>
        <li><a href="supermarket.html" target="right"><span class="icon-caret-right"></span>其他</a></li>
    </ul>
    <h2><span class="icon-adjust"></span>成绩查询</h2>
    <ul>
        <li><a href="info.html" target="right"><span class="icon-caret-right"></span>英语四六级</a></li>
        <li><a href="pass.html" target="right"><span class="icon-caret-right"></span>普通话水平测试</a></li>
        <li><a href="page.html" target="right"><span class="icon-caret-right"></span>计算机等级考试</a></li>
    </ul>
    <h2><span class="icon-user"></span>校园资讯</h2>
    <ul>
        <li><a href="index2.html" target="right"><span class="icon-caret-right"></span>全部讯息</a></li>
        <li><a href="info.html" target="right"><span class="icon-caret-right"></span>表白墙</a></li>
        <li><a href="pass.html" target="right"><span class="icon-caret-right"></span>寻物启事</a></li>
    </ul>
    <h2><span class="icon-plus"></span>信息发布</h2>
    <ul>
        <li><a href="add.html" target="right"><span class="icon-caret-right"></span>发布商品</a></li>
        <li><a href="page.html" target="right"><span class="icon-caret-right"></span>发布动态</a></li>
    </ul>
    <h2><span class="icon-wrench"></span>基本设置</h2>
    <ul>
        <li><a href="info.html" target="right"><span class="icon-caret-right"></span>个人中心</a></li>
        <li><a href="book.html" target="right"><span class="icon-caret-right"></span>留言管理</a></li>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
    <ul>
        <li><a href="list.html" target="right"><span class="icon-caret-right"></span>商品管理</a></li>
        <li><a href="add.html" target="right"><span class="icon-caret-right"></span>资讯管理</a></li>
    </ul>
</div>


<script type="text/javascript">
    $(function(){
        $(".leftnav h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>

<div class="admin">
<!-- 填充 -->

<!-- 填充 -->
    <div class="container-layout">
        <div class="border-top padding-top">
            <div class="text-center">
                <ul class="nav nav-inline">
                    <li><a href="#">网站首页</a> </li>
                    <li><a href="#">新闻资讯</a> </li>
                    <li><a href="#">产品中心</a> </li>
                    <li><a href="#">技术反馈</a> </li>
                    <li><a href="#">留言反馈</a> </li>
                    <li><a href="#">联系方式</a> </li>
                </ul>
            </div>
            <div class="text-center height-big">
                版权所有 © Pintuer.com All Rights Reserved，图ICP备：380959609</div>
        </div>
    </div>
</div>
</body>
<!-- 特效 -->
<script type="text/javascript" src="static/js/index.min.js"></script>
</html>