<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>操作员信息修改</title>
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
		  <div class="panel-title" style="float:left;width:200px;height:26px;line-height:26px;margin-left:10px;">操作员信息-修改</div>
		  <div style="float:right;width:200px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentUpdatePage.submitForm()" style="width:80px">提交</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" href="javascript:void(0)" onclick="contentUpdatePage.clearForm()" style="width:80px">返回</a>
		  </div>
		</div>
		<div data-options="region:'center',border:false" style="padding:10px">
			<form id="contentEditForm" method="post" action="${contextPath}/platform/user/update" >
				<input type="hidden" name="userid" />
				<table class="easyui-panel form-table">
				   <tr>
						<td class="form-table-td-left">
							<label for="username">登录用户账号:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="username" data-options="required:true,validType:['length[0,32]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="operatorname">操作员名称:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="operatorname" data-options="required:true,validType:['length[0,40]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="password">操作员密码:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="password" name="password" data-options="required:true,validType:['length[0,50]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="domainName">域名:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="domainName" data-options="required:false,validType:['length[0,255]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="status">用户状态:</label>
						</td>
						<td class="form-table-td-right">
							<input type="radio" id="radio_on" name="status" value="on"/>
							<label for="radio_on">显示</label>
							<input type="radio" id="radio_off" name="status" value="off"/>
							<label for="radio_off">隐藏</label>
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
		var url = "${contextPath}/platform/user/load";
		url += "/${userid}";
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
		$.post("${contextPath}/platform/user/update",$("#contentEditForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','修改成功!');
				window.self.location = "${contextPath}/platform/user/${page}";
			}else{
				$.messager.alert('修改错误',data.msg,'error');
			}
		});
	},
	clearForm : function(){
		window.self.location = "${contextPath}/platform/user/${page}";
	}
};
$(function(){
	contentUpdatePage.initFormData();
});
</script>
</body>
</html>