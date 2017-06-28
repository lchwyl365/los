package com.team.platform.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team.common.pojo.ResponseResult;
import com.team.platform.pojo.AuthUser;


/**
 * Created by Administrator on 2017/02/27
 */
public interface SessionUserService {
	
	AuthUser getUserByToken(String token);

	ResponseResult userLogin(String username, String password,
			HttpServletRequest request, HttpServletResponse response);

}