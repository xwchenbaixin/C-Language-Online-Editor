package com.cbx.editor.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cbx.editor.beans.*;

import com.cbx.editor.service.TopicSetService;

@Controller
@RequestMapping("/user")
public class TopicSetController {
	@Autowired
	private TopicSetService topicsetService;

	
	
	@RequestMapping("getAllTopicSet")
	public String getAllTopicSer(Model model) {
		List<TopicSet> topicset = topicsetService.findAllTopicset();
		List<Topic> topic = topicsetService.findAllTopic();
		model.addAttribute("TopicSetList",topicset);  
		model.addAttribute("TopicList",topic);
		return "tables";
	}
	
	@RequestMapping("teachergetAllTopicSet")
	public String TeachergetAllTopicSet(Model model) {
		List<TopicSet> topicset = topicsetService.findAllTopicset();
		List<Topic> topic = topicsetService.findAllTopic();
		model.addAttribute("TopicSetList",topicset);  
		model.addAttribute("TopicList",topic);
		return "teachertables";
	}
	
	@RequestMapping("detail")
	public String detail(HttpServletRequest request,Model model){
		String a = request.getParameter("topic_id");
		int i = Integer.parseInt(a);
		System.out.println(i);
		List<Detail> detailList = topicsetService.findSomeDetail(i);
		List<User> userList = topicsetService.findStudent(i);
		model.addAttribute("DetailList",detailList);
		model.addAttribute("UserList",userList);
		return "seefinished";
	}
	
	@RequestMapping("control2")
	public String getUser3(Model model) {
		List<Topic> topic = topicsetService.findAllTopic();
		model.addAttribute("topic",topic);
			return "control2";
	}
	
	@RequestMapping("check")
	public String check(HttpServletRequest request,Model model) {
		topicsetService.check(Integer.parseInt(request.getParameter("id")));
		List<Topic> topic = topicsetService.findAllTopic();
		model.addAttribute("topic",topic);
		return "control2";
	}
	
	@RequestMapping("delete")
	public String delete(HttpServletRequest request,Model model) {
		topicsetService.delete(Integer.parseInt(request.getParameter("id")));
		List<Topic> topic = topicsetService.findAllTopic();
		model.addAttribute("topic",topic);
		return "control2";
	}
	
	public Map<String, Object> listData(){
		Map<String, Object> res=null;
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
