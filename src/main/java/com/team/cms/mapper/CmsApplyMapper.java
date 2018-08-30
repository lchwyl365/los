package com.team.cms.mapper;

import com.team.cms.pojo.CmsApply;
import com.team.cms.pojo.CmsApplyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsApplyMapper {
    /**
     *
     * @mbg.generated
     */
    long countByExample(CmsApplyExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByExample(CmsApplyExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     *
     * @mbg.generated
     */
    int insert(CmsApply record);

    /**
     *
     * @mbg.generated
     */
    int insertSelective(CmsApply record);

    /**
     *
     * @mbg.generated
     */
    List<CmsApply> selectByExample(CmsApplyExample example);

    /**
     *
     * @mbg.generated
     */
    CmsApply selectByPrimaryKey(String id);

    /**
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CmsApply record, @Param("example") CmsApplyExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CmsApply record, @Param("example") CmsApplyExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CmsApply record);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CmsApply record);
}