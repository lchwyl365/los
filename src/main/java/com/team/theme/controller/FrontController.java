package com.team.theme.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.cms.pojo.CmsArticle;
import com.team.cms.pojo.CmsBanner;
import com.team.cms.pojo.CmsChannel;
import com.team.cms.pojo.CmsVideo;
import com.team.cms.service.CmsArticleService;
import com.team.cms.service.CmsBannerService;
import com.team.cms.service.CmsChannelService;
import com.team.cms.service.CmsVideoService;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;

@Controller
@RequestMapping("/front/r")
public class FrontController {
	
	@Autowired
	private CmsChannelService cmsChannelService;
	@Autowired
	private CmsBannerService cmsBannerService;
	@Autowired
	private CmsArticleService cmsArticleService;
	@Autowired
	private CmsVideoService cmsVideoService;

	@RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		//顶部栏目导航
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setPid("0");
		cmsChannel.setIstop("on");
		List<CmsChannel> channelList = cmsChannelService.selectByChannel(cmsChannel);
		model.addAttribute("channelList", channelList);
    	
		CmsBanner cmsBanner = new CmsBanner();
		cmsBanner.setType("home");
		List<CmsBanner> bannerList = cmsBannerService.selectByBanner(cmsBanner);
    	model.addAttribute("bannerList", bannerList);
    	//集团要闻	
    	CmsArticle cmsArticle = new CmsArticle();
    	cmsArticle.setChannelId("55230388368137");
    	List<CmsArticle> yaowenList = cmsArticleService.selectByArticle(cmsArticle);//.listByChannel();
    	model.addAttribute("yaowenList", yaowenList);
    	//最新动态
    	CmsArticle dongtaiArticle = new CmsArticle();
    	dongtaiArticle.setChannelId("55230443822142");
    	List<CmsArticle> dongtaiList = cmsArticleService.selectByArticle(dongtaiArticle);
    	model.addAttribute("dongtaiList", dongtaiList);
    	
    	//底部栏目导航
    	CmsChannel aboutChannel = new CmsChannel();
    	aboutChannel.setPid("55226776264115");
    	List<CmsChannel> aboutChannels = cmsChannelService.selectByChannel(aboutChannel);
    	
    	CmsChannel chanyeChannel = new CmsChannel();
    	chanyeChannel.setPid("55398939588116");
    	List<CmsChannel> chanyeChannels = cmsChannelService.selectByChannel(chanyeChannel);
    	
    	CmsChannel serviceChannel = new CmsChannel();
    	serviceChannel.setPid("56438939530112");
    	List<CmsChannel> serviceChannels = cmsChannelService.selectByChannel(serviceChannel);
    	
    	CmsChannel contactChannel = new CmsChannel();
    	contactChannel.setPid("56438994540139");
    	List<CmsChannel> contactChannels = cmsChannelService.selectByChannel(contactChannel);
    	
    	model.addAttribute("aboutChannels", aboutChannels);
    	model.addAttribute("chanyeChannels", chanyeChannels);
    	model.addAttribute("serviceChannels", serviceChannels);
    	model.addAttribute("contactChannels", contactChannels);
    	
    	//视频内容
    	CmsVideo cmsVideo = new CmsVideo();
    	cmsVideo.setIstop("on");
    	List<CmsVideo> videoList = cmsVideoService.selectByCmsVideo(cmsVideo);
    	if(videoList.size() > 4){ videoList = videoList.subList(0, 4); }
    	model.addAttribute("videoList", videoList);
    	//集团简介
    	CmsChannel introduceChannel = cmsChannelService.selectByPrimaryKey("55229185193119");
    	model.addAttribute("introduceChannel", introduceChannel);
		
