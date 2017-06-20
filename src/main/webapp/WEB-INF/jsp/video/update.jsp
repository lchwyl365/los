<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>视频管理修改</title>
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
		  <div class="panel-title" style="float:left;width:200px;height:26px;line-height:26px;margin-left:10px;">视频管理-修改</div>
		  <div style="float:right;width:200px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentUpdatePage.submitForm()" style="width:80px">提交</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" href="javascript:void(0)" onclick="contentUpdatePage.clearForm()" style="width:80px">返回</a>
		  </div>
		</div>
		<div data-options="region:'center',border:false" style="padding:10px">
			<form id="contentEditForm" method="post">
				<input type="hidden" name="videoId" />
				<table class="easyui-panel form-table">
				   <tr>
						<td class="form-table-td-left">
							<label for="videoImage">视频图片:</label>
						</td>
						<td class="form-table-td-right">
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="videoTitle">视频标题:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="videoTitle" data-options="required:true,validType:['length[0,255]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="videoDesc">视频描述:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="videoDesc" data-options="required:true,validType:['length[0,255]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="istop">顶部显示:</label>
						</td>
						<td class="form-table-td-right">
							<input type="radio" id="radio_on" name="istop" value="on"/>
							<label for="radio_on">显示</label>
							<input type="radio" id="radio_off" name="istop" value="off"/>
							<label for="radio_off">隐藏</label>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="ordernum">序号:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="ordernum" data-options="required:true,validType:['length[0,64]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="clicks">点击次数:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="clicks" data-options="required:true,validType:['length[0,64]']" style="width:320px;height:28px;"/>
						</td>
				    </tr>
				   <tr>
						<td class="form-table-td-left">
							<label for="youkuid">优酷编号:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-validatebox" type="text" name="youkuid" data-options="required:true,validType:['length[0,100]']" style="width:320px;height:28px;"/>
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
		var url = "${contextPath}/cms/video/load";
		url += "/${videoId}";
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
		$.post("${contextPath}/cms/video/update",$("#contentEditForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','修改成功!');
				window.self.location = "${contextPath}/cms/video/list";
			}else{
				$.messager.alert('修改错误',data.msg,'error');
			}
		});
	},
	clearForm : function(){
		window.self.location = "${contextPath}/cms/video/list";
	}
};
$(function(){
	contentUpdatePage.initFormData();
});
</script>
</body>
</html>