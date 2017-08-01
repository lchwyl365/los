package com.team.platform.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class WebController {
	
	@RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		String serverName = request.getServerName();
		System.out.println(serverName);
		if("www.runyigroup.com.cn".equals(serverName)){
			return "redirect:/front/r/index";
		}else{
			return "redirect:/front/t/index";
		}
    }
	
}
