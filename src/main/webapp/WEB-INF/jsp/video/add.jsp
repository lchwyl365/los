<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>视频管理添加</title>
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
		  <div class="panel-title" style="float:left;width:200px;height:26px;line-height:26px;margin-left:10px;">视频管理-添加</div>
		  <div style="float:right;width:200px;">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="contentAddPage.submitForm()" style="width:80px">提交</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-back'" href="javascript:void(0)" onclick="contentAddPage.clearForm()" style="width:80px">返回</a>
		  </div>
		</div>
		<div data-options="region:'center',border:false" style="padding:10px">
			<form id="contentAddForm" method="post" action="${contextPath}/cms/video/add"  enctype="multipart/form-data" >
				<table class="easyui-panel form-table">
				   <tr>
						<td class="form-table-td-left">
							<label for="videoImage">视频图片:</label>
						</td>
						<td class="form-table-td-right">
								<input type="file" name="videoImage" />
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
							<label for="channelid">栏目编号:</label>
						</td>
						<td class="form-table-td-right">
								<input class="easyui-combotree" name="channelid"
								   data-options="url:'${contextPath}/platform/box/combotree?id=56683781353113',method:'get'" style="width:200px;height:28px;">
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
							<input type="radio" id="radio_on" name="istop" checked="checked" value="on"/>
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
var contentAddPage  = {
	submitForm : function (){
		if(!$('#contentAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$('#contentAddForm').submit();
		
	},
	clearForm : function(){
		window.self.location = "${contextPath}/cms/video/list";
	}
};
</script>
</body>
</html>