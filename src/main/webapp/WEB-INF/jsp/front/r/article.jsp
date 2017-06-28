<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>『济南润易集团』润易官网-鲁丰纸业有限公司-晨光纸业有限公司-欣易特种纸有限公司-晨光空港实业公司</title>
<meta name="keywords" content="济南润易集团,济南润易,济南赵滨,济南造纸,鲁丰纸业有限公司,晨光纸业有限公司,欣易特种纸有限公司,晨光空港实业公司">
<meta name="description" content="济南润易集团有限公司官网网站，提供润易集团简介，鲁丰纸业有限公司,晨光纸业有限公司,欣易特种纸有限公司,晨光空港实业公司等信息。业务涵盖商务综合体领域、文化产业领域、特种纸领域和电商物流领域四大核心产业。">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/runyi.css">
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
	margin-top:50px;
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
.slider { width: 194px; padding: 10px 0;  float: left;}
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
		<ul class="nav navbar-nav" style="float:right;">
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

<div class="w960 mauto">
	<div class="channel_title_div">
		<i class="web-font" >${channel.channelName}</i>
		
		<ol class="breadcrumb">
		  <li><a href="#">首页</a></li>
		  <c:if test="${channel != null}">
		  	<li><a href="#">${channel.channelName}</a></li>
		  </c:if>
		  <c:if test="${childchannel != null}">
		  	<li class="active">${childchannel.channelName}</li>
		  </c:if>
		</ol>
	</div>
	<div class="mt30">
		<div class="slider fl png">
			<ul>
				<c:forEach items="${childList}" var="item">
					<c:if test="${childchannel.channelId == item.channelId}">
						<li class="current nobt"><a href="#">${item.channelName}</a></li>
					</c:if>
					<c:if test="${childchannel.channelId != item.channelId}">
						<li><a href="${contextPath}/front/r/channel/${item.channelId}">${item.channelName}</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<div class="main fr">
			<h1 class="h1 f18" style="margin-top:10px;margin-bottom:0px;">${childchannel.channelName}</h1>
			<div class="mt30 b1s pl30 pr30" style="margin-bottom:80px;margin-top:10px;">
				<h3 style="text-align:center;margin-bottom:25px;">${article.title}</h3>
				<p>${article.content}</p>
			</div>
		</div>
	</div>
</div>
</body>
<script src="${contextPath}/resources/jQuery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var width = $(window).width();
		$(".ck-slide").width(width);
		$(".ck-slide-wrapper").width(width);
		$(".bannerImg").width(width);

	});
</script>
</html>