<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>云商智建服务平台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%-- <link type="text/css" rel="stylesheet" href="${contextPath}/resources/fontsawesome/css/font-awesome.css"/> --%>
<style type="text/css">
ul,ol,dl{list-style-type:none}
.nav{margin-left:100px;height:74px;float:left;font-size:14px;text-align:center;overflow:hidden;position:relative;}
.nav ul{position:absolute;top:0;left:0;margin: 0;padding: 0;display: block;}
.nav li{float:left;width:48px;height:61px;padding:13px 13px 0px 13px;cursor:pointer;color:#FFF;}
.nav li:hover,.nav li.curr{background-color:#1d73a0;}
.nav li p{width:48px;height:29px;line-height:29px;margin:0px;padding:0px;}

.nav_roll{width:61px;height:74px;line-height:74px;text-align:center;cursor:pointer;background-color:#3B9FE1;}
.nav_roll div{width:30px;}
.clearfix {
    zoom: 1;
}
.fa-1x {
    padding: 27px 0px;
    font-size: 1.7em;
    color:#fff;
}
/*====font icon===*/
.font_lager{font-size:32px;}
.f_left{float:left;height:74px;}
.f_right{float:right;height:74px;border-left:1px solid #2A83CF;}
</style>	
	<script type="text/javascript" src='${contextPath}/resources/js/outlook2.js'> </script>
    <script type="text/javascript">
        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable:false
            });
        }
        //关闭登录窗口
        function closePwd() {
            $('#w').window('close');
        }

        //修改密码
        function serverLogin() {
        	var $prepass = $('#txtPrePass');
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');
            if ($prepass.val() == '') {
                msgShow('系统提示', '请输入原密码！', 'warning');
                return false;
            }
            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入新密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请输入确认密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次新密码不一致！请重新输入', 'warning');
                $prepass.val('');
                $newpass.val('');
                $rePass.val('');
                $rePass.focus();
                return false;
            }
            $.post("${contextPath}/platform/user/modPass?userid=${authUser.userid}&password=" + $newpass.val()+"&prePassword=" + $prepass.val(), function(data){
    			if(data.status == 200){
    				msgShow('系统提示', '密码修改成功！', 'info');
    				$prepass.val('');
    				$newpass.val('');
                    $rePass.val('');
                    $('#password-window').window('close');
    			}else{
    				$.messager.alert('错误',data.msg,'error');
    				$prepass.val('');
    				$newpass.val('');
                    $rePass.val('');
                    //$('#password-window').window('close');
    			}
    		});
        }
        
        function initNavBar(){
        	var top_width = $(document.body).width() - 800;
			if(top_width>=74){
				var w = parseInt(top_width / 74) * 74;
				$("#nav_bar").show();
				$("#nav_roll_bar").show();
				$("#nav_bar").width(w + "px");
			}else{
				$("#nav_bar").hide();
				$("#nav_roll_bar").hide();
			}
			offset = parseInt($(".nav ul").width())-parseInt($(".nav").width());
			if(offset>0){
				$("#nav_roll_bar").show();
			}else{
				$("#nav_roll_bar").hide();
			}
			$(".nav ul").animate({
                left:"0px"
            },300);
        }

        $(function() {

            openPwd();
            
            $('#editpass').click(function() {
            	$('#password-window').window('open');
            });

            $('#btnEp').click(function() {
                serverLogin();
            })

			$('#btnCancel').click(function(){$('#password-window').window('close');})

           

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                    if (r) {
                        location.href = '${contextPath}/admin/loginout';
                    }
                });

            });
            
            $("#northPanel").show();
            $("#homeTab").show();
            $("#southPanel").show();
            

            
            offset = parseInt($(".nav ul").width())-parseInt($(".nav").width());
			
            initNavBar();
    		$(window).resize(function(){
    			initNavBar();
    		});
    		function navLeft(){
    			if($(".nav ul").position().left < 0){
    				$(".nav_roll .f_left").off("click");
    				$(".nav ul").animate({
    	                left:$(".nav ul").position().left+parseInt($(".nav li").outerWidth())+"px"
    	            },300,function(){
    	            	$(".nav_roll .f_left").on("click",navLeft);
    	            });
    			}
    		}
    		function navright(){
    			if($(".nav ul").position().left > -offset){
    				$(".nav_roll .f_right").off("click");
    				$(".nav ul").animate({
    	                left:$(".nav ul").position().left+parseInt(-$(".nav li").outerWidth())+"px"
    	            },300,function(){
    	            	$(".nav_roll .f_right").on("click",navright);
    	            });
    			}
    		}
            $(".nav_roll .f_left").click(function(){
    			navLeft();
    		});
    		$(".nav_roll .f_right").click(function(){
    			navright();
    		});
    		$(".nav li").click(function(){
		
    			var dataId = $(this).attr("data-id");	
    			if(dataId == '0000'){
    				window.open("${contextPath}/index");
    			}else{
    				//清空 panel
	            	var panels = $('#menu').accordion("panels");
	            	for ( var i = panels.length-1 ; i >= 0 ; i-- ){
	            		var index = $('#menu').accordion('getPanelIndex',panels[i]);
	    				$('#menu').accordion('remove',index);
	            	}
    				refreshLeftMenu(dataId);
    			}
    			$(this).addClass("curr").siblings().removeClass("curr");
    		});
        });
        
        function sessionTimeout(){
        	window.self.location = "${contextPath}/admin/login";
        }
    </script>

