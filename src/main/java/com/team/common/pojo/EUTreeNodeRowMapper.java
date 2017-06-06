package com.team.common.pojo;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class EUTreeNodeRowMapper implements RowMapper<EUTreeNode> {  
		  
        @Override  
        public EUTreeNode mapRow(ResultSet rs, int rowNum) throws SQLException {  
        	EUTreeNode node = new EUTreeNode();  
        	node.setId(rs.getString("id"));  
        	node.setText(rs.getString("text"));
            return node;  
        }  
          
    }