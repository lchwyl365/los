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
import com.team.cms.mapper.CmsFriendlyLinkMapper;
import com.team.cms.pojo.CmsFriendlyLink;
import com.team.cms.pojo.CmsFriendlyLinkExample;
import com.team.cms.pojo.CmsFriendlyLinkExample.Criteria;
import com.team.cms.service.CmsFriendlyLinkService;




/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class CmsFriendlyLinkServiceImpl implements CmsFriendlyLinkService {

	@Autowired
	private CmsFriendlyLinkMapper cmsFriendlyLinkMapper;
	
	public EUDataGridResult selectList(EUDataGridModel dgm, CmsFriendlyLink cmsFriendlyLink) {
		
		//查询列表
		CmsFriendlyLinkExample example = new CmsFriendlyLinkExample();
		Criteria criteria = example.createCriteria();
		if(StringUtils.isNotEmpty(cmsFriendlyLink.getDomain())){
			criteria.andDomainEqualTo(cmsFriendlyLink.getDomain());
		}
		//排序
		if(StringUtils.isNotEmpty(dgm.getSort())){
			example.setOrderByClause(dgm.getSort() + " " + dgm.getOrder());
		}
		//分页处理
		PageHelper.startPage(dgm.getPage(), dgm.getRows());
		List<CmsFriendlyLink> list = cmsFriendlyLinkMapper.selectByExample(example);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<CmsFriendlyLink> pageInfo = new PageInfo<CmsFriendlyLink>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	
	public List<CmsFriendlyLink> selectByCmsFriendlyLink(CmsFriendlyLink cmsFriendlyLink,String orderByClause){
		//查询列表
		CmsFriendlyLinkExample example = new CmsFriendlyLinkExample();
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(cmsFriendlyLink.getId())){
			criteria.andIdEqualTo(cmsFriendlyLink.getId());
		}
		if(StringUtils.isNotEmpty(cmsFriendlyLink.getUrl())){
			criteria.andUrlEqualTo(cmsFriendlyLink.getUrl());
		}
		if(StringUtils.isNotEmpty(cmsFriendlyLink.getName())){
			criteria.andNameEqualTo(cmsFriendlyLink.getName());
		}
		if(StringUtils.isNotEmpty(cmsFriendlyLink.getLogo())){
			criteria.andLogoEqualTo(cmsFriendlyLink.getLogo());
		}
		if(StringUtils.isNotEmpty(cmsFriendlyLink.getDomain())){
			criteria.andDomainEqualTo(cmsFriendlyLink.getDomain());
		}
		//排序
		if(StringUtils.isNotEmpty(orderByClause)){
			example.setOrderByClause(orderByClause);
		}
		List<CmsFriendlyLink> list = cmsFriendlyLinkMapper.selectByExample(example);
		return list;
	}

	@Override
	public ResponseResult insert(CmsFriendlyLink cmsFriendlyLink,Boolean isDefault) {
		try {
			if(isDefault){
			//补全pojo内容
			  	if(StringUtils.isEmpty(cmsFriendlyLink.getId())){
					cmsFriendlyLink.setId(PrimaryKeyFactory.generatePK(""));
				}
					cmsFriendlyLink.setCreatetime(new Date());
			}
			cmsFriendlyLinkMapper.insert(cmsFriendlyLink);
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
			    cmsFriendlyLinkMapper.deleteByPrimaryKey(id);
			}
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}

	@Override
	public CmsFriendlyLink selectByPrimaryKey(String id) {
		CmsFriendlyLink cmsFriendlyLink = cmsFriendlyLinkMapper.selectByPrimaryKey(id);
		return cmsFriendlyLink;
	}

	@Override
	public ResponseResult update(CmsFriendlyLink cmsFriendlyLink) {
		try {
			CmsFriendlyLink temp = cmsFriendlyLinkMapper.selectByPrimaryKey(cmsFriendlyLink.getId());
			temp.setUrl(cmsFriendlyLink.getUrl());
			temp.setName(cmsFriendlyLink.getName());
			temp.setOrderNum(cmsFriendlyLink.getOrderNum());
			temp.setLogo(cmsFriendlyLink.getLogo());
			temp.setDomain(cmsFriendlyLink.getDomain());
			temp.setCreatetime(cmsFriendlyLink.getCreatetime());
			cmsFriendlyLinkMapper.updateByPrimaryKeySelective(temp);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
}