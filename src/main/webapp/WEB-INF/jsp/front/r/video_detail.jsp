<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${video.videoTitle}</title>
<meta name="keywords" content="济南润易集团,济南润易,济南赵滨,济南造纸,鲁丰纸业有限公司,晨光纸业有限公司,欣易特种纸有限公司,晨光空港实业公司">
<meta name="description" content="济南润易集团有限公司官网网站，提供润易集团简介，鲁丰纸业有限公司,晨光纸业有限公司,欣易特种纸有限公司,晨光空港实业公司等信息。业务涵盖商务综合体领域、文化产业领域、特种纸领域和电商物流领域四大核心产业。">
<link rel="stylesheet" href="${contextPath}/resources/theme/r/css/base5.css" />
<link rel="stylesheet" href="${contextPath}/resources/theme/r/css/style.css" />
<script type="text/javascript" src="${contextPath}/resources/js/jquery-1.7.2.js"> </script>
<script type="text/javascript" src="${contextPath}/resources/theme/r/js/common.js"></script>

<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?946a23deafd9be89f1593b0b6e2ab6bf";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</head>
<body>
<div style="overflow:hidden;background-color: #005BAC;">
	<div style="height:48px;width:980px;margin:0px auto;">
		<i class="web-font" style="float:left;font-size:24px;color:#fff;line-height:48px;font-style:normal;">润易集团</i>
		<ul class="nav navbar-nav">
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

<div class="pt25 pb15 bc_1d">
<div class="w960 mauto">
<div class="bb1s_02 pb5 cf">
    <span class="f28 cwhite mr15">视频中心</span> 
    <span class="c9 f12 pt20 tdau">
    <a href="${contextPath}/index" class="cblue">首页</a> > 
                    <a href="${contextPath}/front/r/videos" class="cblue">视频中心</a> >
       ${video.videoTitle}</span> 
   </div>    
	<embed src="http://player.youku.com/player.php/sid/${video.youkuid}/v.swf" quality="high" width="960" height="600" align="middle" allowScriptAccess="never" allowNetworking="internal" autostart="0" type="application/x-shockwave-flash"></embed>
  </div>
</div>
<div class="w960 mauto">
  <div class="mt20 cf">
			<div class="pb30 bb1s">
				<div class="lh40 cf">
					<span class="fr f14 c9"> 发布时间：<fmt:formatDate value="${video.createtime}" type="date" />
					</span> <span class="fl f24 cblue">${video.videoTitle}</span>
				</div>
				<div class="f14 lh21 c6 mt20" id="description">
					${video.videoDesc} <a href="javascript:;" class="f14 ml10 description"
						style="color: rgb(99, 131, 233);">展开&nbsp;<img
						src="${contextPath}/resources/theme/r/img/narrx.png"
						width="12" height="12"></a>
				</div>
				<div class="f14 lh21 c6 mt20 editBody" id="content"
					style="display: none;">
					<p>${video.videoDesc}</p>
					<a href="javascript:;" class=" f14 ml10 content jq_hide"
						style="color: rgb(99, 131, 233);">隐藏</a>
				</div>
			</div>

			<h1 class="h1 f18 c3 mt60">相关视频</h1>
    <div class="b1s pl20 pr20 mt10">
      <div class="videoList videoList5 videoListUlnobb">
        <ul class="cf">
            
            <c:forEach items="${newList}" var="item">
            	<li>
	              <div class="pr mauto" style="width:150px; height:112px;" >
	                <p class="pa">
	                	<a href="${contextPath}/front/r/video_detail/${item.videoId}" title="${item.videoTitle}" target="_blank">
	                	<img src="${item.videoImage}" alt="${item.videoTitle}" style="width:150px; height:112px;"/>
	                	</a></p>
	                <p class="play pa png" style="right:10px; bottom:10px;">
	                	<a href="${contextPath}/front/r/video_detail/${item.videoId}" title="${item.videoTitle}" target="_blank">播放</a></p>
	              </div>
	             <p class="videoTit pt5 tdau"><a href="${contextPath}/front/r/video_detail/${item.videoId}" title="${item.videoTitle}" target="_blank" class="f14 cblue">${item.videoTitle}</a></p>
	            </li> 
            </c:forEach>                   
            
          </ul>
      </div>
    </div>
  </div>
  <div class="h200"> <span class="fr mt150"><a href="#" class="backtop">返回顶部</a></span> </div>
</div>

	<footer class="footer ohz">
		<div class="w960 mauto">
			<span class="fl f12 ca2">济南润易集团有限公司 版权所有 ICP备16016467号-1</span>
		</div>
	</footer>
	
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-47494733-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>
<script type="text/javascript">
videoHits(37,405,85);
$(".description").click( function () {
    $("#content").show();
    $("#description").hide();
});
$(".content").click( function () {
    $("#description").show();
    $("#content").hide();
});
</script>
