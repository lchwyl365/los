<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>『济南润易集团』润易官网-鲁丰纸业有限公司-晨光纸业有限公司-欣易特种纸有限公司-晨光空港实业公司</title>
<meta name="keywords" content="济南润易集团,润易官网,济南赵滨,鲁丰纸业有限公司,晨光纸业有限公司,欣易特种纸有限公司,晨光空港实业公司">
<meta name="description" content="济南润易集团有限公司官网网站，提供润易集团简介，鲁丰纸业有限公司,晨光纸业有限公司,欣易特种纸有限公司,晨光空港实业公司等信息。业务涵盖商务综合体领域、文化产业领域、特种纸领域和电商物流领域四大核心产业。">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/theme/r/css/style.css">
<link rel="stylesheet" href="${contextPath}/resources/theme/r/css/base5.css">
<link rel="stylesheet" href="${contextPath}/resources/theme/r/css/runyi.css">
<style type="text/css">
.nav li a{
	color:#FFF;
}
.nav > li > a:hover {
    background-color: #3A93FF;
}
.w960 {
    width: 960px;
}
.mauto {
    margin: 0 auto;
}
.channel_title_div{
	overflow: hidden;
	border-bottom:1px solid #CCCCCC;
	margin-top:25px;
}
.channel_title_div i{
	float:left;font-size:28px;color:#333;line-height:48px;
}
.breadcrumb {
    margin-bottom:0px;
    list-style: none;
    background-color: #fff;
    border-radius: 0px;
    display: inline-block;
    padding: 0px;
    line-height: 48px;
    margin-left:40px;
}
.mt30{
	margin-top: 30px;
}
.slider { width: 194px; padding: 10px 0; }
.slider li { line-height: 29px; display: block;
			float: left; width: 180px; background: url(${contextPath}/resources/theme/r/img/sidelibg.png) no-repeat left top; }
