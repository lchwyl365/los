<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>『济南润易集团』润易官网-鲁丰纸业有限公司-晨光纸业有限公司-欣易特种纸有限公司-晨光空港实业公司</title>
<meta name="keywords" content="济南润易集团,润易官网,济南赵滨,鲁丰纸业有限公司,晨光纸业有限公司,欣易特种纸有限公司,晨光空港实业公司">
<meta name="description" content="济南润易集团有限公司官网网站，提供润易集团简介，鲁丰纸业有限公司,晨光纸业有限公司,欣易特种纸有限公司,晨光空港实业公司等信息。业务涵盖商务综合体领域、文化产业领域、特种纸领域和电商物流领域四大核心产业。">
<link rel="stylesheet"
	href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/theme/r/css/slide.css">
<link rel="stylesheet" href="${contextPath}/resources/theme/r/css/runyi.css">
<style>
a{blr:expression(this.onFocus=this.blur());}
a:focus{outline:none;}
a.hidefocus{outline:none}
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
	<div class="topdiv">&nbsp;</div>
	<div class="navdiv">
		<div class="navdiv_left"></div>
		<div class="navdiv_right">
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
	<div class="container-fluid">
		<div class="row" style="margin: 0px; padding: 0px;">
			<!-- html -->
			<div class="ck-slide">
				<ul class="ck-slide-wrapper">
					<c:forEach items="${bannerList}" var="banner">
						<li><a href="javascript:"><img class="bannerImg"
								src="${contextPath}/resources/theme/r/img/${banner.img}" alt="${banner.bannerTitle}" /></a></li>
					</c:forEach>
				</ul>
				<a href="javascript:;" class="ctrl-slide ck-prev">上一张</a> <a
					href="javascript:;" class="ctrl-slide ck-next">下一张</a>
				<div class="ck-slidebox">
					<div class="slideWrap">
						<ul class="dot-wrap">
							<c:forEach items="${bannerList}" var="banner" varStatus="st">
								<c:if test="${st.index == 0}">
									<li class="current"><em>${st.count}</em></li>
								</c:if>
								<c:if test="${st.index != 0}">
									<li><em>${st.count}</em></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="width: 980px; margin-top: 20px;">
		<div class="row">
			<div class="col-md-6" style="width: 480px; float: left;padding:0px;">
				<div class="ohz">
					<h2 class="artTitle">
						<span><a href="${contextPath}/front/r/channel/55230388368137">集团要闻</a></span> <a
							class="cblue fr f14 pt5 lh200" href="${contextPath}/front/r/channel/55230388368137">更多</a>
					</h2>
					<c:forEach items="${yaowenList}" var="yaowen" varStatus="st">
						<c:if test="${st.index == 0}">
							<div class="mt15 ohz">
								<p class="fl">
									<a href="${contextPath}/front/r/article/${yaowen.articleId}" title="" target="_bank"> <img
										src="${yaowen.thumbnail}"
										alt="" height="120" width="180">
									</a>
								</p>
								<div class="fr w270">
									<a href="${contextPath}/front/r/article/${yaowen.articleId}" title="${yaowen.title}" target="_blank">
										<h2 class="cblue f18">${yaowen.title}</h2>
									</a>
									<p class="f12 c6 mt10 lh19 t2 cnp h60 ohz">
										<c:choose>
											<c:when test="${fn:length(yaowen.content) > 100}">
												<c:out value="${fn:substring(yaowen.content, 0, 100)}" />
											</c:when>
											<c:otherwise>
												<c:out value="${yaowen.content}" />
											</c:otherwise>
										</c:choose>
									</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
					<ul class="txtlist cf txtlist4 mt5" style="overflow: hidden;min-height: 196px;">
						<c:forEach items="${yaowenList}" var="yaowen" varStatus="st">
							<c:if test="${st.index != 0}">
								<li><span><fmt:formatDate value="${yaowen.createtime}" pattern="MM-dd"/></span> <a href="${contextPath}/front/r/article/${yaowen.articleId}" target="_blank"
									title="${yaowen.title}"> <c:choose>
											<c:when test="${fn:length(yaowen.title) > 23}">
												<c:out value="${fn:substring(yaowen.title, 0, 23)}" />
											</c:when>
											<c:otherwise>
												<c:out value="${yaowen.title}" />
											</c:otherwise>
										</c:choose>
								</a></li>
							</c:if>
						</c:forEach>
					</ul>

				</div>

				<div class="ohz mt10">
					<h2 class="artTitle">
						<span><a href="${contextPath}/front/r/channel/55230443822142">最新动态</a></span> <a
							class="cblue fr f14 pt5 lh200" href="${contextPath}/front/r/channel/55230443822142">更多</a>
					</h2>

					<ul class="txtlist cf txtlist4 mt10" style="padding-top: 15px;">

						<c:forEach items="${dongtaiList}" var="dongtai" varStatus="st">
							<li><span><fmt:formatDate value="${dongtai.createtime}" pattern="MM-dd"/></span> 
							<a href="${contextPath}/front/r/article/${dongtai.articleId}" target="_blank"
								title="${dongtai.title}"> <c:choose>
										<c:when test="${fn:length(dongtai.title) > 23}">
											<c:out value="${fn:substring(dongtai.title, 0, 23)}" />
										</c:when>
										<c:otherwise>
											<c:out value="${dongtai.title}" />
										</c:otherwise>
									</c:choose>
							</a></li>
						</c:forEach>

					</ul>
				</div>

			</div>
			<div class="col-md-6" style="width: 480px; float: left;padding:0px;margin-left:20px;">
				<div class="ohz">
					<h2 class="artTitle" style="border: 0px; margin-bottom: 2px;">
						<span style="border: 0px;"><a href="#">集团简介</a></span>
					</h2>

					<div class="mt15 ohz"
						style="margin-top: 0px; padding: 10px; border: 1px solid #CCCCCC;">
						<p class="fl">
							<a href="${contextPath}/channel/1603161551390001014" title="" target="_bank"> 
								<img style="width:180px;height:120px;" src="${contextPath}/resources/theme/r/img/about.jpg" />
							</a>
						</p>
						<div class="fr w270">
							<p class="lh21 h63 ohz cnp">
								<c:choose>
									<c:when test="${fn:length(introduceChannel.content) > 120}">
										<c:out value="${fn:substring(introduceChannel.content, 0, 120)}" escapeXml="false" />
									</c:when>
									<c:otherwise>
										<c:out value="${introduceChannel.content}"  escapeXml="false" />
									</c:otherwise>
								</c:choose>
							</p>
							<span class="v4-more fr"><a href="${contextPath}/front/r/channel/55229185193119" target="_blank">查看更多</a></span>
						</div>
					</div>

				</div>
				<div class="ohz">
					<h2 class="artTitle" style="border: 0px; margin-bottom: 3px; margin-top: 10px;">
						<span style="border: 0px;"><a href="${contextPath}/videos">视频中心</a></span> 
						<a href="${contextPath}/front/r/videos" class="cblue fr lh200 pt5 f14" target="_blank">更多</a>
					</h2>

					<div class="mt15 ohz" style="margin-top: 0px; padding: 10px; border: 1px solid #CCCCCC;">
						<div class="z4_wrap">
							<div class=" z4 z4-qqyue2" style="width: 453px;" id="qqyue2">
								<ul class="pic">
									<c:forEach items="${videoList}" var="video" varStatus="st">
										<c:if test="${st.index == 0}">
											<li id="pic_${video.videoId}" style="display: block; opacity: 1;">
												<a href="${contextPath}/front/r/video_detail/${video.videoId}" title="${video.videoTitle}" target="_blank">
												<img src="${video.videoImage}" height="200" width="268"></a>
											</li>
										</c:if>
										<c:if test="${st.index != 0}">
											<li id="pic_${video.videoId}" style="display: none; opacity: 1;">
												<a href="${contextPath}/front/r/video_detail/${video.videoId}" title="${video.videoTitle}" target="_blank">
												<img src="${video.videoImage}" height="200" width="268"></a>
											</li>
										</c:if>
									</c:forEach>
								</ul>
								<ul style="width: 268px;" class="par">
									<c:forEach items="${videoList}" var="video" varStatus="st">
										<c:if test="${st.index == 0}">
											<li style="display: block;" id="par_${video.videoId}">
												<p><a href="${contextPath}/front/r/video_detail/${video.videoId}" title="${video.videoTitle}"
														target="_blank">${video.videoTitle}</a></p><span></span>
											</li>
										</c:if>
										<c:if test="${st.index != 0}">
											<li style="display: none;" id="par_${video.videoId}">
												<p><a href="${contextPath}/front/r/video_detail/${video.videoId}" title="${video.videoTitle}"
														target="_blank">${video.videoTitle}</a></p><span></span>
											</li>
										</c:if>
									</c:forEach>
								</ul>
								<ul style="width: 185px;" class="parcon">
									<c:forEach items="${videoList}" var="video" varStatus="st">
										<c:if test="${st.index == 0}">
										  <li id="parcon_${video.videoId}" data-id="${video.videoId}" class="current parconli" style="width: 185px; height: 51px;">
											<span><img src="${video.videoImage}" 
											alt="${video.videoTitle}" height="45" width="60"></span> 
											<a title="${video.videoTitle}"><p>${video.videoTitle}</p>
											<p>[<fmt:formatDate value="${video.createtime}" type="date"/>]</p></a>
											<s></s><i></i></li>
										</c:if>
										<c:if test="${st.index != 0}">
											<li id="parcon_${video.videoId}" data-id="${video.videoId}" class="parconli" style="width: 185px; height: 51px;">
											<span><img src="${video.videoImage}" 
											alt="${video.videoTitle}" height="45" width="60"></span> 
											<a title="${video.videoTitle}"><p>${video.videoTitle}</p>
											<p>[<fmt:formatDate value="${video.createtime}" type="date"/>]</p></a>
											<s></s><i></i></li>
										</c:if>
									</c:forEach>
								</ul>
								<ul class="txt">
									<c:forEach items="${videoList}" var="video" varStatus="st">
									  <li id="txt_${video.videoId}" data-id="${video.videoId}" class="parconli">
									  	<a href="${contextPath}/front/r/video_detail/${video.videoId}" title="${video.videoTitle}" target="_blank"></a>
										<p></p>
										<span></span></li>
									</c:forEach>
								</ul>
							</div>
						</div>

					</div>
				</div>

				<div class="ohz">
					<h2 class="artTitle"
						style="border: 0px; margin-bottom: 4px; margin-top: 10px;">
						<span style="border: 0px;"><a href="#">润易全媒体</a></span>
					</h2>
					<div class="mt15 ohz"
						style="margin-top: 0px; border: 1px solid #CCCCCC; padding-bottom: 10px; padding-top: 4px;">

						<ul class="v4-icon_digital cf">

							<li><a href="#" target="_blank"> <img
									src="http://image.wanda.cn/statics/images/web/icon/icon_digital1.gif"
									alt=""> <span>官方微信</span>
							</a></li>

							<li><a href="#" target="_blank"><img
									src="http://image.wanda.cn/uploadfile/2015/0811/20150811035643537.gif"
									alt=""><span>官方微博</span></a></li>
							<li class="last"><a href="#" target="_blank"><img
									src="http://image.wanda.cn/statics/images/web/icon/icon_digital4.gif"
									alt=""><span>APP应用</span></a></li>


						</ul>

					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>

	<div class="container" style="width: 1000px;">
		<div class="row">
			<h1
				style="text-align: center; font-size: 26px; color: #333; margin-top: 60px; margin-bottom: 40px;">集团旗下核心产业</h1>
		</div>
		<div class="row">
			<div class="col-md-3" style="width: 250px; float: left;">
				<div class="col-title">
					<img src="${contextPath}/resources/theme/r/img/icon1.png" /> 商务综合体领域
				</div>
				<p class="col-p">计划总投入约50亿，建设集会展、购物、娱乐、服务、文化、社交、住宅等功能于一体的大型商务、商业和住宅综合体。</p>
				<a class="col-a" href="${contextPath}/front/r/channel/56472035632146">了解更多</a>
			</div>
			<div class="col-md-3" style="width: 250px; float: left;">
				<div class="col-title">
					<img src="${contextPath}/resources/theme/r/img/icon2.png" /> 文化产业领域
				</div>
				<p class="col-p">是一个集儿童水上乐园，陶艺、奇石、古玩、书画，曲艺、KTV、茶吧、影视院线、水族世界及餐饮、商务酒店等为一体的大型泉水文化综合体。</p>
				<a class="col-a" href="${contextPath}/front/r/channel/56472052915150">了解更多</a>
			</div>
			<div class="col-md-3" style="width: 250px; float: left;">
				<div class="col-title">
					<img src="${contextPath}/resources/theme/r/img/icon4.png" /> 特种纸领域
				</div>
				<p class="col-p">建设特种纸研发中心，发展生活用纸和特种纸，建设绿色环保的“城市造纸”基地。</p>
				<a class="col-a" href="${contextPath}/front/r/channel/56472090587179">了解更多</a>
			</div>
			<div class="col-md-3" style="width: 250px; float: left;">
				<div class="col-title">
					<img src="${contextPath}/resources/theme/r/img/icon3.png" /> 电商物流领域
				</div>
				<p class="col-p">占地500余亩，规划建设物流基地及所属加油站、加汽站等附属设施。</p>
				<a class="col-a" href="${contextPath}/front/r/channel/56472072075163">了解更多</a>
			</div>
		</div>
	</div>

	<div class="container-fluid"
		style="height: 300px; margin-top: 60px; background-color: #0082DA; width:100%;" >
		<div class="row"
			style="margin: 0px auto; padding: 0px; width: 1000px; color: #FFF;">
			<div class="col-md-7" style="float: left; width: 600px">
				<div class="row">
					<div class="col-sm-3 bottom-info"
						style="float: left; width: 150px">
						<h3>关于润易</h3>
						<ul>
							<c:forEach items="${aboutChannels}" var="item">
								<li><a href="${contextPath}/front/r/channel/${item.channelId}">${item.channelName}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="col-sm-3 bottom-info"
						style="float: left; width: 150px">
						<h3>润易产业</h3>
						<ul>
							<c:forEach items="${chanyeChannels}" var="item">
								<li><a href="${contextPath}/front/r/channel/${item.channelId}">${item.channelName}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="col-sm-3 bottom-info"
						style="float: left; width: 150px">
						<h3>产品服务</h3>
						<ul>
							<c:forEach items="${serviceChannels}" var="item">
								<li><a href="${contextPath}/front/r/channel/${item.channelId}">${item.channelName}</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="col-sm-3 bottom-info"
						style="float: left; width: 150px">
						<h3>联系我们</h3>
						<ul>
							<c:forEach items="${contactChannels}" var="item">
								<li><a href="${contextPath}/front/r/channel/${item.channelId}">${item.channelName}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-3" style="float: left; width: 240px">
				<div class="bottom-group">
					<h3>润易集团群</h3>
					<ul>
						<li><a href="#">鲁丰纸业有限公司</a></li>
						<li><a href="#">晨光纸业有限公司</a></li>
						<li><a href="#">欣易特种纸有限公司</a></li>
						<li><a href="#">晨光空港实业公司</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-2" style="float: left; width: 150px;padding-left:40px;">
				<div class="bottom-code">
					<h3>润易集团</h3>
					<img style="width: 90px" src="${contextPath}/resources/theme/r/img/code.png" />
					<p style="padding: 5px 15px;">官方微信</p>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row"
			style="margin: 15px auto; padding: 0px; text-align: center;">
			<div>地址：山东省济南市天桥区铜元局前街11号，电话：0531-86112876</div>
			<div>Copyright ©济南润易集团有限公司 鲁ICP备16016467号-1</div>
		</div>
	</div>
</body>
<script src="${contextPath}/resources/js/jquery-1.8.3.min.js"></script>
<!--<script src="js/slide.min.js"></script>-->
<script src="${contextPath}/resources/js/slide.js"></script>
<script type="text/javascript">

$(document).ready(function(){
    
    var width = $(window).width();
    	$(".ck-slide").width(width);
    	$(".ck-slide-wrapper").width(width);
    	$(".bannerImg").width(width);
    
    $('.ck-slide').ckSlide({
        autoPlay: true,//默认为不自动播放，需要时请以此设置
        dir: 'x',// 默认效果淡隐淡出，x为水平移动，y 为垂直滚动
        interval:8000//默认间隔2000毫秒
    });
    
    $(".parconli").click(function(){
    	var id = $(this).attr("data-id");
    	$(".pic > li").css("display","none");
    	$(".par > li").css("display","none");
    	$(".parcon > li").removeClass("current");
    	
    	$("#pic_"+id).css("display","block");
    	$("#par_"+id).css("display","block");
    	$("#parcon_"+id).addClass("current");
    	
    });
    
});

</script>
</html>