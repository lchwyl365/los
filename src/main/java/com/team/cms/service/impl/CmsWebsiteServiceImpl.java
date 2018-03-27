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
import com.team.cms.mapper.CmsWebsiteMapper;
import com.team.cms.pojo.CmsWebsite;
import com.team.cms.pojo.CmsWebsiteExample;
import com.team.cms.pojo.CmsWebsiteExample.Criteria;
import com.team.cms.service.CmsWebsiteService;




/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class CmsWebsiteServiceImpl implements CmsWebsiteService {

	@Autowired
	private CmsWebsiteMapper cmsWebsiteMapper;
	
	public EUDataGridResult selectList(EUDataGridModel dgm, CmsWebsite cmsWebsite) {
		
		//查询列表
		CmsWebsiteExample example = new CmsWebsiteExample();
		Criteria criteria = example.createCriteria();
		
	
		//排序
		if(StringUtils.isNotEmpty(dgm.getSort())){
			example.setOrderByClause(dgm.getSort() + " " + dgm.getOrder());
		}
		//分页处理
		PageHelper.startPage(dgm.getPage(), dgm.getRows());
		List<CmsWebsite> list = cmsWebsiteMapper.selectByExample(example);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<CmsWebsite> pageInfo = new PageInfo<CmsWebsite>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	
	public List<CmsWebsite> selectByCmsWebsite(CmsWebsite cmsWebsite,String orderByClause){
		//查询列表
		CmsWebsiteExample example = new CmsWebsiteExample();
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(cmsWebsite.getId())){
			criteria.andIdEqualTo(cmsWebsite.getId());
		}
		if(StringUtils.isNotEmpty(cmsWebsite.getDomainName())){
			criteria.andDomainNameEqualTo(cmsWebsite.getDomainName());
		}
		if(StringUtils.isNotEmpty(cmsWebsite.getAddress())){
			criteria.andAddressEqualTo(cmsWebsite.getAddress());
		}
		if(StringUtils.isNotEmpty(cmsWebsite.getTelphone())){
			criteria.andTelphoneEqualTo(cmsWebsite.getTelphone());
		}
		//排序
		if(StringUtils.isNotEmpty(orderByClause)){
			example.setOrderByClause(orderByClause);
		}
		List<CmsWebsite> list = cmsWebsiteMapper.selectByExample(example);
		return list;
	}

	@Override
	public ResponseResult insert(CmsWebsite cmsWebsite,Boolean isDefault) {
		try {
			if(isDefault){
			//补全pojo内容
			  	if(StringUtils.isEmpty(cmsWebsite.getId())){
					cmsWebsite.setId(PrimaryKeyFactory.generatePK(""));
				}
			}
			cmsWebsiteMapper.insert(cmsWebsite);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
		
	}

	@Override
	public ResponseResult delete(List<String> ids) {
		try {
			for (int i = 0; i < ids.size(); i++) {
				String id = ids.get(i);
			    cmsWebsiteMapper.deleteByPrimaryKey(id);
			}
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}

	@Override
	public CmsWebsite selectByPrimaryKey(String id) {
		CmsWebsite cmsWebsite = cmsWebsiteMapper.selectByPrimaryKey(id);
		return cmsWebsite;
	}

	@Override
	public ResponseResult update(CmsWebsite cmsWebsite) {
		try {
			CmsWebsite temp = this.selectByCmsWebsite(cmsWebsite);
			if (temp == null) {
				temp = new CmsWebsite();
				temp.setId(PrimaryKeyFactory.generatePK(""));
				temp.setDomainName(cmsWebsite.getDomainName());
				temp.setAddress(cmsWebsite.getAddress());
				temp.setTelphone(cmsWebsite.getTelphone());
				temp.setEmail(cmsWebsite.getEmail());
				temp.setMainProduct(cmsWebsite.getMainProduct());
				temp.setKeywords(cmsWebsite.getKeywords());
				temp.setDescription(cmsWebsite.getDescription());
				cmsWebsiteMapper.insertSelective(temp);
			} else {
				temp.setAddress(cmsWebsite.getAddress());
				temp.setTelphone(cmsWebsite.getTelphone());
				temp.setEmail(cmsWebsite.getEmail());
				temp.setMainProduct(cmsWebsite.getMainProduct());
				temp.setKeywords(cmsWebsite.getKeywords());
				temp.setDescription(cmsWebsite.getDescription());
				cmsWebsiteMapper.updateByPrimaryKeySelective(temp);
			}
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}

	@Override
	public CmsWebsite selectByCmsWebsite(CmsWebsite _temp) {
		//查询列表
		CmsWebsiteExample example = new CmsWebsiteExample();
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(_temp.getDomainName())){
			criteria.andDomainNameEqualTo(_temp.getDomainName());
		}
		
		List<CmsWebsite> list = cmsWebsiteMapper.selectByExample(example);
		if(list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
}