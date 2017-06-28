package com.team.platform.service;

import java.util.List;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.platform.pojo.AuthUser;

/**
 * Created by Administrator on 2017/02/27
 */
public interface AuthUserService {

	public EUDataGridResult selectList(EUDataGridModel dgm,AuthUser authUser);

	public List<AuthUser> selectByAuthUser(AuthUser authUser,String orderByClause);
	
	public AuthUser selectByPrimaryKey(String userid);

	public ResponseResult insert(AuthUser authUser,Boolean isDefault);

	public ResponseResult delete(List<String> userids);

	public ResponseResult update(AuthUser authUser);
	
}