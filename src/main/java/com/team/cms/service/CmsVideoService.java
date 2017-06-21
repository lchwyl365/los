package com.team.cms.service;

import java.util.List;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.cms.pojo.CmsVideo;

/**
 * Created by Administrator on 2017/02/27
 */
public interface CmsVideoService {

	public EUDataGridResult selectList(EUDataGridModel dgm,CmsVideo crmVideo);

	public List<CmsVideo> selectByCmsVideo(CmsVideo crmVideo,String orderByClause);
	
	public CmsVideo selectByPrimaryKey(String videoId);

	public ResponseResult insert(CmsVideo crmVideo);

	public ResponseResult delete(List<String> videoIds);

	public ResponseResult update(CmsVideo crmVideo);
	
}