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

import com.team.cms.pojo.CmsWebsite;
import com.team.cms.service.CmsWebsiteService;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.platform.pojo.AuthUser;
import com.team.platform.service.SessionUserService;

@Controller
@RequestMapping("/cms/website")
public class CmsWebsiteController {

	private static final Logger logger = Logger.getLogger(CmsWebsiteController.class);
	
	@Autowired
	private CmsWebsiteService cmsWebsiteService;
	
	@Autowired
	private SessionUserService sessionUserService;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
    	return "website/list";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add() throws Exception{
    	return "website/add";
    }
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult add(HttpServletRequest request,CmsWebsite cmsWebsite) throws Exception{
		ResponseResult result = cmsWebsiteService.insert(cmsWebsite,true);
		return result;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult delete(@RequestParam List<String> ids)throws Exception{
		ResponseResult result = cmsWebsiteService.delete(ids);
		return result;
	}
	
	@RequestMapping(value = "/update",method = RequestMethod.GET)
    public String update(HttpServletRequest request ,Model model) throws Exception{
		AuthUser user = sessionUserService.getLoginUser(request);
		if(user == null) {
			return "redirect:/admin/login";
		}
		CmsWebsite _temp = new CmsWebsite();
		_temp.setDomainName(user.getDomainName());
		CmsWebsite website = cmsWebsiteService.selectByCmsWebsite(_temp);
		if (website == null) {
			model.addAttribute("website", _temp);
		} else {
			model.addAttribute("website", website);
		}
    	return "website/update";
    }
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	@ResponseBody
    public ResponseResult update(HttpServletRequest request) throws Exception{
    
    	CmsWebsite cmsWebsite = new CmsWebsite();
		String id = request.getParameter("id");
		if(StringUtils.isNotEmpty(id)){
			cmsWebsite.setId(String.valueOf(id));
		}
		String domainName = request.getParameter("domainName");
		if(StringUtils.isNotEmpty(domainName)){
			cmsWebsite.setDomainName(String.valueOf(domainName));
		}
		String address = request.getParameter("address");
		if(StringUtils.isNotEmpty(address)){
			cmsWebsite.setAddress(String.valueOf(address));
		}
		String telphone = request.getParameter("telphone");
		if(StringUtils.isNotEmpty(telphone)){
			cmsWebsite.setTelphone(String.valueOf(telphone));
		}
		String email = request.getParameter("email");
		if(StringUtils.isNotEmpty(email)){
			cmsWebsite.setEmail(email);
		}
		String mainProduct = request.getParameter("mainProduct");
		if(StringUtils.isNotEmpty(mainProduct)){
			cmsWebsite.setMainProduct(String.valueOf(mainProduct));
		}
		String keywords = request.getParameter("keywords");
		if(StringUtils.isNotEmpty(keywords)){
			cmsWebsite.setKeywords(String.valueOf(keywords));
		}
		String description = request.getParameter("description");
		if(StringUtils.isNotEmpty(description)){
			cmsWebsite.setDescription(String.valueOf(description));
		}
		String name = request.getParameter("name");
		if(StringUtils.isNotEmpty(name)){
			cmsWebsite.setName(name);
		}
		String copyright = request.getParameter("copyright");
		if(StringUtils.isNotEmpty(copyright)){
			cmsWebsite.setCopyright(copyright);
		}
		return cmsWebsiteService.update(cmsWebsite);
    }
	@RequestMapping(value = "/queryList",method = RequestMethod.POST)
	@ResponseBody
    public EUDataGridResult queryList(EUDataGridModel dgm,CmsWebsite cmsWebsite) throws Exception{
		EUDataGridResult result = cmsWebsiteService.selectList(dgm, cmsWebsite);
    	return result;
    }

	@RequestMapping(value="/load",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult load(HttpServletRequest request ) {
		AuthUser user = sessionUserService.getLoginUser(request);
		CmsWebsite _temp = new CmsWebsite();
		_temp.setDomainName(user.getDomainName());
		CmsWebsite cmsWebsite = cmsWebsiteService.selectByCmsWebsite(_temp);
		return new ResponseResult(cmsWebsite);
	}
	
}