<div class="lmlblog-member-content-list clear">

    <div class="lmlblog-post-list" id="goodsContent">

    </div>
</div>
<div id="pageContent"></div>
<script>
    $(function () {
        var id = '${postTypeId}'.trim();
        // ajax 加载商品列表
        ajax_get_table(1,id);
    })
    //ajax抓取页面 page为当前第几页
    function ajax_get_table(page,postTypeId) {
        $.ajax({
            url: "note/list",
            type: "POST",
            data: {
                pageNum: page,
                postTypeId:postTypeId
            },
            dataType: "JSON",
            success: function (result) {
                if (200 == result.code) {
                    if (result.pageInfo.list.length > 0) {
                        //获取商品列表模板
                        var goodsTemp = doT.template($("#goodsTemplate").text());
                        //填充数据
                        $("#goodsContent").html(goodsTemp(result.pageInfo.list));
                        //获取分页模板
                        var pageTemp = doT.template($("#pageTemplate").text());
                        //填充数据
                        $("#pageContent").html(pageTemp(result.pageInfo));
                    }
                }
            },
            error: function (result) {
                console.log(result)
            }
        });
    }
</script>
<!-- 编写商品模板 -->
<script type="template" id="goodsTemplate">
    {{ for(var i = 0; i < it.length; i++){ }}
    {{ if(i%2==0) { }}
    <div  class="lmlblog-posts-list words" style="background-image:url(static/images/058.png); " data="4197">
    {{ } }}
        {{ if((i+1)%2==0) { }}
        <div  class="lmlblog-posts-list words" style="background-image:url(static/images/028.png); " data="4197">
            {{ } }}
            {{ if(i%3==0) { }}
            <div  class="lmlblog-posts-list words" style="background-image:url(static/images/031.png); " data="4197">
                {{ } }}
        <!-- 动态内容部分，包括列表 -->
        <div class="lmlblog-post-user-info">

            <div class="lmlblog-post-user-info-avatar" user-data="1">
                <a href="#1" style="display: inline-block;">
                    <span class="lmlblog-vip-icon"></span><img src="{{=it[i].user.headImage}}" class="avatar"/><i class="lmlblog-verify lmlblog-verify-a" title="aaaa"></i></a>
                <div class="lmlblog-user-info-card">
                    <div class="info_card_loading">
                    </div>
                </div>
            </div>

            <div class="lmlblog-post-user-info-name">
                <a href="#1">
                    <font style="color:#333;font-weight:600">{{=it[i].user.userName}}</font>
                </a>
                <span class="lmlblog-mark lmlblog-lv" title="经验：3815">Lv.1</span><span class="lmlblog-mark lmlblog-vip">VIP 1</span>
            </div>
            <div class="lmlblog-post-user-info-time" title="2017-12-14 05:25">{{=it[i].createDate}}</div>
        </div><!-- 作者信息 -->

        <div class="lmlblog-post-content ">
            <a class="post_list_link" href="#">
                {{=it[i].describes}}
            </a>
        </div>
                {{? it[i].picture}}
                <div class="lmlblog-post-images-list clear">
                    <a href="static/upload/{{=it[i].picture}}" data-fancybox="gallery" data-caption='<i class="fa fa-copyright"></i> lmlblog'>
                        <img src="static/upload/{{=it[i].picture}}" /></a>
                </div>
                {{?}}
        <!-- 点赞评论 -->
        <div class="lmlblog-post-bar">
            <#--icon-thumbs-up-->
            <li class="lmlblog-no-like" id="n_{{=it[i].id}}"

            <#if user??>
                onclick='lmlblog_like_posts("n_{{=it[i].id}}","${user.headImage!}");'
            </#if>
            ><i class="icon-thumbs-o-up"></i> <span>{{=it[i].likeNum}}</span></li>
            <li onclick='lmlblog_pop_login_style();'><i class="icon-comment-o"></i>
                <span>
                    {{? it[i].comNum}}
                    {{=it[i].comNum}}
                    {{??}}
                    0
                    {{?}}
                </span>
            </li>
                <div class="bdsharebuttonbox" style="padding-top: 2px">
                    <a class="bds_weixin" data-cmd="weixin"></a>
                </div>
<#--            <li><i class="icon-send-o"></i> <span>1.2w</span></li>-->
            <li class="tag" style="background-color: #ffffff">
                <i class="lmlblog-icon"></i><a href="#2" title="{{=it[i].title}}"># {{=it[i].title}}</a>
            </li>
        </div>
        <!-- 头像显示 -->
        <div class="lmlblog-post-like-list" id="n_{{=it[i].id}}_head">
            {{ for(var j = 0; j < it[i].headImages.length; j++){ }}
            <a href="#22" id="had_like_1"><img src="{{=it[i].headImages[j]}}" class="avatar"/><i class="lmlblog-verify lmlblog-verify-a"></i></a>
            {{ } }}
        </div>

        <div class="lmlblog-post-content" style="padding-top: 10px; color: #00aa00">
                {{ for(var j = 0; j < it[i].comments.length; j++){ }}
            <div id="{{=it[i].id}}_{{=it[i].comments[j].id}}_com">
                <span>{{=it[i].comments[j].fromUserName}}:{{=it[i].comments[j].content}}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #0a0627;cursor: pointer"
                <#if user??>
                    onclick="addinput('{{=it[i].id}}_{{=it[i].comments[j].id}}_com','{{=it[i].comments[j].fromUserName}}','{{=it[i].id}}','{{=it[i].comments[j].fromUid}}','${user.id!}')"
                </#if>

                >回复</span><p></p>
            </div>
                {{if(it[i].comments[j].recomment != null){ }}

                {{ for(var m = 0; m < it[i].comments[j].recomment.length; m++){ }}
            <div id="{{=it[i].id}}_{{=it[i].comments[j].id}}_{{=it[i].comments[j].recomment[m].id}}_com">
                <span>&nbsp;&nbsp;&nbsp;&nbsp;{{=it[i].comments[j].recomment[m].fromUserName}}@{{=it[i].comments[j].recomment[m].toUserName}}:{{=it[i].comments[j].recomment[m].content}}</span>
            &nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #0a0627;cursor: pointer"
                <#if user??>
                    onclick="addinput('{{=it[i].id}}_{{=it[i].comments[j].id}}_{{=it[i].comments[j].recomment[m].id}}_com','{{=it[i].comments[j].recomment[m].fromUserName}}','{{=it[i].id}}','{{=it[i].comments[j].recomment[m].fromUid}}','${user.id!}')"
                </#if>

                >回复</span><p></p>
            </div>
                {{ } }}

                {{ } }}


                {{ } }}
        </div>
        <div class="lmlblog-post-content" style="padding-top: 20px">
            <input id="input_{{=it[i].id}}" type="text" class="input border-yellow-light bg-yellow-light" placeholder="评论"
            <#if user??>
                onkeypress="aa(event,'{{=it[i].id}}','${user.id!}')"
            </#if>
                   >
<#--            <span title="2017-12-14 05:25:48">12月14日 05:25</span>-->
            <span></span><#--<i class="icon-desktop" onclick="lmlblog_post_type_open();"></i>--></div>
        </div>
    <!-- posts_list -->
    {{ } }}
