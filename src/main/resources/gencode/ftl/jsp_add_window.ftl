<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${model.menuName}添加</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true">
		<div data-options="region:'center,border:false'">
			<form id="contentAddForm" method="post">
				<table class="easyui-panel form-table">
			<#list model.addPropertys as property>
				<#if property_index % 2 == 0>
				   <tr>
						<td class="form-table-td-left">
							<label for="${property.propertyName}">${property.propertyTitle}:</label>
						</td>
						<td class="form-table-td-right">
							<#if property.component == 'easyui-validatebox'>
								<input class="easyui-validatebox" type="text" name="${property.propertyName}" data-options="${property.dataOptions}" />
							<#elseif property.component == 'easyui-numberbox'>
								<input class="easyui-numberbox" type="text" name="${property.propertyName}" data-options="${property.dataOptions}" style="width:320px;height:28px;"/>
							<#elseif property.component == 'password'>
								<input class="easyui-validatebox" type="password" name="${property.propertyName}" data-options="${property.dataOptions}" style="width:320px;height:28px;"/>
							<#elseif property.component == 'radio'>
								<#list property.options as optionMap>
									<#list optionMap?keys as key>
										<#if optionMap_index == 0>
							<input type="radio" id="radio_${key_index}" name="${property.propertyName}" checked="checked" value="${key}"/>
							<label for="radio_${key_index}">${optionMap[key]}</label>		
										</#if>
										<#if optionMap_index != 0>
							<input type="radio" id="radio_${key_index}" name="${property.propertyName}" value="${key}"/>
							<label for="radio_${key_index}">${optionMap[key]}</label>			
										</#if>
									</#list>
								</#list>
							<#elseif property.component == 'easyui-switchbutton'>
								<input class="easyui-switchbutton" name="${property.propertyName}" data-options="${property.dataOptions}">
							<#elseif property.component == 'easyui-combotree'>
								<input class="easyui-combotree" name="${property.propertyName}"
								   data-options="url:'${r"${contextPath}"}/platform/box/combotree?id=${property.comboid}',method:'get'" style="width:100%">
							</#if>
						</td>
				<#else>
					    <td class="form-table-td-left">
							<label for="${property.propertyName}">${property.propertyTitle}:</label>
						</td>
						<td class="form-table-td-right">
							<#if property.component == 'easyui-validatebox'>
								<input class="easyui-validatebox" type="text" name="${property.propertyName}" data-options="${property.dataOptions}" />
							<#elseif property.component == 'easyui-numberbox'>
								<input class="easyui-numberbox" type="text" name="${property.propertyName}" data-options="${property.dataOptions}" style="width:320px;height:28px;"/>
							<#elseif property.component == 'password'>
								<input class="easyui-validatebox" type="password" name="${property.propertyName}" data-options="${property.dataOptions}" style="width:320px;height:28px;"/>
							<#elseif property.component == 'radio'>
								<#list property.options as optionMap>
									<#list optionMap?keys as key>
										<#if optionMap_index == 0>
							<input type="radio" id="radio_${key}" name="${property.propertyName}" checked="checked" value="${key}"/>
							<label for="radio_${key}">${optionMap[key]}</label>		
										</#if>
										<#if optionMap_index != 0>
							<input type="radio" id="radio_${key}" name="${property.propertyName}" value="${key}"/>
							<label for="radio_${key}">${optionMap[key]}</label>			
										</#if>
									</#list>
								</#list>
							<#elseif property.component == 'easyui-switchbutton'>
								<input class="easyui-switchbutton" name="${property.propertyName}" data-options="${property.dataOptions}">
							<#elseif property.component == 'easyui-combotree'>
								<input class="easyui-combotree" name="${property.propertyName}"
								   data-options="url:'${r"${contextPath}"}/platform/box/combotree?id=${property.comboid}',method:'get'" style="width:100%">
							</#if>
						</td>
				    </tr>
				</#if>
			</#list>
			     <#if model.addPropertys?size % 2 != 0>
			     		<td class="form-table-td-left">
							<label></label>
						</td>
						<td class="form-table-td-right">
						</td>
			     	</tr>
			     </#if>
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
		
		$.post("${r"${contextPath}"}/${model.businessName}/${model.path}/add",$("#contentAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增成功!');
				<#if model.gentype == "DataGrid">
				$("#${model.path}Table").datagrid("reload");
				<#elseif model.gentype == "TreeGrid">
				$("#${model.path}Table").treegrid("reload");
				</#if>
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