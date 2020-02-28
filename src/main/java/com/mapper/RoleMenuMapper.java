package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.RoleMenu;

public interface RoleMenuMapper {
	public List<RoleMenu> getRoleMenuByRid(int rid);

	public int deleteRoleMenuByRid(int rid);

	public int addRoleMenu(@Param("rid")int rid, @Param("menuNum")String menuNum);
}
