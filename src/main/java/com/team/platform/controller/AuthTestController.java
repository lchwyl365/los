package com.team.platform.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.team.platform.pojo.AuthTest;
import com.team.platform.service.AuthTestService;

@Controller
@RequestMapping("/platform/test")
public class AuthTestController {

	private static final Logger logger = Logger.getLogger(AuthTestController.class);
	
	@Autowired
	private AuthTestService authTestService;
	
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
    	return "test/list";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add() throws Exception{
    	return "test/add";
    }
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult add(AuthTest authTest) throws Exception{
		ResponseResult result = authTestService.insert(authTest);
		return result;
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult delete(@RequestParam List<String> testids)throws Exception{
		ResponseResult result = authTestService.delete(testids);
		return result;
	}
	
	@RequestMapping(value = "/update/{testid}",method = RequestMethod.GET)
    public String update(@PathVariable String testid,Model model) throws Exception{
	  	model.addAttribute("testid", testid);
    	return "test/update";
    }
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	@ResponseBody
    public ResponseResult update(HttpServletRequest request) throws Exception{
    
    	AuthTest authTest = new AuthTest();
		authTest.setTestid(String.valueOf(request.getParameter("testid")));
		authTest.setTestname(String.valueOf(request.getParameter("testname")));
		authTest.setGroupId(String.valueOf(request.getParameter("groupId")));
		authTest.setTestgroup(String.valueOf(request.getParameter("testgroup")));
		authTest.setDeptId(String.valueOf(request.getParameter("deptId")));
		return authTestService.update(authTest);
    }
	
	@RequestMapping(value = "/queryList",method = RequestMethod.POST)
	@ResponseBody
    public EUDataGridResult queryList(EUDataGridModel dgm,AuthTest authTest) throws Exception{
		EUDataGridResult result = authTestService.selectList(dgm, authTest);
    	return result;
    }

	@RequestMapping(value="/load/{testid}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult load(@PathVariable String testid) {
		AuthTest authTest = authTestService.selectByPrimaryKey(testid);
		return new ResponseResult(authTest);
	}
	
}