</script>
<!-- 编写分页模板 -->
<script type="template" id="pageTemplate">
    <td colspan="8">
        <div class="pagelist">
            {{ if(it.hasPreviousPage){ }}
            <a href="javascript:ajax_get_table('{{=it.prePage}}');">上一页</a>
            {{ } }}


            {{ for(var i = 1; i <= it.pages; i++){ }}
            {{ if(i == it.pageNum){ }}
            <span class="current">{{=i}}</span>
            {{ } else { }}
            <a href="javascript:ajax_get_table('{{=i}}');">{{=i}}</a>
            {{ } }}
            {{ } }}


            {{ if(it.hasNextPage){ }}
            <a href="javascript:ajax_get_table('{{=it.nextPage}}');">下一页</a>
            {{ } }}
        </div>
    </td>
</script>

<script type="text/javascript">
    function aa(e,topicId,fromUid) {
        if (e.keyCode == 13){
            var  content = $("#input_"+topicId).val();
            if (content ==""||content.trim()==""){
                swal("","<h3>发表失败！</h3>","error");
                return;
            }
            $.ajax({
                url: "comment/savecom",
                type: "POST",
                data: {
                    topicId: topicId,
                    fromUid:fromUid,

                    content:content
                },
                success: function (result) {
                    if (result==1){
                        swal("","<h3>发表成功！</h3>","success");
                        ajax_get_table(1);
                    }
                }
            })
        }
    }
    function addinput(id,name,topicId,fromUid,uid) {
        if($("#p"+id).size()>0){
            $("#p"+id).remove();
            return;
        }
        var canshu = "'"+topicId+"'"+","+"'"+uid+"'"+","+"'"+fromUid+"'"+","+"'p"+id+"'";
        $("#"+id).append('<input id="p'+id+'" type="text" class="input" placeholder="@'+name+'" onkeypress="bb(event,'+canshu+')"></input>')
    }
    function bb(e,topicId,fromUid,toUid,id) {
        if (e.keyCode == 13){
            var  content = $("#"+id).val();
            if (content ==""||content.trim()==""){
                swal("","<h3>发表失败！</h3>","error");
                return;
            }
            $.ajax({
                url: "comment/savecom",
                type: "POST",
                data: {
                    topicId: topicId,
                    fromUid:fromUid,
                    toUid:toUid,
                    content:content
                },
                success: function (result) {
                    if (result==1){
                        swal("","<h3>发表成功！</h3>","success");
                        ajax_get_table(1);
                    }
                }
            })
        }
    }
    //点赞
    function lmlblog_like_posts(id,head) {
        var idd = $("#"+id);
        if (idd.children().eq(0).attr("class")=="icon-thumbs-up"){
            idd.children().eq(0).attr("class","icon-thumbs-o-up");
            var ch =  parseInt( idd.children().eq(1).text())-1;
            idd.children().eq(1).text(ch);
            $("#a"+id).remove();
        }else {
            idd.children().eq(0).attr("class","icon-thumbs-up");
            var ch =  parseInt( idd.children().eq(1).text())+1;
            idd.children().eq(1).text(ch);
            $("#"+id+"_head").prepend('<a href="#22" id="a'+id+'"><img src="'+head+'" class="avatar"/><i class="lmlblog-verify lmlblog-verify-a"></a>');

        }
    }
</script>
<script>
    window._bd_share_config = {
        common: {
            bdText : '这是分享的标题',
            bdMini: "2",                // 下拉浮层分享按钮的列数
            bdMiniList: ['mshare', 'qzone', 'tsina', 'weixin', 'tqq', 'tieba', 'copy', 'print'],
            bdComment : '我是通用分享设置,会出现在发送给QQ好友里的描述',
            bdPic : "https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1906469856,4113625838&fm=26&gp=0.jpg",//分享的图像地址
            bdStyle : "0",//按钮样式
            bdSize: "20",//按钮大小
            bdUrl : 'https://www.baidu.com',//分享的地址
            bdDesc:'给你的好友留一句话吧'
        },
        "share" : {},

    };
    //此处为需要引入的百度分享的js文件
    with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
</script>