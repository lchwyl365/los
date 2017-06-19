package com.team.cms.service;

import java.util.List;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.cms.pojo.CrmVideo;

/**
 * Created by Administrator on 2017/02/27
 */
public interface CrmVideoService {

	public EUDataGridResult selectList(EUDataGridModel dgm,CrmVideo crmVideo);
	
	public CrmVideo selectByPrimaryKey(String videoId);

	public ResponseResult insert(CrmVideo crmVideo);

	public ResponseResult delete(List<String> videoIds);

	public ResponseResult update(CrmVideo crmVideo);
	
}