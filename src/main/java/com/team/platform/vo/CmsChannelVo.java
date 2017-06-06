package com.team.platform.vo;

import java.util.List;

import com.team.platform.pojo.CmsChannel;

public class CmsChannelVo extends CmsChannel {

	List<CmsChannelVo> children;

	public List<CmsChannelVo> getChildren() {
		return children;
	}

	public void setChildren(List<CmsChannelVo> children) {
		this.children = children;
	}
	
}