package com.team.common.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public class FileUtil {

	public static String checkFileDir(String savePath, String saveUrl, HttpServletRequest request) {
		// 定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        extMap.put("flash", "swf,flv");
        extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
        
        // 检查目录
        File uploadDir = new File(savePath);
        if (!uploadDir.isDirectory()) {
            //return getError("上传目录不存在。");
        	//return "banner/add";
        }
        // 检查目录写权限
        if (!uploadDir.canWrite()) {
            //return getError("上传目录没有写权限。");
        	//return "banner/add";
        }

        String dirName = request.getParameter("dir");
        if (dirName == null) {
            dirName = "image";
        }
        if (!extMap.containsKey(dirName)) {
           // return getError("目录名不正确。");
           // return "banner/add";
        }
        // 创建文件夹
        savePath += dirName + "/";
        saveUrl += dirName + "/";
        File saveDirFile = new File(savePath);
        if (!saveDirFile.exists()) {
            saveDirFile.mkdirs();
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        savePath += ymd + "/";
        saveUrl += ymd + "/";
        File dirFile = new File(savePath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }
        
        return dirName + "/" +  ymd + "/";
	}
}
