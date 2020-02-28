package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.MenuUtil;
import com.mapper.MenuUtilMapper;
import com.service.MenuUtilService;

@Service("MenuUtilService")
public class MenuUtilServiceImpl implements MenuUtilService{

	@Autowired
	private MenuUtilMapper mum;
	
	@Override
	public List<MenuUtil> getAllMenuUtil() {
		List<MenuUtil> menuUtilList = mum.getAllMenuUtil();
		return menuUtilList;
	}

}
