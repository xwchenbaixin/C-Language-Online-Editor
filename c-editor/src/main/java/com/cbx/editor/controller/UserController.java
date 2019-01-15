package com.cbx.editor.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cbx.editor.beans.Topic;
import com.cbx.editor.beans.User;
import com.cbx.editor.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("listData")
	@ResponseBody
	public Map<String,Object> listData(){
		return userService.listData();
	}

	@RequestMapping("index")
	public String getUser(User user,Model model,HttpServletRequest request) {
		int flag,permission;
		flag = userService.login(user.getPhone(), user.getPassword());
		permission = userService.permission1(user.getPhone(), user.getPassword());
		if(flag == 1) {
			if(permission==1) {
				List<User> useteacher = userService.getUseTeacher(user.getPhone(), user.getPassword());
				model.addAttribute("useteacher",useteacher);
				for(User user1:useteacher) {
					request.getSession().setAttribute("Teacherid", user1.getId());
					request.getSession().setAttribute("permission", user1.getPermission());
					request.getSession().setAttribute("Teachername", user1.getUsername());}
				return "index";
			}
			else 
			{
				List<User> useteacher = userService.getUseTeacher(user.getPhone(), user.getPassword());
				model.addAttribute("useteacher",useteacher);
				for(User user1:useteacher) {
					request.getSession().setAttribute("Teacherid", user1.getId());
					request.getSession().setAttribute("permission", user1.getPermission());
					request.getSession().setAttribute("Teachername", user1.getUsername());}
				return "index2";
			}
		}
		else {
			return "fail";
		}
		
	}
	
	@RequestMapping("login2")
	public String getUser2(User user) {
		int flag;
		flag = userService.login2(user.getEmail(), user.getPassword());
		if(flag == 1) {
			return "success";
		}
		else {
			return "fail";
		}
	}
	
	@RequestMapping("control")
	public String getUser3(Model model) {
		List<User> allUser=userService.allUser();
		model.addAttribute("allUser",allUser);
			return "control";
		
	}
	
	@RequestMapping("deleteuser")
	public String delete(HttpServletRequest request,Model model) {
		List<User> allUser=userService.allUser();
		model.addAttribute("allUser",allUser);
		userService.delete(Integer.parseInt(request.getParameter("id")));
			return "control";
		
	}
	
	@RequestMapping("upload")
	public String upload() {
		return "upload";
	}
	
	@RequestMapping("register1")
	public void register1(@RequestBody User user){
			userService.register1(userService.createid(),user.getUsername(),user.getEmail(),user.getPassword());
	}
	
	@RequestMapping("register2")
	public void register2(@RequestBody User user){
			userService.register2(userService.createid(),user.getUsername(),user.getPhone(),user.getPassword());
	}
	
	@RequestMapping("register3")
	public void register3(@RequestBody User user){
			userService.register3(userService.createid(),user.getUsername(),user.getEmail(),user.getPassword(),user.getStudent_id());
	}
	
	@RequestMapping("register4")
	public void register4(@RequestBody User user){
			userService.register4(userService.createid(),user.getUsername(),user.getPhone(),user.getPassword(),user.getStudent_id());
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
