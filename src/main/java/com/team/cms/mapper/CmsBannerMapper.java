package com.team.cms.mapper;

import com.team.cms.pojo.CmsBanner;
import com.team.cms.pojo.CmsBannerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsBannerMapper {
    /**
     *
     * @mbg.generated
     */
    long countByExample(CmsBannerExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByExample(CmsBannerExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String bannerId);

    /**
     *
     * @mbg.generated
     */
    int insert(CmsBanner record);

    /**
     *
     * @mbg.generated
     */
    int insertSelective(CmsBanner record);

    /**
     *
     * @mbg.generated
     */
    List<CmsBanner> selectByExample(CmsBannerExample example);

    /**
     *
     * @mbg.generated
     */
    CmsBanner selectByPrimaryKey(String bannerId);

    /**
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CmsBanner record, @Param("example") CmsBannerExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CmsBanner record, @Param("example") CmsBannerExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CmsBanner record);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CmsBanner record);
}