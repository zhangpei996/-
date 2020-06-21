<!-- 百度 ueditor -->
<script type="text/javascript" charset="utf-8" src="static/plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="static/plugins/Ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="static/plugins/Ueditor/lang/zh-cn/zh-cn.js"></script>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> ${msg}</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="note/upNote" enctype="multipart/form-data" id="saveNote">
            <input type="hidden" name="uid" value="${user.id}">
            <div class="form-group">
                <div class="label">
                    <label>标题：</label>
                </div>
                <div class="field">
                    <input type="text" class="input" name="title" value="${note.pageInfo.list[0].title!}"/>
                    <div class="tips"></div>
                </div>
            </div>
            <input type="hidden" name="id" value="${note.pageInfo.list[0].id!}">
<#--            <div class="form-group">
                <div class="label">
                    <label>价格：</label>
                </div>
                <div class="field">
                    <input type="type" class="input" name="price" value=""/>
                    <div class="tips"></div>
                </div>
            </div>-->
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
                    <select name="postTypeId" class="input w50">
                        <option value="">请选择分类</option>
                        <#list type as item>
                            <#if item.id == note.pageInfo.list[0].postTypeId!>
                                <option value="${item.id}" selected>${item.postType}</option>
                                <#else>
                                    <option value="${item.id}">${item.postType}</option>
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
                <textarea rows="6" cols="80" class="span12 ckeditor" id="goods_content"
                name="describes" title="">${note.pageInfo.list[0].describes!}</textarea>
                    <span id="err_goods_content" style="color:#F00; display:none;"></span>
                    <div class="tips">
<#--                    <textarea name="describes"></textarea>
                    <div class="tips"></div>-->
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
<!--以下是在线编辑器 代码 -->
<script type="text/javascript">
    /**
     * 在线编辑器相 关配置 js
     *  参考 地址 http://fex.baidu.com/ueditor/
     */
    window.UEDITOR_Admin_URL = "static/plugins/Ueditor/";
    var URL_upload = "/index/Admin/Ueditor/imageUp/savepath/goods";
    var URL_fileUp = "/index/Admin/Ueditor/fileUp/savepath/article";
    var URL_scrawlUp = "/index/Admin/Ueditor/scrawlUp/savepath/article";
    var URL_getRemoteImage = "/index/Admin/Ueditor/getRemoteImage/savepath/article";
    var URL_imageManager = "/index/Admin/Ueditor/imageManager/savepath/article";
    var URL_imageUp = "/index/Admin/Ueditor/imageUp/savepath/article";
    var URL_getMovie = "/index/Admin/Ueditor/getMovie/savepath/article";
    var URL_home = "";
</script>
<script type="text/javascript">
    var editor;
    $(function () {
        //具体参数配置在  editor_config.js  中
        var options = {
            zIndex: 999,
            initialFrameWidth: "95%", //初化宽度
            initialFrameHeight: 400, //初化高度
            focus: false, //初始化时，是否让编辑器获得焦点true或false
            maximumWords: 99999,
            removeFormatAttributes: 'class,style,lang,width,height,align,hspace,valign', //允许的最大字符数 'fullscreen',
            pasteplain: false, //是否默认为纯文本粘贴。false为不使用纯文本粘贴，true为使用纯文本粘贴
            autoHeightEnabled: true
            /*   autotypeset: {
                   mergeEmptyline: true,        //合并空行
                   removeClass: true,           //去掉冗余的class
                   removeEmptyline: false,      //去掉空行
                   textAlign: "left",           //段落的排版方式，可以是 left,right,center,justify 去掉这个属性表示不执行排版
                   imageBlockLine: 'center',    //图片的浮动方式，独占一行剧中,左右浮动，默认: center,left,right,none 去掉这个属性表示不执行排版
                   pasteFilter: false,          //根据规则过滤没事粘贴进来的内容
                   clearFontSize: false,        //去掉所有的内嵌字号，使用编辑器默认的字号
                   clearFontFamily: false,      //去掉所有的内嵌字体，使用编辑器默认的字体
                   removeEmptyNode: false,      //去掉空节点
                                                //可以去掉的标签
                   removeTagNames: {"font": 1},
                   indent: false,               // 行首缩进
                   indentValue: '0em'           //行首缩进的大小
               }*/,
            toolbars: [
                ['fullscreen', 'source', '|', 'undo', 'redo',
                    '|', 'bold', 'italic', 'underline', 'fontborder',
                    'strikethrough', 'superscript', 'subscript',
                    'removeformat', 'formatmatch', 'autotypeset',
                    'blockquote', 'pasteplain', '|', 'forecolor',
                    'backcolor', 'insertorderedlist',
                    'insertunorderedlist', 'selectall', 'cleardoc', '|',
                    'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                    'customstyle', 'paragraph', 'fontfamily', 'fontsize',
                    '|', 'directionalityltr', 'directionalityrtl',
                    'indent', '|', 'justifyleft', 'justifycenter',
                    'justifyright', 'justifyjustify', '|', 'touppercase',
                    'tolowercase', '|', 'link', 'unlink', 'anchor', '|',
                    'imagenone', 'imageleft', 'imageright', 'imagecenter',
                    '|', 'insertimage', 'emotion', 'insertvideo',
                    'attachment', 'map', 'gmap', 'insertframe',
                    'insertcode', 'webapp', 'pagebreak', 'template',
                    'background', '|', 'horizontal', 'date', 'time',
                    'spechars', 'wordimage', '|',
                    'inserttable', 'deletetable',
                    'insertparagraphbeforetable', 'insertrow', 'deleterow',
                    'insertcol', 'deletecol', 'mergecells', 'mergeright',
                    'mergedown', 'splittocells', 'splittorows',
                    'splittocols', '|', 'print', 'preview', 'searchreplace']
            ]
        };
        editor = new UE.ui.Editor(options);
        editor.render("goods_content");  //  指定 textarea 的  id 为 goods_content

    });
</script>
<!--以上是在线编辑器 代码  end-->
