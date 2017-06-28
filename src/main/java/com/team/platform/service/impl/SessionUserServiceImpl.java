package com.team.platform.service.impl;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.team.common.pojo.ResponseResult;
import com.team.common.util.CookieUtils;
import com.team.common.util.JsonUtils;
import com.team.platform.dao.JedisClient;
import com.team.platform.mapper.AuthUserMapper;
import com.team.platform.pojo.AuthUser;
import com.team.platform.pojo.AuthUserExample;
import com.team.platform.pojo.AuthUserExample.Criteria;
import com.team.platform.service.SessionUserService;
/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class SessionUserServiceImpl implements SessionUserService {
	
	@Autowired
	private JedisClient jedisClient;
	
	public static final String LOGIN_USER = "LOGIN_USER";
	
	@Value("${USE_REDIS}")
	private Boolean USE_REDIS;
	@Value("${REDIS_USER_SESSION_KEY}")
	private String REDIS_USER_SESSION_KEY;
	@Value("${SSO_SESSION_EXPIRE}")
	private Integer SSO_SESSION_EXPIRE;
	
	@Autowired
	private AuthUserMapper authUserMapper;

	@Override
	public AuthUser getUserByToken(String token) {
		//根据token从redis中查询用户信息
		String json = "";
		if(USE_REDIS){
			json = jedisClient.get(REDIS_USER_SESSION_KEY + ":" + token);
			//判断是否为空
			if (StringUtils.isBlank(json)) {
				return null;
			}
			//更新过期时间
			jedisClient.expire(REDIS_USER_SESSION_KEY + ":" + token, SSO_SESSION_EXPIRE);
		}
		
		//返回用户信息
		return JsonUtils.jsonToPojo(json, AuthUser.class);
	}

	@Override
	public ResponseResult userLogin(String username, String password,HttpServletRequest request, HttpServletResponse response) {
		//查询列表
		AuthUserExample example = new AuthUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<AuthUser> list = authUserMapper.selectByExample(example);
		//如果没有此用户名
		if (null == list || list.size() == 0) {
			return ResponseResult.build(400, "用户名或密码错误");
		}
		AuthUser user = list.get(0);
		//比对密码
		if (!DigestUtils.md5DigestAsHex(password.getBytes()).equals(user.getPassword())) {
			return ResponseResult.build(400, "用户名或密码错误");
		}
		//生成token
		String token = UUID.randomUUID().toString();
		//保存用户之前，把用户对象中的密码清空。
		user.setPassword(null);
		if(USE_REDIS){
			//把用户信息写入redis
			jedisClient.set(REDIS_USER_SESSION_KEY + ":" + token, JsonUtils.objectToJson(user));
			//设置session的过期时间
			jedisClient.expire(REDIS_USER_SESSION_KEY + ":" + token, SSO_SESSION_EXPIRE);
		} else {
			request.getSession().setAttribute(LOGIN_USER, user);
		}
		
		//写入cookie
		CookieUtils.setCookie(request, response, "TT_TOKEN", token);

		//返回token
		return ResponseResult.ok(token);
	}
}