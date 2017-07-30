package com.team.cms.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.cms.pojo.CmsArticle;
import com.team.cms.pojo.CmsChannel;
import com.team.cms.service.CmsArticleService;
import com.team.cms.service.CmsChannelService;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.common.util.CookieUtils;
import com.team.common.util.ImageUtil;
import com.team.platform.pojo.AuthUser;
import com.team.platform.service.SessionUserService;
import com.team.platform.service.SysComboBoxService;
import com.team.platform.service.impl.SessionUserServiceImpl;

@Controller
@RequestMapping("/cms/article")
public class CmsArticleController {

	private static final Logger logger = Logger.getLogger(CmsArticleController.class);
	
	@Autowired
	private CmsArticleService cmsArticleService;
	
	@Autowired
	private SysComboBoxService sysComboBoxService;
	
	@Autowired
	private SessionUserService sessionUserService;
	
	@Autowired
	private CmsChannelService cmsChannelService;
	
	@Value("${USE_REDIS}")
	private Boolean USE_REDIS;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
	  	String combo55059701325166_json = sysComboBoxService.selectComboid("55059701325166");
		model.addAttribute("combo55059701325166_json", combo55059701325166_json);
    	return "article/list";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(HttpServletRequest request,Model model) throws Exception{
		String channelId = request.getParameter("channelId");
		CmsChannel channel = cmsChannelService.selectByPrimaryKey(channelId);
		if(channel != null){
			model.addAttribute("channelId", channelId);
			model.addAttribute("channelName",channel.getChannelName());
			System.out.println(channelId + " "+ channel.getChannelName());
		}
    	return "article/add";
    }
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult add(HttpServletRequest request,CmsArticle cmsArticle) throws Exception{
		//从cookie中取token
		String token = CookieUtils.getCookieValue(request, "TT_TOKEN");
		//根据token换取用户信息，调用sso系统的接口。
		AuthUser user = null;
		if(USE_REDIS){
			user = sessionUserService.getUserByToken(token);
		}else{
			user = (AuthUser) request.getSession().getAttribute(SessionUserServiceImpl.LOGIN_USER);
		}
        cmsArticle.setUserid(user.getUserid());
        cmsArticle.setDomainName(user.getDomainName());
        Set<String> imgs = ImageUtil.getImgStr(cmsArticle.getContent());
        if(imgs != null && imgs.size() > 0){
        	Iterator<String> iterator = imgs.iterator();
        	String thumbnail = iterator.next();
        	cmsArticle.setThumbnail(thumbnail);
        }
		ResponseResult result = cmsArticleService.insert(cmsArticle,true);
		return result;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult delete(@RequestParam List<String> articleIds)throws Exception{
		ResponseResult result = cmsArticleService.delete(articleIds);
		return result;
	}
	
	@RequestMapping(value = "/update/{articleId}",method = RequestMethod.GET)
    public String update(@PathVariable String articleId,Model model) throws Exception{
	  	model.addAttribute("articleId", articleId);
    	return "article/update";
    }
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	@ResponseBody
    public ResponseResult update(HttpServletRequest request) throws Exception{
    
    	CmsArticle cmsArticle = new CmsArticle();
		String articleId = request.getParameter("articleId");
		if(StringUtils.isNotEmpty(articleId)){
			cmsArticle.setArticleId(String.valueOf(articleId));
		}
		String title = request.getParameter("title");
		if(StringUtils.isNotEmpty(title)){
			cmsArticle.setTitle(String.valueOf(title));
		}
		String content = request.getParameter("content");
		if(StringUtils.isNotEmpty(content)){
			cmsArticle.setContent(String.valueOf(content));
		}
		String channelId = request.getParameter("channelId");
		if(StringUtils.isNotEmpty(channelId)){
			cmsArticle.setChannelId(String.valueOf(channelId));
		}
		String thumbnail = request.getParameter("thumbnail");
		if(StringUtils.isNotEmpty(thumbnail)){
			cmsArticle.setThumbnail(String.valueOf(thumbnail));
		}
		String keywords = request.getParameter("keywords");
		if(StringUtils.isNotEmpty(keywords)){
			cmsArticle.setKeywords(String.valueOf(keywords));
		}
		String description = request.getParameter("description");
		if(StringUtils.isNotEmpty(description)){
			cmsArticle.setDescription(String.valueOf(description));
		}
		String userid = request.getParameter("userid");
		if(StringUtils.isNotEmpty(userid)){
			cmsArticle.setUserid(String.valueOf(userid));
		}
		String readCount = request.getParameter("readCount");
		if(StringUtils.isNotEmpty(readCount)){
			cmsArticle.setReadCount(Integer.valueOf(readCount));
		}
		String status = request.getParameter("status");
		if(StringUtils.isNotEmpty(status)){
			cmsArticle.setStatus(String.valueOf(status));
		}
		String domainName = request.getParameter("domainName");
		if(StringUtils.isNotEmpty(domainName)){
			cmsArticle.setDomainName(String.valueOf(domainName));
		}
		String topNumber = request.getParameter("topNumber");
		if(StringUtils.isNotEmpty(topNumber)){
			cmsArticle.setTopNumber(Integer.valueOf(topNumber));
		}
		return cmsArticleService.update(cmsArticle);
    }
	
	@RequestMapping(value = "/queryList",method = RequestMethod.POST)
	@ResponseBody
    public EUDataGridResult queryList(HttpServletRequest request,EUDataGridModel dgm,CmsArticle cmsArticle) throws Exception{
		//从cookie中取token
		String token = CookieUtils.getCookieValue(request, "TT_TOKEN");
		//根据token换取用户信息，调用sso系统的接口。
		AuthUser user = null;
		if(USE_REDIS){
			user = sessionUserService.getUserByToken(token);
		}else{
			user = (AuthUser) request.getSession().getAttribute(SessionUserServiceImpl.LOGIN_USER);
		}
		cmsArticle.setUserid(user.getUserid());
		EUDataGridResult result = cmsArticleService.selectList(dgm, cmsArticle);
    	return result;
    }

	@RequestMapping(value="/load/{articleId}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult load(@PathVariable String articleId) {
		CmsArticle cmsArticle = cmsArticleService.selectByPrimaryKey(articleId);
		return new ResponseResult(cmsArticle);
	}
	
}