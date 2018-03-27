<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>网站信息修改</title>
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
		  <div class="panel-title" style="float:left;width:200px;height:26px;line-height:26px;margin-left:10px;">网站信息-修改</div>
		  <div style="float:right;width:200px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentUpdatePage.submitForm()" style="width:80px">提交</a>
		  </div>
		</div>
		<div data-options="region:'center',border:false" style="padding:10px">
			<form id="contentEditForm" method="post" action="${contextPath}/cms/website/update" >
				<input type="hidden" name="domainName" value="${website.domainName}" />
				<table class="easyui-panel form-table">
				   <tr>
						<td class="form-table-td-left">
							<label for="address">公司地址:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-textbox" type="text" name="address" data-options="required:false,validType:['length[0,255]']" style="width:500px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="telphone">联系电话:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-textbox" type="text" name="telphone" data-options="required:false,validType:['length[0,255]']" style="width:500px;height:28px;"/>
						</td>
				    </tr>
				    <tr>
						<td class="form-table-td-left">
							<label for="email">Email:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-textbox" type="text" name="email" data-options="required:false,validType:['length[0,255]']" style="width:500px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="mainProduct">主营产品:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-textbox" type="text" name="mainProduct" data-options="required:false,validType:['length[0,2000]']" style="width:500px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="keywords">首页关键字:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-textbox" type="text" name="keywords" data-options="required:false,validType:['length[0,500]']" style="width:500px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="description">网站描述:</label>
						</td>
						<td class="form-table-td-right">
							<input class="easyui-textbox" type="text" name="description" data-options="multiline:true,required:false,validType:['length[0,1000]']" style="width:500px;height:60px;"/>
						</td>
				    </tr>
				</table>
			</form>
		</div>
	</div>
<script type="text/javascript">

var contentUpdatePage  = {
	initFormData:function(){
		var url = "${contextPath}/cms/website/load";
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
		$.post("${contextPath}/cms/website/update",$("#contentEditForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','修改成功!');
			}else{
				$.messager.alert('修改错误',data.msg,'error');
			}
		});
	},
	clearForm : function(){
		window.self.location = "${contextPath}/cms/website/list";
	}
};
$(function(){
	contentUpdatePage.initFormData();
});
</script>
</body>
</html>