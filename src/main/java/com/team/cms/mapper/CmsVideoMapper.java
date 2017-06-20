package com.team.cms.mapper;

import com.team.cms.pojo.CmsVideo;
import com.team.cms.pojo.CmsVideoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsVideoMapper {
    /**
     *
     * @mbg.generated
     */
    long countByExample(CmsVideoExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByExample(CmsVideoExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String videoId);

    /**
     *
     * @mbg.generated
     */
    int insert(CmsVideo record);

    /**
     *
     * @mbg.generated
     */
    int insertSelective(CmsVideo record);

    /**
     *
     * @mbg.generated
     */
    List<CmsVideo> selectByExample(CmsVideoExample example);

    /**
     *
     * @mbg.generated
     */
    CmsVideo selectByPrimaryKey(String videoId);

    /**
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CmsVideo record, @Param("example") CmsVideoExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CmsVideo record, @Param("example") CmsVideoExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CmsVideo record);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CmsVideo record);
}