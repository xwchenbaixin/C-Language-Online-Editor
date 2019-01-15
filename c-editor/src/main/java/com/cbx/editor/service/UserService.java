package com.cbx.editor.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cbx.editor.beans.TopicSet;
import com.cbx.editor.beans.User;
import com.cbx.editor.dao.UserDao;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public Map<String,Object> listData(){
		Map<String,Object> res =  new HashMap<String,Object>();
		res.put("data", userDao.listData());
		return res;
	}
	
	public void delete(int id) {
		userDao.delete(id);
	}
	
	public List<User> allUser(){
		List<User> list = userDao.listData();
		return list;
	}
	
	public int login(String phone,String password) {
		int i=0;
		i=userDao.login(phone, password);
		return i;
	}
	
	public int login2(String email,String password) {
		int i=0;
		i=userDao.login2(email, password);
		return i;
	}
	
	public int permission1(String phone,String password) {
		int i = userDao.permission1(phone, password);
		return i;
	}
	
	public int permission2(String email,String password) {
		int i = userDao.permission2(email, password);
		return i;
	}
	
	public void register1(int id,String username,String email,String password) {
		userDao.register1(id, username, email, password);
	}
	
	public void register2(int id,String username,String phone,String password) {
		userDao.register2(id, username, phone, password);
	}
	
	public void register3(int id,String username,String email,String password,int student_id) {
		userDao.register3(id, username, email, password,student_id);
	}
	
	public void register4(int id,String username,String phone,String password,int student_id) {
		userDao.register4(id, username, phone, password,student_id);
	}
	
	public int createid() {
		int id;
		id=userDao.maxid();
		return (id+1);
	}
	
	public List<User> getUseTeacher(String phone,String password){
		List<User> useTeacher = userDao.useTeacher(phone, password);
		return useTeacher;
	}
	
}
