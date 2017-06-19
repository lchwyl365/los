package com.team.cms.mapper;

import com.team.cms.pojo.CrmVideo;
import com.team.cms.pojo.CrmVideoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CrmVideoMapper {
    /**
     *
     * @mbg.generated
     */
    long countByExample(CrmVideoExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByExample(CrmVideoExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String videoId);

    /**
     *
     * @mbg.generated
     */
    int insert(CrmVideo record);

    /**
     *
     * @mbg.generated
     */
    int insertSelective(CrmVideo record);

    /**
     *
     * @mbg.generated
     */
    List<CrmVideo> selectByExample(CrmVideoExample example);

    /**
     *
     * @mbg.generated
     */
    CrmVideo selectByPrimaryKey(String videoId);

    /**
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CrmVideo record, @Param("example") CrmVideoExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CrmVideo record, @Param("example") CrmVideoExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CrmVideo record);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CrmVideo record);
}