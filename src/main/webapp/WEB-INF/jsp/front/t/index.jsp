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
<title>山东天宏石材-专注：中国棕，石岛红，紫晶钻，皇室啡，皇室珍珠，染色板，皇室啡，皇室棕钻，皇室玛瑙，皇室啡，皇室啡的研发生产，专业提供高品质的石岛红，紫晶钻，中国棕，皇室啡，皇室珍珠，染色板，荣成灰，皇室棕钻，皇室玛瑙，白麻，黄金麻等系列产品</title>
<meta name="keywords" content="中国棕，石岛红，紫晶钻，皇室啡，皇室珍珠，染色板，皇室啡，皇室棕钻，皇室玛瑙，皇室啡，皇室啡" />
<meta name="description" content="荣成市人和镇天宏石材厂自有大型石岛红矿山，集矿山开采，石材加工，销售于一体的石材企业，采用自动红外线切机，自动磨板机，全自动大切等先进设备生产的建筑用成品，半成品板材，做工精细，品质一流，深受业界好评。主营：中国棕，石岛红，紫晶钻，皇室啡，皇室珍珠，染色板，皇室珍珠，皇室棕钻，皇室玛瑙，皇室珍珠花岗岩，皇室珍珠干挂石材等系列产品。联系电话：13465102999，于总。" />
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
			<a href="${contextPath}/front/t/index"><img src="${contextPath}/resources/theme/t/img/logo.png" /></a>
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
<!-- 
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
</div> -->
<!---------------  search end  ----------------->

