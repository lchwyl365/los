package com.team.theme.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/front")
public class FrontController {
	

	@RequestMapping(value = "/r/index",method = RequestMethod.GET)
    public String index(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
    	return "front/r/index";
    }
	
}
