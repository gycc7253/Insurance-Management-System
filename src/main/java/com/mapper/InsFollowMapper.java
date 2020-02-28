package com.mapper;

import java.util.List;

import com.entity.InsFollow;

public interface InsFollowMapper {

	public List<InsFollow> getInsFollowByInsId(int insId);

	public int addInsFollow(InsFollow insFollow);

}
