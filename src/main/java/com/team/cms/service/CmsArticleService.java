package com.team.cms.service;

import java.util.List;

import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.cms.pojo.CmsArticle;

/**
 * Created by Administrator on 2017/02/27
 */
public interface CmsArticleService {

	public EUDataGridResult selectList(EUDataGridModel dgm,CmsArticle cmsArticle);

	public List<CmsArticle> selectByCmsArticle(CmsArticle cmsArticle,String orderByClause);
	
	public CmsArticle selectByPrimaryKey(String articleId);

	public ResponseResult insert(CmsArticle cmsArticle,Boolean isDefault);

	public ResponseResult delete(List<String> articleIds);

	public ResponseResult update(CmsArticle cmsArticle);

	public CmsArticle getPreArticle(String id, String domain);
	
	public CmsArticle getAfterArticle(String id, String domain);

	public List<CmsArticle> selectByChannel(List<String> channelIds,String status);
	
}