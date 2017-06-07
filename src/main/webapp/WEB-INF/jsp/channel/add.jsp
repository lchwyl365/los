<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>cms_channel添加</title>
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
		  <div class="panel-title" style="float:left;width:200px;height:26px;line-height:26px;margin-left:10px;">栏目添加</div>
		  <div style="float:right;width:200px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentAddPage.submitForm()" style="width:80px">提交</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" href="javascript:void(0)" onclick="contentAddPage.clearForm()" style="width:80px">返回</a>
		  </div>
		</div>
		<div data-options="region:'center',border:false" style="padding:10px">
			<form id="contentAddForm" method="post">
				<input type="hidden" name="pid" value="${pid}"/>
				<input type="hidden" name="istop" value="${istop}" />
				<table class="easyui-panel form-table" style="width:90%;">
				   <tr>
						<td class="form-table-td-left">
							<label for="status">状态:</label>
						</td>
						<td class="form-table-td-right">
							<input type="radio" id="radio2" name="status" value="on"/> <label for="radio2">显示</label>
							<input type="radio" id="radio3" name="status" value="off"/><label for="radio3">隐藏</label>
						</td>
			     	</tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="channelName">栏目名称:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="channelName" data-options="required:false,validType:['length[0,64]']" />
						</td>
				    </tr>
				    <tr>
					    <td class="form-table-td-left">
							<label for="channelSort">排列顺序:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="channelSort" style="width:80px;" data-options="required:false,validType:['length[0,64]']" />
						</td>
				    </tr>
				   <tr>
					    <td class="form-table-td-left">
							<label for="channelType">栏目类型:</label>
						</td>
						<td class="form-table-td-right">
							<c:forEach items="${dictitems}" var="item" varStatus="st">
								<input type="radio" id="channelType_${st.index}" name="channelType" value="${item.dictid}"/><label for="channelType_${st.index}">${item.dictname}</label>
							</c:forEach>
						</td>
				    </tr>
				   <tr id="link-tr" style="display:none;">
					    <td class="form-table-td-left">
							<label for="url">链接地址:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="url" data-options="required:false,validType:['length[0,255]']" />
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
var editor = null;
$(function(){
	
	editor = KindEditor.create('textarea[name="content"]', {
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
	
	$("input[name='status'][value='on']").prop("checked", true);
	$("input[name='channelType'][value='list']").prop("checked", true);
	
	$("input[name='channelType']").change(function(){
		var type = $(this).val();
		if(type == 'cover'){
			$("#content_div").show();
		}else{
			$("#content_div").hide();
		}
		if(type == 'link'){
			$("#link-tr").show();
		}else{
			$("#link-tr").hide();
		}
	});
	
});
var contentAddPage  = {
	submitForm : function (){
		if(!$('#contentAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		//获取内容
		editor.sync();
		var status = $("input[name='status']:checked").val();
		var channelType = $("input[name='channelType']:checked").val();
		var url =  $("input[name='url']").val();
		var channelName =  $("input[name='channelName']").val();
		var channelSort =  $("input[name='channelSort']").val(); 
		var content = $("#content").val()
		var param = {
			"pid":"${pid}",
			"istop":"${istop}",
			"content":content,
			"status":status,
			"channelType":channelType,
			"url":url,
			"channelName":channelName,
			"channelSort":channelSort,
			"content":content
		};
		console.log(param);
		//$("#contentAddForm").serialize()
	    $.post("${contextPath}/cms/channel/add",param, function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增成功!');
				window.self.location = "${contextPath}/cms/channel/list";
			}else{
				$.messager.alert('添加错误',data.msg,'error');
			}
		});
		
	},
	clearForm : function(){
		window.self.location="${contextPath}/cms/channel/list";
	}
};
</script>
</body>
</html>