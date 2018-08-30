package com.team.cms.service;

import java.util.List;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.cms.pojo.CmsApply;

/**
 * Created by Administrator on 2017/02/27
 */
public interface CmsApplyService {

	public EUDataGridResult selectList(EUDataGridModel dgm,CmsApply cmsApply);

	public List<CmsApply> selectByCmsApply(CmsApply cmsApply,String orderByClause);
	
	public CmsApply selectByPrimaryKey(String id);

	public ResponseResult insert(CmsApply cmsApply,Boolean isDefault);

	public ResponseResult delete(List<String> ids);

	public ResponseResult update(CmsApply cmsApply);
	
}