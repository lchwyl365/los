<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>栏目管理管理</title>
    <script type="text/javascript">
    $(function(){
    	
		var combo55072199221118_json = eval('${combo55072199221118_json}');
		var combo55059701325166_json = eval('${combo55059701325166_json}');
    	
		$('#channelTable').treegrid({
			title:'栏目管理',
			iconCls:'icon-table',
			border:false,
			rownumbers: true,
			fit:true, //高度
			fitColumns:true,
			url:'${contextPath}/cms/channel/queryList/0',
			method: 'get',
			idField:'channelId',
			treeField:'channelName',
			toolbar:'#tb',
			columns:[[
				{field:'channelName',title:'栏目名称',width:100},
				{field:'channelSort',title:'排列顺序',width:100},
				{field:'channelType',title:'栏目类型',width:100},
				{field:'istop',title:'首页导航栏目',width:100},
				{field:'thumbnail',title:'图片',width:100,
					formatter:function(value,row,index){
						var e = "";
						if(row.thumbnail && row.thumbnail.length > 0){
							e = '<p><img src="${contextPath}'+row.thumbnail+'" height="45px" width="45px"/></p>';
						}
						return e;
					}
				},
				{field:'action',title:'操作',width:100,align:'center',
					formatter:function(value,row,index){
						var e = '';
						if(row.pid == '0'){
							var e = '<a href="javascript:void(0)" onclick="CmsChannel.addSubRow('+row.channelId+')">添加子栏目</a> ';
						}
						return e;
					}
				}
			]]
		});
		
		$("#add-btn").bind('click',CmsChannel.addRow);
		$("#del-btn").bind('click',CmsChannel.deleteRow);
		$("#edit-btn").bind('click',CmsChannel.updateRow);
		$("#search-btn").bind('click',CmsChannel.search);
		$("#clear-btn").bind('click',CmsChannel.clear);

	});
    var CmsChannel = {
    		addRow:function(){//新增
  				window.self.location = "${contextPath}/cms/channel/add";
    		},
    		addSubRow:function(pid){
    			window.self.location = "${contextPath}/cms/channel/add?pid="+pid;
    		},
    		updateRow:function(){//更新
    			var rows = $('#channelTable').datagrid('getSelections');
    			if(rows.length==0){
    				$.messager.alert('提示',"请选择你要更新的记录",'info');
    				return;
    			}
    			if(rows.length > 1){
    				$.messager.alert('提示',"只能选择一条记录进行更新",'info');
    				return;
    			}
    			var ps = "";
			  	ps += "/" + rows[0].channelId;
  				window.self.location = '${contextPath}/cms/channel/update'+ps;
    		},
    		deleteRow:function(){//删除
    			var rows = $('#channelTable').datagrid('getSelections');
	        	if(rows.length==0){
    				$.messager.alert('提示',"请选择你要更新的记录",'info');
    				return;
    			}
    	  		$.messager.confirm('提示','确定要删除吗?',function(result){
    		        if (result){
    		        	var ps = "?1=1";
    		        	$.each(rows,function(i,n){
					       	ps += "&channelIds="+n.channelId;
    		        	});
    		        	$.post('${contextPath}/cms/channel/delete'+ps,function(data){
							$("#channelTable").treegrid("reload");
    		        		$.messager.alert('提示',data.msg,'info');
    		        	});
    		        }
    		    });
    	  	},
    	  	search:function(){//表格查询
    			var params = $('#channelTable').datagrid('options').queryParams; //先取得 datagrid 的查询参数
    			var fields =$('#cmsChannelForm').serializeArray(); //自动序列化表单元素为JSON对象
    			$.each( fields, function(i, field){
    				params[field.name] = field.value; //设置查询参数
    			});
    			$('#channelTable').datagrid('reload'); //设置好查询参数 reload 一下就可以了
    		},
    		//清空查询条件
    		clear:function(){
    			$('#cmsChannelForm').form('clear');
    			CmsChannel.search();
    		}
	};
    </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
    <div data-options="region:'center',border:false">
    	<table id="channelTable"></table>
    	<div id="tb" style="padding:10px;height:auto">
			<form id="cmsChannelForm" style="margin-bottom: 0px;">
				<a id="add-btn" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
				<a id="edit-btn" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
				<a id="del-btn" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			</form>
		</div>
    </div>
</body>
</html>