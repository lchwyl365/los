package com.team.theme.controller;

import java.util.ArrayList;
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
import com.team.common.util.HttpClientUtil;
import com.team.common.util.ImageUtil;

@Controller
@RequestMapping("/front/r")
public class FrontRunyiController {
	
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
		String serverName = HttpClientUtil.getServerName(request);
		//顶部栏目导航
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setPid("0");
		cmsChannel.setIstop("on");
		cmsChannel.setDomainName(serverName);
		List<CmsChannel> channelList = cmsChannelService.selectByCmsChannel(cmsChannel,"channel_sort desc");
		model.addAttribute("channelList", channelList);
    	
		CmsBanner cmsBanner = new CmsBanner();
		cmsBanner.setType("home");
		cmsBanner.setDomainName(serverName);
		List<CmsBanner> bannerList = cmsBannerService.selectByCmsBanner(cmsBanner,"order_num asc");
    	model.addAttribute("bannerList", bannerList);
    	//集团要闻	
    	CmsArticle cmsArticle = new CmsArticle();
    	cmsArticle.setChannelId("55230388368137");
    	cmsArticle.setStatus("on");
    	List<CmsArticle> yaowenList = cmsArticleService.selectByCmsArticle(cmsArticle,"top_number desc,createtime desc");
    	model.addAttribute("yaowenList", yaowenList);
    	//最新动态
    	CmsArticle dongtaiArticle = new CmsArticle();
    	dongtaiArticle.setChannelId("55230443822142");
    	dongtaiArticle.setStatus("on");
    	List<CmsArticle> dongtaiList = cmsArticleService.selectByCmsArticle(dongtaiArticle,"top_number desc,createtime desc");
    	model.addAttribute("dongtaiList", dongtaiList);
    	
    	//底部栏目导航
    	CmsChannel aboutChannel = new CmsChannel();
    	aboutChannel.setPid("55226776264115");
    	List<CmsChannel> aboutChannels = cmsChannelService.selectByCmsChannel(aboutChannel,"channel_sort desc");
    	
    	CmsChannel chanyeChannel = new CmsChannel();
    	chanyeChannel.setPid("55398939588116");
    	List<CmsChannel> chanyeChannels = cmsChannelService.selectByCmsChannel(chanyeChannel,"channel_sort desc");
    	
    	CmsChannel serviceChannel = new CmsChannel();
    	serviceChannel.setPid("56438939530112");
    	List<CmsChannel> serviceChannels = cmsChannelService.selectByCmsChannel(serviceChannel,"channel_sort desc");
    	
    	CmsChannel contactChannel = new CmsChannel();
    	contactChannel.setPid("56438994540139");
    	List<CmsChannel> contactChannels = cmsChannelService.selectByCmsChannel(contactChannel,"channel_sort desc");
    	
    	model.addAttribute("aboutChannels", aboutChannels);
    	model.addAttribute("chanyeChannels", chanyeChannels);
    	model.addAttribute("serviceChannels", serviceChannels);
    	model.addAttribute("contactChannels", contactChannels);
    	
    	//视频内容
    	CmsVideo cmsVideo = new CmsVideo();
    	cmsVideo.setIstop("on");
    	List<CmsVideo> videoList = cmsVideoService.selectByCmsVideo( cmsVideo, null);
    	if(videoList.size() > 4){ videoList = videoList.subList(0, 4); }
    	model.addAttribute("videoList", videoList);
    	//集团简介
    	CmsChannel introduceChannel = cmsChannelService.selectByPrimaryKey("55229185193119");
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
		
    	return "front/r/index";
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
    	CmsChannel childchannel = null;
    	if("0".equals(channel.getPid())){ //有子栏目
    		model.addAttribute("channel", channel);
    		CmsChannel tempChannel = new CmsChannel();
    		tempChannel.setPid(channel.getChannelId());
    		List<CmsChannel> childList = cmsChannelService.selectByCmsChannel(tempChannel,"channel_sort desc");
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
    		List<CmsChannel> childList = cmsChannelService.selectByCmsChannel(tempChannel,"channel_sort desc");
    		model.addAttribute("childList", childList);
    	}
    	
