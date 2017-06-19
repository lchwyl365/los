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

import com.team.cms.vo.CmsChannelVo;

import com.team.common.pojo.ResponseResult;
import com.team.cms.pojo.CmsChannel;
import com.team.cms.service.CmsChannelService;
import com.team.platform.service.SysComboBoxService;

@Controller
@RequestMapping("/cms/channel")
public class CmsChannelController {

	private static final Logger logger = Logger.getLogger(CmsChannelController.class);
	
	@Autowired
	private CmsChannelService cmsChannelService;
	
	@Autowired
	private SysComboBoxService sysComboBoxService;
	
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
	@ResponseBody
	public ResponseResult add(CmsChannel cmsChannel) throws Exception{
		ResponseResult result = cmsChannelService.insert(cmsChannel);
		return result;
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
	@ResponseBody
    public ResponseResult update(HttpServletRequest request) throws Exception{
    
    	CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setChannelId(String.valueOf(request.getParameter("channelId")));
		cmsChannel.setChannelName(String.valueOf(request.getParameter("channelName")));
		cmsChannel.setChannelSort(Integer.valueOf(request.getParameter("channelSort")));
		cmsChannel.setIstop(String.valueOf(request.getParameter("istop")));
		cmsChannel.setChannelType(String.valueOf(request.getParameter("channelType")));
		cmsChannel.setPid(String.valueOf(request.getParameter("pid")));
		cmsChannel.setUrl(String.valueOf(request.getParameter("url")));
		cmsChannel.setStatus(String.valueOf(request.getParameter("status")));
		cmsChannel.setContent(String.valueOf(request.getParameter("content")));
		return cmsChannelService.update(cmsChannel);
    }
	
	@RequestMapping(value = "/queryList/{pid}")
	@ResponseBody
    public List<CmsChannelVo> queryList(@PathVariable String pid) throws Exception{
		List<CmsChannelVo> list = cmsChannelService.selectList(pid);
    	return list;
    }

	@RequestMapping(value="/load/{channelId}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult load(@PathVariable String channelId) {
		CmsChannel cmsChannel = cmsChannelService.selectByPrimaryKey(channelId);
		return new ResponseResult(cmsChannel);
	}
	
}