package com.team.platform.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.common.util.PrimaryKeyFactory;
import com.team.platform.mapper.AuthUserMapper;
import com.team.platform.mapper.CommonMapper;
import com.team.platform.pojo.AuthRole;
import com.team.platform.pojo.AuthUser;
import com.team.platform.pojo.AuthUserExample;
import com.team.platform.pojo.AuthUserExample.Criteria;
import com.team.platform.service.AuthUserService;

/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class AuthUserServiceImpl implements AuthUserService {

	@Autowired
	private AuthUserMapper authUserMapper;
	
	@Autowired
	private CommonMapper commonMapper;
	
	public EUDataGridResult selectList(EUDataGridModel dgm, AuthUser authUser) {
		
		//查询列表
		AuthUserExample example = new AuthUserExample();
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(authUser.getCreateUser())){
			criteria.andCreateUserEqualTo(authUser.getCreateUser());
		}
		if(StringUtils.isNotEmpty(authUser.getUsername())){
			criteria.andUsernameLike("%"+authUser.getUsername()+"%");
		}
		if(StringUtils.isNotEmpty(authUser.getOperatorname())){
			criteria.andOperatornameLike("%"+authUser.getOperatorname()+"%");
		}
	
		//排序
		if(StringUtils.isNotEmpty(dgm.getSort())){
			example.setOrderByClause(dgm.getSort() + " " + dgm.getOrder());
		}
		//分页处理
		PageHelper.startPage(dgm.getPage(), dgm.getRows());
		List<AuthUser> list = authUserMapper.selectByExample(example);
		
		/** 设置机构信息 、角色信息**/
		for (AuthUser user : list) {
			List<AuthRole> roles = commonMapper.selectRoleByUser(user.getUserid());
			if(roles.size() > 0){
				StringBuilder roleName = new StringBuilder();
				for (int i = 0; i < roles.size(); i++) {
					if(i != 0) {
						roleName.append(";");
					}
					AuthRole role = roles.get(i);
					roleName.append(role.getName());
				}
				user.setRolename(roleName.toString());
			}
		}
		
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<AuthUser> pageInfo = new PageInfo<AuthUser>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	
	public List<AuthUser> selectByAuthUser(AuthUser authUser,String orderByClause){
		//查询列表
		AuthUserExample example = new AuthUserExample();
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(authUser.getUserid())){
			criteria.andUseridEqualTo(authUser.getUserid());
		}
		if(StringUtils.isNotEmpty(authUser.getUsername())){
			criteria.andUsernameLike("%"+authUser.getUsername()+"%");
		}
		if(StringUtils.isNotEmpty(authUser.getOperatorname())){
			criteria.andOperatornameLike("%"+authUser.getOperatorname()+"%");
		}
		if(StringUtils.isNotEmpty(authUser.getPassword())){
			criteria.andPasswordEqualTo(authUser.getPassword());
		}
		if(StringUtils.isNotEmpty(authUser.getDomainName())){
			criteria.andDomainNameEqualTo(authUser.getDomainName());
		}
		if(StringUtils.isNotEmpty(authUser.getStatus())){
			criteria.andStatusEqualTo(authUser.getStatus());
		}
		if(StringUtils.isNotEmpty(authUser.getCreateUser())){
			criteria.andCreateUserEqualTo(authUser.getCreateUser());
		}
		//排序
		if(StringUtils.isNotEmpty(orderByClause)){
			example.setOrderByClause(orderByClause);
		}
		List<AuthUser> list = authUserMapper.selectByExample(example);
		return list;
	}

	@Override
	public ResponseResult insert(AuthUser authUser,Boolean isDefault) {
		try {
			if(isDefault){
			//补全pojo内容
			  	if(StringUtils.isEmpty(authUser.getUserid())){
					authUser.setUserid(PrimaryKeyFactory.generatePK(""));
				}
				//md5加密
				authUser.setPassword(DigestUtils.md5DigestAsHex(authUser.getPassword().getBytes()));
				authUser.setCreatetime(new Date());
				authUser.setAltertime(new Date());
			}
			authUserMapper.insert(authUser);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
		
	}

	@Override
	public ResponseResult delete(List<String> userids) {
		try {
			for (int i = 0; i < userids.size(); i++) {
				String userid = userids.get(i);
			    authUserMapper.deleteByPrimaryKey(userid);
			}
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}

	@Override
	public AuthUser selectByPrimaryKey(String userid) {
		AuthUser authUser = authUserMapper.selectByPrimaryKey(userid);
		return authUser;
	}

	@Override
	public ResponseResult update(AuthUser authUser) {
		try {
			AuthUser temp = authUserMapper.selectByPrimaryKey(authUser.getUserid());
			temp.setUsername(authUser.getUsername());
			temp.setOperatorname(authUser.getOperatorname());
			//md5加密
			temp.setPassword(DigestUtils.md5DigestAsHex(authUser.getPassword().getBytes()));
			temp.setDomainName(authUser.getDomainName());
			temp.setCreatetime(authUser.getCreatetime());
			temp.setAltertime(authUser.getAltertime());
			temp.setStatus(authUser.getStatus());
			temp.setCreateUser(authUser.getCreateUser());
			authUserMapper.updateByPrimaryKeySelective(temp);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
	
	/**
	 * 修改密码
	 */
	@Override
	public ResponseResult modPass(AuthUser user,String prePassword) {
		if(user==null||user.getUserid()==null){
			throw new RuntimeException("用户不存在或登录超时！");
		}
		
		AuthUser temp = authUserMapper.selectByPrimaryKey(user.getUserid());
		String oldPassword = DigestUtils.md5DigestAsHex(prePassword.getBytes());
		if(!temp.getPassword().equals(oldPassword)){
			throw new RuntimeException("原密码不正确！");
		}
		//md5加密
		user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
		authUserMapper.updateByPrimaryKeySelective(user);
		return ResponseResult.ok();
	}
	
}