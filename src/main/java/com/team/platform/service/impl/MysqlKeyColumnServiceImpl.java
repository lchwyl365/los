package com.team.platform.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.platform.mapper.KeyColumnUsageMapper;
import com.team.platform.pojo.KeyColumnUsage;
import com.team.platform.pojo.KeyColumnUsageExample;
import com.team.platform.pojo.SysColumns;
import com.team.platform.pojo.SysTables;
import com.team.platform.service.MysqlKeyColumnService;
import com.team.platform.service.SysColumnsService;
import com.team.platform.service.SysTablesService;

/**
 * Created by liuchao on 2017/02/21 0021.
 */
@Service
public class MysqlKeyColumnServiceImpl implements MysqlKeyColumnService {

	@Autowired
	private KeyColumnUsageMapper keyColumnUsageMapper;

	@Autowired
	private SysTablesService sysTablesService;
	
	@Autowired
	private SysColumnsService sysColumnsService;
	
	@Override
	public List<KeyColumnUsage> selectByTabConst(String schema,String tabname) {
		
		KeyColumnUsageExample keyColumnExample = new KeyColumnUsageExample();
		KeyColumnUsageExample.Criteria keyColumnCriteria = keyColumnExample.createCriteria();
		keyColumnCriteria.andTableSchemaEqualTo(schema);
		keyColumnCriteria.andConstraintNameEqualTo("PRIMARY");
		if(StringUtils.isNotEmpty(tabname)){
			keyColumnCriteria.andTableNameEqualTo(tabname);
		}
		List<KeyColumnUsage> tabConsts = keyColumnUsageMapper.selectByExample(keyColumnExample);
		return tabConsts;
	}

	@Override
	public void updateTabConst(String schema,String tabname) {
		List<KeyColumnUsage> tabConsts = selectByTabConst(schema,tabname);
    	for (int i = 0; i < tabConsts.size(); i++) {
    		KeyColumnUsage keyColumn = tabConsts.get(i);
    		//List<DB2KeyColuse> keyColuses = db2KeyColuseService.selectByConst(tabConst.getConstname());
    		//for (DB2KeyColuse db2KeyColuse : keyColuses) {
    			SysColumns sysColumns = new SysColumns();
    			sysColumns.setTbname(keyColumn.getTableName());
    			sysColumns.setColumnName(keyColumn.getColumnName());
    			sysColumns.setTbcreator(keyColumn.getTableSchema());
    			sysColumns.setIsprimary("T");//是否是主键
    			sysColumns.setIsupdate("F");//是否可以修改
    			sysColumnsService.update(sysColumns);
    			
    			SysColumns temp = sysColumnsService.selectByPrimaryKey(sysColumns.getColumnName(), sysColumns.getTbname(), sysColumns.getTbcreator());
    			//设置主键列
    			SysTables sysTables = new SysTables();
    			sysTables.setSchemaName(sysColumns.getTbcreator());
    			sysTables.setTableName(sysColumns.getTbname());
    			sysTables.setType("T");
    			sysTables.setIdField(temp.getPropertyName());
    			sysTablesService.updateIdField(sysTables);
			//}
		}
	}
}
