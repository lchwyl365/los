package com.team.cms.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

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
import com.team.cms.mapper.CmsApplyMapper;
import com.team.cms.pojo.CmsApply;
import com.team.cms.pojo.CmsApplyExample;
import com.team.cms.pojo.CmsApplyExample.Criteria;
import com.team.cms.service.CmsApplyService;




/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class CmsApplyServiceImpl implements CmsApplyService {

	@Autowired
	private CmsApplyMapper cmsApplyMapper;
	
	public EUDataGridResult selectList(EUDataGridModel dgm, CmsApply cmsApply) {
		
		//查询列表
		CmsApplyExample example = new CmsApplyExample();
		Criteria criteria = example.createCriteria();
		
	
		//排序
		if(StringUtils.isNotEmpty(dgm.getSort())){
			example.setOrderByClause(dgm.getSort() + " " + dgm.getOrder());
		}
		//分页处理
		PageHelper.startPage(dgm.getPage(), dgm.getRows());
		List<CmsApply> list = cmsApplyMapper.selectByExample(example);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<CmsApply> pageInfo = new PageInfo<CmsApply>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	
	public List<CmsApply> selectByCmsApply(CmsApply cmsApply,String orderByClause){
		//查询列表
		CmsApplyExample example = new CmsApplyExample();
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(cmsApply.getId())){
			criteria.andIdEqualTo(cmsApply.getId());
		}
		if(StringUtils.isNotEmpty(cmsApply.getName())){
			criteria.andNameEqualTo(cmsApply.getName());
		}
		if(StringUtils.isNotEmpty(cmsApply.getTelphone())){
			criteria.andTelphoneEqualTo(cmsApply.getTelphone());
		}
		if(StringUtils.isNotEmpty(cmsApply.getContent())){
			criteria.andContentEqualTo(cmsApply.getContent());
		}
		if(StringUtils.isNotEmpty(cmsApply.getDomainName())){
			criteria.andDomainNameEqualTo(cmsApply.getDomainName());
		}
		//排序
		if(StringUtils.isNotEmpty(orderByClause)){
			example.setOrderByClause(orderByClause);
		}
		List<CmsApply> list = cmsApplyMapper.selectByExample(example);
		return list;
	}

	@Override
	public ResponseResult insert(CmsApply cmsApply,Boolean isDefault) {
		try {
			if(isDefault){
			//补全pojo内容
			  	if(StringUtils.isEmpty(cmsApply.getId())){
					cmsApply.setId(PrimaryKeyFactory.generatePK(""));
				}
				cmsApply.setCreatetime(new Date());
			}
			cmsApplyMapper.insert(cmsApply);
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
			    cmsApplyMapper.deleteByPrimaryKey(id);
			}
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}

	@Override
	public CmsApply selectByPrimaryKey(String id) {
		CmsApply cmsApply = cmsApplyMapper.selectByPrimaryKey(id);
		return cmsApply;
	}

	@Override
	public ResponseResult update(CmsApply cmsApply) {
		try {
			CmsApply temp = cmsApplyMapper.selectByPrimaryKey(cmsApply.getId());
			temp.setName(cmsApply.getName());
			temp.setTelphone(cmsApply.getTelphone());
			temp.setContent(cmsApply.getContent());
			temp.setCreatetime(cmsApply.getCreatetime());
			temp.setDomainName(cmsApply.getDomainName());
			cmsApplyMapper.updateByPrimaryKeySelective(temp);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
}