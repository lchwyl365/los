package com.team.cms.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
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

import com.team.cms.pojo.CmsApply;
import com.team.cms.service.CmsApplyService;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.common.util.HttpClientUtil;

@Controller
@RequestMapping("/cms/apply")
public class CmsApplyController {

	private static final Logger logger = Logger.getLogger(CmsApplyController.class);
	
	@Autowired
	private CmsApplyService cmsApplyService;
	
	
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
    	return "apply/list";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add() throws Exception{
    	return "apply/add";
    }
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult add(HttpServletRequest request,CmsApply cmsApply) throws Exception{
		
		String serverName = HttpClientUtil.getMobileServerName(request);
		cmsApply.setDomainName(serverName);
		ServletContext application = request.getSession().getServletContext();
        
		ResponseResult result = cmsApplyService.insert(cmsApply, true);
		return result;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult delete(@RequestParam List<String> ids)throws Exception{
		ResponseResult result = cmsApplyService.delete(ids);
		return result;
	}
	
	@RequestMapping(value = "/update/{id}",method = RequestMethod.GET)
    public String update(@PathVariable String id,Model model) throws Exception{
	  	model.addAttribute("id", id);
    	return "apply/update";
    }
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	@ResponseBody
    public ResponseResult update(HttpServletRequest request) throws Exception{
    
    	CmsApply cmsApply = new CmsApply();
		String id = request.getParameter("id");
		if(StringUtils.isNotEmpty(id)){
			cmsApply.setId(String.valueOf(id));
		}
		String name = request.getParameter("name");
		if(StringUtils.isNotEmpty(name)){
			cmsApply.setName(String.valueOf(name));
		}
		String telphone = request.getParameter("telphone");
		if(StringUtils.isNotEmpty(telphone)){
			cmsApply.setTelphone(String.valueOf(telphone));
		}
		String content = request.getParameter("content");
		if(StringUtils.isNotEmpty(content)){
			cmsApply.setContent(String.valueOf(content));
		}
	  	cmsApply.setCreatetime(new Date(request.getParameter("createtime")));
		String domainName = request.getParameter("domainName");
		if(StringUtils.isNotEmpty(domainName)){
			cmsApply.setDomainName(String.valueOf(domainName));
		}
		return cmsApplyService.update(cmsApply);
    }
	@RequestMapping(value = "/queryList",method = RequestMethod.POST)
	@ResponseBody
    public EUDataGridResult queryList(EUDataGridModel dgm,CmsApply cmsApply) throws Exception{
		EUDataGridResult result = cmsApplyService.selectList(dgm, cmsApply);
    	return result;
    }

	@RequestMapping(value="/load/{id}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult load(@PathVariable String id) {
		CmsApply cmsApply = cmsApplyService.selectByPrimaryKey(id);
		return new ResponseResult(cmsApply);
	}
	
}