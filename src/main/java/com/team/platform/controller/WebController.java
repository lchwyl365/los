package com.team.platform.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.common.util.HttpClientUtil;

@Controller
@RequestMapping("/")
public class WebController {
	
	@RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		String serverName = HttpClientUtil.getServerName(request);
		System.out.println(serverName);
		if("www.runyigroup.com.cn".equals(serverName)){
			return "redirect:/front/r/index";
		}else if("www.rctianhong.com".equals(serverName)){
			return "redirect:/front/t/index";
		} else if("thyd.0531yx.cn".equals(serverName)){
			
			return "redirect:/front/yuesao/mohome";
			//return "redirect:/front/t/mohome";
		} else if("www.jinan-kendo.com".equals(serverName)){
			return "redirect:/front/q/index";
		} else if("www.0631yuesao.com".equals(serverName)) {
			return "redirect:/front/yuesao/mohome";
		} else {
			return "redirect:/front/t/index";
		}
    }
	
}
