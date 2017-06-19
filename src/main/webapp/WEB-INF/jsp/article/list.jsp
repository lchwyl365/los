<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>文章管理管理</title>
    <script type="text/javascript">
    $(function(){
    	
		var combo55059701325166_json = eval('${combo55059701325166_json}');
    	
		$('#articleTable').datagrid({
			title:'文章管理', //标题
			border:false,
			method:'post',
			iconCls:'icon-table', //图标
			singleSelect:false, //多选
			fit:true, //高度
			fitColumns: true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
			striped: true, //奇偶行颜色不同
			collapsible:false,//可折叠
			url:"${contextPath}/cms/article/queryList", //数据来源
			sortName: 'createtime', //排序的列
			sortOrder: 'desc', //倒序
			remoteSort: true, //服务器端排序
			idField:'articleId', //主键字段
			queryParams:{}, //查询条件
			pagination:true, //显示分页
			rownumbers:true, //显示行号
			columns:[[
				{field:'ck',checkbox:true,width:2}, //显示复选框
				{field:'title',title:'文章标题',width:140,sortable:'F',
						formatter:function(value,row,index){return row.title;}
				},
				{field:'channel_id',title:'栏目编号',width:100,sortable:'F',
						formatter:function(value,row,index){
							var text = '';
							for(var i=0;i<combo55059701325166_json.length;i++){  
					    		if(row.channelId == combo55059701325166_json[i].id){
					    			text = combo55059701325166_json[i].text;
					    		}
					    	}
							return text;
						}
				},
				{field:'createtime',title:'发布时间',width:100,sortable:'T',
						formatter:function(value,row,index){if (row.createtime != null) {var date = new Date(row.createtime);return date.format('yyyy-MM-dd hh:mm:ss');}return '';}
				},
				{field:'read_count',title:'已读数量',width:100,sortable:'F',
						formatter:function(value,row,index){return row.readCount;}
				},
				{field:'status',title:'状态',width:100,sortable:'F',
						formatter:function(value,row,index){if (row.status == 'F'){return '<span style="color:red;">隐藏</span>';} else {return '显示';}}
				}
			]],
			toolbar:'#tb',
			onLoadSuccess:function(){
				$('#articleTable').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题
			}
		});
		
		$("#add-btn").bind('click',CmsArticle.addRow);
		$("#del-btn").bind('click',CmsArticle.deleteRow);
		$("#edit-btn").bind('click',CmsArticle.updateRow);
		$("#search-btn").bind('click',CmsArticle.search);
		$("#clear-btn").bind('click',CmsArticle.clear);

	});
    var CmsArticle = {
    		addRow:function(){//新增
  				window.self.location = "${contextPath}/cms/article/add";
    		},
    		updateRow:function(){//更新
    			var rows = $('#articleTable').datagrid('getSelections');
    			if(rows.length==0){
    				$.messager.alert('提示',"请选择你要更新的记录",'info');
    				return;
    			}
    			if(rows.length > 1){
    				$.messager.alert('提示',"只能选择一条记录进行更新",'info');
    				return;
    			}
    			var ps = "";
			  	ps += "/" + rows[0].articleId;
  				window.self.location = '${contextPath}/cms/article/update'+ps;
    		},
    		deleteRow:function(){//删除
    			var rows = $('#articleTable').datagrid('getSelections');
	        	if(rows.length==0){
    				$.messager.alert('提示',"请选择你要更新的记录",'info');
    				return;
    			}
    	  		$.messager.confirm('提示','确定要删除吗?',function(result){
    		        if (result){
    		        	var ps = "?1=1";
    		        	$.each(rows,function(i,n){
					       	ps += "&articleIds="+n.articleId;
    		        	});
    		        	$.post('${contextPath}/cms/article/delete'+ps,function(data){
							$("#articleTable").datagrid("reload");
    		        		$.messager.alert('提示',data.msg,'info');
    		        	});
    		        }
    		    });
    	  	},
    	  	search:function(){//表格查询
    			var params = $('#articleTable').datagrid('options').queryParams; //先取得 datagrid 的查询参数
    			var fields =$('#cmsArticleForm').serializeArray(); //自动序列化表单元素为JSON对象
    			$.each( fields, function(i, field){
    				params[field.name] = field.value; //设置查询参数
    			});
    			$('#articleTable').datagrid('reload'); //设置好查询参数 reload 一下就可以了
    		},
    		//清空查询条件
    		clear:function(){
    			$('#cmsArticleForm').form('clear');
    			CmsArticle.search();
    		}
	};
    </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
    <div data-options="region:'center',border:false">
    	<table id="articleTable"></table>
    	<div id="tb" style="padding:10px;height:auto">
			<form id="cmsArticleForm" style="margin-bottom: 0px;">
				<label for="title" style="margin-left:10px;">文章标题: </label>
				<input class="easyui-textbox" name="title" style="width:120px;">
				<a id="search-btn" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" style="width:80px;">查询</a>
				<a id="clear-btn" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-clear" style="width:80px;">清空</a>
				<span class="datagrid-btn-separator" style="float:none;margin-left:5px;margin-right:5px;"></span>
				<a id="add-btn" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
				<a id="edit-btn" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
				<a id="del-btn" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			</form>
		</div>
    </div>
</body>
</html>