    	return "front/r/index";
    }
	
	@RequestMapping(value = "/channel/{id}",method = RequestMethod.GET)
    public String channel(@PathVariable String id,@RequestParam(value="pagerNumber",required=false) Integer pagerNumber,Model model) throws Exception{
		//顶部栏目导航
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setPid("0");
		cmsChannel.setIstop("on");
		List<CmsChannel> channelList = cmsChannelService.selectByChannel(cmsChannel);
		model.addAttribute("channelList", channelList);
    	
		//当前导航层级
		CmsChannel channel = cmsChannelService.selectByPrimaryKey(id);
    	CmsChannel childchannel = null;
    	if("0".equals(channel.getPid())){ //有子栏目
    		model.addAttribute("channel", channel);
    		CmsChannel tempChannel = new CmsChannel();
    		tempChannel.setPid(channel.getChannelId());
    		List<CmsChannel> childList = cmsChannelService.selectByChannel(tempChannel);
    		model.addAttribute("childList", childList);
    		if(childList.size() > 0){
    			childchannel = childList.get(0);
        		model.addAttribute("childchannel", childchannel);
    		}
    	}else{
    		CmsChannel parent = cmsChannelService.selectByPrimaryKey(channel.getPid());
    		model.addAttribute("channel", parent);
    		childchannel = channel;
    		model.addAttribute("childchannel", childchannel);
    		
    		CmsChannel tempChannel = new CmsChannel();
    		tempChannel.setPid(parent.getChannelId());
    		List<CmsChannel> childList = cmsChannelService.selectByChannel(tempChannel);
    		model.addAttribute("childList", childList);
    	}
    	
    	if(childchannel != null && "list".equals(childchannel.getChannelType())){
    		
    		CmsArticle cmsArticle = new CmsArticle();
        	cmsArticle.setChannelId(childchannel.getChannelId());
        	EUDataGridModel dgm = new EUDataGridModel();
        	int page = pagerNumber == null ? 0 : pagerNumber;
        	dgm.setPage(page);
        	dgm.setRows(10);
        	EUDataGridResult result = cmsArticleService.selectList(dgm, cmsArticle);
        	model.addAttribute("dataGridResult", result);
    	}
    	model.addAttribute("pagerNumber", pagerNumber);
    	
    	return "front/r/channel";
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
    public String article(@PathVariable String id,@RequestParam(value="pagerNumber",required=false) Integer pagerNumber,Model model) throws Exception{
    
    	CmsArticle article = cmsArticleService.selectByPrimaryKey(id);
    	model.addAttribute("article", article);
    	
    	//顶部栏目导航
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setPid("0");
		cmsChannel.setIstop("on");
		List<CmsChannel> channelList = cmsChannelService.selectByChannel(cmsChannel);
		model.addAttribute("channelList", channelList);
    	
		if(article == null){
			return "front/r/article";
		}
		//当前导航层级
		CmsChannel channel = cmsChannelService.selectByPrimaryKey(article.getChannelId());
    	CmsChannel childchannel = null;
    	if("0".equals(channel.getPid())){ //有子栏目
    		model.addAttribute("channel", channel);
    		CmsChannel tempChannel = new CmsChannel();
    		tempChannel.setPid(channel.getChannelId());
    		List<CmsChannel> childList = cmsChannelService.selectByChannel(tempChannel);
    		model.addAttribute("childList", childList);
    		if(childList.size() > 0){
    			childchannel = childList.get(0);
        		model.addAttribute("childchannel", childchannel);
    		}
    	}else{
    		CmsChannel parent = cmsChannelService.selectByPrimaryKey(channel.getPid());
    		model.addAttribute("channel", parent);
    		childchannel = channel;
    		model.addAttribute("childchannel", childchannel);
    		
    		CmsChannel tempChannel = new CmsChannel();
    		tempChannel.setPid(parent.getChannelId());
    		List<CmsChannel> childList = cmsChannelService.selectByChannel(tempChannel);
    		model.addAttribute("childList", childList);
    	}
    	
    	return "front/r/article";
    }
	
	@RequestMapping(value = "/videos",method = RequestMethod.GET)
    public String videos(Model model) throws Exception{
    
		//顶部栏目导航
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setPid("0");
		cmsChannel.setIstop("on");
		List<CmsChannel> channelList = cmsChannelService.selectByChannel(cmsChannel);
		model.addAttribute("channelList", channelList);
    	
    	//视频内容
    	CmsVideo cmsVideo = new CmsVideo();
    	cmsVideo.setIstop("on");
    	List<CmsVideo> videoList = cmsVideoService.selectByCmsVideo(cmsVideo);
    	model.addAttribute("videoList", videoList);
    	
    	/*List<CmsChannel> subChannelList = cmsChannelService.listByParentid(1606022304170001014L);
    	for (int i = 0; i < subChannelList.size(); i++) {
			CmsChannel channel = subChannelList.get(i);
			
			List<CrmVideo> videos = crmVideoService.listByChannel(channel.getId());
			for (int j = 0; j < videos.size(); j++) {
				switch(j){
				case 0:
					channel.setFirstVideo(videos.get(j));
					break;
				case 1:
				case 2:
				case 3:
					List<CrmVideo> secondVideoList = channel.getSecondVideoList();
					if(secondVideoList == null) { secondVideoList = new ArrayList<CrmVideo>();}
					secondVideoList.add(videos.get(j));
					channel.setSecondVideoList(secondVideoList);
					break;
				case 4:
				case 5:
					List<CrmVideo> threeVideoList = channel.getThreeVideoList();
					if(threeVideoList == null) { threeVideoList = new ArrayList<CrmVideo>();}
					threeVideoList.add(videos.get(j));
					channel.setThreeVideoList(threeVideoList);
					break;
				}
			}
		}
    	model.addAttribute("subChannelList", subChannelList);
    	
    	List<CrmVideo> orderList = crmVideoService.listOrderByClick();
    	model.addAttribute("orderList", orderList);
    	
    	List<CrmVideo> newList = crmVideoService.listOrderByTime();
    	model.addAttribute("newList", newList);*/
    	
    	return "web/videos";
    }
	
}
