function getEvent() {
	if (document.all) return window.event; //如果是ie
	func = getEvent.caller;
	while (func != null) {
		var arg0 = func.arguments[0];
		if (arg0) {
			if ((arg0.constructor == Event || arg0.constructor == MouseEvent) || (typeof(arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
				return arg0;
			}
		}
		func = func.caller;
	}
	return null;
}

function killerrors() {return true;}
window.onerror = killerrors;

// jquery开始


$(document).ready(function() {
	// 编辑区内的p>img的间距调整
	$(".editBody p > img").parent().css({"padding-top":10,"padding-bottom":0,"text-align":"center"});
	//顶部下拉
	$('.js_dropCon').each(function() {
	$(this).children('a').click(function() {
		var status = $(this).next().css("display");
		if (status == "none") {
			$(this).parent().addClass("currentClk");
			$(this).next().css("display", "block");
		} else {
			$(this).parent().removeClass("currentClk");
			$(this).next().css("display", "none");
		}
	});
});
$('.dropClose').each(function() {
	$(this).children('a').click(function() {
		var status = $(this).parent().parent().css("display");
		if (status == "none") {
			$(this).parent().parent().css("display", "block");
		} else {
			$(this).parent().parent().parent().removeClass("currentClk");
			$(this).parent().parent().css("display", "");
		}
	});
});

$(".js_dropCon").mouseleave(function() {
	$(this).find(".dropCon").hide();
	$(this).removeClass("currentClk");
})
	
	//搜索
	$(".ipt1").focus(function(){
		$(this).parent().addClass("topSchh");	
	});
	$(".ipt1").blur(function(){
		$(this).parent().removeClass("topSchh");	
	});
	$(".btn1").hover(function(){
		$(this).parent().addClass("topSchh");	
	},function(){
		$(this).parent().removeClass("topSchh");	
	})
	
	//返回顶部
	$('.backtop').click(function() {
		$('html, body').animate({
			scrollTop: 0
		}, 500);
		return false;
	});
	//收起展开
	$(".btnup").click(function () {
		$(".hide").slideToggle("slow");
		$(this).toggleClass("btndown");
		$(this).text()=="收起"?$(this).html("<a>展开</a>"):$(this).html("<a>收起</a>");
	});	
	//样式美化
	$(".slider li:first").addClass("nobt");
	//导航下拉
	$(".slider li:first").addClass("nobt");
	//样式美化
	$(".mainnav").click(function(){
		$(this).addClass("mainnavhover");
		$(this).find("ul").show();
		
	});
	$(".mainnav").mouseleave(function(){
		$(this).removeClass("mainnavhover");
		$(this).find("ul").hide();
		
		})
	//微信
	$(".weixinItem").hover(function(){
		$(this).find(".wxfloat").show();	
	},function(){
		$(this).find(".wxfloat").hide();	
	})
	//字母切换
	$(".js_letter li a").click(function(){
		$(this).parent().addClass("current").siblings().removeClass("current");
		
	});


		//视频年份下拉
$('.age').hide(); 
$('.js_age span').click(function() { 
  $(this).parent().find('.age').slideDown("fast"); 
  $(this).parent().find('li').hover(function() {
    $(this).addClass('hover')
  }, function() {
    $(this).removeClass('hover')
  });
  $(".age").mouseleave(function(){
    $(this).slideUp("fast");
  });
});
$('.age li').click(function() {
  $(this).parent().parent().find('span').html($(this).html());
  $(this).parent().parent().find('ul').slideUp("fast");
});
$(".js_age").mouseleave(function(){
  $(".age").slideUp("fast");
});
	
	
});

//TAB选项卡
function setTab(name, cursel, n) {
  for (i = 1; i <= n; i++) {
	var menu = document.getElementById(name + i);
	var con = document.getElementById("con_" + name + "_" + i);
	menu.className = i == cursel ? "hover":"";
	con.style.display = i == cursel ? "block": "none";
  }
}


function setTab2(name, cursel, n) {
  for (i = 1; i <= n; i++) {
	var menu = document.getElementById(name + i);
	var con = document.getElementById("con_" + name + "_" + i);
	menu.className = i == cursel ? "hover":"";
    con.style.visibility = i == cursel ? "visible": "hidden";
    con.style.display = i == cursel ? "block": "none";
  }
}

function getValue(){
  document.getElementById('up01').value = document.getElementById('v_up01').value;
  document.getElementById('up02').value = document.getElementById('v_up02').value;
  document.getElementById('up03').value = document.getElementById('v_up03').value;
}




//搜索下拉
function select_form()
{
	var thisinput=$("#myselect");
	var thisul=$(thisinput).parent().find("ul");
	
	if(thisul.css("display")=="none")
	{
		if(thisul.height()>200){thisul.css({height:"200"+"px","overflow-y":"scroll" })};
		thisul.fadeIn("100");
		thisul.hover(function(){},function(){thisul.fadeOut("100");})
		thisul.find("li").click(function()
		{
			
			var slect_str = $(this).html();
			var flag = $(this).attr("flag");
                        $("input[name='m']").val("search");
                        $("input[name='c']").val("index");
                        $("input[name='a']").val("init");
			if(slect_str == '视频'){
                            $("#typeid").val('73');
			}else if(flag == 'search_wenda'){
                            $("input[name='m']").val("content");
                            $("input[name='c']").val("ajax");
                            $("input[name='a']").val("search_wenda");
                        }else if(flag == 'search_qa'){
                            $("input[name='m']").val("content");
                            $("input[name='c']").val("ajax");
                            $("input[name='a']").val("search_qa");
                        }else{
                            $("#typeid").val('66');
			}
			thisinput.html($(this).html());
			thisul.fadeOut("100");}).hover(function(){$(this).addClass("hover");},function(){$(this).removeClass("hover");});
	}
	else
	{
		thisul.fadeOut("fast");	
	}
}

/*
 * 检查搜索文字合法性
 */
function chkSearch_form()
{
	var q = $("#q").val();
	if(!q||q=='请输入关键词')
	{
		
		$("#q").focus();
		return false;
	}
	return true;
}
function trim(str){
     return str.replace(/(^\s*)|(\s*$)/g, "");
}
