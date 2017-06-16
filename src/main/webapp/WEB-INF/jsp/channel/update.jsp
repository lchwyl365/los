<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>cms_channel修改</title>
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
		  <div class="panel-title" style="float:left;width:200px;height:26px;line-height:26px;margin-left:10px;">cms_channel-修改</div>
		  <div style="float:right;width:200px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentUpdatePage.submitForm()" style="width:80px">提交</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" href="javascript:void(0)" onclick="contentUpdatePage.clearForm()" style="width:80px">返回</a>
		  </div>
		</div>
		<div data-options="region:'center',border:false" style="padding:10px">
			<form id="contentEditForm" method="post">
				<input type="hidden" name="channelId" />
				<table class="easyui-panel form-table">
				   <tr>
						<td class="form-table-td-left">
							<label for="content">栏目内容:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="content" data-options="required:true,validType:['length[0,16777215]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
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
							<label for="istop">顶级栏目:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-switchbutton" name="istop" data-options="onText:'开启',offText:'冻结',checked:true">
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="channelType">栏目类型:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-combotree" name="channelType"
								   data-options="url:'${contextPath}/platform/box/combotree?id=55072199221118',method:'get'" style="width:200px;height:28px;">
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="pid">上级栏目编号:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-combotree" name="pid"
								   data-options="url:'${contextPath}/platform/box/combotree?id=55059701325166',method:'get'" style="width:200px;height:28px;">
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="createtime">发布时间:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="createtime" data-options="required:true,validType:['length[0,64]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="url">链接地址:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="url" data-options="required:false,validType:['length[0,255]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="status">状态:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-switchbutton" name="status" data-options="onText:'开启',offText:'冻结',checked:true">
						</td>
				    </tr>
				</table>
			</form>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	
});
var contentUpdatePage  = {
	initFormData:function(){
		var url = "${contextPath}/cms/channel/load";
		url += "/${channelId}";
		$.get(url,function(data){
			if(data.status == 200){
				$("#contentEditForm").form("load",data.data);
			}
		});
	},
	submitForm : function (){
		if(!$('#contentEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$.post("${contextPath}/cms/channel/update",$("#contentEditForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','修改成功!');
				window.self.location = "${contextPath}/cms/channel/list";
			}else{
				$.messager.alert('修改错误',data.msg,'error');
			}
		});
	},
	clearForm : function(){
		window.self.location = "${contextPath}/cms/channel/list";
	}
};
$(function(){
	contentUpdatePage.initFormData();
});
</script>
</body>
</html>