package com.team.platform.service;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import com.team.common.pojo.EUTreeNode;
import com.team.common.pojo.EUTreeNodeRowMapper;

public class TestSpringJdbc {

	private ApplicationContext applicationContext;
	
	@Test
	public void test() {
		applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
		//从spring容器中获得Mapper的代理对象
		JdbcTemplate jdbcTemplate = applicationContext.getBean(JdbcTemplate.class);
		
		String sql = "select channel_id as id,channel_name as text from CMS_CHANNEL";
	    List<EUTreeNode> list =  jdbcTemplate.query(sql,new EUTreeNodeRowMapper());  
	    System.out.println(list.size());
	}

}
