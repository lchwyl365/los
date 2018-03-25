<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>首页</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="http://at.alicdn.com/t/font_598640_c61hk6pc1kcyds4i.css" rel="stylesheet">
    <style type="text/css">  
    *{
        margin: 0;
        padding: 0;
    }
    body{
        font: 12px/1.5 tahoma, arial, Microsoft YaHei, sans-serif;
        background-color: #f0f0f0;
    }
    li{
        list-style: none;
    }
    img{
        display: block;
        border: none;
    }
    label{
        cursor: pointer;
    }
    input[type='checkbox']{
        cursor: pointer;
    }
    body a, body a:focus, body a:hover {
        text-decoration: none;
    }
    .row{
        margin: 0px;
    }
    .col-xs-6{
        padding: 0px;
    }
     #page-wrapper{
        width:100%;
     }
     .phone-bar{
        position: relative;
        overflow: hidden;
        margin:20px 0px;
        padding-left:36px;
        background-color: #F74D62;
        color: #fff;
        border-radius: 5px;        
        width: 170px;
     }
     .phone-bar p{
        margin: 0px;
     }
     .phone-icon{
        position: absolute;
        top: 2px;
        left: 5px;
        width: 30px;
        height: 32px;
        font-size: 26px;
     }
     .phone-title{
        font-size:11px;
     }
     .phone-num{
        font-size:16px;
        font-weight: 400;
     }
     .menu-bar{
        overflow: hidden;
        margin:0px;
     }
     .menu-bar li{
        float: left;
        background-color: #333439;
        overflow: hidden;
        height: 44px;
        line-height: 44px;
        width: 25%;
        text-align: center;
        border-left: 1px solid #696A6C;
     }
     .menu-bar>li>a{
        font-size: 16px;
        color:#fff;
     }
     .product-wapper{
        width:90%;
        margin:0px auto;
        height:250px;
        background-color:#FFF;
        margin-top:-80px;
        box-shadow: 0 2px 4px 0 rgba(7, 17, 27, 0.1);
        border-radius: 8px;
        padding-left: 10px;
        padding-top: 15px;
        margin-bottom:15px;
     }
     .product-wapper .col-xs-3{
        padding: 0px;
        padding-right: 10px;
     }
     .product-wapper p{
        text-align: center;
     }
     .product-item{
     	position: relative;
        width:90%;
        margin:20px auto;
        height:258px;
        background-color:#FFF;
        box-shadow: 5px 5px 10px rgba(7, 17, 27, 0.2);
        border-radius: 8px;  
    }
    .mt80{
    	margin-top:-80px;
    }
    .product-item-title{
        font-size: 24px;
        text-align: center;
        border-bottom: 1px solid #E74A5E;
        background-color: #2B2C34;
        color: #FFF;
        border-top-right-radius: 8px;
        border-top-left-radius: 8px;
    }
    .product-item-phone{
    	border-bottom-right-radius: 8px;
    	border-bottom-left-radius: 8px;
    	position: absolute;
    	bottom: 0px;
    	left:0px;
    	right:0px;
    	background-color: #F74D62;
    	padding: 8px;
    }
    .product-item-phone h2{
		color: #FFF;
		text-align: center;
		margin: 0px;
		font-size: 22px;
    }
    .product-item-phone h2 a{ color:#FFF; }
    .product-item-content{
    	padding: 10px;
    }
    .product-item-content img{ height: 160px; width: 160px;}
    .product-item-content p{ font-size: 14px;font-weight:400;}
    .info-item{
    	padding: 30px 0px 20px;
    }
    .info-item p{
    	font-size: 14px;
    }
    .fontImg{
    	border:2px solid #F7485D;
		padding: 8px 10px;
    }
    .fontImg p{
    	font-size: 34px;
    	line-height: 40px;
    	text-align: center;
    	color: #F7485D;
    	margin: 0px;
    	padding: 0px;
    }
    .info-item h3{
    	margin: 10px 0px;
    }
	.mt15{
		margin-top: 15px;
	}
	.mt20{
		margin-top: 20px;
	}
	.mt30{
		margin-top: 30px;
	}
	.inst-item{
		padding:10px;
	}
	.inst-item div{
		padding: 10px;
	}
	.news-item{
		padding: 10px 20px;
		background-color: #FFF;
	}
	.news-item h2{
		margin:10px 10px;
		font-size:24px; 
		border-left: 5px solid #242424;
		padding: 0px 10px;
	}
	.news-item li{
		border-bottom: 2px dashed #7E7F82;
		padding: 10px;
		font-size: 16px;
	}
	.news-item li a{
		font-size: 16px;
		border-left: 5px solid #F74D62;
		padding-left: 10px;
	}
	.contact-info{
		height:160px;background-color: #232530;color:#FFF;text-align: center;
		font-size: 16px;
	}
	.carousel-control{
		padding-top: 100px;
	}
    </style>  
  </head>
  <body>
    <div id="page-wrapper">
        <div class="row" style="background-color: #FFF;">
          <div class="col-xs-6">
              <img src="${contextPath}/resources/images/tianhong/home_01.png" style="width:160px;margin-top: 20px;margin-left: 10px;">
          </div>
          <div class="col-xs-6">
            <div class="phone-bar">
                <i class="iconfont icon-dianhua phone-icon" ></i>
                <p class="phone-title">24小时客户服务热线</p>
                <p class="phone-num">134-6510-2999</p>
            </div>
          </div>
        </div>
        <div class="row">
            <ul class="menu-bar">
                <li><a href="${contextPath}/front/t/mohome">首页</a></li>
                <li><a href="${contextPath}/front/t/mochannel/596189879568725">厂家简介</a></li>
                <li><a href="${contextPath}/front/t/mochannel/596190358348736">产品中心</a></li>
                <li><a href="${contextPath}/front/t/mochannel/596191211738751">建筑案例</a></li>
            </ul>
        </div>
        
        <div class="row">
            <div id="myCarousel" class="carousel slide">
			    <!-- 轮播（Carousel）指标 -->
			    <ol class="carousel-indicators">
			        <c:forEach items="${bannerList}" var="banner" varStatus="status">
			    		<c:if test="${status.index == 0}">
           					<li data-target="#myCarousel" data-slide-to="${status.index}" class="active"></li>
           				</c:if>
           				<c:if test="${status.index != 0}">
           					<li data-target="#myCarousel" data-slide-to="${status.index}"></li>
           				</c:if>
					</c:forEach>
			    </ol>   
			    <!-- 轮播（Carousel）项目 -->
			    <div class="carousel-inner">
			    	<c:forEach items="${bannerList}" var="banner" varStatus="status">
			    		<c:if test="${status.index == 0}">
           					<div class="item active"><img src="${contextPath}${banner.img}" /></div>
           				</c:if>
           				<c:if test="${status.index != 0}">
           					<div class="item"><img src="${contextPath}${banner.img}" /></div>
           				</c:if>
					</c:forEach>
			    </div>
			    <!-- 轮播（Carousel）导航 -->
			    <a class="carousel-control left" href="#myCarousel" 
			        data-slide="prev">&lsaquo;
			    </a>
			    <a class="carousel-control right" href="#myCarousel" 
			        data-slide="next">&rsaquo;
			    </a>
			</div>
            
            
        </div>
        <div class="row">
            <img src="${contextPath}/resources/images/tianhong/channel01.gif" style="width: 100%">
            <div style="height:80px;background-color:#333439;"></div>
            <div class="product-wapper" >
            	<c:forEach items="${productChannelList}" var="channel">
            		<div class="col-xs-3">
            		<a href="${contextPath}/front/t/mochannel/${channel.channelId}">
						<img src="${contextPath}${channel.thumbnail}" style="width: 100%;height:74px;" />
						<p>
						<c:set var="xindex" value='${fn:indexOf(channel.channelName, "系列")}' />
						<c:choose>
							<c:when test="${xindex != -1}">
								<c:out value="${fn:substring(channel.channelName, 0, xindex)}" /><br>系列
							</c:when>
							<c:otherwise>
								<c:out value="${channel.channelName}" />
							</c:otherwise>
						</c:choose>
						</p>
					</a>	
	                </div>
            	</c:forEach>
            </div>
        </div>
        <div class="row">
            <img src="${contextPath}/resources/images/tianhong/channel_hot.png" style="width: 100%">
            <div style="height:80px;background-color:#333439;"></div>
            
            <c:forEach items="${channelArtList}" var="channelArt" varStatus="status">
					
			<c:if test="${status.index == 0}">
				<div class="product-item mt80" >
			</c:if>
			<c:if test="${status.index != 0}">
				<div class="product-item" >
			</c:if>	
					<a href="${contextPath}/front/t/moarticle/${channelArt.articleId}">
		                <div class="product-item-title">${channelArt.title}</div>
		                <div class="product-item-content">
							<div class="col-xs-6">
								<img src="${contextPath}${channelArt.thumbnail}" alt="" style="height:160px;width:160px;"/>
							</div>
							<div class="col-xs-6" >
								<p>
									&nbsp;&nbsp;${channelArt.description}
								</p>
							</div>
		                </div>
	                </a>
	                <div class="product-item-phone">
	                	<h2><a href="tel:13465102999">立刻拨打电话询价</a></h2>
	                </div>
	            </div>
			</c:forEach>

        </div>

        <div class="row">
            <img src="${contextPath}/resources/images/tianhong/channel_why.png" style="width: 100%">
            <div class="row info-item">
                <div class="col-xs-4">
					<div class="fontImg">
						<p>产品</p>
						<p>优势</p>
					</div>
                </div>
                <div class="col-xs-8">
					<h3>自有矿山，储备充足！</h3>
					<p>
						位于天然石材优质矿区,拥有天然石材专用存储仓库,满足您的供应需求。
					</p>
                </div>
            </div>
            <img src="${contextPath}/resources/images/tianhong/info01.png" alt="" style="width: 100%">
            <div class="row info-item">
            	<div class="col-xs-8">
					<h3>严格检测，精益求精！</h3>
					<p>
						天宏石材所生产和加工的石材均经过严格的质检车间及国家权威部门的检测，将您的担心的质量问题扼杀在萌芽状态！
					</p>
                </div>
                <div class="col-xs-4">
					<div class="fontImg mt15">
						<p>生产</p>
						<p>优势</p>
					</div>
                </div>
            </div>
            <div class="row info-item">
                <div class="col-xs-4">
					<div class="fontImg mt30">
						<p>诚信</p>
						<p>优势</p>
					</div>
                </div>
                <div class="col-xs-8">
					<h3>百度信誉认证企业，诚信第一！</h3>
					<p>
						做事先做人，诚信第一，天宏石材自建长以来始终本着精益求精，诚信为本的经营理念为广大新老客户提供专业、迅速、高效的产品于服务，得到了各界客户的认可与赞许！
					</p>
                </div>
            </div>
            <img src="${contextPath}/resources/images/tianhong/info02.png" alt="" style="width: 100%">
			<div class="row info-item">
            	<div class="col-xs-8">
					<h3>厂家直销取消代理环节，让利终端市场！</h3>
					<p>
						为了让利终端市场，天宏石材全部严格实施厂家直营，让利终端的政策，保证了品牌影响力提升了产品质量与服务水平，让您赚更多的钱，省更多的心！
					</p>
                </div>
                <div class="col-xs-4">
					<div class="fontImg mt15">
						<p>节省</p>
						<p>优势</p>
					</div>
                </div>
            </div>
            <div class="row info-item">
                <div class="col-xs-4">
					<div class="fontImg mt30">
						<p>服务</p>
						<p>优势</p>
					</div>
                </div>
                <div class="col-xs-8">
					<h3>近十年无产品质量投诉100%客户满意口碑！</h3>
					<p>
						天宏石材自建厂以来始终坚持对产品质量的严格检验，目前保持了近十年无客户质量投诉，使我们的产品得到了各领域客户的高度认可！
					</p>
                </div>
            </div>
            <img src="${contextPath}/resources/images/tianhong/channel_demo.png" alt="" style="width: 100%">
            <div class="row inst-item">
            	 <c:forEach items="${caseList}" var="caseArt" varStatus="st">
				    <div class="col-xs-6">
				   		<a href="${contextPath}/front/t/moarticle/${caseArt.articleId}">
							<img src="${contextPath}${caseArt.thumbnail}" alt="" style="width: 100%;width:177px;height:132px" />
						</a>
	                </div>
				 </c:forEach>
            </div>
            <img src="${contextPath}/resources/images/tianhong/channel_new.png" alt="" style="width: 100%">
			<div class="row news-item">
				<h2>新闻中心</h2>
				<ul>
					<c:forEach items="${companyArticleList}" var="companyArt" varStatus="st">
					   <li><a href="${contextPath}/front/t/moarticle/${companyArt.articleId}">
					   		<c:choose>
							<c:when test="${fn:length(companyArt.title) > 16}">
								<c:out value="${fn:substring(companyArt.title, 0, 16)}......" escapeXml="false" />
							</c:when>
							<c:otherwise>
								<c:out value="${companyArt.title}"  escapeXml="false" />
							</c:otherwise>
						</c:choose>
					   </a></li>
					 </c:forEach>
				</ul>
			</div>
        </div>
        <div class="row contact-info" >
				<h3>产品咨询热线</h3>
				<p>地址:山东省荣成市人和镇东邵家山石材工业园</p>
				<p>技术支持:山东创服信息技术有限公司</p>
			</div>
        </div>
        <div class="row">
            <ul class="menu-bar">
                <li><a href="${contextPath}/front/t/mohome">首页</a></li>
                <li><a href="${contextPath}/front/t/mochannel/596189879568725">厂家简介</a></li>
                <li><a href="${contextPath}/front/t/mochannel/596190358348736">产品中心</a></li>
                <li><a href="${contextPath}/front/t/mochannel/596191211738751">建筑案例</a></li>
            </ul>
    	</div>
 
    </div>
    

    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	$('.carousel').carousel();
    })
    
    </script>
  </body>
</html>