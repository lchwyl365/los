package ${model.serviceTargetPackage}.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

<#if model.gentype == "DataGrid">
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
import com.team.common.util.ExceptionUtil;
</#if>

import com.team.common.pojo.ResponseResult;
import com.team.common.util.PrimaryKeyFactory;
import ${model.mapperTargetPackage}.${model.domainObjectName}Mapper;
import ${model.pojoTargetPackage}.${model.domainObjectName};
import ${model.pojoTargetPackage}.${model.domainObjectName}Example;
import ${model.pojoTargetPackage}.${model.domainObjectName}Example.Criteria;
import ${model.serviceTargetPackage}.${model.domainObjectName}Service;

<#if model.gentype == "TreeGrid">
import com.team.${model.businessName}.vo.${model.domainObjectName}Vo;
</#if>

<#if model.keycolumns gt 1 >
import ${model.pojoTargetPackage}.${model.domainObjectName}Key;
</#if>


/**
 * Created by liuchao on 2017/02/21
 */
@Service
public class ${model.domainObjectName}ServiceImpl implements ${model.domainObjectName}Service {

	@Autowired
	private ${model.domainObjectName}Mapper ${model.variableName}Mapper;
	
	<#if model.gentype == "DataGrid">
	public EUDataGridResult selectList(EUDataGridModel dgm, ${model.domainObjectName} ${model.variableName}) {
		
		//查询列表
		${model.domainObjectName}Example example = new ${model.domainObjectName}Example();
		Criteria criteria = example.createCriteria();
		
	<#list model.selectPropertys as property>
	  <#if property.isselect == "T">
		if(StringUtils.isNotEmpty(${model.variableName}.get${property.propertyName?cap_first}())){
			criteria.and${property.propertyName?cap_first}EqualTo(${model.variableName}.get${property.propertyName?cap_first}());
		}
	  </#if>
	</#list>
	<#list model.selectPropertys as property>
	  <#if property.islike == "T">
		if(StringUtils.isNotEmpty(${model.variableName}.get${property.propertyName?cap_first}())){
			criteria.and${property.propertyName?cap_first}Like("%"+${model.variableName}.get${property.propertyName?cap_first}()+"%");
		}
	  </#if>
	</#list>
	
		//排序
		if(StringUtils.isNotEmpty(dgm.getSort())){
			example.setOrderByClause(dgm.getSort() + " " + dgm.getOrder());
		}
		//分页处理
		PageHelper.startPage(dgm.getPage(), dgm.getRows());
		List<${model.domainObjectName}> list = ${model.variableName}Mapper.selectByExample(example);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<${model.domainObjectName}> pageInfo = new PageInfo<${model.domainObjectName}>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	</#if>
	
	<#if model.gentype == "TreeGrid">
	public List<${model.domainObjectName}Vo> selectList(${model.typeMap[model.parentField]} ${model.parentField}) {
		
		
		//查询列表
		${model.domainObjectName}Example example = new ${model.domainObjectName}Example();
		Criteria criteria = example.createCriteria();
		<#if model.typeMap[model.parentField] == "String">
		if(StringUtils.isNotEmpty(${model.parentField})){
			criteria.and${model.parentField?cap_first}EqualTo(${model.parentField});
		}
		<#else>
		if(${model.parentField} != null){
			criteria.and${model.parentField?cap_first}EqualTo(${model.parentField});
		}
		</#if>
		
		//排序
		/*if(StringUtils.isNotEmpty(dgm.getSort())){
			example.setOrderByClause(dgm.getSort() + " " + dgm.getOrder());
		}*/
		List<${model.domainObjectName}Vo> ${model.variableName}VoList = new ArrayList<${model.domainObjectName}Vo>();
		List<${model.domainObjectName}> list = ${model.variableName}Mapper.selectByExample(example);
		for (${model.domainObjectName} ${model.variableName} : list) {
			${model.domainObjectName}Vo ${model.variableName}Vo = new ${model.domainObjectName}Vo();
			<#list model.propertys as property>
			${model.variableName}Vo.set${property.propertyName?cap_first}(${model.variableName}.get${property.propertyName?cap_first}());
			</#list>
			List<${model.domainObjectName}Vo> children = selectList(${model.variableName}Vo.get${model.idField?cap_first}());
			if(children != null && children.size() > 0){
				${model.variableName}Vo.setChildren(children);
			}
			${model.variableName}VoList.add(${model.variableName}Vo);
		}
		return ${model.variableName}VoList;
	}
	</#if>
	
	public List<${model.domainObjectName}> selectBy${model.domainObjectName}(${model.domainObjectName} ${model.variableName},String orderByClause){
		//查询列表
		${model.domainObjectName}Example example = new ${model.domainObjectName}Example();
		Criteria criteria = example.createCriteria();
		
	<#list model.propertys as property>
	  <#if property.islike == "F" && property.propertyType == "String" && property.propertyLength < 256>
		if(StringUtils.isNotEmpty(${model.variableName}.get${property.propertyName?cap_first}())){
			criteria.and${property.propertyName?cap_first}EqualTo(${model.variableName}.get${property.propertyName?cap_first}());
		}
	  </#if>
	  <#if property.islike == "T">
		if(StringUtils.isNotEmpty(${model.variableName}.get${property.propertyName?cap_first}())){
			criteria.and${property.propertyName?cap_first}Like("%"+${model.variableName}.get${property.propertyName?cap_first}()+"%");
		}
	  </#if>
	</#list>
		//排序
		if(StringUtils.isNotEmpty(orderByClause)){
			example.setOrderByClause(orderByClause);
		}
		List<${model.domainObjectName}> list = ${model.variableName}Mapper.selectByExample(example);
		return list;
	}

	@Override
	public ResponseResult insert(${model.domainObjectName} ${model.variableName},Boolean isDefault) {
		try {
			if(isDefault){
			//补全pojo内容
			<#list model.propertys as property>
			  <#if property.isprimary == "T" && property.propertyType == "String">
			  	if(StringUtils.isEmpty(${model.variableName}.get${property.propertyName?cap_first}())){
					${model.variableName}.set${property.propertyName?cap_first}(PrimaryKeyFactory.generatePK(""));
				}
			  </#if>
			  <#if property.defaultValue?? && property.defaultValue != "" && property.defaultValue != "userid" && property.defaultValue != "domain" >
				<#if property.defaultValue == "Date">
					${model.variableName}.set${property.propertyName?cap_first}(new ${property.defaultValue}());
				<#else>
					${model.variableName}.set${property.propertyName?cap_first}(${property.defaultValue});
				</#if>
			  </#if>
			  <#if property.component == "password" >
				//md5加密
				${model.variableName}.set${property.propertyName?cap_first}(DigestUtils.md5DigestAsHex(${model.variableName}.get${property.propertyName?cap_first}().getBytes()));
			  </#if>
			</#list>
			}
			${model.variableName}Mapper.insert(${model.variableName});
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
		
	}

	@Override
	public ResponseResult delete(${model.batchServiceParam}) {
		try {
			for (int i = 0; i < ${model.idField}s.size(); i++) {
			<#list model.propertys as property>
			  <#if property.isprimary == "T" >
				${property.propertyType} ${property.propertyName} = ${property.propertyName}s.get(i);
			  </#if>
			</#list>
			<#if model.keycolumns gt 1 >
				${model.domainObjectName}Key key = new ${model.domainObjectName}Key();
			<#list model.propertys as property>
			  <#if property.isprimary == "T" >
				key.set${property.propertyName?cap_first}(${property.propertyName});
			  </#if>
			</#list>
				${model.variableName}Mapper.deleteByPrimaryKey(key);
			<#else>
			    ${model.variableName}Mapper.deleteByPrimaryKey(${model.idField});
			</#if>
			}
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}

	@Override
	public ${model.domainObjectName} selectByPrimaryKey(${model.primaryKey}) {
	<#if model.keycolumns gt 1>
		${model.domainObjectName}Key key = new ${model.domainObjectName}Key();
		<#list model.propertys as property>
		  <#if property.isprimary == "T" >
		key.set${property.propertyName?cap_first}(${property.propertyName});
		  </#if>
		</#list>
		${model.domainObjectName} ${model.variableName} = ${model.variableName}Mapper.selectByPrimaryKey(key);
	<#else>
		${model.domainObjectName} ${model.variableName} = ${model.variableName}Mapper.selectByPrimaryKey(${model.callPathVariable});
	</#if>
		return ${model.variableName};
	}

	@Override
	public ResponseResult update(${model.domainObjectName} ${model.variableName}) {
		try {
		<#if model.keycolumns gt 1 >
			${model.domainObjectName}Key key = new ${model.domainObjectName}Key();
			<#list model.propertys as property>
			  <#if property.isprimary == "T" >
			key.set${property.propertyName?cap_first}(${model.variableName}.get${property.propertyName?cap_first}());
			  </#if>
			</#list>
			${model.domainObjectName} temp = ${model.variableName}Mapper.selectByPrimaryKey(key);
			<#list model.propertys as property>
			  <#if property.isprimary != "T" >
			temp.set${property.propertyName?cap_first}(${model.variableName}.get${property.propertyName?cap_first}());
			  </#if>
			</#list>
			${model.variableName}Mapper.updateByPrimaryKeySelective(${model.variableName});
		<#else>
			${model.domainObjectName} temp = ${model.variableName}Mapper.selectByPrimaryKey(${model.variableName}.get${model.callPathVariable?cap_first}());
		    <#list model.propertys as property>
			  <#if property.isprimary == "F">
			temp.set${property.propertyName?cap_first}(${model.variableName}.get${property.propertyName?cap_first}());
			  </#if>
			  <#if property.component == "password" >
				//md5加密
				${model.variableName}.set${property.propertyName?cap_first}(DigestUtils.md5DigestAsHex(${model.variableName}.get${property.propertyName?cap_first}().getBytes()));
			  </#if>
			</#list>
			${model.variableName}Mapper.updateByPrimaryKeySelective(temp);
		 </#if>
			return ResponseResult.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseResult.build(ResponseResult.ERROR, e.getMessage());
		}
	}
}