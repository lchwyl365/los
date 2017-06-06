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
import com.team.platform.pojo.SysDictEntry;
import com.team.platform.service.SysComboBoxService;
import com.team.platform.service.SysDictEntryService;

@Controller
@RequestMapping("/cms/channel")
public class CmsChannelController {

	private static final Logger logger = Logger.getLogger(CmsChannelController.class);
	
	@Autowired
	private CmsChannelService cmsChannelService;
	
	@Autowired
	private SysComboBoxService sysComboBoxService;
	
	@Autowired
	private SysDictEntryService sysDictEntryService;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
	  	String combo4_json = sysComboBoxService.selectComboid("55072199221118");
		model.addAttribute("combo4_json", combo4_json);
	  	String combo5_json = sysComboBoxService.selectComboid("55059701325166");
		model.addAttribute("combo5_json", combo5_json);
    	return "channel/list";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(@RequestParam String pid,@RequestParam String istop,Model model) throws Exception{
		
		List<SysDictEntry> dictitems = sysDictEntryService.selectByType("55072199221118");
		model.addAttribute("dictitems",dictitems);
		model.addAttribute("pid",pid);
		model.addAttribute("istop",istop);
    	return "channel/add";
    }
	
	@RequestMapping(value = "/add")
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
	  	
	  	List<SysDictEntry> dictitems = sysDictEntryService.selectByType("55072199221118");
		model.addAttribute("dictitems",dictitems);
		
    	return "channel/update";
    }
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	@ResponseBody
    public ResponseResult update(CmsChannel cmsChannel) throws Exception{
		ResponseResult result = cmsChannelService.update(cmsChannel);
		return result;
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