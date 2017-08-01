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

import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.cms.pojo.CmsFriendlyLink;
import com.team.cms.service.CmsFriendlyLinkService;

import org.springframework.beans.factory.annotation.Value;

import com.team.common.util.CookieUtils;
import com.team.platform.service.SessionUserService;
import com.team.platform.service.impl.SessionUserServiceImpl;
import com.team.platform.pojo.AuthUser;

import javax.servlet.ServletContext;

import java.io.File;

import com.team.common.util.FileUtil;

import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@Controller
@RequestMapping("/cms/link")
public class CmsFriendlyLinkController {

	private static final Logger logger = Logger.getLogger(CmsFriendlyLinkController.class);
	
	@Autowired
	private CmsFriendlyLinkService cmsFriendlyLinkService;
	
	
	@Autowired
	private SessionUserService sessionUserService;
	
	@Value("${USE_REDIS}")
	private Boolean USE_REDIS;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
    	return "link/list";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add() throws Exception{
    	return "link/add";
    }
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public String add(
		@RequestParam(value = "logo", required = false) MultipartFile logo,
		HttpServletRequest request) throws Exception{
		
		ServletContext application = request.getSession().getServletContext();
		
		CmsFriendlyLink cmsFriendlyLink = new CmsFriendlyLink();
        cmsFriendlyLink.setUrl(String.valueOf(request.getParameter("url")));
        cmsFriendlyLink.setName(String.valueOf(request.getParameter("name")));
        cmsFriendlyLink.setOrderNum(Integer.valueOf(request.getParameter("orderNum")));
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	if(StringUtils.isNotEmpty(logo.getOriginalFilename())){
			// 文件保存目录URL
	        String logoPath = application.getRealPath("/") + "upload/";
	        String logoUrl = request.getContextPath() + "/upload/";
	        String logoDirName = FileUtil.checkFileDir(logoPath,logoUrl,request);
	        logoPath = logoPath + logoDirName;
	        logoUrl = logoUrl + logoDirName;
	        // 文件名
	        String logoFileExt = logo.getOriginalFilename().substring(logo.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
	        String logoNewFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + logoFileExt;
	        // 保存文件
	        File logoNewFile=new File(logoPath + logoNewFileName);
	        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
	        logo.transferTo(logoNewFile);
	        cmsFriendlyLink.setLogo(logoUrl+logoNewFileName);
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
        cmsFriendlyLink.setDomain(user.getDomainName());
        cmsFriendlyLinkService.insert(cmsFriendlyLink,true);
		return "link/list";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult delete(@RequestParam List<String> ids)throws Exception{
		ResponseResult result = cmsFriendlyLinkService.delete(ids);
		return result;
	}
	
	@RequestMapping(value = "/update/{id}",method = RequestMethod.GET)
    public String update(@PathVariable String id,Model model) throws Exception{
	  	model.addAttribute("id", id);
    	return "link/update";
    }
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String update(
		@RequestParam(value = "logo", required = false) MultipartFile logo,
		HttpServletRequest request) throws Exception{
		
		CmsFriendlyLink cmsFriendlyLink = new CmsFriendlyLink();
		String id = request.getParameter("id");
		if(StringUtils.isNotEmpty(id)){
			cmsFriendlyLink.setId(String.valueOf(id));
		}
		String url = request.getParameter("url");
		if(StringUtils.isNotEmpty(url)){
			cmsFriendlyLink.setUrl(String.valueOf(url));
		}
		String name = request.getParameter("name");
		if(StringUtils.isNotEmpty(name)){
			cmsFriendlyLink.setName(String.valueOf(name));
		}
		String orderNum = request.getParameter("orderNum");
		if(StringUtils.isNotEmpty(orderNum)){
			cmsFriendlyLink.setOrderNum(Integer.valueOf(orderNum));
		}
	
		ServletContext application = request.getSession().getServletContext();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		if(StringUtils.isNotEmpty(logo.getOriginalFilename())){
			// 文件保存目录URL
	        String logoPath = application.getRealPath("/") + "upload/";
	        String logoUrl = request.getContextPath() + "/upload/";
	        String logoDirName = FileUtil.checkFileDir(logoPath,logoUrl,request);
	        logoPath = logoPath + logoDirName;
	        logoUrl = logoUrl + logoDirName;
	        // 文件名
	        String logoFileExt = logo.getOriginalFilename().substring(logo.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
	        String logoNewFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + logoFileExt;
	        // 保存文件
	        File logoNewFile=new File(logoPath + logoNewFileName);
	        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
	        logo.transferTo(logoNewFile);
	        cmsFriendlyLink.setLogo(logoUrl+logoNewFileName);
        }
		cmsFriendlyLinkService.update(cmsFriendlyLink);
		return "link/list"; 
	}
	@RequestMapping(value = "/queryList",method = RequestMethod.POST)
	@ResponseBody
    public EUDataGridResult queryList(HttpServletRequest request,EUDataGridModel dgm,CmsFriendlyLink cmsFriendlyLink) throws Exception{
		//从cookie中取token
		String token = CookieUtils.getCookieValue(request, "TT_TOKEN");
		//根据token换取用户信息，调用sso系统的接口。
		AuthUser user = null;
		if(USE_REDIS){
			user = sessionUserService.getUserByToken(token);
		}else{
			user = (AuthUser) request.getSession().getAttribute(SessionUserServiceImpl.LOGIN_USER);
		}
		
		if(user != null){
			cmsFriendlyLink.setDomain(user.getDomainName());
		}
		EUDataGridResult result = cmsFriendlyLinkService.selectList(dgm, cmsFriendlyLink);
    	return result;
    }

	@RequestMapping(value="/load/{id}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult load(@PathVariable String id) {
		CmsFriendlyLink cmsFriendlyLink = cmsFriendlyLinkService.selectByPrimaryKey(id);
		return new ResponseResult(cmsFriendlyLink);
	}
	
}