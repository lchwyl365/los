package com.team.cms.mapper;

import com.team.cms.pojo.CmsAccessLog;
import com.team.cms.pojo.CmsAccessLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsAccessLogMapper {
    /**
     *
     * @mbg.generated
     */
    long countByExample(CmsAccessLogExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByExample(CmsAccessLogExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String logId);

    /**
     *
     * @mbg.generated
     */
    int insert(CmsAccessLog record);

    /**
     *
     * @mbg.generated
     */
    int insertSelective(CmsAccessLog record);

    /**
     *
     * @mbg.generated
     */
    List<CmsAccessLog> selectByExample(CmsAccessLogExample example);

    /**
     *
     * @mbg.generated
     */
    CmsAccessLog selectByPrimaryKey(String logId);

    /**
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CmsAccessLog record, @Param("example") CmsAccessLogExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CmsAccessLog record, @Param("example") CmsAccessLogExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CmsAccessLog record);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CmsAccessLog record);
}