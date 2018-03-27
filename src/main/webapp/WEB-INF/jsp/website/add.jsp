<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>cms_website添加</title>
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
		  <div class="panel-title" style="float:left;width:200px;height:26px;line-height:26px;margin-left:10px;">cms_website-添加</div>
		  <div style="float:right;width:200px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentAddPage.submitForm()" style="width:80px">提交</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" href="javascript:void(0)" onclick="contentAddPage.clearForm()" style="width:80px">返回</a>
		  </div>
		</div>
		<div data-options="region:'center',border:false" style="padding:10px">
			<form id="contentAddForm" method="post" action="${contextPath}/cms/website/add" >
				<table class="easyui-panel form-table">
				   <tr>
						<td class="form-table-td-left">
							<label for="id">编号:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="id" data-options="required:true,validType:['length[0,255]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="domainName">域名:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="domainName" data-options="required:true,validType:['length[0,255]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="address">公司地址:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="address" data-options="required:true,validType:['length[0,255]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="telphone">联系电话:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="telphone" data-options="required:true,validType:['length[0,255]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="mainProduct">主营产品:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="mainProduct" data-options="required:true,validType:['length[0,2000]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="keywords">首页关键字:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="keywords" data-options="required:true,validType:['length[0,500]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="description">网站描述:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="description" data-options="required:true,validType:['length[0,1000]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				</table>
			</form>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	
});
var contentAddPage  = {
	submitForm : function (){
		if(!$('#contentAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$.post("${contextPath}/cms/website/add",$("#contentAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增成功!');
				window.self.location = "${contextPath}/cms/website/list";
			}else{
				$.messager.alert('添加错误',data.msg,'error');
			}
		});
		
	},
	clearForm : function(){
		window.self.location = "${contextPath}/cms/website/list";
	}
};
</script>
</body>
</html>