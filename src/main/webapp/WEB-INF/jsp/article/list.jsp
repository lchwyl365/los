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
		var combo92145544385112_json = eval('${combo92145544385112_json}');
    	
		$('#articleTable').datagrid({
			title:'栏目内容管理', //标题
			border:false,
			method:'post',
			iconCls:'icon-table', //图标
			singleSelect:false, //多选
			fit:true, //高度
			fitColumns: true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
			striped: true, //奇偶行颜色不同
			collapsible:false,//可折叠
			url:"${contextPath}/cms/article/queryList?channelId=${channelId}", //数据来源
			sortName: 'createtime', //排序的列
			sortOrder: 'desc', //倒序
			remoteSort: true, //服务器端排序
			idField:'articleId', //主键字段
			queryParams:{}, //查询条件
			pagination:true, //显示分页
			rownumbers:true, //显示行号
			columns:[[
				{field:'ck',checkbox:true,width:10}, //显示复选框
				{field:'thumbnail',title:'缩略图',width:30,sortable:'F',
					formatter:function(value,row,index){
						if(row.thumbnail){
							var e = '<p><img src="'+row.thumbnail+'" height="80" /></p>';return e;
						}else{
							return "";
						}
					}
				},
				{field:'title',title:'标题',width:30,sortable:'F',
						formatter:function(value,row,index){return row.title;}
				},
				{field:'emptype',title:'员工类型',width:20,sortable:'F',
					formatter:function(value,row,index){
						//combo92145544385112_json
						var text = '';
						for(var i=0;i<combo92145544385112_json.length;i++){  
				    		if(row.emptype == combo92145544385112_json[i].id){
				    			text = combo92145544385112_json[i].text;
				    		}
				    	}
						return text;
					}
				},
				{field:'channel_id',title:'栏目',width:30,sortable:'F',
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
				{field:'createtime',title:'发布时间',width:20,sortable:'T',
						formatter:function(value,row,index){if (row.createtime != null) {var date = new Date(row.createtime);return date.format('yyyy-MM-dd hh:mm:ss');}return '';}
				},
				{field:'read_count',title:'已读数量',width:20,sortable:'F',
						formatter:function(value,row,index){return row.readCount;}
				},
				{field:'status',title:'状态',width:15,sortable:'F',
						formatter:function(value,row,index){if (row.status == 'F'){return '<span style="color:red;">隐藏</span>';} else {return '显示';}}
				},
				{field:'top_number',title:'置顶序号',width:20,sortable:'F',
						formatter:function(value,row,index){return row.topNumber;}
				},
				{field:'recommend',title:'首页推荐',width:15,sortable:'F',
					formatter:function(value,row,index){
						if (row.recommend == '1'){
							return '<span style="color:green;">推荐</span>';
						} else {
							return '<span style="color:red;">未推荐</span>';
						}
					}
				},
				{field:'action',title:'操作',width:40,align:'center',
					formatter:function(value,row,index){
						var e = '<a href="javascript:void(0)" style="color:#2882CE;text-decoration:underline;" onclick="CmsArticle.recommendRow('+row.articleId+',1)">推荐</a>&nbsp;&nbsp;';
						e += '<a href="javascript:void(0)" style="color:#2882CE;text-decoration:underline;" onclick="CmsArticle.recommendRow('+row.articleId+',0)">取消推荐</a> ';
						return e;
					}
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
		
		$('#articleTable').datagrid('hideColumn','emptype');

	});
    var CmsArticle = {
    		addRow:function(){//新增
    			var node = $('#artChannelTree').tree('getSelected');
                if (!node){
                	$.messager.alert('提示',"请选择你要添加内容的栏目",'info');
    				return;
                }
  				window.self.location = "${contextPath}/cms/article/add?channelId="+node.id;
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
    	  	recommendRow:function(articleId,recommend){
    	  		$.post('${contextPath}/cms/article/recommend?articleId='+articleId+"&recommend="+recommend,function(data){
    	  			$("#articleTable").datagrid("reload");
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
    		},
    		channelClickHandler:function(node){
    			
    			if('${serverName}' == 'www.0631yuesao.com'){
    				$('#articleTable').datagrid('hideColumn','recommend');
    				$('#articleTable').datagrid('hideColumn','action');
    			}
    		
    			if(node.id != '92128268024132'){
    				$('#articleTable').datagrid('hideColumn','emptype');
    			} else {
    				$('#articleTable').datagrid('showColumn','emptype');
    			}
    			
    			var url = "${contextPath}/cms/article/queryList?channelId=" +node.id;   
    			//重新赋值url 属性
    		    $('#articleTable').datagrid('options').url=url;
    		    $("#articleTable").datagrid('reload');
    	    },
    	    channelLoadHandler:function(node,data){
    	    	var channelId = "${channelId}";
    	    	if(channelId){
    	    		var node = $("#artChannelTree").tree("find",channelId);
    	    		$('#artChannelTree').tree('select', node.target);
    	    	}
    	    }
	};
    </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
	<div data-options="region:'west',split:true,collapsible:false,border:false" title="栏目列表" style="width:170px;border-right:1px solid #D3D3D3;">
		<!-- <div id="tree-toolbar" style="padding:5px;background-color: #FAFAFA;border-bottom:1px solid #DDDDDD;">
			<table cellpadding="0" cellspacing="0" style="width:100%">
				<tr>
					<td>
						<a href="#" id="type-add" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
						<a href="#" id="type-update" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
						<a href="#" id="type-delete" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
					</td>
				</tr>
			</table>
		</div> -->
		<ul id="artChannelTree" class="easyui-tree" 
			data-options="url:'${contextPath}/platform/box/combotree?id=55059701325166',method:'get',onClick:CmsArticle.channelClickHandler,onLoadSuccess:CmsArticle.channelLoadHandler">
		</ul>
	</div>
    <div data-options="region:'center',border:false">
    	<table id="articleTable"></table>
    	<div id="tb" style="padding:10px;height:auto">
			<form id="cmsArticleForm" style="margin-bottom: 0px;">
				<label for="title" style="margin-left:10px;">标题: </label>
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