package com.team.cms.service;

import java.util.List;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.cms.pojo.CmsMember;

/**
 * Created by Administrator on 2017/02/27
 */
public interface CmsMemberService {

	public EUDataGridResult selectList(EUDataGridModel dgm,CmsMember cmsMember);

	public List<CmsMember> selectByCmsMember(CmsMember cmsMember,String orderByClause);
	
	public CmsMember selectByPrimaryKey(String id);

	public ResponseResult insert(CmsMember cmsMember,Boolean isDefault);

	public ResponseResult delete(List<String> ids);

	public ResponseResult update(CmsMember cmsMember);
	
}