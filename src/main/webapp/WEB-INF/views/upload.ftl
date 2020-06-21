<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> ${msg}</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="saveProduct" enctype="multipart/form-data">
            <input type="hidden" name="uid" value="${user.id}">
            <div class="form-group">
                <div class="label">
                    <label>标题：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="title" value="${products[0].title!}"/>
                    <div class="tips"></div>
                </div>
                <input type="hidden" name="id" value="${products[0].id!}">
            </div>
            <div class="form-group">
                <div class="label">
                    <label>价格：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="price" value="${products[0].price!}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="upfile">图片</label>
                </div>
                <div class="field">
                    <a class="button input-file" href="javascript:void(0);">+ 请选择上传文件
                        <input size="100" name="file"
                               data-validate="required:请选择文件,regexp#.+.(jpg|jpeg|png|gif)$:只能上传jpg|gif|png格式文件"
                               type="file"/>
                    </a>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>分类标题：</label>
                </div>
                <div class="field">
                    <select name="goodTypeId" class="input w50">
                        <option value="">请选择分类</option>
                        <#list type as item>
                            <#if item.id == products[0].goodTypeId!>
                                <option value="${item.id}" selected>${item.goodType}</option>
                                <#else>
                                    <option value="${item.id}">${item.goodType}</option>
                            </#if>
                        </#list>
                    </select>
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>内容：</label>
                </div>
                <div class="field">
                    <textarea class="input" name="describes" rows="6" cols="80">${products[0].describes!}</textarea>
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
