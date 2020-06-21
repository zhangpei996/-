<!-- 个人信息 -->
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 个人中心</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="">
            <div class="form-group">
                <div class="label">
                    <label>用户名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="s_name" value="${user.userName!}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>密码：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="s_phone" value="${user.pwd!}"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>性别：</label>
                </div>
                <div class="field" style="padding-top: 8px;">
                    男<input type="radio" class="radio" name="s_tel" value="" checked="checked"/>
                    女<input type="radio" class="radio" name="s_tel" value=""/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>电话：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="s_tel" value="${user.phone!}"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group" style="display:none;">
                <div class="label">
                    <label>学院：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="s_400" value=""/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>宿舍地址：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="s_fax" value=""/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>