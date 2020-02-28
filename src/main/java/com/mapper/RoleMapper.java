package com.mapper;

import java.util.List;

import com.entity.Role;

public interface RoleMapper {

	public List<Role> getAllRoles();

	public int addRole(Role role);

	public Role getRoleById(int id);

	public int deleteRole(int id);

	public int editRole(Role role);

}
