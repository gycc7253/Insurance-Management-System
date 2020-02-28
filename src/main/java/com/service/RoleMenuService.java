package com.service;

import java.util.List;

import com.entity.RoleMenu;

public interface RoleMenuService {
	
	public List<RoleMenu> getRoleMenuByRid(int rid);

	public boolean deleteRoleMenuByRid(int rid);

	public boolean addRoleMenu(int rid, String menuNum);
}
