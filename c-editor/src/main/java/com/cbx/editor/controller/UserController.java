package com.cbx.editor.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cbx.editor.beans.User;
import com.cbx.editor.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	public Map<String, Object> listData(){
		Map<String,Object> res=null;
		return res;
	}
	
	public Map<String, Object> insert(User user){
		Map<String,Object> res=null;
		return res;
	}
	
	public Map<String, Object> delete(User user){
		Map<String,Object> res=null;
		return res;
	}
	public Map<String, Object> update(User user){
		Map<String,Object> res=null;
		return res;
	}
	public Map<String, Object> search(User user){
		Map<String,Object> res=null;
		return res;
	}
}
