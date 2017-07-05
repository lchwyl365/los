package com.team.cms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cms.vo.CmsChannelVo;

import com.team.common.pojo.ResponseResult;
import com.team.cms.pojo.CmsChannel;
import com.team.cms.service.CmsChannelService;
import com.team.platform.service.SysComboBoxService;
import org.springframework.beans.factory.annotation.Value;
import com.team.common.util.CookieUtils;
import com.team.platform.service.SessionUserService;
import com.team.platform.service.impl.SessionUserServiceImpl;
import com.team.platform.pojo.AuthUser;

@Controller
@RequestMapping("/cms/channel")
public class CmsChannelController {

	private static final Logger logger = Logger.getLogger(CmsChannelController.class);
	
	@Autowired
	private CmsChannelService cmsChannelService;
	
	@Autowired
	private SysComboBoxService sysComboBoxService;
	
	@Autowired
	private SessionUserService sessionUserService;
	
	@Value("${USE_REDIS}")
	private Boolean USE_REDIS;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
	  	String combo55072199221118_json = sysComboBoxService.selectComboid("55072199221118");
		model.addAttribute("combo55072199221118_json", combo55072199221118_json);
	  	String combo55059701325166_json = sysComboBoxService.selectComboid("55059701325166");
		model.addAttribute("combo55059701325166_json", combo55059701325166_json);
    	return "channel/list";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(HttpServletRequest request,Model model) throws Exception{
		String pid = request.getParameter("pid");
		model.addAttribute("pid", pid);
    	return "channel/add";
    }
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult add(HttpServletRequest request,CmsChannel cmsChannel) throws Exception{
		//从cookie中取token
		String token = CookieUtils.getCookieValue(request, "TT_TOKEN");
		//根据token换取用户信息，调用sso系统的接口。
		AuthUser user = null;
		if(USE_REDIS){
			user = sessionUserService.getUserByToken(token);
		}else{
			user = (AuthUser) request.getSession().getAttribute(SessionUserServiceImpl.LOGIN_USER);
		}
        cmsChannel.setDomainName(user.getDomainName());
        cmsChannel.setUserid(user.getUserid());
		ResponseResult result = cmsChannelService.insert(cmsChannel,true);
		return result;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult delete(@RequestParam List<String> channelIds)throws Exception{
		ResponseResult result = cmsChannelService.delete(channelIds);
		return result;
	}
	
	@RequestMapping(value = "/update/{channelId}",method = RequestMethod.GET)
    public String update(@PathVariable String channelId,Model model) throws Exception{
	  	model.addAttribute("channelId", channelId);
    	return "channel/update";
    }
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	@ResponseBody
    public ResponseResult update(HttpServletRequest request) throws Exception{
    
    	CmsChannel cmsChannel = new CmsChannel();
		String channelId = request.getParameter("channelId");
		if(StringUtils.isNotEmpty(channelId)){
			cmsChannel.setChannelId(String.valueOf(channelId));
		}
		String channelName = request.getParameter("channelName");
		if(StringUtils.isNotEmpty(channelName)){
			cmsChannel.setChannelName(String.valueOf(channelName));
		}
		String channelSort = request.getParameter("channelSort");
		if(StringUtils.isNotEmpty(channelSort)){
			cmsChannel.setChannelSort(Integer.valueOf(channelSort));
		}
		String istop = request.getParameter("istop");
		if(StringUtils.isNotEmpty(istop)){
			cmsChannel.setIstop(String.valueOf(istop));
		}
		String channelType = request.getParameter("channelType");
		if(StringUtils.isNotEmpty(channelType)){
			cmsChannel.setChannelType(String.valueOf(channelType));
		}
		String pid = request.getParameter("pid");
		if(StringUtils.isNotEmpty(pid)){
			cmsChannel.setPid(String.valueOf(pid));
		}
		String url = request.getParameter("url");
		if(StringUtils.isNotEmpty(url)){
			cmsChannel.setUrl(String.valueOf(url));
		}
		String status = request.getParameter("status");
		if(StringUtils.isNotEmpty(status)){
			cmsChannel.setStatus(String.valueOf(status));
		}
		String content = request.getParameter("content");
		if(StringUtils.isNotEmpty(content)){
			cmsChannel.setContent(String.valueOf(content));
		}
		String domainName = request.getParameter("domainName");
		if(StringUtils.isNotEmpty(domainName)){
			cmsChannel.setDomainName(String.valueOf(domainName));
		}
		String userid = request.getParameter("userid");
		if(StringUtils.isNotEmpty(userid)){
			cmsChannel.setUserid(String.valueOf(userid));
		}
		return cmsChannelService.update(cmsChannel);
    }
	@RequestMapping(value = "/queryList/{pid}")
	@ResponseBody
    public List<CmsChannelVo> queryList(HttpServletRequest request,@PathVariable String pid) throws Exception{
		//从cookie中取token
		String token = CookieUtils.getCookieValue(request, "TT_TOKEN");
		//根据token换取用户信息，调用sso系统的接口。
		AuthUser user = null;
		if(USE_REDIS){
			user = sessionUserService.getUserByToken(token);
		}else{
			user = (AuthUser) request.getSession().getAttribute(SessionUserServiceImpl.LOGIN_USER);
		}
		List<CmsChannelVo> list = cmsChannelService.selectList(pid,user.getUserid());
    	return list;
    }

	@RequestMapping(value="/load/{channelId}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult load(@PathVariable String channelId) {
		CmsChannel cmsChannel = cmsChannelService.selectByPrimaryKey(channelId);
		return new ResponseResult(cmsChannel);
	}
	
}