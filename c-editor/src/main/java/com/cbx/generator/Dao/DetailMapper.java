package com.cbx.generator.Dao;

import com.cbx.editor.beans.Detail;
import com.cbx.generator.domain.DetailExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DetailMapper {
    long countByExample(DetailExample example);

    int deleteByExample(DetailExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Detail record);

    int insertSelective(Detail record);

    List<Detail> selectByExampleWithBLOBs(DetailExample example);

    List<Detail> selectByExample(DetailExample example);

    Detail selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Detail record, @Param("example") DetailExample example);

    int updateByExampleWithBLOBs(@Param("record") Detail record, @Param("example") DetailExample example);

    int updateByExample(@Param("record") Detail record, @Param("example") DetailExample example);

    int updateByPrimaryKeySelective(Detail record);

    int updateByPrimaryKeyWithBLOBs(Detail record);

    int updateByPrimaryKey(Detail record);
}