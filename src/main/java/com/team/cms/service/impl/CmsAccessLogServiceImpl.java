package com.team.cms.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.cms.mapper.CmsAccessLogMapper;
import com.team.cms.pojo.CmsAccessLog;
import com.team.cms.pojo.CmsAccessLogExample;
import com.team.cms.pojo.CmsAccessLogExample.Criteria;
import com.team.cms.service.CmsAccessLogService;
import com.team.common.pojo.ResponseResult;
import com.team.common.util.PrimaryKeyFactory;




/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class CmsAccessLogServiceImpl implements CmsAccessLogService {

	@Autowired
	private CmsAccessLogMapper cmsAccessLogMapper;
	
	
	
	public List<CmsAccessLog> selectByCmsAccessLog(CmsAccessLog cmsAccessLog,String orderByClause){
		//查询列表
		CmsAccessLogExample example = new CmsAccessLogExample();
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(cmsAccessLog.getArticleId())){
			criteria.andArticleIdEqualTo(cmsAccessLog.getArticleId());
		}
		if(StringUtils.isNotEmpty(cmsAccessLog.getIp())){
			criteria.andIpEqualTo(cmsAccessLog.getIp());
		}
		criteria.andCreatetimeBetween(getStartTime(), getEndTime());
		//排序
		if(StringUtils.isNotEmpty(orderByClause)){
			example.setOrderByClause(orderByClause);
		}
		List<CmsAccessLog> list = cmsAccessLogMapper.selectByExample(example);
		return list;
	}

	@Override
	public ResponseResult insert(CmsAccessLog cmsAccessLog,Boolean isDefault) {
		try {
			if(isDefault){
			//补全pojo内容
			  	if(StringUtils.isEmpty(cmsAccessLog.getLogId())){
					cmsAccessLog.setLogId(PrimaryKeyFactory.generatePK(""));
				}
			}
			cmsAccessLogMapper.insert(cmsAccessLog);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
		
	}

	@Override
	public ResponseResult delete(List<String> logIds) {
		try {
			for (int i = 0; i < logIds.size(); i++) {
				String logId = logIds.get(i);
			    cmsAccessLogMapper.deleteByPrimaryKey(logId);
			}
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}

	@Override
	public CmsAccessLog selectByPrimaryKey(String logId) {
		CmsAccessLog cmsAccessLog = cmsAccessLogMapper.selectByPrimaryKey(logId);
		return cmsAccessLog;
	}

	@Override
	public ResponseResult update(CmsAccessLog cmsAccessLog) {
		try {
			CmsAccessLog temp = cmsAccessLogMapper.selectByPrimaryKey(cmsAccessLog.getLogId());
			temp.setCreatetime(cmsAccessLog.getCreatetime());
			temp.setArticleId(cmsAccessLog.getArticleId());
			temp.setIp(cmsAccessLog.getIp());
			cmsAccessLogMapper.updateByPrimaryKeySelective(temp);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
	
	private static Date getStartTime() {  
        Calendar todayStart = Calendar.getInstance();  
        todayStart.set(Calendar.HOUR, 0);  
        todayStart.set(Calendar.MINUTE, 0);  
        todayStart.set(Calendar.SECOND, 0);  
        todayStart.set(Calendar.MILLISECOND, 0);  
        return todayStart.getTime();  
    }  
  
    private static Date getEndTime() {  
        Calendar todayEnd = Calendar.getInstance();  
        todayEnd.set(Calendar.HOUR, 23);  
        todayEnd.set(Calendar.MINUTE, 59);  
        todayEnd.set(Calendar.SECOND, 59);  
        todayEnd.set(Calendar.MILLISECOND, 999);  
        return todayEnd.getTime();  
    }  
}