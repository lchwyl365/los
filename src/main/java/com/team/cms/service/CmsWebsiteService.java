package com.team.cms.service;

import java.util.List;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.cms.pojo.CmsWebsite;

/**
 * Created by Administrator on 2017/02/27
 */
public interface CmsWebsiteService {

	public EUDataGridResult selectList(EUDataGridModel dgm,CmsWebsite cmsWebsite);

	public List<CmsWebsite> selectByCmsWebsite(CmsWebsite cmsWebsite,String orderByClause);
	
	public CmsWebsite selectByPrimaryKey(String id);

	public ResponseResult insert(CmsWebsite cmsWebsite,Boolean isDefault);

	public ResponseResult delete(List<String> ids);

	public ResponseResult update(CmsWebsite cmsWebsite);

	public CmsWebsite selectByCmsWebsite(CmsWebsite _temp);
	
}