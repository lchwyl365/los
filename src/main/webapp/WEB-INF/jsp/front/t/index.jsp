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
<meta charset="UTF-8">
<title>天宏首页</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/theme/t/css/zui.min.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/theme/t/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/theme/t/css/index.css"/>
</head>
<style type="text/css">

</style>
<body>
<!---------------  head  ----------------->
<div class="head">
	<div class="w logobox">
		<div class="logo">
			<a href=""><img src="${contextPath}/resources/theme/t/img/logo.png" /></a>
			<p>荣成市人和镇天宏石材厂</p>
			<p>近十年专注天然石材开采、加工经验</p>
		</div>
		<div class="head_contact">
			<em></em>
			<span>24小时客户服务热线</span>
			<p>177-6316-8888</p>
		</div>
	</div>
	<div class="nav">
		<div class="w">
			<ul>
				<c:forEach items="${channelList}" var="channel">
					<c:if test="${channel.channelId == '596188949908799'}">
						<li><a href="${contextPath}/index">${channel.channelName}</a></li>
					</c:if>
					<c:if test="${channel.channelId != '596188949908799'}">
						<li><em></em><a href="${contextPath}/front/t/channel/${channel.channelId}">${channel.channelName}</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<!---------------  head end  ----------------->

<!---------------  banner  ----------------->
<div class="banner">
	<div class="silder">
		<div class="flexslider">
			<ul class="slides">
				<c:forEach items="${bannerList}" var="banner">
					<li style="background: url(${contextPath}${banner.img}) 50% 0 no-repeat;"><a href="javascript:void(0);"></a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<!---------------  banner end  ----------------->

<!---------------  search  ----------------->
<div class="search">
	<div class="w cl">
		<div class="search_hot">
			<span>热门关键词：</span>
			<a href="">石英石石材</a>
			<a href="">石英石石材</a>
			<a href="">石英石石材</a>
			<a href="">石英石石材</a>
			<a href="">石英石石材</a>
			<a href="">石英石石材</a>
		</div>
		<div class="search_input">
			<input class="form-control search_text" type="text" placeholder="请输入搜索关键词">
			<button type="button" class="btn btn-primary">搜索</button>
		</div>
	</div>
</div>
<!---------------  search end  ----------------->

<!---------------  core product  ----------------->
<div class="core cl">
	<div class="w">
		<div class="title">
			<em></em><h2>核心产品</h2><span> /  Core product</span><i></i>
		</div>
		<div class="core_main">
			<ul>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg"/><span>皇室玛瑙<br />皇室钻棕</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg"/><span>皇室珍珠<br />系列</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg"/><span>皇室咖啡<br />系列</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg"/><span>皇室珍珠<br />系列</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg"/><span>皇室珍珠<br />系列</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg"/><span>皇室咖啡<br />系列</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg"/><span>皇室珍珠<br />系列</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg"/><span>皇室玛瑙<br />皇室钻棕</span></a></li>
			</ul>
		</div>
	</div>
</div>
<!---------------  core product end  ----------------->

<!---------------  hot product  ----------------->
<div class="product">
	<div class="w">
		<div class="pro_title">
			<h2>产品热销推荐</h2>
			<p>Recommend products sell like hot</p>
			<span></span>
		</div>
		<div class="pro_main">
			<ul>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img1.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img1.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img1.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img1.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg" alt="" /><span>大理石-米黄</span></a></li>
			</ul>
		</div>
	</div>
</div>
<!---------------  hot product end  ----------------->

<!---------------  why choose  ----------------->
<div class="choose">
	<div class="w">
		<div class="title">
			<em></em><h2>为什么选择天宏石材</h2><span> /  Why choose</span><i></i>
		</div>
		<div class="choose_main">
			<img src="${contextPath}/resources/theme/t/img/choose1.jpg"/>
			<img src="${contextPath}/resources/theme/t/img/choose2.jpg"/>
		</div>
	</div>
</div>
<!---------------  why choose end  ----------------->

<!---------------  case  ----------------->
<div class="case">
	<div class="w">
		<div class="title">
			<em></em><h2>案例鉴赏</h2><span> /  Engineering case</span><i></i>
		</div>
		<div class="case_main cl">
			<div class="case_box2">
				<div class="mod18Box">
					<div class="mod18">
						<span id="prev" class="btn prev"></span>
						<span id="next" class="btn next"></span>
						<span id="prevTop" class=" prev"></span>
						<span id="nextTop" class=" next"></span>
						<div id="picBox" class="picBox">
							<ul class="cf">
								<li><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a></li>
								<li><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a></li>
								<li><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a></li>
								<li><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a></li>
								<li><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a></li>
								<li><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a></li>
								<li><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a></li>
								<li><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a><a href=""><img src="${contextPath}/resources/theme/t/img/caseimg.jpg"/></a>/li>
							</ul>
						</div>
						
						<div id="listBox" class="listBox">
							<ul class="cf">
								<li class="on"><i class="arr2"></i><img width="215" height="147" src="${contextPath}/resources/theme/t/img/caseimg2.jpg" alt="" /></li>
								<li><i class="arr2"></i><img width="215" height="147" src="${contextPath}/resources/theme/t/img/caseimg2.jpg" alt="" /></li>
								<li><i class="arr2"></i><img width="215" height="147" src="${contextPath}/resources/theme/t/img/caseimg2.jpg" alt="" /></li>
								<li><i class="arr2"></i><img width="215" height="147" src="${contextPath}/resources/theme/t/img/caseimg2.jpg" alt="" /></li>
								<li><i class="arr2"></i><img width="215" height="147" src="${contextPath}/resources/theme/t/img/caseimg2.jpg" alt="" /></li>
								<li><i class="arr2"></i><img width="215" height="147" src="${contextPath}/resources/theme/t/img/caseimg2.jpg" alt="" /></li>
								<li><i class="arr2"></i><img width="215" height="147" src="${contextPath}/resources/theme/t/img/caseimg2.jpg" alt="" /></li>
								<li><i class="arr2"></i><img width="215" height="147" src="${contextPath}/resources/theme/t/img/caseimg2.jpg" alt="" /></li>
							</ul>
						</div>
						
					</div>

					</div>

			</div>
		</div>
	</div>
