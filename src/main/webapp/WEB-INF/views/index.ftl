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
    <link rel='stylesheet' id='style-css'  href='static/css/styles.css' type='text/css' media='all' />
    <link rel='stylesheet' id='lmlblog-css'  href='static/css/lmlblog.css' type='text/css' media='all' />
    <link rel='stylesheet' id='all-css'  href='static/css/all.css' type='text/css' media='all' />
    <link rel="stylesheet" href="static/plugins/sweetalert2/sweetalert2.min.css"/>
    <script type="text/javascript" src="static/js/doT.min.js"></script>
    <script type="text/javascript" src="static/plugins/sweetalert2/sweetalert2.min.js"></script>
    <script src="static/js/jquery.js"></script>

</head>
<!-- <body style="background-color:#f2f9fd;"> -->
<body>

<div class="header bg-main container-layout">
    <div class="line-middle line-small">
        <div class="xm5 xs4">
            <div class="logo">
                <h1><img src="static/images/log1.png" class="radius-circle rotate-hover" height="50" alt="" />新院校园生活网</h1>
            </div>
        </div>
        <div class="xm4 xs4">
            <div class="head-l input-help">
                <form  id="searchgood" action="selectProductAll" method="post">
                    <input id="goodname" type="text" name="title" class="input border-yellow" placeholder="搜索商品" style="padding: 6px;" />
                </form>
            </div>
            <span class="icon-search" style="top: 25px; position: absolute; left: 160px; color: gray;" onclick="searchgood()"></span>
        </div>
        <div class="xm3 xs4">
            <div class="head-l">
                    <#if user??>
                        <a class="button button-little bg-blue-light" href="updateshow"><span class="icon-user"></span>${user.userName!}</a>&nbsp;&nbsp;&nbsp;
                         <a class="button button-little bg-red" href="show/login.jsp"><span class="icon-power-off"></span>退出</a>
                        <#else >
                        <a class="button button-little bg-green" href="show/login.jsp" target="_parent"><span class="icon-qrcode"></span> 登录</a> &nbsp;&nbsp;
                        <a class="button button-little bg-blue"  href="show/login.jsp" target="_parent"><span class="icon-pencil"></span> 注册</a> &nbsp;&nbsp;
                    </#if>
            </div>
        </div>
    </div>
</div>

<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <#if user??>
        <#if (user.userName != "admin")>
    <h2><span class="icon-home"></span>跳蚤市场</h2>
    <ul><!-- style="display:block" -->
        <li><a href="selectProductAll" target="right"><span class="icon-caret-right"></span>全部商品</a></li>
        <li><a href="selectProductAll?goodTypeId=1" target="right"><span class="icon-caret-right"></span>书籍</a></li>
        <li><a href="selectProductAll?goodTypeId=2" target="right"><span class="icon-caret-right"></span>生活用品</a></li>
        <li><a href="selectProductAll?goodTypeId=3" target="right"><span class="icon-caret-right"></span>3C数码</a></li>
        <li><a href="selectProductAll?goodTypeId=4" target="right"><span class="icon-caret-right"></span>鞋帽美妆</a></li>
        <li><a href="selectProductAll?goodTypeId=5" target="right"><span class="icon-caret-right"></span>其他</a></li>
    </ul>
    <h2><span class="icon-adjust"></span>成绩查询</h2>
    <ul>
        <li><a href="javascript:siliu();" target="_parent"><span class="icon-caret-right"></span>英语四六级</a></li>
        <li><a href="javascript:;" onclick="putonghua()"><span class="icon-caret-right"></span>计算机等级考试</a></li>
        <li><a href="javascript:;" onclick="teacher()"><span class="icon-caret-right"></span>教师资格证</a></li>
    </ul>
    <h2><span class="icon-user"></span>校园资讯</h2>
    <ul>
        <li><a href="note/show?changePage=note.ftl&postTypeId=0" target="right"><span class="icon-caret-right"></span>全部讯息</a></li>
        <li><a href="note/show?changePage=note.ftl&postTypeId=1" target="right"><span class="icon-caret-right"></span>表白墙</a></li>
        <li><a href="note/show?changePage=note.ftl&postTypeId=2" target="right"><span class="icon-caret-right"></span>寻物启事</a></li>
    </ul>
    <h2><span class="icon-plus"></span>信息发布</h2>
    <ul>
        <li><a href="productTypeAll/1" target="right"><span class="icon-caret-right"></span>发布商品</a></li>
        <li><a href="productTypeAll/2" target="right"><span class="icon-caret-right"></span>发布动态</a></li>
<#--
        <li><a href="note/saveshow?id=3" target="right"><span class="icon-caret-right"></span>发布动态</a></li>
