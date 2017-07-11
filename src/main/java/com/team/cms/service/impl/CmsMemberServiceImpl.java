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
import com.team.cms.mapper.CmsMemberMapper;
import com.team.cms.pojo.CmsMember;
import com.team.cms.pojo.CmsMemberExample;
import com.team.cms.pojo.CmsMemberExample.Criteria;
import com.team.cms.service.CmsMemberService;




/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class CmsMemberServiceImpl implements CmsMemberService {

	@Autowired
	private CmsMemberMapper cmsMemberMapper;
	
	public EUDataGridResult selectList(EUDataGridModel dgm, CmsMember cmsMember) {
		
		//查询列表
		CmsMemberExample example = new CmsMemberExample();
		Criteria criteria = example.createCriteria();
		
	
		//排序
		if(StringUtils.isNotEmpty(dgm.getSort())){
			example.setOrderByClause(dgm.getSort() + " " + dgm.getOrder());
		}
		//分页处理
		PageHelper.startPage(dgm.getPage(), dgm.getRows());
		List<CmsMember> list = cmsMemberMapper.selectByExample(example);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<CmsMember> pageInfo = new PageInfo<CmsMember>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	
	public List<CmsMember> selectByCmsMember(CmsMember cmsMember,String orderByClause){
		//查询列表
		CmsMemberExample example = new CmsMemberExample();
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(cmsMember.getId())){
			criteria.andIdEqualTo(cmsMember.getId());
		}
		if(StringUtils.isNotEmpty(cmsMember.getMemberId())){
			criteria.andMemberIdEqualTo(cmsMember.getMemberId());
		}
		if(StringUtils.isNotEmpty(cmsMember.getMemberName())){
			criteria.andMemberNameEqualTo(cmsMember.getMemberName());
		}
		if(StringUtils.isNotEmpty(cmsMember.getSex())){
			criteria.andSexEqualTo(cmsMember.getSex());
		}
		if(StringUtils.isNotEmpty(cmsMember.getCreatetime())){
			criteria.andCreatetimeEqualTo(cmsMember.getCreatetime());
		}
		if(StringUtils.isNotEmpty(cmsMember.getDan())){
			criteria.andDanEqualTo(cmsMember.getDan());
		}
		if(StringUtils.isNotEmpty(cmsMember.getDomainName())){
			criteria.andDomainNameEqualTo(cmsMember.getDomainName());
		}
		//排序
		if(StringUtils.isNotEmpty(orderByClause)){
			example.setOrderByClause(orderByClause);
		}
		List<CmsMember> list = cmsMemberMapper.selectByExample(example);
		return list;
	}

	@Override
	public ResponseResult insert(CmsMember cmsMember,Boolean isDefault) {
		try {
			if(isDefault){
			//补全pojo内容
			  	if(StringUtils.isEmpty(cmsMember.getId())){
					cmsMember.setId(PrimaryKeyFactory.generatePK(""));
				}
			}
			cmsMemberMapper.insert(cmsMember);
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
			    cmsMemberMapper.deleteByPrimaryKey(id);
			}
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}

	@Override
	public CmsMember selectByPrimaryKey(String id) {
		CmsMember cmsMember = cmsMemberMapper.selectByPrimaryKey(id);
		return cmsMember;
	}

	@Override
	public ResponseResult update(CmsMember cmsMember) {
		try {
			CmsMember temp = cmsMemberMapper.selectByPrimaryKey(cmsMember.getId());
			temp.setMemberId(cmsMember.getMemberId());
			temp.setMemberName(cmsMember.getMemberName());
			temp.setSex(cmsMember.getSex());
			temp.setCreatetime(cmsMember.getCreatetime());
			temp.setDan(cmsMember.getDan());
			temp.setDomainName(cmsMember.getDomainName());
			cmsMemberMapper.updateByPrimaryKeySelective(temp);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
}