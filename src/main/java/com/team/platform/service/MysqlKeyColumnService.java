package com.team.platform.service;

import java.util.List;

import com.team.platform.pojo.KeyColumnUsage;

/**
 * Created by Administrator on 2015/9/21 0021.
 */
public interface MysqlKeyColumnService {

	List<KeyColumnUsage> selectByTabConst(String schema,String tabname);

	void updateTabConst(String schema,String tabname);

}