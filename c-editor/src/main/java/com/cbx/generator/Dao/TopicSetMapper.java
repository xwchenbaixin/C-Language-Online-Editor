package com.cbx.generator.Dao;

import com.cbx.editor.beans.TopicSet;
import com.cbx.generator.domain.TopicSetExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TopicSetMapper {
    long countByExample(TopicSetExample example);

    int deleteByExample(TopicSetExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TopicSet record);

    int insertSelective(TopicSet record);

    List<TopicSet> selectByExample(TopicSetExample example);

    TopicSet selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TopicSet record, @Param("example") TopicSetExample example);

    int updateByExample(@Param("record") TopicSet record, @Param("example") TopicSetExample example);

    int updateByPrimaryKeySelective(TopicSet record);

    int updateByPrimaryKey(TopicSet record);
}