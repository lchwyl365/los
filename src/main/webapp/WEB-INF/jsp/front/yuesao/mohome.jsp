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
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/fonts/iconfont.css">
    <style type="text/css">  
    *{
        margin: 0;
        padding: 0;
    }
    body{
        font: 12px/1.5 Microsoft YaHei,tahoma, arial, sans-serif;
        background-color: #fff;
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
        max-width: 677px;
        margin:0 auto;
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
     }
     .menu-bar li{
        float: left;
        background-color: #E64CA4;
        overflow: hidden;
        height: 40px;
        line-height: 40px;
        width: 20%;
        text-align: center;
        border-left: 1px solid #FFFFFF;
     }
     .menu-bar>li>a{
        font-size: 16px;
        color:#fff;
     }
     .product-wapper{
        width:90%;
        margin:0px auto;
        height:240px;
        background-color:#FFF;
        box-shadow: 0 2px 4px 0 rgba(7, 17, 27, 0.1);
        border-radius: 8px;
        padding-left: 10px;
        padding-top: 15px;
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
		border-bottom: 1px dashed #7E7F82;
		padding: 8px;
		font-size: 14px;
	}
	.news-item li a{
		font-size: 14px;
		border-left: 4px solid #F74D62;
		padding-left: 10px;
	}
    .news-item li i{
        font-size: 13px;
        font-style:normal;
        float: right;
    }
	.contact-info{
        padding: 15px;
		height:90px;
        background-color: #D8298E;
        color:#FFF;
        text-align: center;
		font-size: 14px;
	}
    .banner-title{
        text-align: center;
        background-color: #C32481;
        color:#FFF;
        font-size: 18px;
        line-height: 32px;
    }
    .row-title{
        height:32px;
        line-height:32px;
        background-color:#F166B7;
        color:#FFF;
        text-align: center;
        font-size:16px;
        margin-top: 5px;
    }
    .service-item{
        text-align: center;
        border: 1px solid #FC7571;
        border-radius: 4px;
        background-color: #FFF3F7;
        color: #FC7571;
    }
    .service-wapper{
        margin:0px auto;
        background-color:#FFF;
        padding: 5px;
     }
     .service-wapper .col-xs-3{
        padding: 5px;
     }
     .service-wapper p{
        text-align: center;
     }
     .iconfont{
        font-size: 36px;
        color: #FC7571;
     }
     .employee-item{
        text-align: center;
        color: #FC7571;
    }
    .apply-form{
        padding: 20px 40px;
        background-color: #FFD3E0;
    }
    .carousel-control{
    	padding-top: 15%;
    }
    .subtitle{
    	background: #C189A2;line-height:34px;width:100%;height:34px;text-align: center;font-size:14px;color:#FFF;
    }
    </style>  
  </head>
  <body>
    <div id="page-wrapper">
        <div class="row banner-title">
            	我的店面
        </div>
        <div class="row" style="background-color: #FFF;">
          <div class="col-xs-4" style="background-color: #E64CA4;width:30%;padding: 0px;">
            <div style="height:80px;padding: 0px;overflow: hidden;" >
              <img src="${contextPath}/resources/images/yuesao/logo.jpg" style="height:70px;margin-top:5px;padding-left:5px;" />
            </div>
          </div>
          <div class="col-xs-4" style="background-color: #F3ACCA;width:35%;padding: 0px;border-left: 1px solid #fff;">
            <div style="height:80px;">
                <div style="height:46px;" ><img src="${contextPath}/resources/images/yuesao/slogan.jpg" style="height:40px;" /></div>
                <div class="subtitle">责任+爱心</div>
            </div>
          </div>
          <div class="col-xs-4" style="background-color: #F3ACCA;width:35%;padding: 0px;border-left: 1px solid #fff;">
            <div style="height:80px;">
				<div style="height:46px;overflow: hidden;" >
					<img src="${contextPath}/resources/images/yuesao/tel.jpg" style="height:40px;float:left;margin-left:-5px;" />
					<span style="float:right;line-height:46px;font-size:14px;color:#fff;margin-right:3px;">${website.telphone}</span>
				</div>
                <div class="subtitle">联系我们</div>
            </div>
          </div>
        </div>
        <div class="row" style="margin-top: 5px;">
            <ul class="menu-bar">
            <c:forEach items="${channelList}" var="channel">
            	<c:if test="${channel.channelId == '92128214208194'}">
						<li><a href="${contextPath}/front/yuesao/mohome">${channel.channelName}</a></li>
					</c:if>
					<c:if test="${channel.channelId != '92128214208194'}">
						<li><a href="${contextPath}/front/yuesao/mochannel/${channel.channelId}">${channel.channelName}</a></li>
					</c:if>
			</c:forEach>
            </ul>
        </div>
        <div class="row">
            <!-- <img src="images/tianhong/banner.gif" style="width: 100%"> -->
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
            <div class="row-title">
                -- 服务范围 --
            </div>
            <div class="service-wapper" >
                <div class="col-xs-3">
                    <div class="service-item">
                        <i class="iconfont icon-home"></i>
                        <p>母婴生活护理</p>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="service-item">
                        <i class="iconfont icon-yanglaoguihua"></i>
                        <p>居家养老服务</p>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="service-item">
                        <i class="iconfont icon-richangbaoji01"></i>
                        <p>家政服务</p>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="service-item">
                        <i class="iconfont icon-yuying01"></i>
                        <p>育婴服务</p>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="service-item">
                        <i class="iconfont icon-usermd"></i>
                        <p>医院陪护服务</p>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="service-item">
                        <i class="iconfont icon-rengongbaojie"></i>
                        <p>专业保洁服务</p>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="service-item">
                        <i class="iconfont icon-xingxing"></i>
                        <p>厨嫂服务</p>
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="service-item">
                        <i class="iconfont icon-jiaoyu"></i>
                        <p>家教型家政服务</p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="row-title">
                -- 技师团队 --
            </div>
            <div class="service-wapper" >
            <c:forEach items="${jishiList}" var="jishiArt" varStatus="st">
			   <div class="col-xs-3">
                    <div class="employee-item">
                    	<a href="${contextPath}/front/yuesao/moarticle/${jishiArt.articleId}">
	                        <img src="${contextPath}${jishiArt.thumbnail}" style="width:100%;height:121px;">
	                        <p>${jishiArt.title}</p>
                        </a>
                    </div>
                </div>
			 </c:forEach>
            </div>
        </div>

        <div class="row">
            <div class="row-title">
                -- 月嫂团队 --
            </div>
            <div class="service-wapper" >
            <c:forEach items="${yuesaoList}" var="yuesaoArt" varStatus="st">
			   <div class="col-xs-3">
                    <div class="employee-item">
                    	<a href="${contextPath}/front/yuesao/moarticle/${yuesaoArt.articleId}">
	                        <img src="${contextPath}${yuesaoArt.thumbnail}" style="width:100%;height:121px;">
	                        <p>${yuesaoArt.title}</p>
                        </a>
                    </div>
                </div>
			 </c:forEach>
            </div>
        </div>

        <div class="row">            
            <div class="row-title">
                -- 服务案例 --
            </div>
            <div class="service-wapper" style="overflow:hidden;">
            <c:forEach items="${caseList}" var="caseArt" varStatus="st">
               <div class="col-xs-3">
                    <div class="employee-item">
                    	<a href="${contextPath}/front/yuesao/moarticle/${caseArt.articleId}">
                        	<img src="${contextPath}${caseArt.thumbnail}" style="width:100%;height:121px;">
                        </a>
                    </div>
                </div>
		   </c:forEach>
            </div>
        </div>

        <div class="row">
            <div class="row-title">
                -- 常见问题 --
            </div>
			<div class="row news-item">
				<ul>
			<c:forEach items="${questList}" var="questArt" varStatus="st">
               <li><a href="${contextPath}/front/yuesao/moarticle/${questArt.articleId}">
               			${questArt.title}</a><i><fmt:formatDate value="${questArt.createtime}" pattern="yyyy-MM-dd"/></i>
               	</li>
		    </c:forEach>
				</ul>
			</div>
        </div>
        <div class="row">
            <div class="row-title">
                -- 申请加盟 --
            </div>
            <div class="row">
                <div class="apply-form">
                    <form>
                      <div class="input-group" style="margin-top: 10px;">
                        <input type="text" class="form-control" id="username" placeholder="您的尊称Name">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        </span>
                      </div>
                      <div class="input-group" style="margin-top: 10px; margin-bottom: 10px;">
                        <input type="text" class="form-control" id="telphone" placeholder="您的电话Phone">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
                        </span>
                      </div>
                      <button type="button" class="btn btn-default" style="width: 49%;">提交申请</button>
                      <button type="button" class="btn btn-warning" style="width: 49%;">清空重填</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="row contact-info" >
			<p>Copyright 2018 我的店面 版权所有</p>
			<p>技术支持:山东创服信息技术有限公司</p>
        </div>
    </div>
    
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	$('.carousel').carousel();
    	
    	/* if(IsPC()){
    		window.location.href = "http://www.rctianhong.com";
    	} */
    	$(".btn-default").bind('click',function(){
    		
    		var username = $.trim($('#username').val());
    		var telphone = $.trim($('#telphone').val());
    		if(!username || username == ''){
    			alert('请录入用户名');
    			return false;
    		}
    		if(!telphone || telphone == ''){
    			alert('请录入电话');
    			return false;
    		}
    		$.post("${contextPath}/cms/apply/add",{
    			name		: username,
    			telphone 	: telphone
    		}, function(data){
    			if(data.status == 200){
    				alert('新增成功!');
    			}else{
    				alert('添加错误',data.msg,'error');
    			}
    		});
    		
    	});
    	
    	$(".btn-warning").bind('click',function(){
    		$('#username').val('');
    		$('#telphone').val('');
    	});
    	
    });
    function IsPC() {
	   var userAgentInfo = navigator.userAgent;
	   var Agents = ["Android", "iPhone",
	      "SymbianOS", "Windows Phone",
	      "iPad", "iPod"];
	   var flag = true;
	   for (var v = 0; v < Agents.length; v++) {
	      if (userAgentInfo.indexOf(Agents[v]) > 0) {
	         flag = false;
	         break;
	      }
	   }
	   return flag;
	}
    </script>
  </body>
</html>