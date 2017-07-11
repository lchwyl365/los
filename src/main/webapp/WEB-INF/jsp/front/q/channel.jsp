<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="X-UA-Compatible" content="IE=edge"/>
		<title>济南剑道|济南泉剑馆|济南剑道馆|济南泉剑馆-专业剑道馆/泉剑馆馆</title>
		<meta name="keywords" content="济南剑道，济南泉剑馆，济南剑道馆，济南泉剑馆">
		<meta name="description" content="济南剑道和济南泉剑馆专业认证和赛事中心，泉剑馆是最专业的济南剑道馆和济南泉剑馆。招生电话：15552518882">
		<link rel="stylesheet" type="text/css" href="${contextPath}/resources/theme/q/css/style.css"/>
	</head>
	<body>
		<!--header-->
		<div class="top_wrap">
			<!--top index-->
			<div class="top">
				<span class="welcome">欢迎您访问泉剑馆网站！</span>
				<div class="corner">
					<a onclick=SetHome(this,window.location) title="设为首页" href="javascript:void(0);">设为首页</a>
					<span>|</span>
					<a onclick=addFavorite(window.location,document.title) title="添加收藏" href="javascript:void(0);">加入收藏</a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!--logo and nav-->
		<div class="header_wrap">
			<div class="header">
				<a href="index.html" class="logo"><img src="${contextPath}/resources/theme/q/img/logo.png" style="height:42px;margin-top:8px;" /></a>
				<div class="nav_list">
					<ul id="nav" class="nav clearfix">
						<li class="nLi" style="display: none;"></li>
						<c:forEach items="${channelList}" var="channel">
							<c:if test="${channel.channelId == '57921583854116'}">
								<li class="nLi">
									<h3><a href="${contextPath}/index">${channel.channelName}</a></h3>
								</li>
							</c:if>
							<c:if test="${channel.channelId != '57921583854116'}">
								<li class="nLi">
									<h3><a href="${contextPath}/front/q/channel/${channel.channelId}">${channel.channelName}</a></h3>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<!--content-->
		<div class="content" style="min-height:300px;">
			   <c:if test="${channel.channelType == 'cover'}">
				    <div class="left_tab" style="width:960px;float:none;background:#FDFBF5">
					    <div class="hd">
							<ul><li class="first on">${channel.channelName}</li></ul>
						</div>
						<div class="con_box" style="padding:15px;padding-bottom: 30px;margin-bottom: 30px;">
							${channel.content}
						</div>
					</div>
			    </c:if>
			    <c:if test="${channel.channelType == 'list'}">
				    <div class="left_tab" style="width:960px;float:none;background:#FDFBF5">
					    <div class="hd">
							<ul><li class="first on">${channel.channelName}</li></ul>
						</div>
						<div class="con_box">
							<ul class="items-list">
								<c:forEach items="${dataGridResult.rows}" var="item">
								<li><a href="${contextPath}/front/q/article/${item.articleId}" title="${item.title}" target="_blank">${item.title}</a>
									<span class="date"><fmt:formatDate value="${item.createtime}" type="date"/></span></li>
								</c:forEach>
							</ul>
							<c:if test="${dataGridResult.total > 0}">
							<div class="record">
							<pg:pager url="${contextPath}/front/q/channel/${childchannel.channelId}" items="${dataGridResult.total}" 
	                              export="currentPageNumber=pageNumber">
		                        <pg:first>
		                            <span class="prev"><a href="${pageUrl}&pageNumber=${pageNumber}">首页</a></span>
		                        </pg:first>
		                        <pg:pages>
		                            <c:choose>
		                                <c:when test="${currentPageNumber == pageNumber}">
		                                    <span class="current">${pageNumber}</span>
		                                </c:when>
		                                <c:otherwise>
		                                	<span class="word"><a href="${pageUrl}&pageNumber=${pageNumber}">${pageNumber}</a></span>
		                                </c:otherwise>
		                            </c:choose>
		                        </pg:pages>
		                        <pg:last>
		                            <span class="next"><a href="${pageUrl}&pageNumber=${pageNumber}">尾页</a></span>
		                        </pg:last>
		                    </pg:pager>
		                    </div>
						</c:if>
						</div>
					</div>
				</c:if>
		</div>
		<!--footer-->
		<div class="footer_wrap">
			<div class="line"></div>
			<div class="footer">
				<div class="f_left">
					<%-- <img src="${contextPath}/resources/theme/q/img/f_logo.png" class="f_logo" /> --%>
					<div class="contact">
						<p><a href="${contextPath}/front/q/channel/57944184578122">联系我们</a></p>
						<p>泉剑馆本部地址&nbsp;&nbsp;&nbsp;&nbsp;所在地址：经十一路建设路交叉口139路42路公交站牌西20米</p>
						<p>版权所有：  济南泉剑剑道馆</p>
					</div>
				</div>
				<div class="f_right">
					<!-- <p><a href="" style="text-decoration: underline;">XX官网入口</a></p>
					<p><a href=""></a></p> -->
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<script type="text/javascript" src="${contextPath}/resources/js/jquery-1.11.0.min.js" ></script>
		<script type="text/javascript" src="${contextPath}/resources/theme/q/js/jquery.SuperSlide.2.1.js" ></script>
		<script type="text/javascript" src="${contextPath}/resources/theme/q/js/common.js" ></script>
		<script type="text/javascript">
			//banner滚动效果
			jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" });
			//tab切换效果
			jQuery(".left_tab").slide();
			//news滚动效果
			/**
			jQuery(".notice").slide({mainCell:".bd ul",autoPage:true,effect:"top",autoPlay:true,vis:3});**/
			function SetHome(obj,url){
				  try{
				    obj.style.behavior='url(#default#homepage)';
				    obj.setHomePage(url);
				  }catch(e){
				    if(window.netscape){
				     try{
				       netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
				     }catch(e){
				       alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
				     }
				    }else{
				    alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");
				    }
				  }
				}
				function addFavorite(title, url) {
				 try {
				   window.external.addFavorite(url, title);
				 }
					catch (e) {
					   try {
					    window.sidebar.addPanel(title, url, "");
					   }
					   catch (e) {
					     alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请进入新网站后使用Ctrl+D进行添加");
					   }
					 }
				}
		</script>
	</body>
</html>