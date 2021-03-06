package com.team.platform.controller;

import java.util.List;

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

	private static final Logger logger = Logger.getLogger(AuthUserController.class);
	
	@Autowired
	private AuthUserService authUserService;
	
	@Autowired
	private SessionUserService sessionUserService;
	
	@Value("${USE_REDIS}")
	private Boolean USE_REDIS;
	
	@RequestMapping(value = "/list_self",method = RequestMethod.GET)
    public String list_self(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
    	return "user/list_self";
    }
	@RequestMapping(value = "/list_all",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
    	return "user/list_all";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(HttpServletRequest request,Model model) throws Exception{
		String page = request.getParameter("page");
		model.addAttribute("page", page);
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
	
	@RequestMapping(value = "/update",method = RequestMethod.GET)
    public String update(HttpServletRequest request,Model model) throws Exception{
		String userid = request.getParameter("userid");
	  	model.addAttribute("userid", userid);
	  	String page = request.getParameter("page");
		model.addAttribute("page", page);
    	return "user/update";
    }
	
	@RequestMapping(value = "/update_pwd",method = RequestMethod.GET)
    public String update_pwd(HttpServletRequest request,Model model) throws Exception{
		String userid = request.getParameter("userid");
	  	model.addAttribute("userid", userid);
	  	String page = request.getParameter("page");
		model.addAttribute("page", page);
		AuthUser user = authUserService.selectByPrimaryKey(userid);
		model.addAttribute("user", user);
    	return "user/update_pwd";
    }
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	@ResponseBody
    public ResponseResult update(HttpServletRequest request) throws Exception{
    
    	AuthUser authUser = new AuthUser();
		String userid = request.getParameter("userid");
		if(StringUtils.isNotEmpty(userid)){
			authUser.setUserid(String.valueOf(userid));
		}
		String username = request.getParameter("username");
		if(StringUtils.isNotEmpty(username)){
			authUser.setUsername(String.valueOf(username));
		}
		String operatorname = request.getParameter("operatorname");
		if(StringUtils.isNotEmpty(operatorname)){
			authUser.setOperatorname(String.valueOf(operatorname));
		}
		String password = request.getParameter("password");
		if(StringUtils.isNotEmpty(password)){
			authUser.setPassword(String.valueOf(password));
		}
		String domainName = request.getParameter("domainName");
		if(StringUtils.isNotEmpty(domainName)){
			authUser.setDomainName(String.valueOf(domainName));
		}
		String status = request.getParameter("status");
		if(StringUtils.isNotEmpty(status)){
			authUser.setStatus(String.valueOf(status));
		}
		String createUser = request.getParameter("createUser");
		if(StringUtils.isNotEmpty(createUser)){
			authUser.setCreateUser(String.valueOf(createUser));
		}
		return authUserService.update(authUser);
    }
	@RequestMapping(value = "/queryList",method = RequestMethod.POST)
	@ResponseBody
    public EUDataGridResult queryList(HttpServletRequest request,EUDataGridModel dgm,AuthUser authUser) throws Exception{
		EUDataGridResult result = authUserService.selectList(dgm, authUser);
    	return result;
    }
	
	@RequestMapping(value = "/queryNormalList",method = RequestMethod.POST)
	@ResponseBody
    public EUDataGridResult queryNormalList(HttpServletRequest request,EUDataGridModel dgm,AuthUser authUser) throws Exception{
		AuthUser user = sessionUserService.getLoginUser(request);
		authUser.setCreateUser(user.getUserid());
		EUDataGridResult result = authUserService.selectList(dgm, authUser);
    	return result;
    }

	@RequestMapping(value="/load/{userid}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult load(@PathVariable String userid) {
		AuthUser authUser = authUserService.selectByPrimaryKey(userid);
		return new ResponseResult(authUser);
	}
	
	/**
	 * 修改密码
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/modPass", method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult modPass(AuthUser user,@RequestParam(value="prePassword") String prePassword) throws Exception {
		try {
			ResponseResult result = authUserService.modPass(user,prePassword);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
	
}