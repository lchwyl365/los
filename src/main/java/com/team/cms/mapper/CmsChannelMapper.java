package com.team.cms.mapper;

import com.team.cms.pojo.CmsChannel;
import com.team.cms.pojo.CmsChannelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsChannelMapper {
    /**
     *
     * @mbg.generated
     */
    long countByExample(CmsChannelExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByExample(CmsChannelExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String channelId);

    /**
     *
     * @mbg.generated
     */
    int insert(CmsChannel record);

    /**
     *
     * @mbg.generated
     */
    int insertSelective(CmsChannel record);

    /**
     *
     * @mbg.generated
     */
    List<CmsChannel> selectByExample(CmsChannelExample example);

    /**
     *
     * @mbg.generated
     */
    CmsChannel selectByPrimaryKey(String channelId);

    /**
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CmsChannel record, @Param("example") CmsChannelExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CmsChannel record, @Param("example") CmsChannelExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CmsChannel record);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CmsChannel record);
}