package com.team.theme.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.cms.pojo.CmsAccessLog;
import com.team.cms.pojo.CmsArticle;
import com.team.cms.pojo.CmsBanner;
import com.team.cms.pojo.CmsChannel;
import com.team.cms.service.CmsAccessLogService;
import com.team.cms.service.CmsArticleService;
import com.team.cms.service.CmsBannerService;
import com.team.cms.service.CmsChannelService;
import com.team.cms.service.CmsVideoService;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.util.HttpClientUtil;
import com.team.common.util.ImageUtil;

@Controller
@RequestMapping("/front/t")
public class FrontTianController {
	
	@Autowired
	private CmsChannelService cmsChannelService;
	@Autowired
	private CmsBannerService cmsBannerService;
	@Autowired
	private CmsArticleService cmsArticleService;
	@Autowired
	private CmsVideoService cmsVideoService;
	@Autowired
	private CmsAccessLogService cmsAccessLogService;

	@RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		String serverName = HttpClientUtil.getServerName(request);
		//顶部栏目导航
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setIstop("on");
		cmsChannel.setDomainName(serverName);
		List<CmsChannel> channelList = cmsChannelService.selectByCmsChannel(cmsChannel,"channel_sort desc");
		model.addAttribute("channelList", channelList);
    	
		CmsBanner cmsBanner = new CmsBanner();
		cmsBanner.setType("home");
		cmsBanner.setDomainName(serverName);
		List<CmsBanner> bannerList = cmsBannerService.selectByCmsBanner(cmsBanner,"order_num asc");
    	model.addAttribute("bannerList", bannerList);

    	//产品栏目
		CmsChannel productChannel = new CmsChannel();
		productChannel.setPid("596190358348736");
		List<CmsChannel> productChannelList = cmsChannelService.selectByCmsChannel(productChannel,"channel_sort desc");
		model.addAttribute("productChannelList", productChannelList);
		
    	//集团简介
    	CmsChannel introduceChannel = cmsChannelService.selectByPrimaryKey("596189879568725");
    	if(introduceChannel != null && StringUtils.isNotEmpty(introduceChannel.getContent())){
    		Set<String> set = ImageUtil.getImgStr(introduceChannel.getContent());
    		String thumbnail = "";
			for (String str : set) {
				if(StringUtils.isNotEmpty(str) && StringUtils.isEmpty(thumbnail)){
					thumbnail = str;
				}
			}
			introduceChannel.setThumbnail(thumbnail);
			String desc = introduceChannel.getContent()
					.replaceAll("</?[^>]+>", "").replaceAll("\\s*|\t|\r|\n", "").replaceAll("&nbsp;", "");
			introduceChannel.setDescription(desc);
    	}
    	model.addAttribute("introduceChannel", introduceChannel);
    	
		//公司新闻
    	CmsArticle companyArticle = new CmsArticle();
    	companyArticle.setChannelId("599896164508719");
    	companyArticle.setStatus("on");
    	List<CmsArticle> companyArticleList = cmsArticleService.selectByCmsArticle(companyArticle,"top_number desc,createtime desc");
    	model.addAttribute("companyArticleList", companyArticleList);
    	
    	//行业新闻
    	CmsArticle industryArticle = new CmsArticle();
    	industryArticle.setChannelId("599899530688725");
    	industryArticle.setStatus("on");
    	List<CmsArticle> industryList = cmsArticleService.selectByCmsArticle(industryArticle,"top_number desc,createtime desc");
    	model.addAttribute("industryList", industryList);
    	
    	//技术支持
    	CmsArticle technologyArticle = new CmsArticle();
    	technologyArticle.setChannelId("599919071288713");
    	technologyArticle.setStatus("on");
    	List<CmsArticle> technologyList = cmsArticleService.selectByCmsArticle(technologyArticle,"top_number desc,createtime desc");
        model.addAttribute("technologyList", technologyList);
        
        //案例
    	CmsArticle caseArticle = new CmsArticle();
    	caseArticle.setChannelId("596191211738751");
    	caseArticle.setStatus("on");
    	List<CmsArticle> caseList = cmsArticleService.selectByCmsArticle(caseArticle,"top_number desc,createtime desc");
        model.addAttribute("caseList", caseList);
        
