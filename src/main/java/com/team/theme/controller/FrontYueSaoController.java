package com.team.theme.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.cms.pojo.CmsArticle;
import com.team.cms.pojo.CmsBanner;
import com.team.cms.pojo.CmsChannel;
import com.team.cms.pojo.CmsWebsite;
import com.team.cms.service.CmsArticleService;
import com.team.cms.service.CmsBannerService;
import com.team.cms.service.CmsChannelService;
import com.team.cms.service.CmsWebsiteService;
import com.team.common.util.HttpClientUtil;

@Controller
@RequestMapping("/front/yuesao")
public class FrontYueSaoController {
	
	@Autowired
	private CmsChannelService cmsChannelService;
	
	@Autowired
	private CmsArticleService cmsArticleService;
	
	@Autowired
	private CmsBannerService cmsBannerService;
	
	@Autowired
	private CmsWebsiteService cmsWebsiteService;
	
	@RequestMapping(value = "/mohome",method = RequestMethod.GET)
    public String mohome(HttpServletRequest request,Model model) throws Exception{
		
		String serverName = HttpClientUtil.getMobileServerName(request);
		
		//顶部栏目导航
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setPid("0");
		cmsChannel.setIstop("on");
		cmsChannel.setDomainName(serverName);
		List<CmsChannel> channelList = cmsChannelService.selectByCmsChannel(cmsChannel,"channel_sort");
		model.addAttribute("channelList", channelList);
		
		CmsBanner cmsBanner = new CmsBanner();
		cmsBanner.setType("home");
		cmsBanner.setDomainName(serverName);
		List<CmsBanner> bannerList = cmsBannerService.selectByCmsBanner(cmsBanner,"order_num asc");
    	model.addAttribute("bannerList", bannerList);
    	
    	//技师团队
    	CmsArticle jishiArticle = new CmsArticle();
    	jishiArticle.setChannelId("92128268024132");
    	jishiArticle.setStatus("on");
    	jishiArticle.setEmptype("1");
    	List<CmsArticle> jishiList = cmsArticleService.selectByCmsArticle(jishiArticle,"top_number desc,createtime desc");
    	model.addAttribute("jishiList", jishiList);
    	
    	//月嫂团队
    	CmsArticle yuesaoArticle = new CmsArticle();
    	yuesaoArticle.setChannelId("92128268024132");
    	yuesaoArticle.setStatus("on");
    	yuesaoArticle.setEmptype("2");
    	List<CmsArticle> yuesaoList = cmsArticleService.selectByCmsArticle(yuesaoArticle,"top_number desc,createtime desc");
    	model.addAttribute("yuesaoList", yuesaoList);
    	
    	//案例
    	CmsArticle caseArticle = new CmsArticle();
    	caseArticle.setChannelId("92128306071146");
    	caseArticle.setStatus("on");
    	caseArticle.setRecommend(1);
    	List<CmsArticle> caseList = cmsArticleService.selectByCmsArticle(caseArticle,"top_number desc,createtime desc");
    	model.addAttribute("caseList", caseList);
    	
    	//常见问题 93026633143113
    	CmsArticle questArticle = new CmsArticle();
    	questArticle.setChannelId("93026633143113");
    	questArticle.setStatus("on");
    	questArticle.setRecommend(1);
    	List<CmsArticle> questList = cmsArticleService.selectByCmsArticle(questArticle,"top_number desc,createtime desc");
    	model.addAttribute("questList", questList);
    	
    	return "front/yuesao/mohome";
    }
	
	@RequestMapping(value = "/mochannel/{id}",method = RequestMethod.GET)
    public String mochannel(HttpServletRequest request, @PathVariable String id, Model model) throws Exception{
		
		CmsChannel channel = cmsChannelService.selectByPrimaryKey(id);
		List<CmsArticle> artList = new ArrayList<CmsArticle>();
		if ( "list".equals(channel.getChannelType()) ) {
			
			CmsArticle cmsArticle = new CmsArticle();
        	cmsArticle.setChannelId(channel.getChannelId());
        	cmsArticle.setStatus("on");
        	artList = cmsArticleService.selectByCmsArticle(cmsArticle, "createtime desc");
		}
		model.addAttribute("artList", artList);
		model.addAttribute("channel", channel);
		
		String serverName = HttpClientUtil.getMobileServerName(request);
		CmsWebsite _temp = new CmsWebsite();
        _temp.setDomainName(serverName);
        CmsWebsite website = cmsWebsiteService.selectByCmsWebsite(_temp);
        model.addAttribute("website", website);
        
        //顶部栏目导航
  		CmsChannel cmsChannel = new CmsChannel();
  		cmsChannel.setPid("0");
  		cmsChannel.setIstop("on");
  		cmsChannel.setDomainName(serverName);
  		List<CmsChannel> channelList = cmsChannelService.selectByCmsChannel(cmsChannel,"channel_sort");
  		model.addAttribute("channelList", channelList);
      		
		return "front/yuesao/mochannel";
    }
	
	@RequestMapping(value = "/moarticle/{id}",method = RequestMethod.GET)
    public String moarticle(HttpServletRequest request, @PathVariable String id, Model model) throws Exception{

		String serverName = HttpClientUtil.getMobileServerName(request);
		
		//顶部栏目导航
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setPid("0");
		cmsChannel.setIstop("on");
		cmsChannel.setDomainName(serverName);
		List<CmsChannel> channelList = cmsChannelService.selectByCmsChannel(cmsChannel,"channel_sort");
		model.addAttribute("channelList", channelList);
				
		CmsArticle article = cmsArticleService.selectByPrimaryKey(id);
    	model.addAttribute("article", article);
    	
    	CmsArticle preArticle = cmsArticleService.getPreArticle(id,article.getDomainName());
    	model.addAttribute("preArticle", preArticle);
    	
    	CmsArticle afterArticle = cmsArticleService.getAfterArticle(id,article.getDomainName());
    	model.addAttribute("afterArticle", afterArticle);
    	
		CmsWebsite _temp = new CmsWebsite();
        _temp.setDomainName(serverName);
        CmsWebsite website = cmsWebsiteService.selectByCmsWebsite(_temp);
        model.addAttribute("website", website);
        
		return "front/yuesao/moarticle";
    }
	
	public String getRemoteHost(javax.servlet.http.HttpServletRequest request){
	    String ip = request.getHeader("x-forwarded-for");
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getRemoteAddr();
	    }
	    return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
	}
	
}
