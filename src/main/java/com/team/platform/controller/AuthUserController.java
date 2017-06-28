package com.team.platform.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.common.util.CookieUtils;
import com.team.platform.pojo.AuthUser;
import com.team.platform.service.AuthUserService;
import com.team.platform.service.SessionUserService;
import com.team.platform.service.impl.SessionUserServiceImpl;

@Controller
@RequestMapping("/platform/user")
public class AuthUserController {

	@Autowired
	private SessionUserService sessionUserService;
	
	@Value("${USE_REDIS}")
	private Boolean USE_REDIS;
	
	private static final Logger logger = Logger.getLogger(AuthUserController.class);
	
	@Autowired
	private AuthUserService authUserService;
	
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
    	return "user/list";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add() throws Exception{
    	return "user/add";
    }
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult add(HttpServletRequest request,AuthUser authUser) throws Exception{
		
		//从cookie中取token
		String token = CookieUtils.getCookieValue(request, "TT_TOKEN");
		//根据token换取用户信息，调用sso系统的接口。
		AuthUser user = null;
		if(USE_REDIS){
			user = sessionUserService.getUserByToken(token);
		}else{
			user = (AuthUser) request.getSession().getAttribute(SessionUserServiceImpl.LOGIN_USER);
		}
		
		authUser.setCreateUser(user.getUserid());
		
		ResponseResult result = authUserService.insert(authUser,true);
		return result;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult delete(@RequestParam List<String> userids)throws Exception{
		ResponseResult result = authUserService.delete(userids);
		return result;
	}
	
	@RequestMapping(value = "/update/{userid}",method = RequestMethod.GET)
    public String update(@PathVariable String userid,Model model) throws Exception{
	  	model.addAttribute("userid", userid);
    	return "user/update";
    }
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	@ResponseBody
    public ResponseResult update(HttpServletRequest request) throws Exception{
    
    	AuthUser authUser = new AuthUser();
		authUser.setUserid(String.valueOf(request.getParameter("userid")));
		authUser.setUsername(String.valueOf(request.getParameter("username")));
		authUser.setOperatorname(String.valueOf(request.getParameter("operatorname")));
		authUser.setPassword(String.valueOf(request.getParameter("password")));
		authUser.setDomainName(String.valueOf(request.getParameter("domainName")));
		authUser.setStatus(String.valueOf(request.getParameter("status")));
		authUser.setCreateUser(String.valueOf(request.getParameter("createUser")));
		return authUserService.update(authUser);
    }
	
	@RequestMapping(value = "/queryList",method = RequestMethod.POST)
	@ResponseBody
    public EUDataGridResult queryList(EUDataGridModel dgm,AuthUser authUser) throws Exception{
		EUDataGridResult result = authUserService.selectList(dgm, authUser);
    	return result;
    }

	@RequestMapping(value="/load/{userid}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult load(@PathVariable String userid) {
		AuthUser authUser = authUserService.selectByPrimaryKey(userid);
		return new ResponseResult(authUser);
	}
	
}