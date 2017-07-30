package com.team.cms.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;

import com.team.cms.pojo.CmsChannel;
import com.team.cms.service.CmsChannelService;
import com.team.cms.vo.CmsChannelVo;
import com.team.common.pojo.ResponseResult;
import com.team.common.util.CookieUtils;
import com.team.common.util.FileUtil;
import com.team.platform.pojo.AuthUser;
import com.team.platform.service.SessionUserService;
import com.team.platform.service.SysComboBoxService;
import com.team.platform.service.impl.SessionUserServiceImpl;

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
	public String add(
		@RequestParam(value = "thumbnail", required = false) MultipartFile thumbnail,
		HttpServletRequest request) throws Exception{
		
		ServletContext application = request.getSession().getServletContext();
		
		CmsChannel cmsChannel = new CmsChannel();
        cmsChannel.setChannelName(String.valueOf(request.getParameter("channelName")));
        cmsChannel.setChannelSort(Integer.valueOf(request.getParameter("channelSort")));
        cmsChannel.setIstop(String.valueOf(request.getParameter("istop")));
        cmsChannel.setChannelType(String.valueOf(request.getParameter("channelType")));
        cmsChannel.setPid(String.valueOf(request.getParameter("pid")));
        cmsChannel.setUrl(String.valueOf(request.getParameter("url")));
        cmsChannel.setStatus(String.valueOf(request.getParameter("status")));
        cmsChannel.setContent(String.valueOf(request.getParameter("content")));
        if(StringUtils.isNotEmpty(thumbnail.getOriginalFilename())){
        	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
    		// 文件保存目录URL
            String thumbnailPath = application.getRealPath("/") + "upload/";
            String thumbnailUrl = request.getContextPath() + "/upload/";
            String thumbnailDirName = FileUtil.checkFileDir(thumbnailPath,thumbnailUrl,request);
            thumbnailPath = thumbnailPath + thumbnailDirName;
            thumbnailUrl = thumbnailUrl + thumbnailDirName;
            // 文件名
            String thumbnailFileExt = thumbnail.getOriginalFilename().substring(thumbnail.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
            String thumbnailNewFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + thumbnailFileExt;
            // 保存文件
            File thumbnailNewFile=new File(thumbnailPath + thumbnailNewFileName);
            //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
            thumbnail.transferTo(thumbnailNewFile);
            cmsChannel.setThumbnail(thumbnailUrl+thumbnailNewFileName);
        }
	
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
        cmsChannelService.insert(cmsChannel,true);
		return "channel/list";
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
	public String update(
		@RequestParam(value = "thumbnail", required = false) MultipartFile thumbnail,
		HttpServletRequest request) throws Exception{
		
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
	
		ServletContext application = request.getSession().getServletContext();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		if(StringUtils.isNotEmpty(thumbnail.getOriginalFilename())){
			// 文件保存目录URL
	        String thumbnailPath = application.getRealPath("/") + "upload/";
	        String thumbnailUrl = request.getContextPath() + "/upload/";
	        String thumbnailDirName = FileUtil.checkFileDir(thumbnailPath,thumbnailUrl,request);
	        thumbnailPath = thumbnailPath + thumbnailDirName;
	        thumbnailUrl = thumbnailUrl + thumbnailDirName;
	        // 文件名
	        String thumbnailFileExt = thumbnail.getOriginalFilename().substring(thumbnail.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
	        String thumbnailNewFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + thumbnailFileExt;
	        // 保存文件
	        File thumbnailNewFile=new File(thumbnailPath + thumbnailNewFileName);
	        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
	        thumbnail.transferTo(thumbnailNewFile);
	        cmsChannel.setThumbnail(thumbnailUrl+thumbnailNewFileName);
		}
		cmsChannelService.update(cmsChannel);
		return "channel/list"; 
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