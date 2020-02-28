package com.service;

import java.util.List;

import com.entity.PMenu;
import com.entity.SMenu;


public interface NavService {

	public List<PMenu> getPMenuList(int rid);
	
	public List<SMenu> getSMenuList(int rid);
}
