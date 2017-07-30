package ${model.controllerTargetPackage};

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

<#if model.gentype == "DataGrid">
import com.team.common.pojo.EUDataGridModel;
import com.team.common.pojo.EUDataGridResult;
<#elseif model.gentype == "TreeGrid">
import com.team.${model.businessName}.vo.${model.domainObjectName}Vo;
</#if>

import com.team.common.pojo.ResponseResult;
import ${model.pojoTargetPackage}.${model.domainObjectName};
import ${model.serviceTargetPackage}.${model.domainObjectName}Service;
<#if model.useCombo == true>
import com.team.platform.service.SysComboBoxService;
</#if>
<#if model.useUser == true>
import org.springframework.beans.factory.annotation.Value;
import com.team.common.util.CookieUtils;
import com.team.platform.service.SessionUserService;
import com.team.platform.service.impl.SessionUserServiceImpl;
	<#if model.domainObjectName != "AuthUser">
import com.team.platform.pojo.AuthUser;
	</#if>
</#if>
<#if model.enctype == 'multipart/form-data' >
import javax.servlet.ServletContext;
import java.io.File;
import com.team.common.util.FileUtil;
import org.springframework.web.multipart.MultipartFile;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
</#if>

@Controller
@RequestMapping("/${model.businessName}/${model.path}")
public class ${model.domainObjectName}Controller {

	private static final Logger logger = Logger.getLogger(${model.domainObjectName}Controller.class);
	
	@Autowired
	private ${model.domainObjectName}Service ${model.variableName}Service;
	
	<#if model.useCombo == true>
	@Autowired
	private SysComboBoxService sysComboBoxService;
	</#if>
	
	<#if model.useUser == true>
	@Autowired
	private SessionUserService sessionUserService;
	
	@Value("${r"$"}{USE_REDIS}")
	private Boolean USE_REDIS;
	</#if>
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		
	<#list model.propertys as property>
	  <#if property.component == 'easyui-combotree' && property.comboid?? >
	  	String combo${property.comboid}_json = sysComboBoxService.selectComboid("${property.comboid}");
		model.addAttribute("combo${property.comboid}_json", combo${property.comboid}_json);
      </#if>
	</#list>	
    	return "${model.path}/list";
    }
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add() throws Exception{
    	return "${model.path}/add";
    }
