package com.service;

import java.util.List;

import com.entity.FreeIns;

public interface FreeInsService {

	public List<FreeIns> getFreeInsByPage(int currentPage);
	
	public int count();

	public FreeIns getFreeInsById(int id);

	public boolean deleteFreeInsById(int id);

	public boolean editFreeIns(FreeIns freeIns);

	public boolean addFreeIns(FreeIns freeIns);

	public boolean submitFreeIns(int id, Integer freeinsSubmitStatus);

	public List<FreeIns> getFreeInsByPageAndUserId(int currentPage, int userId);

	public int countByUid(Integer id);
	
	public int countByStatus(Integer status);
	
	public List<FreeIns> getFreeInsByPageAndStatus(int currentPage, int status);

	public int getFreeInsStatusById(int id);

	public int countFreeInsByUserAndStatus(int uid, Integer status);

	public int countFreeInsByStatus(Integer status);

}
