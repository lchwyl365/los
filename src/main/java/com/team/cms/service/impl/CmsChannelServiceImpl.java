package com.team.cms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


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
	
	
	public List<CmsChannelVo> selectList(String pid) {
		
		//查询列表
		CmsChannelExample example = new CmsChannelExample();
		Criteria criteria = example.createCriteria();
		if(StringUtils.isNotEmpty(pid)){
			criteria.andPidEqualTo(pid);
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
			List<CmsChannelVo> children = selectList(cmsChannelVo.getChannelId());
			if(children != null && children.size() > 0){
				cmsChannelVo.setChildren(children);
			}
			cmsChannelVoList.add(cmsChannelVo);
		}
		return cmsChannelVoList;
	}

	@Override
	public ResponseResult insert(CmsChannel cmsChannel) {
		try {
			//补全pojo内容
		  	if(StringUtils.isEmpty(cmsChannel.getChannelId())){
				cmsChannel.setChannelId(PrimaryKeyFactory.generatePK(""));
			}
			cmsChannel.setCreatetime(new Date());
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
				CmsChannel cmsChannel = cmsChannelMapper.selectByPrimaryKey(channelId);
				if(cmsChannel != null){
					cmsChannelMapper.deleteByPrimaryKey(channelId);
					if("0".equals(cmsChannel.getPid())){ //顶级节点
						CmsChannelExample example = new CmsChannelExample();
						Criteria criteria = example.createCriteria();
						criteria.andPidEqualTo(cmsChannel.getChannelId());
						cmsChannelMapper.deleteByExample(example);
					}
				}
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
			temp.setCreatetime(new Date());
			temp.setUrl(cmsChannel.getUrl());
			temp.setStatus(cmsChannel.getStatus());
			temp.setContent(cmsChannel.getContent());
			cmsChannelMapper.updateByPrimaryKeySelective(temp);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
}