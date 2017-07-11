package com.team.cms.service;

import java.util.List;
import com.team.common.pojo.ResponseResult;
import com.team.cms.pojo.CmsAccessLog;

/**
 * Created by Administrator on 2017/02/27
 */
public interface CmsAccessLogService {

	public List<CmsAccessLog> selectByCmsAccessLog(CmsAccessLog cmsAccessLog,String orderByClause);
	
	public CmsAccessLog selectByPrimaryKey(String logId);

	public ResponseResult insert(CmsAccessLog cmsAccessLog,Boolean isDefault);

	public ResponseResult delete(List<String> logIds);

	public ResponseResult update(CmsAccessLog cmsAccessLog);
	
}