package com.team.cms.service;

import java.util.List;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.pojo.ResponseResult;
import com.team.cms.pojo.CmsFriendlyLink;

/**
 * Created by Administrator on 2017/02/27
 */
public interface CmsFriendlyLinkService {

	public EUDataGridResult selectList(EUDataGridModel dgm,CmsFriendlyLink cmsFriendlyLink);

	public List<CmsFriendlyLink> selectByCmsFriendlyLink(CmsFriendlyLink cmsFriendlyLink,String orderByClause);
	
	public CmsFriendlyLink selectByPrimaryKey(String id);

	public ResponseResult insert(CmsFriendlyLink cmsFriendlyLink,Boolean isDefault);

	public ResponseResult delete(List<String> ids);

	public ResponseResult update(CmsFriendlyLink cmsFriendlyLink);
	
}