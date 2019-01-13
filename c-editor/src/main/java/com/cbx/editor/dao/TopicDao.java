package com.cbx.editor.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.cbx.editor.beans.Topic;

public interface TopicDao {

	@Insert("INSERT into topic(title,question,answer,topic_set,user_id) values('fff','feawfaw','fewafwa',3,3")
	void insert(Topic tp);

	@Select("select * from topic")
	List<Topic> listData();
	
}
