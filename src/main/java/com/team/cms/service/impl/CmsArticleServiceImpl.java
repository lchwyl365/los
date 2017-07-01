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
import com.team.cms.mapper.CmsArticleMapper;
import com.team.cms.pojo.CmsArticle;
import com.team.cms.pojo.CmsArticleExample;
import com.team.cms.pojo.CmsArticleExample.Criteria;
import com.team.cms.service.CmsArticleService;




/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class CmsArticleServiceImpl implements CmsArticleService {

	@Autowired
	private CmsArticleMapper cmsArticleMapper;
	
	public EUDataGridResult selectList(EUDataGridModel dgm, CmsArticle cmsArticle) {
		
		//查询列表
		CmsArticleExample example = new CmsArticleExample();
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(cmsArticle.getTitle())){
			criteria.andTitleLike("%"+cmsArticle.getTitle()+"%");
		}
	
		//排序
		if(StringUtils.isNotEmpty(dgm.getSort())){
			example.setOrderByClause(dgm.getSort() + " " + dgm.getOrder());
		}
		//分页处理
		PageHelper.startPage(dgm.getPage(), dgm.getRows());
		List<CmsArticle> list = cmsArticleMapper.selectByExample(example);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<CmsArticle> pageInfo = new PageInfo<CmsArticle>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	
	public List<CmsArticle> selectByCmsArticle(CmsArticle cmsArticle,String orderByClause){
		//查询列表
		CmsArticleExample example = new CmsArticleExample();
		Criteria criteria = example.createCriteria();
		
		if(StringUtils.isNotEmpty(cmsArticle.getArticleId())){
			criteria.andArticleIdEqualTo(cmsArticle.getArticleId());
		}
		if(StringUtils.isNotEmpty(cmsArticle.getTitle())){
			criteria.andTitleLike("%"+cmsArticle.getTitle()+"%");
		}
		if(StringUtils.isNotEmpty(cmsArticle.getChannelId())){
			criteria.andChannelIdEqualTo(cmsArticle.getChannelId());
		}
		if(StringUtils.isNotEmpty(cmsArticle.getThumbnail())){
			criteria.andThumbnailEqualTo(cmsArticle.getThumbnail());
		}
		if(StringUtils.isNotEmpty(cmsArticle.getKeywords())){
			criteria.andKeywordsEqualTo(cmsArticle.getKeywords());
		}
		if(StringUtils.isNotEmpty(cmsArticle.getUserid())){
			criteria.andUseridEqualTo(cmsArticle.getUserid());
		}
		if(StringUtils.isNotEmpty(cmsArticle.getStatus())){
			criteria.andStatusEqualTo(cmsArticle.getStatus());
		}
		if(StringUtils.isNotEmpty(cmsArticle.getDomainName())){
			criteria.andDomainNameEqualTo(cmsArticle.getDomainName());
		}
		//排序
		if(StringUtils.isNotEmpty(orderByClause)){
			example.setOrderByClause(orderByClause);
		}
		List<CmsArticle> list = cmsArticleMapper.selectByExample(example);
		return list;
	}

	@Override
	public ResponseResult insert(CmsArticle cmsArticle,Boolean isDefault) {
		try {
			if(isDefault){
			//补全pojo内容
			  	if(StringUtils.isEmpty(cmsArticle.getArticleId())){
					cmsArticle.setArticleId(PrimaryKeyFactory.generatePK(""));
				}
				cmsArticle.setCreatetime(new Date());
				cmsArticle.setReadCount(1);
			}
			cmsArticleMapper.insert(cmsArticle);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
		
	}

	@Override
	public ResponseResult delete(List<String> articleIds) {
		try {
			for (int i = 0; i < articleIds.size(); i++) {
				String articleId = articleIds.get(i);
			    cmsArticleMapper.deleteByPrimaryKey(articleId);
			}
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}

	@Override
	public CmsArticle selectByPrimaryKey(String articleId) {
		CmsArticle cmsArticle = cmsArticleMapper.selectByPrimaryKey(articleId);
		return cmsArticle;
	}

	@Override
	public ResponseResult update(CmsArticle cmsArticle) {
		try {
			CmsArticle temp = cmsArticleMapper.selectByPrimaryKey(cmsArticle.getArticleId());
			temp.setTitle(cmsArticle.getTitle());
			temp.setContent(cmsArticle.getContent());
			temp.setChannelId(cmsArticle.getChannelId());
			temp.setThumbnail(cmsArticle.getThumbnail());
			temp.setKeywords(cmsArticle.getKeywords());
			temp.setDescription(cmsArticle.getDescription());
			temp.setCreatetime(cmsArticle.getCreatetime());
			temp.setUserid(cmsArticle.getUserid());
			temp.setReadCount(cmsArticle.getReadCount());
			temp.setStatus(cmsArticle.getStatus());
			temp.setDomainName(cmsArticle.getDomainName());
			temp.setTopNumber(cmsArticle.getTopNumber());
			cmsArticleMapper.updateByPrimaryKeySelective(temp);
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
}