package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.entity.FreeIns;

public interface FreeInsMapper {
	
	public List<FreeIns> getFreeInsByPage(@Param("start")int start, @Param("size")int size);
	
	public int count();

	public FreeIns getFreeInsById(int id);

	public int deleteFreeInsById(int id);

	public int editFreeIns(FreeIns freeIns);

	public int addFreeIns(FreeIns freeIns);

	public int submitFreeIns(@Param("id")Integer id, @Param("status")Integer status);

	public List<FreeIns> getFreeInsByPageAndUserId(@Param("start")int start, @Param("size")int size, @Param("userId")int userId);

	public int countByUid(Integer id);

	public List<FreeIns> getFreeInsByPageAndStatus(int start, int size, int status);

	public int countByStatus(Integer status);

	public int getFreeInsStatusById(int id);

	public int countFreeInsByUserAndStatus(@Param("userId")int uid, @Param("status")Integer status);
	
}