</head>
<body>
<noscript>
	<div style="position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
	    <img src="${contextPath}/resources/images/noscript.gif" alt='抱歉，请开启脚本支持！' />
	</div>
</noscript>
	<div id="main-content" class="easyui-layout" fit="true" style="overflow-y: hidden;"  scroll="no">
	    <div region="north" split="false" border="false" style="height:79px;padding:0px;">
			<div id="hd">
				<div class="hd-wrap clearfix">
					<div class="top-light"></div>
            		<h1 class="logo"></h1>
            		
            		<div id="nav_bar" class="nav" style="width:600px;">
						<ul class="clearfix" style="width:${fn:length(topMenus) * 74 + 74}px; left: 0px;">
							<c:forEach items="${topMenus}" var="topMenu" varStatus="status">
	            				<c:if test="${status.index == 0}">
	            					<li class="curr" data-id="${topMenu.menuid}" >
										<div class="nav-icon ${topMenu.iconCls}"></div>
										<p>${topMenu.name}</p>
									</li>
	            				</c:if>
	            				<c:if test="${status.index != 0}">
	            					<li data-id="${topMenu.menuid}" >
										<div class="nav-icon ${topMenu.iconCls}"></div>
										<p>${topMenu.name}</p>
									</li>
	            				</c:if>
	            			</c:forEach>
	            			<li data-id="0000">
								<div class="nav-icon icon-first"></div>
								<p>网站首页</p>							
							</li>
						</ul>
					</div>
					<div id="nav_roll_bar" class="nav_roll f_left" style="">
						<div class="f_left">
							<div class="nav-roll-icon icon-left"></div>
						</div>
						<div class="f_right">
							<div class="nav-roll-icon icon-right"></div>
						</div>
					</div>
            		
            		<%-- <ul class="main-nav clearfix">
            			<li class="" ><a href="${contextPath}/index">网站首页</a></li>
            			<c:forEach items="${topMenus}" var="topMenu" varStatus="status">
            				<c:if test="${status.index == 0}">
            					<li class="current" data-id="${topMenu.menuid}"><a href="javascript:;">${topMenu.name}</a></li>
            				</c:if>
            				<c:if test="${status.index != 0}">
            					<li class="" data-id="${topMenu.menuid}"><a href="javascript:;">${topMenu.name}</a></li>
            				</c:if>
            			</c:forEach>
		            </ul> --%>
		            <!-- <div class="notice clearfix">
		                <ul class="clearfix">
		                    <li class="current"><a href="javascript:;">关于客票行程单打印通知</a></li>
		                    <li><a href="javascript:;">关于网银付款升级通知</a></li>
		                    <li><a href="javascript:;">关于客票行程单打印通知</a></li>
		                </ul>
		                <div class="notice-btn">
		                    <a href="javascript:;" class="prev"></a>
		                    <a href="javascript:;" class="next"></a>
		                </div>
		            </div> -->
		            <div class="toolbar">
		                <div class="login-info clearfix">
		                    <div class="welcome clearfix"><span>欢迎您,</span><a href="javascript:;" class="user-name">${authUser.operatorname}</a></div>
		                    <div class="login-msg clearfix">
		                        <!-- <a href="javascript:;" class="msg-txt">消息</a>
		                        <a href="javascript:;" class="msg-num">10</a> -->
		                    </div>
		                </div>
		                <div class="tool clearfix">
		                    <a id="editpass" class="tips" href="javascript:;" style="display:hidden;">修改密码</a>
		                    <!-- <a class="tips" href="javascript:;" style="display:hidden;">协议</a> -->
		                    <!-- <a href="javascript:;" class="help-btn" style="display:hidden;">帮助</a> -->
		                    <a id="loginOut" href="javascript:;" class="quit-btn exit">退出</a>
		                </div>
		            </div>
				</div>
			</div>
	    </div>
	    <div region="south" split="true" style="height: 30px;">
	        <div id="southPanel" class="footer">
	        	Copyright © 2017   朝龙网络科技有限公司  技术支持:18954198703
	        </div>
	    </div>
	    <div region="west" split="true" title="导航菜单" style="width:180px;" id="west">
				<div id="menu" class="easyui-accordion" fit="true" border="false">
				</div>
	    </div>
	    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
	        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
				<div title="欢迎使用" data-options="iconCls:'icon-home'" style="padding:20px;overflow:hidden;display:none;" id="homeTab">
					<h1>Welcome to 云商智建综合服务平台</h1>
				</div>
			</div>
	    </div>
	    
	    <!--修改密码窗口-->
	    <div id="password-window" class="easyui-window" title="修改密码" collapsible="false" minimizable="false" closed="true"
	        maximizable="false" icon="icon-save"  style="width: 400px; height: 200px; padding: 5px;
	        background: #fafafa;">
	    	<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'center,border:false'">
					<form id="contentAddForm" method="post">
						<table class="easyui-panel form-table">
							<tr>
								<td class="form-table-td-left">
									<label for="username">原密码：</label>
								</td>
								<td class="form-table-td-right">
									<input class="easyui-validatebox" type="password" id="txtPrePass" name="txtPrePass" data-options="required:true,validType:['length[0,50]']" style="width:200px;"/>
								</td>
								
							</tr>
							<tr>
								<td class="form-table-td-left">
									<label for="username">新密码：</label>
								</td>
								<td class="form-table-td-right">
									<input class="easyui-validatebox" type="password" id="txtNewPass" name="txtNewPass" data-options="required:true,validType:['length[0,50]']" style="width:200px;"/>
								</td>
								
							</tr>
							<tr>
								<td class="form-table-td-left">
									<label for="password">确认密码：</label>
								</td>
								<td class="form-table-td-right">
									<input class="easyui-validatebox" type="password" id="txtRePass" name="txtRePass" data-options="required:true,validType:['length[0,50]']"  style="width:200px;"/>
								</td>
								
							</tr>
						</table>
					</form>
				</div>
				<div data-options="region:'south',border:false" style="text-align:right;padding:10px 10px;">
					<a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
			                    确定</a> <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
				</div>
			</div>
	    
	    
	    </div>
	
		<div id="mm" class="easyui-menu" style="width:150px;">
			<div id="mm-tabclose">关闭</div>
			<div id="mm-tabcloseall">全部关闭</div>
			<div id="mm-tabcloseother">除此之外全部关闭</div>
			<div class="menu-sep"></div>
			<div id="mm-tabcloseright">当前页右侧全部关闭</div>
			<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
			<div class="menu-sep"></div>
			<div id="mm-exit">退出</div>
		</div>
	</div>
</body>
</html>