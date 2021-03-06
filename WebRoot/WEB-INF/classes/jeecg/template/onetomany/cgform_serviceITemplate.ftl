package ${bussiPackage}.service.${entityPackage};

import java.util.List;
import org.jeecgframework.core.common.service.CommonService;
import ${bussiPackage}.entity.${entityPackage}.${entityName}Entity;
import java.io.Serializable;
<#list subTab as sub>
import ${bussiPackage}.entity.${sub.entityPackage}.${sub.entityName}Entity;
</#list>

public interface ${entityName}ServiceI extends CommonService{
	@Override
 	public <T> void delete(T entity);
	/**
	 * 添加一对多
	 * 
	 */
	public void addMain(${entityName}Entity ${entityName?uncap_first},
	        <#list subTab as sub>List<${sub.entityName}Entity> ${sub.entityName?uncap_first}List<#if sub_has_next>,</#if></#list>) ;
	/**
	 * 修改一对多
	 * 
	 */
	public void updateMain(${entityName}Entity ${entityName?uncap_first},
	        <#list subTab as sub>List<${sub.entityName}Entity> ${sub.entityName?uncap_first}List<#if sub_has_next>,</#if></#list>);
	public void delMain (${entityName}Entity ${entityName?uncap_first});
	
	<#list buttons as btn>
 	<#if btn.buttonStyle =='button' && btn.optType=='action'>
 	/**
	 * 自定义按钮-sql增强-${btn.buttonName}
	 * @param id
	 * @return
	 */
	 public boolean do${btn.buttonCode?cap_first}Sql(${entityName}Entity t);
 	</#if>
 	</#list> 
 	/**
	 * 默认按钮-sql增强-新增操作
	 * @param id
	 * @return
	 */
 	public boolean doAddSql(${entityName}Entity t);
 	/**
	 * 默认按钮-sql增强-更新操作
	 * @param id
	 * @return
	 */
 	public boolean doUpdateSql(${entityName}Entity t);
 	/**
	 * 默认按钮-sql增强-删除操作
	 * @param id
	 * @return
	 */
 	public boolean doDelSql(${entityName}Entity t);
}
