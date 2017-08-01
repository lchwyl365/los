package com.team.cms.mapper;

import com.team.cms.pojo.CmsFriendlyLink;
import com.team.cms.pojo.CmsFriendlyLinkExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsFriendlyLinkMapper {
    /**
     *
     * @mbg.generated
     */
    long countByExample(CmsFriendlyLinkExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByExample(CmsFriendlyLinkExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     *
     * @mbg.generated
     */
    int insert(CmsFriendlyLink record);

    /**
     *
     * @mbg.generated
     */
    int insertSelective(CmsFriendlyLink record);

    /**
     *
     * @mbg.generated
     */
    List<CmsFriendlyLink> selectByExample(CmsFriendlyLinkExample example);

    /**
     *
     * @mbg.generated
     */
    CmsFriendlyLink selectByPrimaryKey(String id);

    /**
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CmsFriendlyLink record, @Param("example") CmsFriendlyLinkExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CmsFriendlyLink record, @Param("example") CmsFriendlyLinkExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CmsFriendlyLink record);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CmsFriendlyLink record);
}