-->
    </ul>
            </#if>
    <h2><span class="icon-wrench"></span>基本设置</h2>
    <ul>
        <li><a href="updateshow" target="right"><span class="icon-caret-right"></span>个人中心</a></li>
        <#if (user.userName != "admin")>
        <li><a href="comment/show" target="right"><span class="icon-caret-right"></span>留言管理</a></li>
        <li><a href="order/manage" target="right"><span class="icon-caret-right"></span>我的订单</a></li>
        </#if>
    </ul>
    <h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
    <ul>
        <#if (user.userName == "admin")>
            <li><a href="user/show" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
        </#if>
        <li><a href="show" target="right"><span class="icon-caret-right"></span>商品管理</a></li>
        <li><a href="note/show?changePage=notemanage.ftl" target="right"><span class="icon-caret-right"></span>资讯管理</a></li>
        <#if (user.userName != "admin")>
            <li><a href="order/manages" target="right"><span class="icon-caret-right"></span>订单管理</a></li>
        </#if>
    </ul>
    <#else >
        <h2><span class="icon-home"></span>跳蚤市场</h2>
        <ul><!-- style="display:block" -->
            <li><a href="selectProductAll" target="right"><span class="icon-caret-right"></span>全部商品</a></li>
            <li><a href="selectProductAll?goodTypeId=1" target="right"><span class="icon-caret-right"></span>书籍</a></li>
            <li><a href="selectProductAll?goodTypeId=2" target="right"><span class="icon-caret-right"></span>生活用品</a></li>
            <li><a href="selectProductAll?goodTypeId=3" target="right"><span class="icon-caret-right"></span>3C数码</a></li>
            <li><a href="selectProductAll?goodTypeId=4" target="right"><span class="icon-caret-right"></span>鞋帽美妆</a></li>
            <li><a href="selectProductAll?goodTypeId=5" target="right"><span class="icon-caret-right"></span>其他</a></li>
        </ul>
        <h2><span class="icon-adjust"></span>成绩查询</h2>
        <ul>
            <li><a href="javascript:siliu();" target="_parent"><span class="icon-caret-right"></span>英语四六级</a></li>
            <li><a href="javascript:;" onclick="putonghua()"><span class="icon-caret-right"></span>计算机等级考试</a></li>
            <li><a href="javascript:;" onclick="teacher()"><span class="icon-caret-right"></span>教师资格证</a></li>
        </ul>
        <h2><span class="icon-user"></span>校园资讯</h2>
        <ul>
            <li><a href="note/show?changePage=note.ftl&postTypeId=0" target="right"><span class="icon-caret-right"></span>全部讯息</a></li>
            <li><a href="note/show?changePage=note.ftl&postTypeId=1" target="right"><span class="icon-caret-right"></span>表白墙</a></li>
            <li><a href="note/show?changePage=note.ftl&postTypeId=2" target="right"><span class="icon-caret-right"></span>寻物启事</a></li>
        </ul>
    </#if>
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
    <#if changePage??>
        <#include changePage>
        <#else >
            <#include "product.ftl">
    </#if>
    <!-- 填充 -->
    <div class="container-layout main center">
        <div class="border-top padding-top">
            <div class="text-center">
                <ul class="nav nav-inline">
                    <li><a href="#">网站首页</a> </li>
                    <li><a href="#">跳蚤市场</a> </li>
                    <li><a href="#">成绩查询</a> </li>
                    <li><a href="#">校园资讯</a> </li>
                    <li><a href="#">留言反馈</a> </li>
                    <li><a href="#">联系方式</a> </li>
                </ul>
            </div>
            <div class="text-center height-big">
                版权所有 © ZhangPei.com All Rights Reserved，图ICP备：20184131023</div>
        </div>
    </div>
</div>
</body>
<!-- 特效 -->
<script type="text/javascript" src="static/js/index.min.js"></script>
<script type="text/javascript">
    function siliu() {
        $(".admin").html("<iframe src=\"http://cet.neea.edu.cn/cet\" width=\"100%\" height=\"100%\" scrolling=\"auto\">");
    }
    function putonghua() {
        $(".admin").html("<iframe src=\"http://cjcx.neea.edu.cn/html1/folder/1508/206-1.htm?sid=300\" width=\"100%\" height=\"100%\" scrolling=\"no\">");
    }
    function teacher() {
        $(".admin").html("<iframe src=\"http://cjcx.neea.edu.cn/html1/folder/1508/206-1.htm?sid=2nasVMoohJ6cFnsQEIjGYmh\" width=\"100%\" height=\"100%\" scrolling=\"yes\" seamless>");
    }
    function searchgood() {
        if ($("#goodname").val().trim()!=null && $("#goodname").val().trim()!=''){
            $("#searchgood").submit();
        }
    }
</script>
</html>