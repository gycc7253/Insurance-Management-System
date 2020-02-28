package com.service;

import java.util.List;

import com.entity.Role;

public interface RoleService {

	public List<Role> getAllRoles();

	public boolean addRole(Role role);

	public Role getRoleById(int id);

	public boolean deleteRole(int id);

	public boolean editRole(Role role);
}
