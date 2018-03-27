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
	.news-item p img{
		width:90%;
		margin:10px auto;
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
	.news-time{
		font-size:14px;
		padding:10px;
	}
	.news-time i{
		margin-right:8px;
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
		border:0px;
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
                <p class="phone-num">${website.telphone}</p>
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
        <div class="row news-item">
			<h2>${article.title}</h2>
			<div class="row news-time">
				<div class="col-xs-6">
					<i class="fa fa-calendar"></i><fmt:formatDate value="${article.createtime}" pattern="yyyy-MM-dd"/>
				</div>
				<div class="col-xs-6">
					<a href="tel:${website.telphone}"><i class="fa fa-phone-square"></i>电话咨询</a>
				</div>
			</div>
			<p>
				${article.content}
			</p>
			<div class="row">
				<c:if test="${preArticle != null }">
					上一篇：<a href="${contextPath}/front/t/moarticle/${preArticle.articleId}">${preArticle.title}</a>
				</c:if>
				<c:if test="${afterArticle != null }">
					<br/>
					下一篇：<a href="${contextPath}/front/t/moarticle/${afterArticle.articleId}">${afterArticle.title}</a>
				</c:if>
		    </div>
		</div>
        <div class="row contact-info" >
				<p>地址:${website.address}</p>
				<p>技术支持:山东创服信息技术有限公司</p>
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

    
    </script>
  </body>
</html>