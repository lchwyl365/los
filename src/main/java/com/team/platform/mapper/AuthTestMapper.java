package com.team.platform.mapper;

import com.team.platform.pojo.AuthTest;
import com.team.platform.pojo.AuthTestExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AuthTestMapper {
    /**
     *
     * @mbg.generated
     */
    long countByExample(AuthTestExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByExample(AuthTestExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String testid);

    /**
     *
     * @mbg.generated
     */
    int insert(AuthTest record);

    /**
     *
     * @mbg.generated
     */
    int insertSelective(AuthTest record);

    /**
     *
     * @mbg.generated
     */
    List<AuthTest> selectByExample(AuthTestExample example);

    /**
     *
     * @mbg.generated
     */
    AuthTest selectByPrimaryKey(String testid);

    /**
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") AuthTest record, @Param("example") AuthTestExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") AuthTest record, @Param("example") AuthTestExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(AuthTest record);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(AuthTest record);
}