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
import com.team.cms.mapper.CmsBannerMapper;
import com.team.cms.pojo.CmsBanner;
import com.team.cms.pojo.CmsBannerExample;
import com.team.cms.pojo.CmsBannerExample.Criteria;
import com.team.cms.service.CmsBannerService;




/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class CmsBannerServiceImpl implements CmsBannerService {

	@Autowired
	private CmsBannerMapper cmsBannerMapper;
	
	public EUDataGridResult selectList(EUDataGridModel dgm, CmsBanner cmsBanner) {
		
		//查询列表
		CmsBannerExample example = new CmsBannerExample();
		Criteria criteria = example.createCriteria();
		
	
		//排序
		if(StringUtils.isNotEmpty(dgm.getSort())){
			example.setOrderByClause(dgm.getSort() + " " + dgm.getOrder());
		}
		//分页处理
		PageHelper.startPage(dgm.getPage(), dgm.getRows());
		List<CmsBanner> list = cmsBannerMapper.selectByExample(example);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<CmsBanner> pageInfo = new PageInfo<CmsBanner>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	

	@Override
	public ResponseResult insert(CmsBanner cmsBanner) {
		try {
			//补全pojo内容
		  	if(StringUtils.isEmpty(cmsBanner.getBannerId())){
				cmsBanner.setBannerId(PrimaryKeyFactory.generatePK(""));
			}
			cmsBanner.setCreatetime(new Date());
			cmsBannerMapper.insert(cmsBanner);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
		
	}

	@Override
	public ResponseResult delete(List<String> bannerIds) {
		try {
			for (int i = 0; i < bannerIds.size(); i++) {
				String bannerId = bannerIds.get(i);
			    cmsBannerMapper.deleteByPrimaryKey(bannerId);
			}
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}

	@Override
	public CmsBanner selectByPrimaryKey(String bannerId) {
		CmsBanner cmsBanner = cmsBannerMapper.selectByPrimaryKey(bannerId);
		return cmsBanner;
	}

	@Override
	public ResponseResult update(CmsBanner cmsBanner) {
		try {
			CmsBanner temp = cmsBannerMapper.selectByPrimaryKey(cmsBanner.getBannerId());
			temp.setImg(cmsBanner.getImg());
			temp.setBannerTitle(cmsBanner.getBannerTitle());
			temp.setType(cmsBanner.getType());
			temp.setCreatetime(cmsBanner.getCreatetime());
			temp.setOrderNum(cmsBanner.getOrderNum());
			cmsBannerMapper.updateByPrimaryKeySelective(temp);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
}