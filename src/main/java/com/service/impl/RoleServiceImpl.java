package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Role;
import com.mapper.RoleMapper;
import com.service.RoleService;

@Service("RoleService")
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	private RoleMapper rm;

	@Override
	public List<Role> getAllRoles(){
		List<Role> roleList = rm.getAllRoles();
		
		return roleList==null?new ArrayList<Role>():roleList;
	}

	@Override
	public boolean addRole(Role role) {
		int result = rm.addRole(role);
		return result>0?true:false;
	}

	@Override
	public Role getRoleById(int id) {
		Role role = rm.getRoleById(id);
		return role==null?new Role():role;
	}

	@Override
	public boolean deleteRole(int id) {
		int result = rm.deleteRole(id);
		return result>0?true:false;
	}

	@Override
	public boolean editRole(Role role) {
		int result = rm.editRole(role);
		return result>0?true:false;
	}
	
	
}
