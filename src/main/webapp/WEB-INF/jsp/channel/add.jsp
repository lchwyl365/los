<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>栏目管理添加</title>
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
		  <div class="panel-title" style="float:left;width:200px;height:26px;line-height:26px;margin-left:10px;">栏目管理-添加</div>
		  <div style="float:right;width:200px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentAddPage.submitForm()" style="width:80px">提交</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" href="javascript:void(0)" onclick="contentAddPage.clearForm()" style="width:80px">返回</a>
		  </div>
		</div>
		<div data-options="region:'center',border:false" style="padding:10px">
			<form id="contentAddForm" method="post" action="${contextPath}/cms/channel/add" enctype="multipart/form-data" >
				<input type="hidden" name="pid" value="${pid}"/>
				<table class="easyui-panel form-table">
				   <tr>
						<td class="form-table-td-left">
							<label for="channelName">栏目名称:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="channelName" data-options="required:true,validType:['length[0,64]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="channelSort">排列顺序:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="channelSort" data-options="required:true,validType:['length[0,64]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="istop">首页导航栏目:</label>
						</td>
						<td class="form-table-td-right">
							<input type="radio" id="radio_on" name="istop" checked="checked" value="on"/>
							<label for="radio_on">是</label>		
							<input type="radio" id="radio_off" name="istop" value="off"/>
							<label for="radio_off">不是</label>			
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="channelType">栏目类型:</label>
						</td>
						<td class="form-table-td-right">
							<input id="channelType" class="easyui-combotree" name="channelType"
								   data-options="url:'${contextPath}/platform/box/combotree?id=55072199221118',method:'get',onChange:changeType" style="width:200px;height:28px;">
						</td>
				    </tr>
				    <tr>
						<td class="form-table-td-left">
							<label for="thumbnail">图片:</label>
						</td>
						<td class="form-table-td-right">
								<input type="file" name="thumbnail" />
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="status">状态:</label>
						</td>
						<td class="form-table-td-right">
							<input type="radio" id="radio_0" name="status" checked="checked" value="on"/>
							<label for="radio_0">显示</label>		
							<input type="radio" id="radio_0" name="status" value="off"/>
							<label for="radio_0">隐藏</label>			
						</td>
				    </tr>
				    <tr id="link_div" style="display:none;">
						<td class="form-table-td-left">
							<label for="url">链接地址:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="url" data-options="required:false,validType:['length[0,255]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				</table>
				<div id="content_div" style="display:none;">
					<p>栏目内容:</p>
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
		$('#contentAddForm').submit();
		
	},
	clearForm : function(){
		window.self.location = "${contextPath}/cms/channel/list";
	}
};
function changeType(newValue){
	if(newValue == 'cover'){
		$("#content_div").show();
		$("#link_div").hide();
	}else if(newValue == 'link'){
		$("#content_div").hide();
		$("#link_div").show();
	}else if(newValue == 'list'){
		$("#content_div").hide();
		$("#link_div").hide();
	}
}
</script>
</body>
</html>