<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>文章管理添加</title>
	<script type="text/javascript" charset="utf-8" src="${contextPath}/resources/js/kindeditor-4.1.10/kindeditor-min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${contextPath}/resources/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <style type="text/css">
    .form-table-td-left{
    	width:15%;
    }
    .form-table-td-right{
    	width:85%;
    }
    </style>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',border:false" style="height:40px;padding:6px;background-color: #FAFAFA;border-bottom:1px solid #DDDDDD;">
		  <div class="panel-title" style="float:left;width:200px;height:26px;line-height:26px;margin-left:10px;">文章管理-添加</div>
		  <div style="float:right;width:200px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentAddPage.submitForm()" style="width:80px">提交</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" href="javascript:void(0)" onclick="contentAddPage.clearForm()" style="width:80px">返回</a>
		  </div>
		</div>
		<div data-options="region:'center',border:false" style="padding:10px">
			<form id="contentAddForm" method="post" action="${contextPath}/cms/article/add" >
				<table class="easyui-panel form-table">
				   <tr>
						<td class="form-table-td-left">
							<label for="title">文章标题:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="title" data-options="required:true,validType:['length[0,255]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="channelId">栏目编号:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-combotree" name="channelId"
								   data-options="url:'${contextPath}/platform/box/combotree?id=55059701325166',method:'get'" style="width:200px;height:28px;">
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="keywords">关键字:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="keywords" data-options="required:false,validType:['length[0,255]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="description">文章描述:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="description" data-options="required:false,validType:['length[0,500]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="status">状态:</label>
						</td>
						<td class="form-table-td-right">
							<input type="radio" id="radio_on" name="status" checked="checked" value="on"/>
							<label for="radio_on">显示</label>		
							<input type="radio" id="radio_off" name="status" value="off"/>
							<label for="radio_off">隐藏</label>			
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="topNumber">置顶序号:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-numberbox" type="text" name="topNumber" data-options="required:true,validType:['length[0,64]'],missingMessage:'请输入数字'" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				</table>
				<div>
					<p>文章内容:</p>
					<textarea name="content" class="common-textarea" id="content" style="width:91%; height:500px;visibility:hidden;"></textarea>
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript">
var contentEditor = null;
$(function(){
	
    contentEditor = KindEditor.create('textarea[name="content"]', {
	    uploadJson : contextPath + '/kindeditor/fileUpload',  
	    fileManagerJson : contextPath + '/kindeditor/fileManager',  
	    allowFileManager : true,
	    items : ['source', '|', 'undo', 'redo', '|', 'preview', 'template', 'cut', 'copy', 'paste',
	             'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
	             'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
	             'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
	             'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
	            'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image','multiimage',
	            'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
	            'anchor', 'link', 'unlink']
	});
});
var contentAddPage  = {
	submitForm : function (){
		if(!$('#contentAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		contentEditor.sync();
		$.post("${contextPath}/cms/article/add",$("#contentAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增成功!');
				window.self.location = "${contextPath}/cms/article/list";
			}else{
				$.messager.alert('添加错误',data.msg,'error');
			}
		});
		
	},
	clearForm : function(){
		window.self.location = "${contextPath}/cms/article/list";
	}
};
</script>
</body>
</html>