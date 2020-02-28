package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.MenuUtil;
import com.entity.PMenu;
import com.entity.RoleMenu;
import com.entity.SMenu;
import com.mapper.MenuUtilMapper;
import com.mapper.RoleMenuMapper;
import com.service.NavService;

@Service("NavService")
public class NavServiceImpl implements NavService{

	@Autowired
	private MenuUtilMapper mum;
	
	@Autowired 
	private RoleMenuMapper rmm;
	
	@Override
	public List<PMenu> getPMenuList(int rid) {
		
		List<RoleMenu> rmList = rmm.getRoleMenuByRid(rid);
		
		List<MenuUtil> muList = mum.getAllMenuUtil();
		
		List<PMenu> pMenuList = new ArrayList<PMenu>();
		
		for(RoleMenu rm: rmList) {
			for(MenuUtil mu: muList) {
				if(rm.getMenuNum().equals(mu.getMenuNum()) && mu.getPmenuNum()==null) {
					PMenu p = new PMenu(mu.getMenuNum(), mu.getMenuText());
					pMenuList.add(p);
				}
				
			}
		}
		return pMenuList;
	}

	@Override
	public List<SMenu> getSMenuList(int rid) {
		
		List<RoleMenu> rmList = rmm.getRoleMenuByRid(rid);
		
		List<MenuUtil> muList = mum.getAllMenuUtil();
		
		List<SMenu> sMenuList = new ArrayList<SMenu>();
		
		for(RoleMenu rm: rmList) {
			for(MenuUtil mu: muList) {
				if(rm.getMenuNum().equals(mu.getMenuNum()) && mu.getPmenuNum()!=null) {
					SMenu s = new SMenu(mu.getMenuNum(),mu.getMenuText(),mu.getMenuUrl(),mu.getPmenuNum());
					sMenuList.add(s);
				}
			}
			
		}
		return sMenuList;
	}

	
	
	
}
