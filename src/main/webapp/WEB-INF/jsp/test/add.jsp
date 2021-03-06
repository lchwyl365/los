<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>测试表添加</title>
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
		  <div class="panel-title" style="float:left;width:200px;height:26px;line-height:26px;margin-left:10px;">测试表-添加</div>
		  <div style="float:right;width:200px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentAddPage.submitForm()" style="width:80px">提交</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" href="javascript:void(0)" onclick="contentAddPage.clearForm()" style="width:80px">返回</a>
		  </div>
		</div>
		<div data-options="region:'center',border:false" style="padding:10px">
			<form id="contentAddForm" method="post" action="${contextPath}/platform/test/add" >
				<table class="easyui-panel form-table">
				   <tr>
						<td class="form-table-td-left">
							<label for="testid">测试编号:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="testid" data-options="required:true,validType:['length[0,32]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="testname">测试名称:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="testname" data-options="required:true,validType:['length[0,64]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="groupId">组编号:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="groupId" data-options="required:true,validType:['length[0,32]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="testgroup">组名称:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="testgroup" data-options="required:true,validType:['length[0,10]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="deptId">DEPT_ID:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="deptId" data-options="required:true,validType:['length[0,32]']" style="width:320px;height:28px;"/>
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
		$.post("${contextPath}/platform/test/add",$("#contentAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增成功!');
				window.self.location = "${contextPath}/platform/test/list";
			}else{
				$.messager.alert('添加错误',data.msg,'error');
			}
		});
		
	},
	clearForm : function(){
		window.self.location = "${contextPath}/platform/test/list";
	}
};
</script>
</body>
</html>