<!---------------  core product  ----------------->
<div class="core cl">
	<div class="w">
		<div class="title">
			<em></em><h2>核心产品</h2><span> /  Core product</span><i></i>
		</div>
		<div class="core_main">
			<ul>
			<c:forEach items="${productChannelList}" var="channel">
				<li><a href="${contextPath}/front/t/channel/${channel.channelId}">
					<img src="${contextPath}${channel.thumbnail}"/>
					<span>
					<c:set var="xindex" value='${fn:indexOf(channel.channelName, "系列")}' />
					<c:choose>
						<c:when test="${xindex != -1}">
							<c:out value="${fn:substring(channel.channelName, 0, xindex)}" /><br>系列
						</c:when>
						<c:otherwise>
							<c:out value="${channel.channelName}" />
						</c:otherwise>
					</c:choose>
					
					</span></a>
				</li>
			</c:forEach>
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
			<c:forEach items="${channelArtList}" var="channelArt" varStatus="st">
				<li><a href="${contextPath}/front/t/article/${channelArt.articleId}">
					<img src="${contextPath}${channelArt.thumbnail}" alt="" /><span>${channelArt.title}</span></a></li>
			</c:forEach>
				<%-- <li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img1.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img1.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img1.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img1.jpg" alt="" /><span>大理石-米黄</span></a></li>
				<li><a href=""><img src="${contextPath}/resources/theme/t/img/img.jpg" alt="" /><span>大理石-米黄</span></a></li> --%>
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
								<c:forEach items="${mapList}" var="caseArt" varStatus="st">
									<li>
									<c:forEach items="${caseArt.imgList}" var="item">
										<a href=""><img style="width: 296px;height:259px" src="${contextPath}${item}"/></a>
									</c:forEach>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div id="listBox" class="listBox">
							<ul class="cf">
								<c:forEach items="${mapList}" var="caseArt" varStatus="st">
									<c:if test="${!st.first}">  
								     <li><i class="arr2"></i>
								     	<img width="215" height="147" src="${contextPath}${caseArt.thumbnail}" alt="" />
								     </li>
								    </c:if>  
								    <c:if test="${st.first}">  
								     <li class="on"><i class="arr2"></i>
								     	<img width="215" height="147" src="${contextPath}${caseArt.thumbnail}" alt="" />
								     </li>
								    </c:if>  
								</c:forEach>
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
				<h2>荣成市人和镇天宏石材厂<a href="${contextPath}/front/t/channel/596189879568725"></a></h2>
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
				<div class="news_title"><em></em><span>公司新闻</span><a href="${contextPath}/front/t/channel/596190729418742">+MORE</a></div>
				<%-- <div class="hot_img"><img src="${contextPath}/resources/theme/t/img/newsimg.jpg"/></div> --%>
				<div class="news_list">
					<ul>
					 <c:forEach items="${companyArticleList}" var="companyArt" varStatus="st">
					   <li><em></em><a href="${contextPath}/front/t/article/${companyArt.articleId}">
					   		<c:choose>
								<c:when test="${fn:length(companyArt.title) > 14}">
									<c:out value="${fn:substring(companyArt.title, 0, 14)}......" escapeXml="false" />
								</c:when>
								<c:otherwise>
									<c:out value="${companyArt.title}"  escapeXml="false" />
								</c:otherwise>
							</c:choose>
					   		</a>
						   <span>[<fmt:formatDate value="${companyArt.createtime}" pattern="yyyy-MM-dd"/>]</span></li>
					 </c:forEach>
					</ul>
				</div>
			</div>
			<div class="news_box news_right">
				<div class="news_title"><em></em><span>行业信息</span><a href="${contextPath}/front/t/channel/599899530688725">+MORE</a></div>
				<div class="news_list">
					<ul>
					<c:forEach items="${industryList}" var="industryArt" varStatus="st">
					   <li><em></em><a href="${contextPath}/front/t/article/${industryArt.articleId}">
					   		<c:choose>
								<c:when test="${fn:length(industryArt.title) > 14}">
									<c:out value="${fn:substring(industryArt.title, 0, 14)}......" escapeXml="false" />
								</c:when>
								<c:otherwise>
									<c:out value="${industryArt.title}"  escapeXml="false" />
								</c:otherwise>
							</c:choose>
					   		</a>
						   <span>[<fmt:formatDate value="${industryArt.createtime}" pattern="yyyy-MM-dd"/>]</span></li>
					 </c:forEach>
					</ul>
				</div>
			</div>
			<div class="news_box">
				<div class="news_title"><em></em><span>技术支持</span><a href="${contextPath}/front/t/channel/599919071288713">+MORE</a></div>
				<%-- <div class="hot_img"><img src="${contextPath}/resources/theme/t/img/newsimg.jpg"/></div> --%>
				<div class="news_list">
					<ul>
					<c:forEach items="${technologyList}" var="technologyArt" varStatus="st">
					   <li><em></em><a href="${contextPath}/front/t/article/${technologyArt.articleId}">
					   		<c:choose>
								<c:when test="${fn:length(technologyArt.title) > 14}">
									<c:out value="${fn:substring(technologyArt.title, 0, 14)}......" escapeXml="false" />
								</c:when>
								<c:otherwise>
									<c:out value="${technologyArt.title}"  escapeXml="false" />
								</c:otherwise>
							</c:choose>
					   	</a>
						   <span>[<fmt:formatDate value="${technologyArt.createtime}" pattern="yyyy-MM-dd"/>]</span></li>
					 </c:forEach>
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
			<c:forEach items="${friendlyLinks}" var="link" varStatus="st">
				<li><a href="${link.url}">${link.name}</a></li>
			</c:forEach>
			</ul>
		</div>
	</div>
</div>
<!---------------  link end  ----------------->

<!---------------  foot  ----------------->
<div class="foot">
	<div class="w">
		<div class="foot_nav">
		<c:forEach items="${channelList}" var="channel">
			<c:if test="${channel.channelId == '596188949908799'}">
				<a href="${contextPath}/index">${channel.channelName}</a>
			</c:if>
			<c:if test="${channel.channelId != '596188949908799'}">
				<a href="${contextPath}/front/t/channel/${channel.channelId}">${channel.channelName}</a>
			</c:if>
		</c:forEach>
		</div>
		<div class="foot_main">
			<div class="foot_logo"><img src="${contextPath}/resources/theme/t/img/logo.png"/></div>
			<div class="foot_p">
				<p>皇室啡外墙干挂石材，皇室啡室内装饰石材</p>
				<p>公司地址：山东省荣成市人和镇天宏石材厂。</p>
				<p>联系电话：17763168888      电子邮件：189651909@qq.com</p>
				<p>公司主营产品：国产皇室啡石材，山东皇室啡，皇室啡矿山，皇室啡花岗岩、皇室啡石材，皇室啡石材价格。新皇室啡花岗岩，皇室啡石材图片</p>
			</div>
			<div class="foot_ewm">
				<%-- <img src="${contextPath}/resources/theme/t/img/ewm.jpg"/> --%>
			</div>
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