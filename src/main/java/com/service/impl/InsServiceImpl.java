package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Ins;
import com.mapper.InsMapper;
import com.page.InsPageBean;
import com.service.InsService;
import com.util.MsgUtil;

@Service("InsService")
public class InsServiceImpl implements InsService{

	@Autowired
	private InsMapper im;

	@Override
	public List<Ins> getInsByPageAndUserId(int currentPage, Integer id) {

		int size = InsPageBean.getSize();
		int start = (currentPage - 1) * size;
		List<Ins> insList = im.getInsByPageAndUserId(start, size, id);
		return insList==null?new ArrayList<Ins>():insList;
	}

	@Override
	public int countByUid(Integer id) {
		int result = im.countByUid(id);
		return result;
	}

	@Override
	public boolean addIns(Ins ins) {
		int result = im.addIns(ins);
		return result>0?true:false;
	}

	@Override
	public Ins getInsById(int id) {
		Ins ins = im.getInsById(id);
		return ins;
	}

	@Override
	public boolean editIns(Ins ins) {
		int result = im.editIns(ins);
		return result>0?true:false;
	}

	@Override
	public boolean deleteInsById(int id) {
		int result = im.deleteInsById(id);
		return result>0?true:false;
	}

	@Override
	public boolean submitIns(int id, int status) {
		int result = im.submitIns(id, status);
		return result>0?true:false;
	}

	@Override
	public List<Ins> getInsByPageAndStatus(int currentPage, Integer status) {
		int size = InsPageBean.getSize();
		int start = (currentPage - 1) * size;
		List<Ins> insList = im.getInsByPageAndStatus(start, size, status);
		return insList;
	}

	@Override
	public int countByStatus(int status) {
		int result = im.countByStatus(status);
		return result;
	}

	@Override
	public List<Ins> getInsByFinance(int currentPage) {
		int size = InsPageBean.getSize();
		int start = (currentPage - 1) * size;
		List<Ins> insList = im.getInsByFinance(start, size, MsgUtil.Ins_confirmed_status, MsgUtil.Ins_accounted_status);
		return insList;
	}

	@Override
	public int getInsStatusById(int id) {
		int status = im.getInsStatusById(id);
		return status;
	}

	@Override
	public int count() {
		int result = im.count();
		return result;
	}
	
	
}
