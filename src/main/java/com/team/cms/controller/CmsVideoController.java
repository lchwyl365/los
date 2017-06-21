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
import com.team.cms.pojo.CmsVideo;
import com.team.cms.service.CmsVideoService;
import com.team.platform.service.SysComboBoxService;
import javax.servlet.ServletContext;
import java.io.File;
import com.team.common.util.FileUtil;
import org.springframework.web.multipart.MultipartFile;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@Controller
@RequestMapping("/cms/video")
public class CmsVideoController {

	private static final Logger logger = Logger.getLogger(CmsVideoController.class);
	
	@Autowired
	private CmsVideoService crmVideoService;
	
	@Autowired
	private SysComboBoxService sysComboBoxService;
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
	  	String combo56683781353113_json = sysComboBoxService.selectComboid("56683781353113");
		model.addAttribute("combo56683781353113_json", combo56683781353113_json);
    	return "video/list";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add() throws Exception{
    	return "video/add";
    }
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public String add(
		@RequestParam(value = "videoImage", required = false) MultipartFile videoImage,
		HttpServletRequest request) throws Exception{
		
		ServletContext application = request.getSession().getServletContext();
		
		CmsVideo crmVideo = new CmsVideo();
        crmVideo.setVideoTitle(String.valueOf(request.getParameter("videoTitle")));
        crmVideo.setChannelid(String.valueOf(request.getParameter("channelid")));
        crmVideo.setVideoDesc(String.valueOf(request.getParameter("videoDesc")));
        crmVideo.setIstop(String.valueOf(request.getParameter("istop")));
        crmVideo.setOrdernum(Integer.valueOf(request.getParameter("ordernum")));
        crmVideo.setYoukuid(String.valueOf(request.getParameter("youkuid")));
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		// 文件保存目录URL
        String videoImagePath = application.getRealPath("/") + "upload/";
        String videoImageUrl = request.getContextPath() + "/upload/";
        String videoImageDirName = FileUtil.checkFileDir(videoImagePath,videoImageUrl,request);
        videoImagePath = videoImagePath + videoImageDirName;
        videoImageUrl = videoImageUrl + videoImageDirName;
        // 文件名
        String videoImageFileExt = videoImage.getOriginalFilename().substring(videoImage.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
        String videoImageNewFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + videoImageFileExt;
        // 保存文件
        File videoImageNewFile=new File(videoImagePath + videoImageNewFileName);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        videoImage.transferTo(videoImageNewFile);
        crmVideo.setVideoImage(videoImageUrl+videoImageNewFileName);
        
        
        crmVideoService.insert(crmVideo);
		return "video/list";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult delete(@RequestParam List<String> videoIds)throws Exception{
		ResponseResult result = crmVideoService.delete(videoIds);
		return result;
	}
	
	@RequestMapping(value = "/update/{videoId}",method = RequestMethod.GET)
    public String update(@PathVariable String videoId,Model model) throws Exception{
	  	model.addAttribute("videoId", videoId);
    	return "video/update";
    }
	
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	@ResponseBody
    public ResponseResult update(HttpServletRequest request) throws Exception{
    
    	CmsVideo crmVideo = new CmsVideo();
		crmVideo.setVideoId(String.valueOf(request.getParameter("videoId")));
		crmVideo.setVideoImage(String.valueOf(request.getParameter("videoImage")));
		crmVideo.setVideoTitle(String.valueOf(request.getParameter("videoTitle")));
		crmVideo.setChannelid(String.valueOf(request.getParameter("channelid")));
		crmVideo.setVideoDesc(String.valueOf(request.getParameter("videoDesc")));
		crmVideo.setIstop(String.valueOf(request.getParameter("istop")));
		crmVideo.setOrdernum(Integer.valueOf(request.getParameter("ordernum")));
		crmVideo.setClicks(Integer.valueOf(request.getParameter("clicks")));
		crmVideo.setYoukuid(String.valueOf(request.getParameter("youkuid")));
		crmVideo.setAddress(String.valueOf(request.getParameter("address")));
		return crmVideoService.update(crmVideo);
    }
	
	@RequestMapping(value = "/queryList",method = RequestMethod.POST)
	@ResponseBody
    public EUDataGridResult queryList(EUDataGridModel dgm,CmsVideo crmVideo) throws Exception{
		EUDataGridResult result = crmVideoService.selectList(dgm, crmVideo);
    	return result;
    }

	@RequestMapping(value="/load/{videoId}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult load(@PathVariable String videoId) {
		CmsVideo crmVideo = crmVideoService.selectByPrimaryKey(videoId);
		return new ResponseResult(crmVideo);
	}
	
}