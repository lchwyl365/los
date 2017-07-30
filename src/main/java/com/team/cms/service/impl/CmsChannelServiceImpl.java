package com.team.cms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;


import com.team.common.pojo.ResponseResult;
import com.team.common.util.PrimaryKeyFactory;
import com.team.cms.mapper.CmsChannelMapper;
import com.team.cms.pojo.CmsChannel;
import com.team.cms.pojo.CmsChannelExample;
import com.team.cms.pojo.CmsChannelExample.Criteria;
import com.team.cms.service.CmsChannelService;

import com.team.cms.vo.CmsChannelVo;



/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class CmsChannelServiceImpl implements CmsChannelService {

	@Autowired
	private CmsChannelMapper cmsChannelMapper;
	
	
	public List<CmsChannelVo> selectList(String pid,String userid) {
		
		//查询列表
		CmsChannelExample example = new CmsChannelExample();
		Criteria criteria = example.createCriteria();
		if(StringUtils.isNotEmpty(pid)){
			criteria.andPidEqualTo(pid);
		}
		if(StringUtils.isNotEmpty(userid)){
			criteria.andUseridEqualTo(userid);
		}
		//排序
		/*if(StringUtils.isNotEmpty(dgm.getSort())){
			example.setOrderByClause(dgm.getSort() + " " + dgm.getOrder());
		}*/
		List<CmsChannelVo> cmsChannelVoList = new ArrayList<CmsChannelVo>();
		List<CmsChannel> list = cmsChannelMapper.selectByExample(example);
		for (CmsChannel cmsChannel : list) {
			CmsChannelVo cmsChannelVo = new CmsChannelVo();
			cmsChannelVo.setChannelId(cmsChannel.getChannelId());
			cmsChannelVo.setChannelName(cmsChannel.getChannelName());
			cmsChannelVo.setChannelSort(cmsChannel.getChannelSort());
			cmsChannelVo.setIstop(cmsChannel.getIstop());
			cmsChannelVo.setChannelType(cmsChannel.getChannelType());
			cmsChannelVo.setPid(cmsChannel.getPid());
			cmsChannelVo.setCreatetime(cmsChannel.getCreatetime());
			cmsChannelVo.setUrl(cmsChannel.getUrl());
			cmsChannelVo.setStatus(cmsChannel.getStatus());
			cmsChannelVo.setContent(cmsChannel.getContent());
			cmsChannelVo.setDomainName(cmsChannel.getDomainName());
			cmsChannelVo.setUserid(cmsChannel.getUserid());
			cmsChannelVo.setThumbnail(cmsChannel.getThumbnail());
			cmsChannelVo.setDescription(cmsChannel.getDescription());
			List<CmsChannelVo> children = selectList(cmsChannelVo.getChannelId(),userid);
			if(children != null && children.size() > 0){
				cmsChannelVo.setChildren(children);
			}
			cmsChannelVoList.add(cmsChannelVo);
		}
		return cmsChannelVoList;
	}
	
	public List<CmsChannel> selectByCmsChannel(CmsChannel cmsChannel,String orderByClause){
		//查询列表
		CmsChannelExample example = new CmsChannelExample();
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(cmsChannel.getChannelId())){
			criteria.andChannelIdEqualTo(cmsChannel.getChannelId());
		}
		if(StringUtils.isNotEmpty(cmsChannel.getChannelName())){
			criteria.andChannelNameEqualTo(cmsChannel.getChannelName());
		}
		if(StringUtils.isNotEmpty(cmsChannel.getIstop())){
			criteria.andIstopEqualTo(cmsChannel.getIstop());
		}
		if(StringUtils.isNotEmpty(cmsChannel.getChannelType())){
			criteria.andChannelTypeEqualTo(cmsChannel.getChannelType());
		}
		if(StringUtils.isNotEmpty(cmsChannel.getPid())){
			criteria.andPidEqualTo(cmsChannel.getPid());
		}
		if(StringUtils.isNotEmpty(cmsChannel.getUrl())){
			criteria.andUrlEqualTo(cmsChannel.getUrl());
		}
		if(StringUtils.isNotEmpty(cmsChannel.getStatus())){
			criteria.andStatusEqualTo(cmsChannel.getStatus());
		}
		if(StringUtils.isNotEmpty(cmsChannel.getDomainName())){
			criteria.andDomainNameEqualTo(cmsChannel.getDomainName());
		}
		if(StringUtils.isNotEmpty(cmsChannel.getUserid())){
			criteria.andUseridEqualTo(cmsChannel.getUserid());
		}
		if(StringUtils.isNotEmpty(cmsChannel.getThumbnail())){
			criteria.andThumbnailEqualTo(cmsChannel.getThumbnail());
		}
		//排序
		if(StringUtils.isNotEmpty(orderByClause)){
			example.setOrderByClause(orderByClause);
		}
		List<CmsChannel> list = cmsChannelMapper.selectByExample(example);
		return list;
	}

	@Override
	public ResponseResult insert(CmsChannel cmsChannel,Boolean isDefault) {
		try {
			if(isDefault){
			//补全pojo内容
			  	if(StringUtils.isEmpty(cmsChannel.getChannelId())){
					cmsChannel.setChannelId(PrimaryKeyFactory.generatePK(""));
				}
			  	if(StringUtils.isEmpty(cmsChannel.getPid())){
			  		cmsChannel.setPid("0");
			  	}
				cmsChannel.setCreatetime(new Date());
			}
			cmsChannelMapper.insert(cmsChannel);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
		
	}

	@Override
	public ResponseResult delete(List<String> channelIds) {
		try {
			for (int i = 0; i < channelIds.size(); i++) {
				String channelId = channelIds.get(i);
			    cmsChannelMapper.deleteByPrimaryKey(channelId);
			}
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}

	@Override
	public CmsChannel selectByPrimaryKey(String channelId) {
		CmsChannel cmsChannel = cmsChannelMapper.selectByPrimaryKey(channelId);
		return cmsChannel;
	}

	@Override
	public ResponseResult update(CmsChannel cmsChannel) {
		try {
			CmsChannel temp = cmsChannelMapper.selectByPrimaryKey(cmsChannel.getChannelId());
			temp.setChannelName(cmsChannel.getChannelName());
			temp.setChannelSort(cmsChannel.getChannelSort());
			temp.setIstop(cmsChannel.getIstop());
			temp.setChannelType(cmsChannel.getChannelType());
			temp.setPid(cmsChannel.getPid());
			temp.setCreatetime(cmsChannel.getCreatetime());
			temp.setUrl(cmsChannel.getUrl());
			temp.setStatus(cmsChannel.getStatus());
			temp.setContent(cmsChannel.getContent());
			temp.setDomainName(cmsChannel.getDomainName());
			temp.setUserid(cmsChannel.getUserid());
			temp.setThumbnail(cmsChannel.getThumbnail());
			temp.setDescription(cmsChannel.getDescription());
			cmsChannelMapper.updateByPrimaryKeySelective(temp);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
}