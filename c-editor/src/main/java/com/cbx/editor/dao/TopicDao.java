package com.cbx.editor.dao;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.cbx.editor.beans.Topic;

public interface TopicDao {

	@Insert("INSERT into topic(id,title,question,answer,topic_set,user_id,state) values(#{id},#{title},#{question},#{answer},#{topic_set},#{user_id},0)")
	void insert(@Param("id")int id,@Param("title")String title,@Param("question")String question,@Param("answer")String answer,@Param("topic_set")int topic_set,@Param("user_id")int user_id);

	@Select("SELECT MAX(id) FROM topic")
	int maxid();
	
	@Select("select * from topic")
	List<Topic> listData();


	
}
