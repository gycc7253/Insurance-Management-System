package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.Ins;

public interface InsMapper {

	public List<Ins> getInsByPageAndUserId(@Param("start")int start, @Param("size")int size, @Param("id")Integer id);

	public int countByUid(Integer id);

	public int addIns(Ins ins);

	public Ins getInsById(int id);

	public int editIns(Ins ins);

	public int deleteInsById(int id);

	public int submitIns(@Param("id")int id, @Param("status")int status);

	public List<Ins> getInsByPageAndStatus(@Param("start")int start, @Param("size")int size, @Param("status")Integer status);

	public int countByStatus(int status);

	public List<Ins> getInsByFinance(@Param("start")int start, @Param("size")int size, @Param("status1")Integer insConfirmedStatus, @Param("status2")Integer insAccountedStatus);

	public int getInsStatusById(int id);

	public int count();

}
