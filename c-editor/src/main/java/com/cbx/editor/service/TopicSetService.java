package com.cbx.editor.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbx.editor.beans.*;
import com.cbx.editor.dao.TopicSetDao;

@Service
public class TopicSetService {
		
	@Autowired
	private TopicSetDao topicsetDao;
	
	public List<TopicSet> findAllTopicset(){
		List<TopicSet> topicsetList = topicsetDao.TopicSetData();
		return topicsetList;
	}
	
	public List<Topic> findAllTopic(){
		List<Topic> topicList = topicsetDao.TopicData();
		return topicList;
	}
	
	public List<Detail> findSomeDetail(int topic_id){
		List<Detail> detailList = topicsetDao.detailList(topic_id);
		return detailList;
	}
	
	public List<User> findStudent(int id){
		List<User> userList = topicsetDao.userList(id);
		return userList;
	}
	
	public void check(int id) {
		topicsetDao.check(id);
	}
	
	public void delete(int id) {
		topicsetDao.delete(id);
	}
	
}
