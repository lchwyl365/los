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
import com.team.cms.pojo.CmsBanner;
import com.team.cms.service.CmsBannerService;
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
@RequestMapping("/cms/banner")
public class CmsBannerController {

	private static final Logger logger = Logger.getLogger(CmsBannerController.class);
	
	@Autowired
	private CmsBannerService cmsBannerService;
	
	
	@Autowired
	private SessionUserService sessionUserService;
	
	@Value("${USE_REDIS}")
	private Boolean USE_REDIS;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
    	return "banner/list";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add() throws Exception{
    	return "banner/add";
    }
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public String add(
		@RequestParam(value = "img", required = false) MultipartFile img,
		HttpServletRequest request) throws Exception{
		
		ServletContext application = request.getSession().getServletContext();
		
		CmsBanner cmsBanner = new CmsBanner();
        cmsBanner.setBannerTitle(String.valueOf(request.getParameter("bannerTitle")));
        cmsBanner.setType(String.valueOf(request.getParameter("type")));
        cmsBanner.setOrderNum(Integer.valueOf(request.getParameter("orderNum")));
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		// 文件保存目录URL
        String imgPath = application.getRealPath("/") + "upload/";
        String imgUrl = request.getContextPath() + "/upload/";
        String imgDirName = FileUtil.checkFileDir(imgPath,imgUrl,request);
        imgPath = imgPath + imgDirName;
        imgUrl = imgUrl + imgDirName;
        // 文件名
        String imgFileExt = img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
        String imgNewFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + imgFileExt;
        // 保存文件
        File imgNewFile=new File(imgPath + imgNewFileName);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        img.transferTo(imgNewFile);
        cmsBanner.setImg(imgUrl+imgNewFileName);
        
	
		//从cookie中取token
		String token = CookieUtils.getCookieValue(request, "TT_TOKEN");
		//根据token换取用户信息，调用sso系统的接口。
		AuthUser user = null;
		if(USE_REDIS){
			user = sessionUserService.getUserByToken(token);
		}else{
			user = (AuthUser) request.getSession().getAttribute(SessionUserServiceImpl.LOGIN_USER);
		}
        cmsBanner.setDomainName(user.getDomainName());
        cmsBannerService.insert(cmsBanner,true);
		return "banner/list";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult delete(@RequestParam List<String> bannerIds)throws Exception{
		ResponseResult result = cmsBannerService.delete(bannerIds);
		return result;
	}
	
	@RequestMapping(value = "/update/{bannerId}",method = RequestMethod.GET)
    public String update(@PathVariable String bannerId,Model model) throws Exception{
	  	model.addAttribute("bannerId", bannerId);
    	return "banner/update";
    }
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String update(
		@RequestParam(value = "img", required = false) MultipartFile img,
		HttpServletRequest request) throws Exception{
		
		CmsBanner cmsBanner = new CmsBanner();
		String bannerTitle = request.getParameter("bannerTitle");
		if(StringUtils.isNotEmpty(bannerTitle)){
			cmsBanner.setBannerTitle(String.valueOf(bannerTitle));
		}
		String type = request.getParameter("type");
		if(StringUtils.isNotEmpty(type)){
			cmsBanner.setType(String.valueOf(type));
		}
		String orderNum = request.getParameter("orderNum");
		if(StringUtils.isNotEmpty(orderNum)){
			cmsBanner.setOrderNum(Integer.valueOf(orderNum));
		}
	
		ServletContext application = request.getSession().getServletContext();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		// 文件保存目录URL
        String imgPath = application.getRealPath("/") + "upload/";
        String imgUrl = request.getContextPath() + "/upload/";
        String imgDirName = FileUtil.checkFileDir(imgPath,imgUrl,request);
        imgPath = imgPath + imgDirName;
        imgUrl = imgUrl + imgDirName;
        // 文件名
        String imgFileExt = img.getOriginalFilename().substring(img.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
        String imgNewFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + imgFileExt;
        // 保存文件
        File imgNewFile=new File(imgPath + imgNewFileName);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        img.transferTo(imgNewFile);
        cmsBanner.setImg(imgUrl+imgNewFileName);
        
		cmsBannerService.update(cmsBanner);
		return "banner/list"; 
	}
	@RequestMapping(value = "/queryList",method = RequestMethod.POST)
	@ResponseBody
    public EUDataGridResult queryList(EUDataGridModel dgm,CmsBanner cmsBanner) throws Exception{
		EUDataGridResult result = cmsBannerService.selectList(dgm, cmsBanner);
    	return result;
    }

	@RequestMapping(value="/load/{bannerId}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult load(@PathVariable String bannerId) {
		CmsBanner cmsBanner = cmsBannerService.selectByPrimaryKey(bannerId);
		return new ResponseResult(cmsBanner);
	}
	
}