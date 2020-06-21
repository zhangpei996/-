<!-- 商品详情展示 -->
<div style="margin-bottom: 10px;">
    <form action="order/show" method="post">
        <div class="xiangqing" style="background-color: #FFFFFF;">
            <div class="neirong w">
                <div class="xiaomi6 fl">${products[0].title}</div>

                    <#if user??>
                        <input type="hidden" name="uid" value=${user.id!}>
                    </#if>
                    <input type="hidden" name="pid" value=${products[0].id}>
                    <input type="hidden" name="title" value=${products[0].title}>
                    <input type="hidden" name="goodsMoney" value=${products[0].price?c}>
<#--                <nav class="fr">
                    <li><a href="">概述</a></li>
                    <li>|</li>
                    <li><a href="">变焦双摄</a></li>
                    <li>|</li>
                    <li><a href="">设计</a></li>
                    <li>|</li>
                    <li><a href="">参数</a></li>
                    <li>|</li>
                    <li><a href="">F码通道</a></li>
                    <li>|</li>
                    <li><a href="">用户评价</a></li>
                    <div class="clear"></div>
                </nav>-->
                <div class="clear"></div>
            </div>
        </div>
        <div class="jieshao mt20 w">
            <div class="left fl" style="height: 560px;" align="center"><img src="static/upload/${products[0].picture!}" width="540px" height="550px"></div>
            <div class="right fr" style="height: 560px;">
                <div class="h3 ml20 mt20">${products[0].title}</div>
                <div class="jianjie mr40 ml20 mt10">${products[0].describes!}</div>
                <div class="jiage ml20 mt10">${products[0].price!}元</div>
<#--                <div class="ft20 ml20 mt20">选择颜色</div>-->
<#--                <div class="xzbb ml20 mt10">
                    <div class="banben">
                        <a>
                            <span class="yuandian"></span>
                            <span class="yanse">亮黑色</span>
                        </a>
                    </div>

                </div>-->
                <div class="ft20 ml20 mt20">付款方式</div>
                <div class="xzbb ml20 mt10">
                    <div class="banben fl">
                        <a style="text-align: center">
                            <span>在线支付</span>
                        </a>
                    </div>
<#--                    <div class="banben fr">
                        <a>
                            <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;货到付款</span>
                        </a>
                    </div>-->
                    <div class="clear"></div>
                </div>
                <div class="xqxq mt20 ml20">
                    <div class="top1">
                        <div class="left1 fl">${products[0].describes!}</div>
                        <div class="right1 fr">${products[0].price!}元</div>
                        <div class="clear"></div>
                    </div>
                    <div class="bot ft20 ftbc" style="margin-top: 5px;">总计：${products[0].price!}元</div>
                </div>
                <div class="xiadan ml20 mt20">
                    <input class="jrgwc"  type="submit" name="jrgwc" value="立即选购" />
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </form>
</div>