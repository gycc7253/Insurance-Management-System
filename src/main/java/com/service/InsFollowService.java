package com.service;

import java.util.List;

import com.entity.InsFollow;

public interface InsFollowService {

	public List<InsFollow> getInsFollowByInsId(int insId);

	public boolean addInsFollow(InsFollow insFollow);
	
	
}
