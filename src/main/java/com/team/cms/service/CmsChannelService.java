package com.team.cms.service;

import java.util.List;
import com.team.cms.vo.CmsChannelVo;
import com.team.common.pojo.ResponseResult;
import com.team.cms.pojo.CmsChannel;

/**
 * Created by Administrator on 2017/02/27
 */
public interface CmsChannelService {

	public List<CmsChannelVo> selectList(String pid,String userid);

	public List<CmsChannel> selectByCmsChannel(CmsChannel cmsChannel,String orderByClause);
	
	public CmsChannel selectByPrimaryKey(String channelId);

	public ResponseResult insert(CmsChannel cmsChannel,Boolean isDefault);

	public ResponseResult delete(List<String> channelIds);

	public ResponseResult update(CmsChannel cmsChannel);
	
}