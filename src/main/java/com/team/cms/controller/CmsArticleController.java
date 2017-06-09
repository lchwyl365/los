package com.team.cms.controller;

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
import com.team.cms.pojo.CmsArticle;
import com.team.cms.service.CmsArticleService;
import com.team.platform.service.SysComboBoxService;

@Controller
@RequestMapping("/cms/article")
public class CmsArticleController {

	private static final Logger logger = Logger.getLogger(CmsArticleController.class);
	
	@Autowired
	private CmsArticleService cmsArticleService;
	
	@Autowired
	private SysComboBoxService sysComboBoxService;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
	  	String combo55059701325166_json = sysComboBoxService.selectComboid("55059701325166");
		model.addAttribute("combo55059701325166_json", combo55059701325166_json);
    	return "article/list";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add() throws Exception{
    	return "article/add";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult add(CmsArticle cmsArticle) throws Exception{
		ResponseResult result = cmsArticleService.insert(cmsArticle);
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
    public ResponseResult update(CmsArticle cmsArticle) throws Exception{
		ResponseResult result = cmsArticleService.update(cmsArticle);
		return result;
    }
	
	@RequestMapping(value = "/queryList",method = RequestMethod.POST)
	@ResponseBody
    public EUDataGridResult queryList(EUDataGridModel dgm,CmsArticle cmsArticle) throws Exception{
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