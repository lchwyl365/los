﻿var collapsed = "expand";
$(function(){
	var id = $(".nav .curr").attr("data-id");
	refreshLeftMenu(id);
	tabClose();
	tabCloseEven();
});
//初始化左侧
function refreshLeftMenu(pid) {
	//清空 panel
	var panels = $('#menu').accordion("panels");
	for ( var i = panels.length-1 ; i >= 0 ; i-- ){
		var index = $('#menu').accordion('getPanelIndex',panels[i]);
		$('#menu').accordion('remove',index);
	}
	//获取子菜单
	$.get(contextPath+"/platform/menu/queryList?pid="+pid, function(data){
		var menulist = "";
	    $.each(data, function(i, n) {  	
	    	menulist = '<ul>';
	    	$.each(n.children, function(j, o) {
				menulist += '<li><div><a menuid="'+o.menuid+'" menulink='+ o.href +' href="javascript:void(0);" ><span class="icon '+o.iconCls+'" >' + o.name + '</span></a></div></li> ';
	        });
	    	menulist += '</ul>';
            $('#menu').accordion('add', {
            	title:n.name,
            	content: menulist,
            	iconCls:n.iconCls,
            	selected: false
            });
            $("#menu").accordion('select',0);
            $("#menu").accordion({animate:false});
            $('.easyui-accordion li a').click(function(){
        		var tabTitle = $(this).text();
        		var url = contextPath+$(this).attr("menulink");
        		var menuid = $(this).attr("menuid");
        		addTab(menuid,tabTitle,url);
        		$('.easyui-accordion li div').removeClass("selected");
        		$(this).parent().addClass("selected");
        	}).hover(function(){
        		$(this).parent().addClass("hover");
        	},function(){
        		$(this).parent().removeClass("hover");
        	});
	    });
	    //展开面板
	    if(collapsed == "collapse"){
	    	$('#main-content').layout('expand','west');
	    	collapsed = "expand";
	    }
	});
}

function addTab(menuid,subtitle,url){
	if(!$('#tabs').tabs('exists',subtitle)){
		$('#tabs').tabs('add',{
			title:subtitle,
			content:createFrame(menuid,url),
			iconCls:'icon-page',
			closable:true,
			width:$('#mainPanle').width()-10,
			height:$('#mainPanle').height()-26
		});
		if(subtitle == '代码生成'){
			// 折叠west panel
			$('#main-content').layout('collapse','west');
			collapsed = "collapse";
		}
	}else{
		$('#tabs').tabs('select',subtitle);
		if(subtitle == '代码生成'){
			// 折叠west panel
			$('#main-content').layout('collapse','west');
			collapsed = "collapse";
		}
	}
	tabClose();
}

function createFrame(menuid,url)
{
	var s = '<iframe name="'+menuid+'" scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
	return s;
}

function tabClose()
{
	/*双击关闭TAB选项卡*/
	$(".tabs-inner").dblclick(function(){
		var subtitle = $(this).children("span").text();
		$('#tabs').tabs('close',subtitle);
	})

	$(".tabs-inner").bind('contextmenu',function(e){
		$('#mm').menu('show', {
			left: e.pageX,
			top: e.pageY
		});
		
		var subtitle =$(this).children("span").text();
		$('#mm').data("currtab",subtitle);
		
		return false;
	});
}
//绑定右键菜单事件
function tabCloseEven()
{
	//关闭当前
	$('#mm-tabclose').click(function(){
		var currtab_title = $('#mm').data("currtab");
		$('#tabs').tabs('close',currtab_title);
	})
	//全部关闭
	$('#mm-tabcloseall').click(function(){
		$('.tabs-inner span').each(function(i,n){
			var t = $(n).text();
			$('#tabs').tabs('close',t);
		});	
	});
	//关闭除当前之外的TAB
	$('#mm-tabcloseother').click(function(){
		var currtab_title = $('#mm').data("currtab");
		$('.tabs-inner span').each(function(i,n){
			var t = $(n).text();
			if(t!=currtab_title)
				$('#tabs').tabs('close',t);
		});	
	});
	//关闭当前右侧的TAB
	$('#mm-tabcloseright').click(function(){
		var nextall = $('.tabs-selected').nextAll();
		if(nextall.length==0){
			//msgShow('系统提示','后边没有啦~~','error');
			alert('后边没有啦~~');
			return false;
		}
		nextall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			$('#tabs').tabs('close',t);
		});
		return false;
	});
	//关闭当前左侧的TAB
	$('#mm-tabcloseleft').click(function(){
		var prevall = $('.tabs-selected').prevAll();
		if(prevall.length==0){
			alert('到头了，前边没有啦~~');
			return false;
		}
		prevall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			$('#tabs').tabs('close',t);
		});
		return false;
	});

	//退出
	$("#mm-exit").click(function(){
		$('#mm').menu('hide');
	})
}

//弹出信息窗口 title:标题 msgString:提示信息 msgType:信息类型 [error,info,question,warning]
function msgShow(title, msgString, msgType) {
	$.messager.alert(title, msgString, msgType);
}

function clockon() {
    var now = new Date();
    var year = now.getFullYear(); //getFullYear getYear
    var month = now.getMonth();
    var date = now.getDate();
    var day = now.getDay();
    var hour = now.getHours();
    var minu = now.getMinutes();
    var sec = now.getSeconds();
    var week;
    month = month + 1;
    if (month < 10) month = "0" + month;
    if (date < 10) date = "0" + date;
    if (hour < 10) hour = "0" + hour;
    if (minu < 10) minu = "0" + minu;
    if (sec < 10) sec = "0" + sec;
    var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    week = arr_week[day];
    var time = "";
    time = year + "年" + month + "月" + date + "日" + " " + hour + ":" + minu + ":" + sec + " " + week;

    $("#bgclock").html(time);

    var timer = setTimeout("clockon()", 200);
}
