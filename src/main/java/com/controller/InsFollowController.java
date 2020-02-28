package com.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.entity.InsFollow;
import com.service.InsFollowService;

@Controller
@RequestMapping("/insFollowController")
public class InsFollowController {
	
	@Autowired
	private InsFollowService ifs;

	@RequestMapping("/getInsFollowByInsId.do")
	@ResponseBody
	public String getInsFollowByIndId(int insId) {
		List<InsFollow> insFollowList = ifs.getInsFollowByInsId(insId);
		String json = JSONObject.toJSONString(insFollowList);
		System.out.println("//" + json + "//");
		return json;
	}
	
	@RequestMapping("/addInsFollow.do")
	public String addInsFollow(int insId, String recordText, Date nextDate) {
		System.out.println("AddInsFollow Controller Arrived...........");
		InsFollow insFollow = new InsFollow(null, new Date(), recordText, nextDate, insId);
		boolean result = ifs.addInsFollow(insFollow);
		if(result) {
			return "redirect:/insController/getInsByPageAndUserId.do?currentPage=1";
		}else {
			return "error";
		}
	}
}
