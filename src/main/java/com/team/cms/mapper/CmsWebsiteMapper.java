package com.team.cms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.cms.pojo.CmsWebsite;
import com.team.cms.pojo.CmsWebsiteExample;

public interface CmsWebsiteMapper {
    /**
     *
     * @mbg.generated
     */
    long countByExample(CmsWebsiteExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByExample(CmsWebsiteExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     *
     * @mbg.generated
     */
    int insert(CmsWebsite record);

    /**
     *
     * @mbg.generated
     */
    int insertSelective(CmsWebsite record);

    /**
     *
     * @mbg.generated
     */
    List<CmsWebsite> selectByExample(CmsWebsiteExample example);

    /**
     *
     * @mbg.generated
     */
    CmsWebsite selectByPrimaryKey(String id);

    /**
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CmsWebsite record, @Param("example") CmsWebsiteExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CmsWebsite record, @Param("example") CmsWebsiteExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CmsWebsite record);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CmsWebsite record);
}