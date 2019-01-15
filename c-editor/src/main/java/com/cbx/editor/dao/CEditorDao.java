package com.cbx.editor.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.cbx.editor.beans.Detail;
import com.cbx.editor.beans.Editor;
import com.cbx.editor.beans.Topic;
import com.cbx.editor.beans.TopicSet;

public interface CEditorDao {

	@Select("select answer from topic where id=#{id}")
	String getAnswer(@Param("id")int id);

	@Select("select id,title,question,time,submit,knowledge,topic_set from topic where topic_set=#{topic_set}")
	List<Topic> getTopics(@Param("topic_set")Integer topic_set);

	@Select("select * from topic_set where id=#{topic_set}")
	TopicSet getTopic_set(@Param("topic_set")Integer topic_set);

	@Select("select id,title,question,time,submit,knowledge from topic where id=#{id}")
	Topic getTopic(@Param("id")Integer id);

	@Select("select count(*) from detail where topic_id=#{topic_id} and user_id=#{user_id} and state=1")
	Integer isSubmited(@Param("topic_id")Integer id, @Param("user_id")Integer userid);

	
	@Insert("insert into detail(topic_id,user_id,user_answer,user_score,user_code,state) values(#{topic_id},#{user_id},#{user_answer},#{user_score},#{user_code},#{state})")
	Integer inserDetail(Detail detail);

	@Select("select id from detail where topic_id=#{topic_id} and user_id=#{user_id} and state=0")
	Integer isSaved(@Param("topic_id")Integer topic_id, @Param("user_id")Integer user_id);

	@Delete("delete from detail where id=#{id}")
	Integer deleteDetail(@Param("id") Integer id);

	@Update("update detail set user_code=#{user_code} where id=#{id}")
	Integer updateDetail(@Param("id") Integer isSaved,@Param("user_code") String code);

	@Select("select user_code from detail where topic_id=#{topic_id} and user_id=#{user_id}")
	String getDetailCode(@Param("topic_id")Integer topic_id, @Param("user_id")Integer user_id);

	@Update("update topic set submit=submit+1 where id=#{id}")
	Integer updateTopicSubmit(Editor editor);
	
	@Update("update topic_set set submit=submit+1 where id=#{topic_set}")
	Integer updateTopicSetSubmit(Editor editor);

	@Select("select user_answer from detail where user_id=#{user_id} and topic_id=#{topic_id}")
	String getUserAnswer(Detail detail);
}
