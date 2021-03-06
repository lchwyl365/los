<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>字典管理添加</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center,border:false'">
			<form id="contentAddForm" method="post">
				<table class="easyui-panel form-table">
				   <tr>
					    <td class="form-table-td-left">
							<label for="dicttypename">字典名称:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="dicttypename" data-options="required:true,validType:['length[0,255]']" />
						</td>
						<td class="form-table-td-left">
							<label for="rank">字典等级:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="rank" data-options="required:false,validType:['length[0,1]']" />
						</td>
				    </tr>
				   <tr>
					    <td class="form-table-td-left">
							<label for="parentid">上级编号:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="parentid" data-options="required:false,validType:['length[0,255]']" />
						</td>
						<td class="form-table-td-left">
						</td>
						<td class="form-table-td-right">
						</td>
				    </tr>
				</table>
			</form>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:10px 10px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentAddPage.submitForm()" style="width:80px">提交</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="contentAddPage.clearForm()" style="width:80px">关闭</a>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	$('#contentAddForm').form('clear');
});
var contentAddPage  = {
	submitForm : function (){
		if(!$('#contentAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		
		$.post("${contextPath}/platform/dict/add",$("#contentAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增成功!');
				$("#dictTypeGrid").tree("reload");
				TT.closeCurrentWindow();
			}else{
				$.messager.alert('添加错误',data.msg,'error');
			}
		});
	},
	clearForm : function(){
		TT.closeCurrentWindow();
	}
};
</script>
</body>
</html>