.slider li.nobt { /* border-top: 1px solid #f9f9f9; */ background: none; }
.slider a { display: block; padding-left: 20px; color: #005bac; font-size: 14px; }
.slider li.current { width: 194px; }
.slider li.current a { color: #fff; background: url(${contextPath}/resources/theme/r/img/sideicon.png) no-repeat right center; }
.slider ul {margin:0px;padding:0px;}
.slider li li { line-height: 29px; border: none; }
.slider li li a { padding-left: 35px; }
.slider li.current li a.current { background: url(${contextPath}/resources/theme/r/img/dot2.gif) no-repeat 20px center }
.slider li.current li a { background: none; color: #005bac; }
.main {
    width: 750px;
}
.fr {
    float: right;
    display: inline;
}
.h1 {
    color: #333;
    line-height: 30px;
}
.f18 {
    font-size: 18px;
}
.pr30 {
    padding-right: 30px;
}
.pl30 {
    padding-left: 30px;
}
.mt30 {
    margin-top: 30px;
}
.b1s {
    border: 1px solid #ccc;
}
.pb25 {
    padding-bottom: 25px;
}
.pt25 {
    padding-top: 25px;
}
.bb1s {
    border-bottom: 1px solid #ccc;
}
.pt30 {
    padding-top: 30px;
}
/* 页码 */
.page { margin: 0px; padding: 0px; text-align: center; font-size: 12px; }
.page a { border: 1px solid #ddd; color: #005bac; margin: 2px; padding: 2px 7px; text-decoration: none; }
.page a:hover, .page a:active { border: 1px solid #ccc; color: #000 }
.page span.current { color: #333; font-weight: 700; margin: 2px; padding: 2px 7px }
.page .pre, .page .next, .page .pre:hover, .page .next:hover { border: none; margin: 2px; padding: 2px 7px; font-size: 12px; }
.backtop { background: url(${contextPath}/resources/theme/r/img/toparrow.png) no-repeat right center; padding-right: 15px; height: 50px; line-height: 50px; display: inline-block; color: #333; font-size: 14px; }

@media projection, screen {
.ui-tabs-hide { display: none; }
}
 @media print {
.ui-tabs-nav { display: none; }
}

.ui-tabs-nav, .ui-tabs-panel { font-size: 14px; }
.ui-tabs-nav { list-style: none; margin: 0; padding: 0; float: right; }
.ui-tabs-nav li { width: 360px; height: 60px; border-bottom: 1px solid #5a5a5a; background-color: #373737; }
.ui-tabs-nav a { display: block; color: #bdbdbd;height:40px;padding:5px 0px}
.ui-tabs-nav a { background: url(${contextPath}/resources/img/vedio_tb.png) no-repeat left 12px; line-height: 20px; padding-left: 25px; }
.ui-tabs-nav .ui-tabs-selected a, .ui-tabs-nav a:hover, .ui-tabs-nav a:focus, .ui-tabs-nav a:active { }
.ui-tabs-nav a, .ui-tabs-nav .ui-tabs-disabled a:hover, .ui-tabs-nav .ui-tabs-disabled a:focus, .ui-tabs-nav .ui-tabs-disabled a:active { }
.ui-tabs-nav .ui-tabs-selected a span, .ui-tabs-nav a:hover span, .ui-tabs-nav a:focus span, .ui-tabs-nav a:active span { }
.ui-tabs-nav a span, .ui-tabs-nav .ui-tabs-disabled a:hover span, .ui-tabs-nav .ui-tabs-disabled a:focus span, .ui-tabs-nav .ui-tabs-disabled a:active span { }
.ui-tabs-nav .ui-tabs-selected a:link, .ui-tabs-nav .ui-tabs-selected a:visited, .ui-tabs-nav .ui-tabs-disabled a:link, .ui-tabs-nav .ui-tabs-disabled a:visited { cursor: text; }
.ui-tabs-nav a:hover, .ui-tabs-nav a:focus, .ui-tabs-nav a:active, .ui-tabs-nav .ui-tabs-unselect a:hover, .ui-tabs-nav .ui-tabs-unselect a:focus, .ui-tabs-nav .ui-tabs-unselect a:active { cursor: pointer; }
.ui-tabs-disabled { opacity: .4; filter: alpha(opacity=40); }
.ui-tabs-panel { float: left; }
.ui-tabs-loading em { padding: 0 0 0 20px; background: url(loading.gif) no-repeat 0 50%; }
* html .ui-tabs-nav { display: inline-block; }
*:first-child+html .ui-tabs-nav { display: inline-block; }
.ui-tabs-nav .ui-tabs-selected { background: #2c2c2c url(${contextPath}/resources/theme/r/img/tabline.jpg) repeat-y left top; }
.ui-tabs-nav .ui-tabs-selected a { color: #fff; background: url(${contextPath}/resources/theme/r/img/vedio_tb_white.png) no-repeat left 12px; }
.ui-tabs-panel a { background:none;}
.pr15 {
    padding-right: 15px;
}
.pl15 {
    padding-left: 15px;
}
a{blr:expression(this.onFocus=this.blur());}
a:focus{outline:none;}
a.hidefocus{outline:none}
.mt30 {
    margin-top: 30px;
}
.cf {
    zoom: 1;
}
.w960 {
    width: 960px;
}
.mauto {
    margin: 0 auto;
}
.h300 {
    height: 300px;
}
.ohz {
    overflow: hidden;
    zoom: 1;
}
.pr {
    position: relative;
}
.pa {
    position: absolute;
}
</style>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?946a23deafd9be89f1593b0b6e2ab6bf";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</head>
<body>

<div style="overflow:hidden;background-color: #005BAC;">
	<div style="height:48px;width:980px;margin:0px auto;">
		<i class="web-font" style="float:left;font-size:24px;color:#fff;line-height:48px;">润易集团</i>
		<ul class="nav navbar-nav" style="float:right;width:800px;">
			<c:forEach items="${channelList}" var="channel">
				<c:if test="${channel.channelId == 55146271874110 }">
					<li class=" " style="float: left;"><a href="${contextPath}/index">${channel.channelName}</a></li>
				</c:if>
				<c:if test="${channel.channelId == 56643194809110 }">
						<li class=" " style="float: left;"><a href="${contextPath}/front/r/videos">${channel.channelName}</a></li>
				</c:if>
				<c:if test="${channel.channelId != 55146271874110 && channel.channelId != 56643194809110}">
					<li class=" " style="float: left;"><a href="${contextPath}/front/r/channel/${channel.channelId}">${channel.channelName}</a></li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>
<div style="overflow: hidden;background-color:#1D1D1D;height:420px;">
		<div class="w960 mauto">
			<div class="channel_title_div">
				<i class="web-font" style="color: #fff;">视频中心</i>
				<ol class="breadcrumb" style="background-color: #1D1D1D;">
					<li><a href="${contextPath}/index" style="color: #999;">首页</a></li>
					<li class="active" style="color: #999;">视频中心</li>
				</ol>
			</div>

			<div class="mt30 cf">
				<div id="rotate" class="cf w960 h300 ohz mauto">
					<c:forEach items="${videoList}" var="item" varStatus="st">
						<c:if test="${st.index == 0}">
							<div style="" id="fragment-${st.count}" class="pr ui-tabs-panel">
						</c:if>
						<c:if test="${st.index != 0}">
							<div style="" id="fragment-${st.count}" class="pr ui-tabs-panel ui-tabs-hide">
						</c:if>
							<a href="${contextPath}/front/r/video_detail/${item.videoId}"
								title="${item.videoTitle}" target="_blank">
								<img src="${item.videoImage}" height="300px" width="600px"></a>
							<div class="pa" style="left: 50%; top: 50%; margin-left: -38px; margin-top: -38px;">
								<p class="png">
									<a href="${contextPath}/front/r/video_detail/${item.videoId}"
										title="${item.videoTitle}" target="_blank">
										<img src="${contextPath}/resources/theme/r/img/play1.png" height="75" width="75"></a>
								</p>
							</div>
						</div>
					</c:forEach>
					
					<ul class="ui-tabs-nav">
						<c:forEach items="${videoList}" var="item" varStatus="st">
							<c:if test="${st.index == 0}">
								<li class="ui-tabs-selected">
							</c:if>
							<c:if test="${st.index != 0}">
								<li class="">
							</c:if>
								<div class="pl15 pr15">
									<a href="#fragment-${st.count}" class="block">${item.videoTitle}</a>
								</div>
							</li>
						</c:forEach>
					</ul>

				</div>
			</div>

		</div>
	</div>

	<div class="w960 mauto cf">
		<div class="w680 mt20 fl">
			<c:forEach items="${subChannelList}" var="channel">
				<h2 class="videoTit2">
					<!-- 
					<a href="#" rel="nofollow"
						class="fr lh200 cblue pt5">更多</a> -->
					<a href="#"
						class="f18 lh200 TitS">${channel.channelName}</a>
				</h2>
				
				<div class="cf pt20 pb10">
				<!-- 左侧第一个 -->
				<c:if test="${channel.firstVideo != null}">
					<div class="fl w200">
						<div class="pr h150">
							<p class="pa">
								<a href="${contextPath}/front/r/video_detail/${channel.firstVideo.videoId}"
									title="${channel.firstVideo.videoTitle}" target="_blank"><img
									title="${channel.firstVideo.videoTitle}"
									src="${channel.firstVideo.videoImage}"
									alt="" height="150" width="200"></a>
							</p>
							<p style="right: 10px; bottom: 10px;" class="play pa png">
								<a href="${contextPath}/front/r/video_detail/${channel.firstVideo.videoId}"
									title="${channel.firstVideo.videoTitle}" target="_blank">播放</a>
							</p>
	
						</div>
						<p class="f16 mt10">
							<a href="${contextPath}/front/r/video_detail/${channel.firstVideo.videoId}"
								class="cblue" title="${channel.firstVideo.videoTitle}" target="_blank">${channel.firstVideo.videoTitle}</a>
						</p>
					</div>
				</c:if>
				<c:if test="${channel.secondVideoList != null}">
					<div class="w440 fr">
						<div class="videoListMr40">
							<ul class="cf pb20">
								<c:forEach items="${channel.secondVideoList}" var="second">
									<li>
										<div style="width: 120px; height: 90px;" class="pr mauto">
											<p class="pa">
												<a href="${contextPath}/front/r/video_detail/${second.videoId}"
													title="${second.videoTitle}" target="_blank">
													<img src="${second.videoImage}" alt="" height="90" width="120">
												</a>
											</p>
											<p style="right: 10px; bottom: 10px;" class="play3 pa png">
												<a href="${contextPath}/front/r/video_detail/${second.videoId}"
													title="${second.videoTitle}" target="_blank">播放</a>
											</p>
										</div>
										<p class="videoTit pt5 w120">
											<a class="f14 cblue"
												href="${contextPath}/front/r/video_detail/${second.videoId}"
												title="${second.videoTitle}" target="_blank">${second.videoTitle}</a>
										</p>
									</li>
								</c:forEach>
							</ul>
						</div>
						<ul class="txtlist videoDot">
							<c:forEach items="${channel.threeVideoList}" var="three">
								<li><span><fmt:formatDate value="${three.createtime}" type="date"/></span><a
								href="${contextPath}/front/r/video_detail/${three.videoId}"
								title="${three.videoTitle}" target="_blank">${three.videoTitle}</a></li>
							</c:forEach>
						</ul>
					</div>
				</c:if>
				
			</div>
				
			</c:forEach>
		</div>
		
		<div class="w250 mt20 fr">
			<div class="ohz">
				<h1 class="lh200 f18 fl">润易视频排行榜</h1>
			</div>

			<div class="b1s p10">
				<ul class="numList toggle-list" id="con_one_1">
					<c:forEach items="${orderList}" var="video" varStatus="st">
						<c:if test="${st.index > 2}">
							<li class="cf">
								<div class="show">
									<p class="num2 num2graybg" style="margin-top: 3px;">${st.count}</p>
									<a href="${contextPath}/front/r/video_detail/${video.videoId}"
										class="cblue" target="_blank" title="${video.videoTitle}">${video.videoTitle}</a>
								</div>
							</li>
						</c:if>
						<c:if test="${st.index < 3}">
							<li class="cf">
								<div class="show">
									<p class="num2 num2bluebg" style="margin-top: 3px;">${st.count}</p>
									<a href="${contextPath}/front/r/video_detail/${video.videoId}"
										class="cblue" target="_blank" title="${video.videoTitle}">${video.videoTitle}</a>
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>

			<h2 class="lh200 f18">润易最新视频</h2>
			<div class="b1s p10">
				<div class="dllist dllistDLbb">
					<c:forEach items="${newList }" var="item">
						<dl class="cf pt15 pb10 ">
							<dt class="pr">
								<a href="${contextPath}/front/r/video_detail/${item.videoId}"
									title="${item.videoTitle}" target="_blank"> <img
									src="${item.videoImage}"
									height="60" width="80">
								</a>
								<p style="right: 5px; bottom: 10px;" class="playx pa png">
									<a href="${contextPath}/front/r/video_detail/${item.videoId}"
										title="${item.videoTitle}" target="_blank">播放</a>
								</p>
	
							</dt>
							<dd>
								<p class="tdau">
									<a class="cblue"
										href="${contextPath}/front/r/video_detail/${item.videoId}"
										title="${item.videoTitle}" target="_blank">${item.videoTitle}</a>
								</p>
								<p class="c9 mt5"><fmt:formatDate value="${item.createtime}" type="date"/></p>
							</dd>
						</dl>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="clearfloat"></div>
		<div class="h200">
			<span class="fr mt150"><a href="#" class="backtop">返回顶部</a></span>
		</div>
	</div>

	<footer class="footer ohz">
		<div class="w960 mauto">
			<span class="fl f12 ca2">济南润易集团有限公司 版权所有 ICP备16016467号-1</span>
		</div>
	</footer>


</body>
<script src="${contextPath}/resources/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="${contextPath}/resources/theme/r/js/ui.core.js" type="text/javascript"></script>
<script src="${contextPath}/resources/theme/r/js/ui.tabs.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {

		var width = $(window).width();
		$(".ck-slide").width(width);
		$(".ck-slide-wrapper").width(width);
		$(".bannerImg").width(width);

		$('#rotate > ul').tabs({ fx: { opacity: 'toggle' } }).tabs('rotate', 4000);
	});
</script>
</html>