<#if model.enctype == 'multipart/form-data' >
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public String add(
	<#list model.addPropertys as property>
		<#if property.component == 'file'>	
		@RequestParam(value = "${property.propertyName}", required = false) MultipartFile ${property.propertyName},
		</#if>
	</#list>
		HttpServletRequest request) throws Exception{
		
		ServletContext application = request.getSession().getServletContext();
		
		${model.domainObjectName} ${model.variableName} = new ${model.domainObjectName}();
	<#list model.addPropertys as property>	
		<#if property.component != 'file' && property.isadd == 'T' && property.propertyType != 'Date' >
        ${model.variableName}.set${property.propertyName?cap_first}(${property.propertyType}.valueOf(request.getParameter("${property.propertyName}")));
        </#if>
	</#list>	
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	<#list model.addPropertys as property>
		<#if property.component == 'file'>
		if(StringUtils.isNotEmpty(${property.propertyName}.getOriginalFilename())){
			// 文件保存目录URL
	        String ${property.propertyName}Path = application.getRealPath("/") + "upload/";
	        String ${property.propertyName}Url = request.getContextPath() + "/upload/";
	        String ${property.propertyName}DirName = FileUtil.checkFileDir(${property.propertyName}Path,${property.propertyName}Url,request);
	        ${property.propertyName}Path = ${property.propertyName}Path + ${property.propertyName}DirName;
	        ${property.propertyName}Url = ${property.propertyName}Url + ${property.propertyName}DirName;
	        // 文件名
	        String ${property.propertyName}FileExt = ${property.propertyName}.getOriginalFilename().substring(${property.propertyName}.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
	        String ${property.propertyName}NewFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + ${property.propertyName}FileExt;
	        // 保存文件
	        File ${property.propertyName}NewFile=new File(${property.propertyName}Path + ${property.propertyName}NewFileName);
	        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
	        ${property.propertyName}.transferTo(${property.propertyName}NewFile);
	        ${model.variableName}.set${property.propertyName?cap_first}(${property.propertyName}Url+${property.propertyName}NewFileName);
	    }
		</#if>
	</#list>
	
	<#if model.useUser == true>
		//从cookie中取token
		String token = CookieUtils.getCookieValue(request, "TT_TOKEN");
		//根据token换取用户信息，调用sso系统的接口。
		AuthUser user = null;
		if(USE_REDIS){
			user = sessionUserService.getUserByToken(token);
		}else{
			user = (AuthUser) request.getSession().getAttribute(SessionUserServiceImpl.LOGIN_USER);
		}
	</#if>
	<#list model.propertys as property>	
		<#if property.defaultValue == 'userid' >
        ${model.variableName}.set${property.propertyName?cap_first}(user.getUserid());
        </#if>
        <#if property.defaultValue =='domain' >
        ${model.variableName}.set${property.propertyName?cap_first}(user.getDomainName());
        </#if>
	</#list>
        ${model.variableName}Service.insert(${model.variableName},true);
		return "${model.path}/list";
	}
<#else>
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult add(HttpServletRequest request,${model.domainObjectName} ${model.variableName}) throws Exception{
	<#if model.useUser == true>
		//从cookie中取token
		String token = CookieUtils.getCookieValue(request, "TT_TOKEN");
		//根据token换取用户信息，调用sso系统的接口。
		AuthUser user = null;
		if(USE_REDIS){
			user = sessionUserService.getUserByToken(token);
		}else{
			user = (AuthUser) request.getSession().getAttribute(SessionUserServiceImpl.LOGIN_USER);
		}
	</#if>
	<#list model.propertys as property>	
		<#if property.defaultValue=='userid' >
        ${model.variableName}.set${property.propertyName?cap_first}(user.getUserid());
        </#if>
        <#if property.defaultValue=='domain' >
        ${model.variableName}.set${property.propertyName?cap_first}(user.getDomainName());
        </#if>
	</#list>
		ResponseResult result = ${model.variableName}Service.insert(${model.variableName},true);
		return result;
	}
</#if>
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public ResponseResult delete(${model.requestParam})throws Exception{
		ResponseResult result = ${model.variableName}Service.delete(${model.callRequestParam});
		return result;
	}
	
	@RequestMapping(value = "/update${model.pathPrimaryKeyURL}",method = RequestMethod.GET)
    public String update(${model.pathVariable},Model model) throws Exception{
	<#list model.propertys as property>
	  <#if property.isprimary == "T">
	  	model.addAttribute("${property.propertyName}", ${property.propertyName});
      </#if>
	</#list>
    	return "${model.path}/update";
    }
	
<#if model.enctype == 'multipart/form-data' >
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String update(
	<#list model.updatePropertys as property>
		<#if property.component == 'file'>	
		@RequestParam(value = "${property.propertyName}", required = false) MultipartFile ${property.propertyName},
		</#if>
	</#list>
		HttpServletRequest request) throws Exception{
		
		${model.domainObjectName} ${model.variableName} = new ${model.domainObjectName}();
	<#list model.propertys as property>
	  <#if property.isupdate == 'T' && property.propertyType != "Date" && property.component != 'file'>
		String ${property.propertyName} = request.getParameter("${property.propertyName}");
		if(StringUtils.isNotEmpty(${property.propertyName})){
			${model.variableName}.set${property.propertyName?cap_first}(${property.propertyType}.valueOf(${property.propertyName}));
		}
	  </#if>
	</#list>
	
		ServletContext application = request.getSession().getServletContext();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	<#list model.updatePropertys as property>
		<#if property.component == 'file'>
		if(StringUtils.isNotEmpty(${property.propertyName}.getOriginalFilename())){
			// 文件保存目录URL
	        String ${property.propertyName}Path = application.getRealPath("/") + "upload/";
	        String ${property.propertyName}Url = request.getContextPath() + "/upload/";
	        String ${property.propertyName}DirName = FileUtil.checkFileDir(${property.propertyName}Path,${property.propertyName}Url,request);
	        ${property.propertyName}Path = ${property.propertyName}Path + ${property.propertyName}DirName;
	        ${property.propertyName}Url = ${property.propertyName}Url + ${property.propertyName}DirName;
	        // 文件名
	        String ${property.propertyName}FileExt = ${property.propertyName}.getOriginalFilename().substring(${property.propertyName}.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
	        String ${property.propertyName}NewFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + ${property.propertyName}FileExt;
	        // 保存文件
	        File ${property.propertyName}NewFile=new File(${property.propertyName}Path + ${property.propertyName}NewFileName);
	        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
	        ${property.propertyName}.transferTo(${property.propertyName}NewFile);
	        ${model.variableName}.set${property.propertyName?cap_first}(${property.propertyName}Url+${property.propertyName}NewFileName);
        }
		</#if>
	</#list>
		${model.variableName}Service.update(${model.variableName});
		return "${model.path}/list"; 
	}
<#else>
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	@ResponseBody
    public ResponseResult update(HttpServletRequest request) throws Exception{
    
    	${model.domainObjectName} ${model.variableName} = new ${model.domainObjectName}();
	<#list model.propertys as property>
	  <#if property.propertyType != "Date">
		String ${property.propertyName} = request.getParameter("${property.propertyName}");
		if(StringUtils.isNotEmpty(${property.propertyName})){
			${model.variableName}.set${property.propertyName?cap_first}(${property.propertyType}.valueOf(${property.propertyName}));
		}
	  </#if>
	</#list>	
		return ${model.variableName}Service.update(${model.variableName});
    }
</#if>	
<#if model.gentype == "DataGrid">
	@RequestMapping(value = "/queryList",method = RequestMethod.POST)
	@ResponseBody
    public EUDataGridResult queryList(EUDataGridModel dgm,${model.domainObjectName} ${model.variableName}) throws Exception{
		EUDataGridResult result = ${model.variableName}Service.selectList(dgm, ${model.variableName});
    	return result;
    }
<#elseif model.gentype == "TreeGrid">
	@RequestMapping(value = "/queryList/{${model.parentField}}")
	@ResponseBody
    public List<${model.domainObjectName}Vo> queryList(@PathVariable String ${model.parentField}) throws Exception{
		List<${model.domainObjectName}Vo> list = ${model.variableName}Service.selectList(${model.parentField});
    	return list;
    }
</#if>

	@RequestMapping(value="/load${model.pathPrimaryKeyURL}",method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult load(${model.pathVariable}) {
		${model.domainObjectName} ${model.variableName} = ${model.variableName}Service.selectByPrimaryKey(${model.callPathVariable});
		return new ResponseResult(${model.variableName});
	}
	
}