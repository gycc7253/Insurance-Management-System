package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.FreeIns;
import com.mapper.FreeInsMapper;
import com.page.FreeInsPageBean;
import com.service.FreeInsService;

@Service("FreeInsService")
public class FreeInsServiceImpl implements FreeInsService{

	@Autowired
	private FreeInsMapper fim;
	
	@Override
	public List<FreeIns> getFreeInsByPage(int currentPage) {
		int start = (currentPage-1)*FreeInsPageBean.getSize();
		int size = FreeInsPageBean.getSize();
		List<FreeIns> freeInsList = fim.getFreeInsByPage(start, size);
		return freeInsList;
	}
	
	@Override
	public List<FreeIns> getFreeInsByPageAndUserId(int currentPage, int userId) {
		int start = (currentPage-1)*FreeInsPageBean.getSize();
		int size = FreeInsPageBean.getSize();
		List<FreeIns> freeInsList = fim.getFreeInsByPageAndUserId(start, size, userId);
		return freeInsList;
	}


	@Override
	public int count() {
		int result = fim.count();
		return result;
	}

	@Override
	public FreeIns getFreeInsById(int id) {
		FreeIns freeIns = fim.getFreeInsById(id);
		return freeIns==null?new FreeIns():freeIns;
	}

	@Override
	public boolean deleteFreeInsById(int id) {
		int result = fim.deleteFreeInsById(id);
		return result>0?true:false;
	}

	@Override
	public boolean editFreeIns(FreeIns freeIns) {
		int result = fim.editFreeIns(freeIns);
		return result>0?true:false;
	}

	@Override
	public boolean addFreeIns(FreeIns freeIns) {
		int result = fim.addFreeIns(freeIns);
		return result>0?true:false;
	}
	
	@Override
	public boolean submitFreeIns(int id, Integer status) {
		int result = fim.submitFreeIns(id, status);
		return result>0?true:false;
	}

	@Override
	public int countByUid(Integer id) {
		int result = fim.countByUid(id);
		return result;
	}

	@Override
	public int countByStatus(Integer status) {
		int result = fim.countByStatus(status);
		return result;
	}

	@Override
	public List<FreeIns> getFreeInsByPageAndStatus(int currentPage, int status) {
		int start = (currentPage-1)*FreeInsPageBean.getSize();
		int size = FreeInsPageBean.getSize();
		List<FreeIns> freeInsList = fim.getFreeInsByPageAndStatus(start, size, status);
		return freeInsList==null?new ArrayList<FreeIns>():freeInsList;
	}

	@Override
	public int getFreeInsStatusById(int id) {
		int status = fim.getFreeInsStatusById(id);
		return status;
	}
	
	@Override
	public int countFreeInsByUserAndStatus(int uid, Integer status) {
		int result = fim.countFreeInsByUserAndStatus(uid, status);
		return result;
	}
	
	@Override
	public int countFreeInsByStatus(Integer status) {
		int result = fim.countByStatus(status);
		return result;
	}


}
