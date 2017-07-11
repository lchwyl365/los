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
import com.team.cms.pojo.CmsMember;
import com.team.cms.service.CmsMemberService;
import org.springframework.beans.factory.annotation.Value;
import com.team.common.util.CookieUtils;
import com.team.platform.service.SessionUserService;
import com.team.platform.service.impl.SessionUserServiceImpl;
import com.team.platform.pojo.AuthUser;

@Controller
@RequestMapping("/cms/member")
public class CmsMemberController {

	private static final Logger logger = Logger.getLogger(CmsMemberController.class);
	
	@Autowired
	private CmsMemberService cmsMemberService;
	
	
	@Autowired
	private SessionUserService sessionUserService;
	
	@Value("${USE_REDIS}")
	private Boolean USE_REDIS;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
    	return "member/list";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add() throws Exception{
    	return "member/add";
    }
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult add(HttpServletRequest request,CmsMember cmsMember) throws Exception{
		//从cookie中取token
		String token = CookieUtils.getCookieValue(request, "TT_TOKEN");
		//根据token换取用户信息，调用sso系统的接口。
		AuthUser user = null;
		if(USE_REDIS){
			user = sessionUserService.getUserByToken(token);
		}else{
			user = (AuthUser) request.getSession().getAttribute(SessionUserServiceImpl.LOGIN_USER);
		}
        cmsMember.setDomainName(user.getDomainName());
		ResponseResult result = cmsMemberService.insert(cmsMember,true);
		return result;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult delete(@RequestParam List<String> ids)throws Exception{
		ResponseResult result = cmsMemberService.delete(ids);
		return result;
	}
	
	@RequestMapping(value = "/update/{id}",method = RequestMethod.GET)
    public String update(@PathVariable String id,Model model) throws Exception{
	  	model.addAttribute("id", id);
    	return "member/update";
    }
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	@ResponseBody
    public ResponseResult update(HttpServletRequest request) throws Exception{
    
    	CmsMember cmsMember = new CmsMember();
		String id = request.getParameter("id");
		if(StringUtils.isNotEmpty(id)){
			cmsMember.setId(String.valueOf(id));
		}
		String memberId = request.getParameter("memberId");
		if(StringUtils.isNotEmpty(memberId)){
			cmsMember.setMemberId(String.valueOf(memberId));
		}
		String memberName = request.getParameter("memberName");
		if(StringUtils.isNotEmpty(memberName)){
			cmsMember.setMemberName(String.valueOf(memberName));
		}
		String sex = request.getParameter("sex");
		if(StringUtils.isNotEmpty(sex)){
			cmsMember.setSex(String.valueOf(sex));
		}
		String createtime = request.getParameter("createtime");
		if(StringUtils.isNotEmpty(createtime)){
			cmsMember.setCreatetime(String.valueOf(createtime));
		}
		String dan = request.getParameter("dan");
		if(StringUtils.isNotEmpty(dan)){
			cmsMember.setDan(String.valueOf(dan));
		}
		String domainName = request.getParameter("domainName");
		if(StringUtils.isNotEmpty(domainName)){
			cmsMember.setDomainName(String.valueOf(domainName));
		}
		return cmsMemberService.update(cmsMember);
    }
	@RequestMapping(value = "/queryList",method = RequestMethod.POST)
	@ResponseBody
    public EUDataGridResult queryList(EUDataGridModel dgm,CmsMember cmsMember) throws Exception{
		EUDataGridResult result = cmsMemberService.selectList(dgm, cmsMember);
    	return result;
    }

	@RequestMapping(value="/load/{id}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult load(@PathVariable String id) {
		CmsMember cmsMember = cmsMemberService.selectByPrimaryKey(id);
		return new ResponseResult(cmsMember);
	}
	
}