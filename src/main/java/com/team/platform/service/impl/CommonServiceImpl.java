package com.team.platform.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.util.JsonUtils;
import com.team.platform.mapper.CommonMapper;
import com.team.platform.pojo.AuthUser;
import com.team.platform.service.CommonService;
/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private CommonMapper commonMapper;

	@Override
	public EUDataGridResult selectListByRole(EUDataGridModel dgm,
			AuthUser user, String roleid) {
		if(StringUtils.isEmpty(roleid)){
			return null;
		}
		//分页处理
		PageHelper.startPage(dgm.getPage(), dgm.getRows());
		List<AuthUser> list = commonMapper.selectUserByRole(roleid);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<AuthUser> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

}