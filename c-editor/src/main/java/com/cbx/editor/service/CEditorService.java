package com.cbx.editor.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.cbx.editor.beans.Detail;
import com.cbx.editor.beans.Editor;
import com.cbx.editor.beans.Topic;
import com.cbx.editor.beans.TopicSet;
import com.cbx.editor.dao.CEditorDao;

@Service
public class CEditorService {

	@Autowired
	private CEditorDao cEditorDao;
	
	public String getAnswer(int id) {
		// TODO Auto-generated method stub
		return cEditorDao.getAnswer(id);
	}

	public Map<String, Object> initEditor(Topic topic) {
		// TODO Auto-generated method stub
		Map<String,Object> data=new HashMap<>();
		List<Topic> topicList=cEditorDao.getTopics(topic.getTopic_set());
		TopicSet topic_set=cEditorDao.getTopic_set(topic.getTopic_set());
		Topic resTopic=cEditorDao.getTopic(topic.getId());
		String user_code=cEditorDao.getDetailCode(topic.getId(),topic.getUser_id());
		
		data.put("topicList", topicList);
		data.put("topic_set", topic_set);
		data.put("topic",resTopic);
		data.put("user_code",user_code);
		return data;
	}

	public Integer isSubmited(int id, int user_id) {
		// TODO Auto-generated method stub
		return cEditorDao.isSubmited(id,user_id);
	}

	public Integer insertDetail(Detail detail) {
		// TODO Auto-generated method stub
		return cEditorDao.inserDetail(detail);
	}

	public Integer isSaved(Integer id, Integer userid) {
		// TODO Auto-generated method stub
		return cEditorDao.isSaved(id,userid);
	}

	public Integer deleteDetail(Integer isSaved) {
		// TODO Auto-generated method stub
		return cEditorDao.deleteDetail(isSaved);
	}

	public Integer updateDetail(Integer isSaved,String code) {
		// TODO Auto-generated method stub
		return cEditorDao.updateDetail(isSaved,code);
	}

	public Integer addSubmit(Editor editor) {
		// TODO Auto-generated method stub
		cEditorDao.updateTopicSetSubmit(editor);
		cEditorDao.updateTopicSubmit(editor);
		return 1;
	}

	public Map<String, Object> initViewEditor(Detail detail) {
		Map<String,Object> data=new HashMap<>();
		Topic resTopic=cEditorDao.getTopic(detail.getTopic_id());
		String user_code=cEditorDao.getDetailCode(detail.getTopic_id(),detail.getUser_id());
		String user_answer=cEditorDao.getUserAnswer(detail);
		System.out.println(user_answer);
		List<Map> scores=JSON.parseArray(user_answer, Map.class);
		
		data.put("topic",resTopic);
		data.put("user_code",user_code);
		data.put("scores",scores);
		return data;
	}
	
}