        //产品热销推荐
        List<String> channelIds = new ArrayList<String>();
        channelIds.add("599671970728716");
        channelIds.add("599821923728718");
        channelIds.add("599822728358728");
        channelIds.add("599823329808737");
        channelIds.add("599823604848743");
        channelIds.add("599823895078757");
        channelIds.add("599824175998767");
        channelIds.add("599832359338712");
        String status = "on";
        List<CmsArticle> channelArtList = cmsArticleService.selectByChannel(channelIds,status);
        model.addAttribute("channelArtList", channelArtList);
        
    	return "front/t/index";
    }
	
	@RequestMapping(value = "/channel/{id}",method = RequestMethod.GET)
    public String channel(HttpServletRequest request,@PathVariable String id,@RequestParam(value="pagerNumber",required=false) Integer pagerNumber,Model model) throws Exception{
		String serverName = HttpClientUtil.getServerName(request);
		//顶部栏目导航
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setPid("0");
		cmsChannel.setIstop("on");
		cmsChannel.setDomainName(serverName);
		List<CmsChannel> channelList = cmsChannelService.selectByCmsChannel(cmsChannel,"channel_sort desc");
		model.addAttribute("channelList", channelList);
    	
		//当前导航层级
		CmsChannel channel = cmsChannelService.selectByPrimaryKey(id);
		model.addAttribute("channel", channel);
    	if(channel != null && "list".equals(channel.getChannelType())){
    		
    		CmsArticle cmsArticle = new CmsArticle();
        	cmsArticle.setChannelId(channel.getChannelId());
        	cmsArticle.setStatus("on");
        	EUDataGridModel dgm = new EUDataGridModel();
        	int page = pagerNumber == null ? 0 : pagerNumber;
        	dgm.setPage(page);
        	dgm.setRows(10);
        	EUDataGridResult result = cmsArticleService.selectList(dgm, cmsArticle);
        	model.addAttribute("dataGridResult", result);
        	model.addAttribute("pagerNumber", pagerNumber);
    	}
    	return "front/q/channel";
    }
	/**
	 * 文章内容页面
	 * @param id
	 * @param pagerNumber
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/article/{id}",method = RequestMethod.GET)
    public String article(@PathVariable String id,HttpServletRequest request,@RequestParam(value="pagerNumber",required=false) Integer pagerNumber,Model model) throws Exception{
    
    	CmsArticle article = cmsArticleService.selectByPrimaryKey(id);
    	model.addAttribute("article", article);
    	
    	//顶部栏目导航
    	String serverName = HttpClientUtil.getServerName(request);
		//顶部栏目导航
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setPid("0");
		cmsChannel.setIstop("on");
		cmsChannel.setDomainName(serverName);
		List<CmsChannel> channelList = cmsChannelService.selectByCmsChannel(cmsChannel,"channel_sort desc");
		model.addAttribute("channelList", channelList);
		
		//当前导航层级
		if(article != null){
			CmsChannel channel = cmsChannelService.selectByPrimaryKey(article.getChannelId());
			model.addAttribute("channel", channel);
			
			CmsArticle preArticle = cmsArticleService.getPreArticle(id,article.getDomainName());
	    	model.addAttribute("preArticle", preArticle);
	    	
	    	CmsArticle afterArticle = cmsArticleService.getAfterArticle(id,article.getDomainName());
	    	model.addAttribute("afterArticle", afterArticle);
	    	
	    	//访问记录
	    	String ip = getRemoteHost(request);
	    	CmsAccessLog cmsAccessLog = new CmsAccessLog();
	    	cmsAccessLog.setArticleId(article.getArticleId());
	    	cmsAccessLog.setIp(ip);
	    	cmsAccessLog.setCreatetime(new Date());
	    	List<CmsAccessLog> logs = cmsAccessLogService.selectByCmsAccessLog(cmsAccessLog, null);
	    	if(logs.size() == 0){//无访问记录
	    		int readCount = article.getReadCount() + 1;
	    		article.setReadCount(readCount);
	    		cmsArticleService.update(article);
	    		cmsAccessLogService.insert(cmsAccessLog, true);
	    	}
		}
    	return "front/q/article";
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
