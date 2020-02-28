package com.service;

import java.util.List;

import com.entity.Ins;

public interface InsService {

	public List<Ins> getInsByPageAndUserId(int currentPage, Integer id);

	public int countByUid(Integer id);

	public boolean addIns(Ins ins);

	public Ins getInsById(int id);

	public boolean editIns(Ins ins);

	public boolean deleteInsById(int id);

	public boolean submitIns(int id, int status);

	public List<Ins> getInsByPageAndStatus(int currentPage, Integer insSubmitStatus);

	public int countByStatus(int status);

	public List<Ins> getInsByFinance(int currentPage);

	public int getInsStatusById(int id);

	public int count();

}
