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
		if(StringUtils.isNotEmpty(cmsBanner.getDomainName())){
			criteria.andDomainNameEqualTo(cmsBanner.getDomainName());
		}
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
	
	
	public List<CmsBanner> selectByCmsBanner(CmsBanner cmsBanner,String orderByClause){
		//查询列表
		CmsBannerExample example = new CmsBannerExample();
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(cmsBanner.getImg())){
			criteria.andImgEqualTo(cmsBanner.getImg());
		}
		if(StringUtils.isNotEmpty(cmsBanner.getBannerId())){
			criteria.andBannerIdEqualTo(cmsBanner.getBannerId());
		}
		if(StringUtils.isNotEmpty(cmsBanner.getBannerTitle())){
			criteria.andBannerTitleEqualTo(cmsBanner.getBannerTitle());
		}
		if(StringUtils.isNotEmpty(cmsBanner.getType())){
			criteria.andTypeEqualTo(cmsBanner.getType());
		}
		if(StringUtils.isNotEmpty(cmsBanner.getDomainName())){
			criteria.andDomainNameEqualTo(cmsBanner.getDomainName());
		}
		//排序
		if(StringUtils.isNotEmpty(orderByClause)){
			example.setOrderByClause(orderByClause);
		}
		List<CmsBanner> list = cmsBannerMapper.selectByExample(example);
		return list;
	}

	@Override
	public ResponseResult insert(CmsBanner cmsBanner,Boolean isDefault) {
		try {
			if(isDefault){
			//补全pojo内容
			  	if(StringUtils.isEmpty(cmsBanner.getBannerId())){
					cmsBanner.setBannerId(PrimaryKeyFactory.generatePK(""));
				}
				cmsBanner.setCreatetime(new Date());
			}
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
			temp.setDomainName(cmsBanner.getDomainName());
			cmsBannerMapper.updateByPrimaryKeySelective(temp);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
}