package com.cbx.editor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbx.editor.beans.Topic;
import com.cbx.editor.beans.User;
import com.cbx.editor.service.TopicService;

@Controller
@RequestMapping("/topic")
public class TopicController {
	@Autowired
	private TopicService topicService;
	
	@RequestMapping("listData")
	@ResponseBody	//加了这句话以后就可以把数据以JSON方式返回到前端了，如果没有加这句话，则是跳转界面
	public Map<String, Object> listData(){
		return topicService.listData();
	}
	
	@RequestMapping("insert")
	public void insert(@RequestBody Topic top){
		topicService.insert(topicService.createid(), 
				top.getTitle(), 
				top.getQuestion(), 
				top.getAnswer(),
				top.getTopic_set(),
				1);
		
	}
	


	public Map<String, Object> update(Topic tp){
		Map<String,Object> res=null;
		return res;
	}
	
	public Map<String, Object> delete(Topic tp){
		Map<String,Object> res=null;
		return res;
	}
	
	public Map<String, Object> search(Topic tp){
		Map<String,Object> res=null;
		return res;
	}
}
