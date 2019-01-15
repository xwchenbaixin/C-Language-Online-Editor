package com.cbx.editor.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.cbx.editor.beans.Detail;
import com.cbx.editor.beans.Topic;
import com.cbx.editor.beans.TopicSet;
import com.cbx.editor.beans.User;

public interface TopicSetDao {
	@Select("select * from topic_set")
	List<TopicSet> TopicSetData();
	
	@Select("select * from topic")
	List<Topic> TopicData();
	
	@Select("select * from detail where topic_id = #{topic_id}")
	List<Detail> detailList(@Param("topic_id")int topic_id );
	
	@Select("SELECT user.`id`,user.`username`,user.`classes` FROM detail,USER WHERE detail.`user_id`=user.`id` AND  topic_id = #{topic_id}")
	List<User> userList(@Param("topic_id")int topic_id );
	
	@Select("select * from user where id = #{id}")
	List<User> userList1(@Param("id")int id );
	
	@Update("UPDATE topic SET state = 1 WHERE id =#{id}")
	void check(@Param("id")int id);
	
	@Delete("DELETE FROM topic WHERE id = #{id}")
	void delete(@Param("id")int id);

}
