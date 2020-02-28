package com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.entity.Role;
import com.entity.RoleMenu;
import com.service.RoleMenuService;
import com.service.RoleService;

@Controller
@RequestMapping("/roleController")
public class RoleController {
	
	@Autowired
	private RoleService rs;
	
	@Autowired
	private RoleMenuService rms;

	@RequestMapping("/getAllRoles.do")
	public ModelAndView getAllRoles() {
		ModelAndView mav = new ModelAndView();
		List<Role> roleList = rs.getAllRoles();
		mav.addObject("roleList", roleList);
		mav.setViewName("role/roleContent");
		return mav;
	}
	
	@RequestMapping("/addRole.do")
	public String addRole(Role role) {
		boolean result = rs.addRole(role);
		
		if(result) {
			return "redirect:/roleController/getAllRoles.do";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping("/checkDelete.do")
	public ModelAndView checkDelete(int id) {
		ModelAndView mav = new ModelAndView();
		Role role = rs.getRoleById(id);
		mav.addObject("role", role);
		mav.setViewName("role/roleDelete");
		return mav;
	}
	
	@RequestMapping("/deleteRole.do")
	public String deleteRole(int id) {
		boolean result = rs.deleteRole(id);
		if(result) {
			return "redirect:/roleController/getAllRoles.do";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/checkEdit.do")
	public ModelAndView checkEdit(int id) {
		ModelAndView mav = new ModelAndView();
		Role role = rs.getRoleById(id);
		mav.addObject("role", role);
		mav.setViewName("role/roleEdit");
		return mav;
	}
	
	@RequestMapping("/editRole.do")
	public String editRole(Role role) {
		boolean result = rs.editRole(role);
		if(result) {
			return "redirect:/roleController/getAllRoles.do";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/checkGrant.do")
	public ModelAndView checkGrant(int rid) {
		ModelAndView mav = new ModelAndView();
		List<RoleMenu> roleMenuList= rms.getRoleMenuByRid(rid);
		String roleMenuListJSON = JSONObject.toJSONString(roleMenuList);
		System.out.println(roleMenuListJSON);
		mav.addObject("roleMenuList", roleMenuListJSON);
		mav.addObject("rid", rid);
		mav.setViewName("role/roleGrant");
		return mav;
	}
	
	@RequestMapping("grantRole.do")
	public String grantRole(int rid, String[] parent, String[] child) {
		List<String> menuNumList = new ArrayList<String>();

		rms.deleteRoleMenuByRid(rid);
		for(int i = 0; i < parent.length; i++) {
			menuNumList.add(parent[i]);
		}
		for(int i = 0; i < child.length; i++) {
			menuNumList.add(child[i]);
		}
		for(String menuNum: menuNumList) {
			rms.addRoleMenu(rid, menuNum);
		}
		return "redirect:/roleController/getAllRoles.do";
	}
}