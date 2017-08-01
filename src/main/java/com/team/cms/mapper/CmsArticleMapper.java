package com.team.cms.mapper;

import com.team.cms.pojo.CmsArticle;
import com.team.cms.pojo.CmsArticleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsArticleMapper {
    /**
     *
     * @mbg.generated
     */
    long countByExample(CmsArticleExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByExample(CmsArticleExample example);

    /**
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String articleId);

    /**
     *
     * @mbg.generated
     */
    int insert(CmsArticle record);

    /**
     *
     * @mbg.generated
     */
    int insertSelective(CmsArticle record);

    /**
     *
     * @mbg.generated
     */
    List<CmsArticle> selectByExample(CmsArticleExample example);

    /**
     *
     * @mbg.generated
     */
    CmsArticle selectByPrimaryKey(String articleId);

    /**
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CmsArticle record, @Param("example") CmsArticleExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CmsArticle record, @Param("example") CmsArticleExample example);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CmsArticle record);

    /**
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CmsArticle record);
}