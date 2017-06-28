package com.team.platform.service;

import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.platform.pojo.AuthUser;


/**
 * Created by Administrator on 2017/02/27
 */
public interface CommonService {

	EUDataGridResult selectListByRole(EUDataGridModel dgm, AuthUser user,
			String roleid);

}