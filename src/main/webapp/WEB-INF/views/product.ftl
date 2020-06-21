<!-- 全部商品展示 -->
<div>
    <div class="danpin center">

        <div class="biaoti center">全部商品</div>
            <#list products as item>
            <#if 0==(item_index)%5>
                <div class="main center">
            </#if>
            <div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
                <div class="sub_mingxing"><a href="selectProductAll?changePage=details.ftl&id=${item.id}"><img src="static/upload/${item.picture!}" alt=""></a></div>
                <div class="pinpai"><a href="selectProductAll?changePage=details.ftl&id=${item.id}">${item.title!}</a></div>
                <div class="youhui"><a href="selectProductAll?changePage=details.ftl&id=${item.id}">${item.describes!}</a></div>
                <div class="jiage">${item.price!}元</div>
            </div>
                <#if 0==(item_index+1)%5 && item_index != products?size>
                    <div class="clear"></div>
                    </div>
                </#if>
                <#if item_index == products?size>
                        <div class="clear"></div>
                    </div>
                </#if>
            </#list>

        </div>
    </div>
</div>