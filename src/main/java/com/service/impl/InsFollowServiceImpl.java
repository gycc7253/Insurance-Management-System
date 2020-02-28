package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.InsFollow;
import com.mapper.InsFollowMapper;
import com.service.InsFollowService;

@Service("InsFollowService")
public class InsFollowServiceImpl implements InsFollowService{

	@Autowired
	private InsFollowMapper ifm;

	@Override
	public List<InsFollow> getInsFollowByInsId(int insId) {
		List<InsFollow> insFollowList = ifm.getInsFollowByInsId(insId);
		return insFollowList;
	}

	@Override
	public boolean addInsFollow(InsFollow insFollow) {
		int result = ifm.addInsFollow(insFollow);
		return result>0?true:false;
	}

}
