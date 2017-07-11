package com.team.cms.mapper;

import com.team.cms.pojo.CmsMember;
import com.team.cms.pojo.CmsMemberExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsMemberMapper {
    /**
     *
     * @mbg.generated
     */
    long countByExample(CmsMemberExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByExample(CmsMemberExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     *
     * @mbg.generated
     */
    int insert(CmsMember record);

    /**
     *
     * @mbg.generated
     */
    int insertSelective(CmsMember record);

    /**
     *
     * @mbg.generated
     */
    List<CmsMember> selectByExample(CmsMemberExample example);

    /**
     *
     * @mbg.generated
     */
    CmsMember selectByPrimaryKey(String id);

    /**
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CmsMember record, @Param("example") CmsMemberExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CmsMember record, @Param("example") CmsMemberExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CmsMember record);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CmsMember record);
}