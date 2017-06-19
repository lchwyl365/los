package com.team.cms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.util.ExceptionUtil;

import com.team.common.pojo.ResponseResult;
import com.team.common.util.PrimaryKeyFactory;
import com.team.cms.mapper.CrmVideoMapper;
import com.team.cms.pojo.CrmVideo;
import com.team.cms.pojo.CrmVideoExample;
import com.team.cms.pojo.CrmVideoExample.Criteria;
import com.team.cms.service.CrmVideoService;




/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class CrmVideoServiceImpl implements CrmVideoService {

	@Autowired
	private CrmVideoMapper crmVideoMapper;
	
	public EUDataGridResult selectList(EUDataGridModel dgm, CrmVideo crmVideo) {
		
		//查询列表
		CrmVideoExample example = new CrmVideoExample();
		Criteria criteria = example.createCriteria();
		
	
		//排序
		if(StringUtils.isNotEmpty(dgm.getSort())){
			example.setOrderByClause(dgm.getSort() + " " + dgm.getOrder());
		}
		//分页处理
		PageHelper.startPage(dgm.getPage(), dgm.getRows());
		List<CrmVideo> list = crmVideoMapper.selectByExample(example);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<CrmVideo> pageInfo = new PageInfo<CrmVideo>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	

	@Override
	public ResponseResult insert(CrmVideo crmVideo) {
		try {
			//补全pojo内容
		  	if(StringUtils.isEmpty(crmVideo.getVideoId())){
				crmVideo.setVideoId(PrimaryKeyFactory.generatePK(""));
			}
			crmVideo.setCreatetime(new Date());
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
	public CrmVideo selectByPrimaryKey(String videoId) {
		CrmVideo crmVideo = crmVideoMapper.selectByPrimaryKey(videoId);
		return crmVideo;
	}

	@Override
	public ResponseResult update(CrmVideo crmVideo) {
		try {
			CrmVideo temp = crmVideoMapper.selectByPrimaryKey(crmVideo.getVideoId());
			temp.setVideoTitle(crmVideo.getVideoTitle());
			temp.setVideoImage(crmVideo.getVideoImage());
			temp.setVideoDesc(crmVideo.getVideoDesc());
			temp.setCreatetime(crmVideo.getCreatetime());
			temp.setIstop(crmVideo.getIstop());
			temp.setOrdernum(crmVideo.getOrdernum());
			temp.setClicks(crmVideo.getClicks());
			temp.setYoukuid(crmVideo.getYoukuid());
			temp.setAddress(crmVideo.getAddress());
			crmVideoMapper.updateByPrimaryKeySelective(temp);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
}