package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.User;

public interface UserMapper {
	public User login(@Param("userName")String userName, @Param("pwd")String pwd);

	public int updatePwd(@Param("id")int id, @Param("newPwd")String newPwd);

	public List<User> getAllUsers();

	public int addUser(User user);

	public User getUserById(int id);

	public int deleteUserById(int id);

	public int editUser(User user);
}
