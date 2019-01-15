package com.cbx.editor.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


import com.cbx.editor.beans.User;

public interface UserDao {
	@Select("select * from user")
	List<User> listData();
	
	@Select("SELECT COUNT(*) FROM USER WHERE phone = #{phone} AND PASSWORD = #{password}")
	int login(@Param("phone")String phone,@Param("password")String password);
	
	@Select("SELECT COUNT(*) FROM USER WHERE email = #{email} AND PASSWORD = #{password}")
	int login2(@Param("email")String email,@Param("password")String password);
	
	@Select("SELECT permission FROM USER WHERE phone=#{phone} AND PASSWORD =#{password}")
	int permission1(@Param("phone")String phone,@Param("password")String password);
	
	@Select("SELECT permission FROM USER WHERE email = #{email} AND PASSWORD = #{password}")
	int permission2(@Param("email")String email,@Param("password")String password);
	
	@Insert("INSERT into user(id,username,email,password,permission,state) values(#{id},#{username},#{email},#{password},0,0)")
	void register1(@Param("id")int id,@Param("username")String username,@Param("email")String email,@Param("password")String password);
	
	@Insert("INSERT into user(id,username,phone,password,permission,state) values(#{id},#{username},#{phone},#{password},0,0)")
	void register2(@Param("id")int id,@Param("username")String username,@Param("phone")String phone,@Param("password")String password);
	
	@Select("SELECT MAX(id) FROM USER")
	int maxid();
	
	@Insert("INSERT into user(id,username,email,password,permission,state,student_id) values(#{id},#{username},#{email},#{password},0,0,#{student_id})")
	void register3(@Param("id")int id,@Param("username")String username,@Param("email")String email,@Param("password")String password,@Param("student_id")int sutdent_id);
	
	@Insert("INSERT into user(id,username,phone,password,permission,state,student_id) values(#{id},#{username},#{phone},#{password},0,0,#{student_id})")
	void register4(@Param("id")int id,@Param("username")String username,@Param("phone")String phone,@Param("password")String password,@Param("student_id")int sutdent_id);
	
	@Select("SELECT * FROM USER WHERE phone = #{phone} AND PASSWORD = #{password}")
	List<User> useTeacher(@Param("phone")String phone,@Param("password")String password);
	
	@Delete("DELETE FROM user WHERE id = #{id}")
	void delete(@Param("id")int id);
}
