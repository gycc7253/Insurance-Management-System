package com.service;

import java.util.List;

import com.entity.User;

public interface UserService {

	public User login(String userName, String pwd);

	public boolean updatePwd(int id, String newPwd);

	public List<User> getAllUsers();

	public boolean addUser(User user);

	public User getUserById(int id);

	public boolean deleteUserById(int id);

	public boolean editUser(User user);
	
	
}
