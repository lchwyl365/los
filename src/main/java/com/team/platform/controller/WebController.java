package com.team.platform.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.cms.service.CmsChannelService;

@Controller
@RequestMapping("/")
public class WebController {
	
	@Autowired
	private CmsChannelService cmsChannelService;
	
	@RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
		//cmsChannelService.selectList(pid)
		
		/*
		List<CmsChannel> channelList = cmsChannelService.listByTopNav();
    	model.addAttribute("channelList", channelList);
    	
    	List<SysBanner> bannerList = sysBannerService.listByType(1);
    	model.addAttribute("bannerList", bannerList);
    	
    	List<SysArticle> yaowenList = sysArticleService.listByChannel(1603310520110001014L);
    	model.addAttribute("yaowenList", yaowenList);
    	
    	List<SysArticle> dongtaiList = sysArticleService.listByChannel(1603310520260002014L);
    	model.addAttribute("dongtaiList", dongtaiList);
    	
    	List<CmsChannel> aboutChannel = cmsChannelService.listByParentid(1603152125550001014L);
    	List<CmsChannel> chanyeChannel = cmsChannelService.listByParentid(1603152127070003014L);
    	List<CmsChannel> serviceChannel = cmsChannelService.listByParentid(1603152127530004014L);
    	List<CmsChannel> contactChannel = cmsChannelService.listByParentid(1603152129480006014L);
    	model.addAttribute("aboutChannel", aboutChannel);
    	model.addAttribute("chanyeChannel", chanyeChannel);
    	model.addAttribute("serviceChannel", serviceChannel);
    	model.addAttribute("contactChannel", contactChannel);
    	
    	List<SysArticle> sysArticles = sysArticleService.listByChannel(1603161551390001014L);
    	if(sysArticles.size() > 0){
    		SysArticle sysArticle = sysArticles.get(0);
    		model.addAttribute("sysArticle", sysArticle);
    	}
    	
    	List<CrmVideo> videoList = crmVideoService.listByTop();
    	if(videoList.size() > 4){ videoList = videoList.subList(0, 4); }
    	model.addAttribute("videoList", videoList);*/
    	
    	return "redirect:/front/r/index";
    }
	
}
