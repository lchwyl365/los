package com.team.cms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.util.ExceptionUtil;

import com.team.common.pojo.ResponseResult;
import com.team.common.util.PrimaryKeyFactory;
import com.team.cms.mapper.CmsVideoMapper;
import com.team.cms.pojo.CmsVideo;
import com.team.cms.pojo.CmsVideoExample;
import com.team.cms.pojo.CmsVideoExample.Criteria;
import com.team.cms.service.CmsVideoService;




/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class CmsVideoServiceImpl implements CmsVideoService {

	@Autowired
	private CmsVideoMapper crmVideoMapper;
	
	public EUDataGridResult selectList(EUDataGridModel dgm, CmsVideo crmVideo) {
		
		//查询列表
		CmsVideoExample example = new CmsVideoExample();
		Criteria criteria = example.createCriteria();
		if(StringUtils.isNotEmpty(crmVideo.getUserid())){
			criteria.andUseridEqualTo(crmVideo.getUserid());
		}
		//排序
		if(StringUtils.isNotEmpty(dgm.getSort())){
			example.setOrderByClause(dgm.getSort() + " " + dgm.getOrder());
		}
		//分页处理
		PageHelper.startPage(dgm.getPage(), dgm.getRows());
		List<CmsVideo> list = crmVideoMapper.selectByExample(example);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<CmsVideo> pageInfo = new PageInfo<CmsVideo>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	
	public List<CmsVideo> selectByCmsVideo(CmsVideo crmVideo,String orderByClause){
		//查询列表
		CmsVideoExample example = new CmsVideoExample();
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(crmVideo.getVideoId())){
			criteria.andVideoIdEqualTo(crmVideo.getVideoId());
		}
		if(StringUtils.isNotEmpty(crmVideo.getVideoImage())){
			criteria.andVideoImageEqualTo(crmVideo.getVideoImage());
		}
		if(StringUtils.isNotEmpty(crmVideo.getVideoTitle())){
			criteria.andVideoTitleEqualTo(crmVideo.getVideoTitle());
		}
		if(StringUtils.isNotEmpty(crmVideo.getChannelid())){
			criteria.andChannelidEqualTo(crmVideo.getChannelid());
		}
		if(StringUtils.isNotEmpty(crmVideo.getVideoDesc())){
			criteria.andVideoDescEqualTo(crmVideo.getVideoDesc());
		}
		if(StringUtils.isNotEmpty(crmVideo.getIstop())){
			criteria.andIstopEqualTo(crmVideo.getIstop());
		}
		if(StringUtils.isNotEmpty(crmVideo.getYoukuid())){
			criteria.andYoukuidEqualTo(crmVideo.getYoukuid());
		}
		if(StringUtils.isNotEmpty(crmVideo.getAddress())){
			criteria.andAddressEqualTo(crmVideo.getAddress());
		}
		if(StringUtils.isNotEmpty(crmVideo.getUserid())){
			criteria.andUseridEqualTo(crmVideo.getUserid());
		}
		//排序
		if(StringUtils.isNotEmpty(orderByClause)){
			example.setOrderByClause(orderByClause);
		}
		List<CmsVideo> list = crmVideoMapper.selectByExample(example);
		return list;
	}

	@Override
	public ResponseResult insert(CmsVideo crmVideo,Boolean isDefault) {
		try {
			if(isDefault){
			//补全pojo内容
			  	if(StringUtils.isEmpty(crmVideo.getVideoId())){
					crmVideo.setVideoId(PrimaryKeyFactory.generatePK(""));
				}
				crmVideo.setCreatetime(new Date());
			}
			crmVideoMapper.insert(crmVideo);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
		
	}

	@Override
	public ResponseResult delete(List<String> videoIds) {
		try {
			for (int i = 0; i < videoIds.size(); i++) {
				String videoId = videoIds.get(i);
			    crmVideoMapper.deleteByPrimaryKey(videoId);
			}
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}

	@Override
	public CmsVideo selectByPrimaryKey(String videoId) {
		CmsVideo crmVideo = crmVideoMapper.selectByPrimaryKey(videoId);
		return crmVideo;
	}

	@Override
	public ResponseResult update(CmsVideo crmVideo) {
		try {
			CmsVideo temp = crmVideoMapper.selectByPrimaryKey(crmVideo.getVideoId());
			temp.setVideoImage(crmVideo.getVideoImage());
			temp.setVideoTitle(crmVideo.getVideoTitle());
			temp.setChannelid(crmVideo.getChannelid());
			temp.setVideoDesc(crmVideo.getVideoDesc());
			temp.setCreatetime(crmVideo.getCreatetime());
			temp.setIstop(crmVideo.getIstop());
			temp.setOrdernum(crmVideo.getOrdernum());
			temp.setClicks(crmVideo.getClicks());
			temp.setYoukuid(crmVideo.getYoukuid());
			temp.setAddress(crmVideo.getAddress());
			temp.setUserid(crmVideo.getUserid());
			crmVideoMapper.updateByPrimaryKeySelective(temp);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
}