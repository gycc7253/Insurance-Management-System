package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.RoleMenu;
import com.mapper.RoleMenuMapper;
import com.service.RoleMenuService;

@Service("RoleMenuService")
public class RoleMenuServiceImpl implements RoleMenuService{
	
	@Autowired
	private RoleMenuMapper rmm;
	
	@Override
	public List<RoleMenu> getRoleMenuByRid(int rid) {
		List<RoleMenu> roleMenuList = rmm.getRoleMenuByRid(rid);
		return roleMenuList==null?new ArrayList<RoleMenu>():roleMenuList;
	}

	@Override
	public boolean deleteRoleMenuByRid(int rid) {
		int result = rmm.deleteRoleMenuByRid(rid);
		
		return result>0?true:false;
	}

	@Override
	public boolean addRoleMenu(int rid, String menuNum) {
		int result = rmm.addRoleMenu(rid, menuNum);
		return result>0?true:false;
	}

}
