<!-- 商品管理 -->
<form method="post" action="" id="listform">
    <div class="panel admin-panel">

        <table class="table table-hover text-center">
            <tr>
                <th width="100" style="text-align:left; padding-left:20px;">选择</th>
                <th>订单编号</th>
                <th>状态</th>
                <th>商品名称</th>
                <th>商品价格</th>
                <th>用户名</th>
                <th>手机号</th>
                <th>地址</th>
                <th>下单时间</th>
                <th width="310">操作</th>
            </tr>
                <tbody id="goodsContent">
                </tbody>
                <!-- -----------分页--------------- -->
                <tr>
                    <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>
                        全选 </td>
                    <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a>

                    </td>
                </tr>
                <tr id="pageContent">
                </tr>
        </table>
    </div>
</form>
<script>
    $(function () {
        // ajax 加载商品列表
        var id = '${user.id}'.trim();
        // ajax 加载商品列表
        ajax_get_table(1,id);
    })
    //ajax抓取页面 page为当前第几页
    function ajax_get_table(page,id) {
        $.ajax({
            url: "order/allorder",
            type: "POST",
            data: {
                pageNum: page,
                uid:id
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
    <tr id="t_{{=it[i].id}}">
        <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value="" /></td>
        <td>{{=it[i].orderNo}}</td>
<#--        <td>{{=it[i].goodTypeId}}</td>-->

        <td>
        {{? it[i].orderStatus == 0 }}
        待发货
        {{?? it[i].orderStatus == 1}}
        配送中
        {{?? it[i].orderStatus == 3}}
        确定收货
            {{?? it[i].orderStatus == 4}}
            待发货
            {{??}}
            待发货
        {{?}}
        </td>
        <td>{{=it[i].title}}</td>
        <td>{{=it[i].goodsMoney}}</td>
        <td>{{=it[i].userName}}</td>
        <td>{{=it[i].userPhone}}</td>
        <td>{{=it[i].userAddress}}</td>
        <td>{{=it[i].createTime}}</td>
        <td><div class="button-group">
                {{? it[i].orderStatus >= 1 }}
                <a class="button border-red" href="javascript:void(0)" onclick="return del({{=it[i].id}})"><span class="icon-trash-o"></span> 删除订单</a>
                {{??}}
                <a class="button border-main" href="javascript:void(0)" onclick="update({{=it[i].id}})"><span class="icon-check"></span> 确定发货</a>
                {{?}}
            </div>
        </td>
    </tr>
    {{ } }}
</script>
<!-- 编写分页模板 -->
<script type="template" id="pageTemplate">
    <td colspan="8">
        <div class="pagelist">
    {{ if(it.hasPreviousPage){ }}
        <a href="javascript:ajax_get_table('{{=it.prePage}}','${user.id}'.trim());">上一页</a>
    {{ } }}


    {{ for(var i = 1; i <= it.pages; i++){ }}
        {{ if(i == it.pageNum){ }}
            <span class="current">{{=i}}</span>
        {{ } else { }}
        <a href="javascript:ajax_get_table('{{=i}}','${user.id}'.trim());">{{=i}}</a>
            {{ } }}
    {{ } }}


    {{ if(it.hasNextPage){ }}
            <a href="javascript:ajax_get_table('{{=it.nextPage}}','${user.id}'.trim());">下一页</a>
    {{ } }}
        </div>
    </td>
</script>
<!-- 删除单个商品 -->
<script>
    function del(id) {
        // 1、弹出提示框询问用户是否确认删除
        swal({
            title: "",  // 标题
            text: "<h3>您确认要删除订单信息吗？</h3>", // 内容
            type: "warning", // 图标  error	  success	info  warning
            showCancelButton: true,  // 是否显示取消按钮
            confirmButtonColor: "orange", // 确认按钮的颜色
            confirmButtonText: "确定", // 确认按钮的文本
            cancelButtonText: "取消" // 取消按钮的文本
        }).then(function(){
            // 2、如果确认删除，发送ajax请求删除指定类型
            $("#t_"+id).remove();
            swal("","<h3>删除成功！</h3>","success");
        })
    }
</script>
<script type="text/javascript">

    //全选
    $("#checkall").click(function(){
        $("input[name='id[]']").each(function(){
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })
    //确认收货
    function update(id) {
        $.ajax({
            url: "order/update",
            type: "POST",
            data: {
                id: id,
                orderStatus:1
            },
            success: function (result) {
                if (result=='success'){
                    swal("","<h3>确认发货！</h3>","success");
                    ajax_get_table(1,'${user.id}'.trim());
                }
            }
        })
    }
</script>