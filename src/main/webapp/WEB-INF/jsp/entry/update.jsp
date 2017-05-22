<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>字典项管理管理</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center,border:false'">
			<form id="contentUpdateForm" method="post">
				<input type="hidden" name="dicttypeid" />
				<input type="hidden" name="dictid" />
				<table class="easyui-panel form-table">
				   <tr>
						<td class="form-table-td-left">
							<label for="dictname">字典项名称:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="dictname" data-options="required:true,validType:['length[0,255]']" />
						</td>
					    <td class="form-table-td-left">
							<label for="status">状态:</label>
						</td>
						<td class="form-table-td-right">
							<input class="easyui-switchbutton" id="status" name="status" data-options="onText:'开启',offText:'冻结',checked:true">
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="sortno">序号:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="sortno" data-options="required:true,validType:['length[0,4]']" />
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
							<label></label>
						</td>
						<td class="form-table-td-right">
						</td>
			     	</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'south',border:false" style="text-align:right;padding:10px 10px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentUpdatePage.submitForm()" style="width:80px">提交</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="contentUpdatePage.clearForm()" style="width:80px">关闭</a>
		</div>
	</div>
<script type="text/javascript">
var contentUpdatePage  = {
	initFormData:function(){
		var url = "${contextPath}/platform/entry/load";
		url += "/${dicttypeid}";
		url += "/${dictid}";
		$.get(url,function(data){
			if(data.status == 200){
				$("#contentUpdateForm").form("load",data.data);
				if(data.data.status == 'on'){  
					$("#status").switchbutton({checked: true});
				}else{  
					$("#status").switchbutton({checked: false});    
				}
			}
		});
	},
	submitForm : function (){
		if(!$('#contentUpdateForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$.post("${contextPath}/platform/entry/update",$("#contentUpdateForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','修改成功!');
				$("#entryTable").datagrid("reload");
				TT.closeCurrentWindow();
			}else{
				$.messager.alert('修改错误',data.msg,'error');
			}
		});
	},
	clearForm : function(){
		TT.closeCurrentWindow();
	}
};
$(function(){
	contentUpdatePage.initFormData();
});
</script>
</body>
</html>