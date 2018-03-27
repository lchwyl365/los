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
			<a href="${contextPath}/front/t/index"><img src="${contextPath}/resources/theme/t/img/logo.png" /></a>
			<p>荣成市人和镇天宏石材厂</p>
			<p>专注天然石材加工</p>
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
		<div class="gsjj_nr">
			<c:if test="${childchannel.channelType == 'cover'}">
				${childchannel.content}
			</c:if>
			<c:if test="${childchannel.channelType == 'list'}">
				<ul class="xwlb_bj">
					<c:forEach items="${dataGridResult.rows}" var="item">
						<li>
							<c:if test="${item.thumbnail != null}">
							<h1><a href="${contextPath}/front/t/article/${item.articleId}"><img src="${contextPath}${item.thumbnail}"></a></h1>
							</c:if>
							<dl>
								<dt><a href="${contextPath}/front/t/article/${item.articleId}">${item.title}</a></dt>
								<dd>${item.description}...</dd>
								<span>日期：<fmt:formatDate value="${item.createtime}" type="date"/> </span>
								<span>阅读（${item.readCount}）</span>
							</dl>
						</li>
					</c:forEach>
				</ul>
				<div class="webdiyerCss">
				<c:if test="${dataGridResult.total > 0}">
					<pg:pager url="${contextPath}/front/t/channel/${childchannel.channelId}" items="${dataGridResult.total}" 
	                              export="currentPageNumber=pageNumber">
                        <pg:first>
                           <a href="${pageUrl}&pageNumber=${pageNumber}" disabled="disabled" style="margin-right:5px;">&lt;&lt;</a>
                        </pg:first>
                        <%-- <pg:prev>
                        	<a disabled="disabled" style="margin-right:5px;">&lt;</a>
                        </pg:prev> --%>
                        <pg:pages>
                            <c:choose>
                                <c:when test="${currentPageNumber == pageNumber}">
                                    <span class="redcss page_go" style="margin-right:5px;">${pageNumber}</span>
                                </c:when>
                                <c:otherwise>
                                	<a href="${pageUrl}&pageNumber=${pageNumber}" style="margin-right:5px;">${pageNumber}</a>
                                </c:otherwise>
                            </c:choose>
                        </pg:pages>
                       <%--  <pg:next>
                        	<a href="${pageUrl}&pageNumber=${pageNumber}" style="margin-right:5px;">&gt;</a>
                        </pg:next> --%>
                        <pg:last>
                            <a href="${pageUrl}&pageNumber=${pageNumber}" style="margin-right:5px;">&gt;&gt;</a>
                        </pg:last>
                    </pg:pager>
		        </c:if>
		        </div>
		    </c:if>
			
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
				<p>公司地址：${website.address}</p>
				<p>联系电话：${website.telphone}      电子邮件：${website.email}</p>
				<p>公司主营产品：${website.mainProduct}</p>
			</div>
			<div class="foot_ewm">
				<%-- <img src="${contextPath}/resources/theme/t/img/ewm.jpg"/> --%>
			</div>
		</div>	
		</div>
	</div>
</div>
<!---------------  foot end  ----------------->

</body>
</html>