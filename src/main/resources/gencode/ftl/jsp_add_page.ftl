<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${model.menuName}添加</title>
	<#if model.haveKindeditor == "1">
	<script type="text/javascript" charset="utf-8" src="${r"${contextPath}"}/resources/js/kindeditor-4.1.10/kindeditor-min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${r"${contextPath}"}/resources/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
	</#if>
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
		  <div class="panel-title" style="float:left;width:200px;height:26px;line-height:26px;margin-left:10px;">${model.menuName}-添加</div>
		  <div style="float:right;width:200px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentAddPage.submitForm()" style="width:80px">提交</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" href="javascript:void(0)" onclick="contentAddPage.clearForm()" style="width:80px">返回</a>
		  </div>
		</div>
		<div data-options="region:'center',border:false" style="padding:10px">
			<form id="contentAddForm" method="post" action="${r"${contextPath}"}/${model.businessName}/${model.path}/add" <#if model.enctype == 'multipart/form-data' > enctype="${model.enctype}" </#if>>
				<table class="easyui-panel form-table">
			<#list model.addPropertys as property>
				<#if property.component != 'kindeditor'>
				   <tr>
						<td class="form-table-td-left">
							<label for="${property.propertyName}">${property.propertyTitle}:</label>
						</td>
						<td class="form-table-td-right">
							<#if property.component == 'easyui-validatebox'>
								<input class="easyui-validatebox" type="text" name="${property.propertyName}" data-options="${property.dataOptions}" style="width:320px;height:28px;"/>
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
							<#elseif property.component == 'easyui-combotree'>
								<input class="easyui-combotree" name="${property.propertyName}"
								   data-options="url:'${r"${contextPath}"}/platform/box/combotree?id=${property.comboid}',method:'get'" style="width:200px;height:28px;">
							<#elseif property.component == 'file'>
								<input type="file" name="${property.propertyName}" />
							</#if>
						</td>
				    </tr>
				</#if>
			</#list>
				</table>
			<#list model.addPropertys as property>
				<#if property.component == 'kindeditor'>	
				<div>
					<p>${property.propertyTitle}:</p>
					<textarea name="${property.propertyName}" class="common-textarea" id="${property.propertyName}" style="width:91%; height:500px;visibility:hidden;"></textarea>
				</div>
				</#if>
			</#list>	
			</form>
		</div>
	</div>
<script type="text/javascript">
<#list model.addPropertys as property>
	<#if property.component == 'kindeditor'>	
var ${property.propertyName}Editor = null;
	</#if>
</#list>
$(function(){
	
<#list model.addPropertys as property>
	<#if property.component == 'kindeditor'>	
    ${property.propertyName}Editor = KindEditor.create('textarea[name="content"]', {
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
	</#if>
</#list>
});
var contentAddPage  = {
	submitForm : function (){
		if(!$('#contentAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		<#list model.addPropertys as property>
			<#if property.component == 'kindeditor'>	
		${property.propertyName}Editor.sync();
			</#if>
		</#list>
	<#if model.enctype == 'multipart/form-data' >
		$('#contentAddForm').submit();
	<#else>
		$.post("${r"${contextPath}"}/${model.businessName}/${model.path}/add",$("#contentAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增成功!');
				window.self.location = "${r"${contextPath}"}/${model.businessName}/${model.path}/list";
			}else{
				$.messager.alert('添加错误',data.msg,'error');
			}
		});
	</#if>
		
	},
	clearForm : function(){
		window.self.location = "${r"${contextPath}"}/${model.businessName}/${model.path}/list";
	}
};
</script>
</body>
</html>