<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
 <!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
<title>山东天宏石材-专注：中国棕，石岛红，紫晶钻，皇室啡，皇室珍珠，染色板，皇室啡，皇室棕钻，皇室玛瑙，皇室啡，皇室啡的研发生产，专业提供高品质的石岛红，紫晶钻，中国棕，皇室啡，皇室珍珠，染色板，荣成灰，皇室棕钻，皇室玛瑙，白麻，黄金麻等系列产品</title>
<meta name="keywords" content="中国棕，石岛红，紫晶钻，皇室啡，皇室珍珠，染色板，皇室啡，皇室棕钻，皇室玛瑙，皇室啡，皇室啡" />
<meta name="description" content="荣成市人和镇天宏石材厂自有大型石岛红矿山，集矿山开采，石材加工，销售于一体的石材企业，采用自动红外线切机，自动磨板机，全自动大切等先进设备生产的建筑用成品，半成品板材，做工精细，品质一流，深受业界好评。主营：中国棕，石岛红，紫晶钻，皇室啡，皇室珍珠，染色板，皇室珍珠，皇室棕钻，皇室玛瑙，皇室珍珠花岗岩，皇室珍珠干挂石材等系列产品。联系电话：13465102999，于总。" />
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/theme/t/css/index.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/theme/t/css/zym.css"/>
</head>
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
<!--关于我们-->
<div class="zy_gywm">
	<div class="ejdh">
		<div class="shang_g"></div>
		<div class="women">
			<div class="btmc">
				<p>${channel.channelName}</p>
			</div>
			<ul class="skb">
				<li style="background: #005bac; width: 25%;"></li>
				<li style="background: #ff8400; width: 20%;"></li>
				<li style="background: #d3d3d3; width: 55%;"></li>
			</ul>
		</div>
		<div class="zy_dh_lb">
			<ul>
				<c:forEach items="${childList}" var="item">
					<c:if test="${childchannel.channelId == item.channelId}">
						<li id="women"><img src="${contextPath}/resources/theme/t/img/zy1_08.png">
						<a id="wenzidangq" href="#">${item.channelName}</a></li>
					</c:if>
					<c:if test="${childchannel.channelId != item.channelId}">
						<li><img src="${contextPath}/resources/theme/t/img/zy1_08_z.png">
						<a href="${contextPath}/front/t/channel/${item.channelId}">${item.channelName}</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- <div class="touyin"></div> -->
	<div class="zynr_db">
		<div class="lujing">
			<h2>${childchannel.channelName}</h2>
			<p>您的位置：${channel.channelName}> ${childchannel.channelName}</p>
		</div>
		<ul class="skb" style="margin-bottom: 20px;">
			<li style="background: #005bac; width: 12%;"></li>
			<li style="background: #ff8400; width: 15%;"></li>
			<li style="background: #d3d3d3; width: 73%;"></li>
		</ul>

		<!--内容-->
		<!--内容-->
		<div class="gsjj_nr">
			<div class="al_biaoti">
				<h3>${article.title}</h3>
				<span>发布时间：<fmt:formatDate value="${article.createtime}" pattern="yyyy-MM-dd"/>　浏览次数：${article.readCount} 次　　</span>
			</div>
			<div class="xian_xw"></div>
			<div class="wzsm">
				${article.content}
			</div>
		    <div class="sx_pian">
				<c:if test="${preArticle != null }">
					上一篇：<a href="${contextPath}/front/t/article/${preArticle.articleId}">${preArticle.title}</a>
				</c:if>
				<c:if test="${afterArticle != null }">
					<br>
					下一篇：<a href="${contextPath}/front/t/article/${afterArticle.articleId}">${afterArticle.title}</a>
				</c:if>
		    </div>
		    <div class="fanhui">
				<a href="${contextPath}/front/t/channel/${article.channelId}"><img src="${contextPath}/resources/theme/t/img/fanhui_03.png"> <span>返回列表</span></a>
		    </div>
	    </div>
		
		
	</div>
</div>
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
			<div class="foot_ewm"><img src="${contextPath}/resources/theme/t/img/ewm.jpg"/></div>
		</div>	
		</div>
	</div>
</div>
<!---------------  foot end  ----------------->

</body>
</html>