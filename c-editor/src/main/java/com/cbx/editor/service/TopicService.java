package com.cbx.editor.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbx.editor.beans.Topic;
import com.cbx.editor.dao.TopicDao;

@Service
public class TopicService {

	@Autowired
	private TopicDao topicDao;
	
	public void insert(Topic tp) {
		// TODO Auto-generated method stub
		topicDao.insert(tp);
	}

	public Map<String, Object> listData() {
		// TODO Auto-generated method stub
		Map<String,Object> res=new HashMap<String, Object>();
		res.put("data", topicDao.listData());
		return res;
	}

}
