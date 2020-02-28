package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.User;
import com.mapper.UserMapper;
import com.service.UserService;

@Service("UserService")
public class UserServiceImpl implements UserService{

	
	@Autowired
	private UserMapper um;
	
	@Override
	public User login(String userName, String pwd) {
		User user = um.login(userName, pwd);
		return user;
	}

	@Override
	public boolean updatePwd(int id, String newPwd) {
		int result = um.updatePwd(id, newPwd);
		return result>0?true:false;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> userList = um.getAllUsers();
		return userList==null?new ArrayList<User>():userList;
	}

	@Override
	public boolean addUser(User user) {
		int result = um.addUser(user);
		return result>0?true:false;
	}

	@Override
	public User getUserById(int id) {
		User user = um.getUserById(id);
		return user==null?new User():user;
	}

	@Override
	public boolean deleteUserById(int id) {
		int result = um.deleteUserById(id);
		return result>0?true:false;
	}

	@Override
	public boolean editUser(User user) {
		int result = um.editUser(user);
		return result>0?true:false;
	}
	
	

}
