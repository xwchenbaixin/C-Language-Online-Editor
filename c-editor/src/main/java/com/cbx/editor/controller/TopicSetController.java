package com.cbx.editor.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cbx.editor.service.TopicSetService;

@Controller
@RequestMapping("topicSet")
public class TopicSetController {
	@Autowired
	private TopicSetService topicSetService;
	
	public Map<String, Object> listData(){
		Map<String,Object> res=null;
		return res;
	}
	public Map<String, Object> update(){
		Map<String, Object> res=null;
		return res;
	}
	
	public Map<String, Object> delete(){
		Map<String, Object> res=null;
		return res;
	}
	public Map<String, Object> insert(){
		Map<String, Object> res=null;
		return res;
	}
	public Map<String, Object> search(){
		Map<String, Object> res=null;
		return res;
	}
}
