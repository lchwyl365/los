<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>轮播图管理修改</title>
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
		  <div class="panel-title" style="float:left;width:200px;height:26px;line-height:26px;margin-left:10px;">轮播图管理-修改</div>
		  <div style="float:right;width:200px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentUpdatePage.submitForm()" style="width:80px">提交</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" href="javascript:void(0)" onclick="contentUpdatePage.clearForm()" style="width:80px">返回</a>
		  </div>
		</div>
		<div data-options="region:'center',border:false" style="padding:10px">
			<form id="contentEditForm" method="post" action="${contextPath}/cms/banner/update"  enctype="multipart/form-data" >
				<input type="hidden" name="bannerId" />
				<table class="easyui-panel form-table">
				   <tr>
						<td class="form-table-td-left">
							<label for="img">图片地址:</label>
						</td>
						<td class="form-table-td-right">
								<input type="file" name="img" />
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="bannerTitle">标题:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="bannerTitle" data-options="required:true,validType:['length[0,255]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="type">类型:</label>
						</td>
						<td class="form-table-td-right">
							<input type="radio" id="radio_home" name="type" value="home"/>
							<label for="radio_home">首页导航</label>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="orderNum">序号:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="orderNum" data-options="required:true,validType:['length[0,64]']" style="width:320px;height:28px;"/>
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
		var url = "${contextPath}/cms/banner/load";
		url += "/${bannerId}";
		$.get(url,function(data){
			if(data.status == 200){
				$("#contentEditForm").form("load",data.data);
				//$("input[name='bannerId']").val(data.data.bannerId);
				//$("input[name='bannerTitle']").val(data.data.bannerTitle);
			}
		});
	},
	submitForm : function (){
		if(!$('#contentEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$('#contentEditForm').submit();
	},
	clearForm : function(){
		window.self.location = "${contextPath}/cms/banner/list";
	}
};
$(function(){
	contentUpdatePage.initFormData();
});
</script>
</body>
</html>