    	if(childchannel != null && "list".equals(childchannel.getChannelType())){
    		
    		CmsArticle cmsArticle = new CmsArticle();
        	cmsArticle.setChannelId(childchannel.getChannelId());
        	cmsArticle.setStatus("on");
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
    public String article(HttpServletRequest request,@PathVariable String id,@RequestParam(value="pagerNumber",required=false) Integer pagerNumber,Model model) throws Exception{
    
    	CmsArticle article = cmsArticleService.selectByPrimaryKey(id);
    	model.addAttribute("article", article);
    	
    	String serverName = HttpClientUtil.getServerName(request);
		//顶部栏目导航
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setPid("0");
		cmsChannel.setIstop("on");
		cmsChannel.setDomainName(serverName);
		List<CmsChannel> channelList = cmsChannelService.selectByCmsChannel(cmsChannel,"channel_sort desc");
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
    		List<CmsChannel> childList = cmsChannelService.selectByCmsChannel(tempChannel,"channel_sort desc");
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
    		List<CmsChannel> childList = cmsChannelService.selectByCmsChannel(tempChannel,"channel_sort desc");
    		model.addAttribute("childList", childList);
    	}
    	
    	return "front/r/article";
    }
	
	@RequestMapping(value = "/videos",method = RequestMethod.GET)
    public String videos(HttpServletRequest request,Model model) throws Exception{
    
		//顶部栏目导航
		String serverName = HttpClientUtil.getServerName(request);
		//顶部栏目导航
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setPid("0");
		cmsChannel.setIstop("on");
		cmsChannel.setDomainName(serverName);
		List<CmsChannel> channelList = cmsChannelService.selectByCmsChannel(cmsChannel,"channel_sort desc");
		model.addAttribute("channelList", channelList);
    	
    	//视频内容
    	CmsVideo cmsVideo = new CmsVideo();
    	cmsVideo.setIstop("on");
    	List<CmsVideo> videoList = cmsVideoService.selectByCmsVideo(cmsVideo, null);
    	model.addAttribute("videoList", videoList);
    	
    	CmsChannel tempChannel = new CmsChannel();
    	tempChannel.setPid("56643194809110");
    	List<CmsChannel> subChannelList = cmsChannelService.selectByCmsChannel(tempChannel,"channel_sort desc");
    	for (int i = 0; i < subChannelList.size(); i++) {
			CmsChannel channel = subChannelList.get(i);
			
			CmsVideo temp = new CmsVideo();
	    	temp.setChannelid(channel.getChannelId());
			List<CmsVideo> videos = cmsVideoService.selectByCmsVideo(temp, null);
			for (int j = 0; j < videos.size(); j++) {
				switch(j){
				case 0:
					channel.setFirstVideo(videos.get(j));
					break;
				case 1:
				case 2:
				case 3:
					List<CmsVideo> secondVideoList = channel.getSecondVideoList();
					if(secondVideoList == null) { secondVideoList = new ArrayList<CmsVideo>();}
					secondVideoList.add(videos.get(j));
					channel.setSecondVideoList(secondVideoList);
					break;
				case 4:
				case 5:
					List<CmsVideo> threeVideoList = channel.getThreeVideoList();
					if(threeVideoList == null) { threeVideoList = new ArrayList<CmsVideo>();}
					threeVideoList.add(videos.get(j));
					channel.setThreeVideoList(threeVideoList);
					break;
				}
			}
		}
    	model.addAttribute("subChannelList", subChannelList);
    	
    	List<CmsVideo> orderList = cmsVideoService.selectByCmsVideo(new CmsVideo(),"clicks desc");
    	model.addAttribute("orderList", orderList);
    	
    	List<CmsVideo> newList = cmsVideoService.selectByCmsVideo(new CmsVideo(),"createtime desc");
    	model.addAttribute("newList", newList);
    	
    	return "front/r/videos";
    }
	
	@RequestMapping(value="/video_detail/{id}",method=RequestMethod.GET)
    public String detail(HttpServletRequest request,@PathVariable String id,Model model) {
    	
		String serverName = HttpClientUtil.getServerName(request);
		//顶部栏目导航
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setPid("0");
		cmsChannel.setIstop("on");
		cmsChannel.setDomainName(serverName);
		List<CmsChannel> channelList = cmsChannelService.selectByCmsChannel(cmsChannel,"channel_sort desc");
		model.addAttribute("channelList", channelList);
    	
       CmsVideo video = cmsVideoService.selectByPrimaryKey(id);
       model.addAttribute("video",video);
       
       List<CmsVideo> newList = cmsVideoService.selectByCmsVideo(new CmsVideo(),"createtime desc");
   	   model.addAttribute("newList", newList);
   	
       return "front/r/video_detail";
    }
	
}
