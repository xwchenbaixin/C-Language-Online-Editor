package com.cbx.generator.Dao;

import com.cbx.editor.beans.Topic;
import com.cbx.editor.beans.TopicWithBLOBs;
import com.cbx.generator.domain.TopicExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TopicMapper {
    long countByExample(TopicExample example);

    int deleteByExample(TopicExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TopicWithBLOBs record);

    int insertSelective(TopicWithBLOBs record);

    List<TopicWithBLOBs> selectByExampleWithBLOBs(TopicExample example);

    List<Topic> selectByExample(TopicExample example);

    TopicWithBLOBs selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TopicWithBLOBs record, @Param("example") TopicExample example);

    int updateByExampleWithBLOBs(@Param("record") TopicWithBLOBs record, @Param("example") TopicExample example);

    int updateByExample(@Param("record") Topic record, @Param("example") TopicExample example);

    int updateByPrimaryKeySelective(TopicWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(TopicWithBLOBs record);

    int updateByPrimaryKey(Topic record);
}