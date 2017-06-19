package com.team.cms.service;

import java.util.List;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.cms.pojo.CmsBanner;

/**
 * Created by Administrator on 2017/02/27
 */
public interface CmsBannerService {

	public EUDataGridResult selectList(EUDataGridModel dgm,CmsBanner cmsBanner);
	
	public CmsBanner selectByPrimaryKey(String bannerId);

	public ResponseResult insert(CmsBanner cmsBanner);

	public ResponseResult delete(List<String> bannerIds);

	public ResponseResult update(CmsBanner cmsBanner);

	public List<CmsBanner> selectByBanner(CmsBanner cmsBanner);
	
}