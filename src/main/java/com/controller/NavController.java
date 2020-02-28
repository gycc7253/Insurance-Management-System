package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.MenuUtilService;
import com.service.RoleMenuService;

@Controller
@RequestMapping("/navController")
public class NavController {

	@Autowired
	private MenuUtilService mus;
	
	@Autowired
	private RoleMenuService rms;
	
	@RequestMapping("/getNavContent")
	@ResponseBody
	public String getNavContent() {
		
		
		return "ok";
	}
	
	
}