</div>
<!---------------  case end  ----------------->

<!---------------  about  ----------------->
<div class="about cl">
	<div class="w">
		<div class="title">
			<em></em><h2>关于天宏</h2><span> /  About Us</span><i></i>
		</div>
		<div class="about_main">
			<div class="about_left">
				<h2>荣成市人和镇天宏石材厂<a href=""></a></h2>
				<p>
					<c:choose>
						<c:when test="${fn:length(introduceChannel.description) > 300}">
							<c:out value="${fn:substring(introduceChannel.description, 0, 300)}" escapeXml="false" />......
						</c:when>
						<c:otherwise>
							<c:out value="${introduceChannel.description}"  escapeXml="false" />
						</c:otherwise>
					</c:choose>
				</p>
			</div>
			<div class="about_right"><img style="width:437px;" src="${contextPath}${introduceChannel.thumbnail}"/></div>
		</div>
	</div>
</div>
<!---------------  about end  ----------------->
<style type="text/css">

</style>
<!---------------  news  ----------------->
<div class="news">
	<div class="w">
		<div class="title">
			<em></em><h2>新闻中心</h2><span> /  News center</span><i></i>
		</div>
		<div class="news_main">
			<div class="news_box news_right">
				<div class="news_title"><em></em><span>天宏石材最新动态</span><a href="">+MORE</a></div>
				<div class="hot_img"><img src="${contextPath}/resources/theme/t/img/newsimg.jpg"/></div>
				<div class="news_list">
					<ul>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
					</ul>
				</div>
			</div>
			<div class="news_box news_right">
				<div class="news_title"><em></em><span>天宏石材最新动态</span><a href="">+MORE</a></div>
				<div class="hot_img"><img src="${contextPath}/resources/theme/t/img/newsimg.jpg"/></div>
				<div class="news_list">
					<ul>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
					</ul>
				</div>
			</div>
			<div class="news_box">
				<div class="news_title"><em></em><span>天宏石材最新动态</span><a href="">+MORE</a></div>
				<div class="hot_img"><img src="${contextPath}/resources/theme/t/img/newsimg.jpg"/></div>
				<div class="news_list">
					<ul>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
						<li><em></em><a href="">2016年石岛红石材新景象</a><span>[2017-06-17]</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!---------------  news end  ----------------->

<!---------------  link  ----------------->
<div class="link">
	<div class="w">
		<div class="link_main">
			<ul>
				<li><a href="">皇室啡室内装饰石材</a></li>
				<li><a href="">石岛红花岗岩外墙干挂石材</a></li>
				<li><a href="">山东皇室珍珠石材</a></li>
				<li><a href="">紫晶钻石材厂家</a></li>
				<li><a href="">中国棕石材厂家</a></li>
				<li><a href="">皇室棕石材厂家</a></li>
				<li><a href="">皇室啡珠花岗岩厂家</a></li>
				<li><a href="">皇室棕钻石材厂家</a></li>
			</ul>
		</div>
	</div>
</div>
<!---------------  link end  ----------------->

<!---------------  foot  ----------------->
<div class="foot">
	<div class="w">
		<div class="foot_nav">
			<a href="">首页</a>
			<a href="">厂家简介</a>
			<a href="">天然石材</a>
			<a href="">新闻中心</a>
			<a href="">建筑案例</a>
			<a href="">矿山风貌</a>
			<a href="">服务体系</a>
			<a href="">联系我们</a>
		</div>
		<div class="foot_main">
			<div class="foot_logo"><img src="${contextPath}/resources/theme/t/img/logo.png"/></div>
			<div class="foot_p">
				<p>皇室啡外墙干挂石材，皇室啡室内装饰石材</p>
				<p>公司地址：山东省荣成市人和镇天宏石材厂。</p>
				<p>联系电话：17763168888      电子邮件：189651909@qq.com</p>
				<p>公司主营产品：国产皇室啡石材，山东皇室啡，皇室啡矿山，皇室啡花岗岩、皇室啡石材，皇室啡石材价格。新皇室啡花岗岩，皇室啡石材图片</p>
			</div>
			<div class="foot_ewm"><img src="${contextPath}/resources/theme/t/img/ewm.jpg"/></div>
		</div>	
		</div>
	</div>
</div>
<!---------------  foot end  ----------------->

<script src="${contextPath}/resources/theme/t/js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/resources/theme/t/js/zui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/resources/theme/t/js/mod.js" type="text/javascript" charset="utf-8"></script>
<!-------  banner js  -------->
<script src="${contextPath}/resources/theme/t/js/jquery.flexslider-min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.flexslider').flexslider({
		directionNav: true,
		pauseOnAction: false
	});
});
</script>
</body>
</html>