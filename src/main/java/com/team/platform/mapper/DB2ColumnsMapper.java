package com.team.platform.mapper;

import com.team.platform.pojo.Columns;
import com.team.platform.pojo.DB2ColumnsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DB2ColumnsMapper {
    /**
     *
     * @mbg.generated
     */
    long countByExample(DB2ColumnsExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByExample(DB2ColumnsExample example);

    /**
     *
     * @mbg.generated
     */
    int insert(Columns record);

    /**
     *
     * @mbg.generated
     */
    int insertSelective(Columns record);

    /**
     *
     * @mbg.generated
     */
    List<Columns> selectByExample(DB2ColumnsExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") Columns record, @Param("example") DB2ColumnsExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") Columns record, @Param("example") DB2ColumnsExample example);
}