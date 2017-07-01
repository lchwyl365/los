<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>视频管理管理</title>
    <script type="text/javascript">
    $(function(){
    	
		var combo56683781353113_json = eval('${combo56683781353113_json}');
    	
		$('#videoTable').datagrid({
			title:'视频管理', //标题
			border:false,
			method:'post',
			iconCls:'icon-table', //图标
			singleSelect:false, //多选
			fit:true, //高度
			fitColumns: true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
			striped: true, //奇偶行颜色不同
			collapsible:false,//可折叠
			url:"${contextPath}/cms/video/queryList", //数据来源
			sortName: 'video_id', //排序的列
			sortOrder: 'desc', //倒序
			remoteSort: true, //服务器端排序
			idField:'videoId', //主键字段
			queryParams:{}, //查询条件
			pagination:true, //显示分页
			rownumbers:true, //显示行号
			columns:[[
				{field:'ck',checkbox:true,width:2}, //显示复选框
				{field:'video_image',title:'视频图片',width:100,sortable:'F',
						formatter:function(value,row,index){ var e = '<p><img src="${contextPath}'+row.videoImage+'" height="80" /></p>';return e;}
				},
				{field:'video_title',title:'视频标题',width:100,sortable:'F',
						formatter:function(value,row,index){return row.videoTitle;}
				},
				{field:'channelId',title:'栏目编号',width:100,sortable:'F',
						formatter:function(value,row,index){
							var text = '';
							for(var i=0;i<combo56683781353113_json.length;i++){  
					    		if(row.channelid == combo56683781353113_json[i].id){
					    			text = combo56683781353113_json[i].text;
					    		}
					    	}
							return text;
						}
				},
				{field:'createtime',title:'发布时间',width:100,sortable:'F',
						formatter:function(value,row,index){if (row.createtime != null) {var date = new Date(row.createtime);return date.format('yyyy-MM-dd hh:mm:ss');}return '';}
				},
				{field:'istop',title:'顶部显示',width:100,sortable:'F',
						formatter:function(value,row,index){if (row.istop == 'on'){return '显示';} else {return '<span style="color:red;">冻结</span>';}}
				},
				{field:'ordernum',title:'序号',width:100,sortable:'F',
						formatter:function(value,row,index){return row.ordernum;}
				},
				{field:'clicks',title:'点击次数',width:100,sortable:'F',
						formatter:function(value,row,index){return row.clicks;}
				},
				{field:'youkuid',title:'优酷编号',width:100,sortable:'F',
						formatter:function(value,row,index){return row.youkuid;}
				}
			]],
			toolbar:'#tb',
			onLoadSuccess:function(){
				$('#videoTable').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
			}
		});
		
		$("#add-btn").bind('click',CmsVideo.addRow);
		$("#del-btn").bind('click',CmsVideo.deleteRow);
		$("#edit-btn").bind('click',CmsVideo.updateRow);
		$("#search-btn").bind('click',CmsVideo.search);
		$("#clear-btn").bind('click',CmsVideo.clear);

	});
    var CmsVideo = {
    		addRow:function(){//新增
  				window.self.location = "${contextPath}/cms/video/add";
    		},
    		updateRow:function(){//更新
    			var rows = $('#videoTable').datagrid('getSelections');
    			if(rows.length==0){
    				$.messager.alert('提示',"请选择你要更新的记录",'info');
    				return;
    			}
    			if(rows.length > 1){
    				$.messager.alert('提示',"只能选择一条记录进行更新",'info');
    				return;
    			}
    			var ps = "";
			  	ps += "/" + rows[0].videoId;
  				window.self.location = '${contextPath}/cms/video/update'+ps;
    		},
    		deleteRow:function(){//删除
    			var rows = $('#videoTable').datagrid('getSelections');
	        	if(rows.length==0){
    				$.messager.alert('提示',"请选择你要更新的记录",'info');
    				return;
    			}
    	  		$.messager.confirm('提示','确定要删除吗?',function(result){
    		        if (result){
    		        	var ps = "?1=1";
    		        	$.each(rows,function(i,n){
					       	ps += "&videoIds="+n.videoId;
    		        	});
    		        	$.post('${contextPath}/cms/video/delete'+ps,function(data){
							$("#videoTable").datagrid("reload");
    		        		$.messager.alert('提示',data.msg,'info');
    		        	});
    		        }
    		    });
    	  	},
    	  	search:function(){//表格查询
    			var params = $('#videoTable').datagrid('options').queryParams; //先取得 datagrid 的查询参数
    			var fields =$('#crmVideoForm').serializeArray(); //自动序列化表单元素为JSON对象
    			$.each( fields, function(i, field){
    				params[field.name] = field.value; //设置查询参数
    			});
    			$('#videoTable').datagrid('reload'); //设置好查询参数 reload 一下就可以了
    		},
    		//清空查询条件
    		clear:function(){
    			$('#crmVideoForm').form('clear');
    			CmsVideo.search();
    		}
	};
    </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
    <div data-options="region:'center',border:false">
    	<table id="videoTable"></table>
    	<div id="tb" style="padding:10px;height:auto">
			<form id="crmVideoForm" style="margin-bottom: 0px;">
				<a id="add-btn" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
				<a id="edit-btn" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
				<a id="del-btn" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			</form>
		</div>
    </div>
</body>
</html>