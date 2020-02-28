package com.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Ins;
import com.entity.InsFollow;
import com.entity.User;
import com.page.InsPageBean;
import com.service.InsFollowService;
import com.service.InsService;
import com.util.MsgUtil;

@Controller
@RequestMapping("/insController")
public class InsController {

	@Autowired
	public InsService is;
	
	@Autowired
	private InsFollowService ifs;
	
	@RequestMapping("/getInsByPageAndUserId.do")
	public ModelAndView getInsByPageAndUserId(int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		List<Ins> insList = is.getInsByPageAndUserId(currentPage, user.getId());
		int totalEntries = is.countByUid(user.getId());
		InsPageBean ipb = new InsPageBean();
		List<InsFollow> insFollowList = new ArrayList<InsFollow>();
		for(Ins ins: insList) {
			List<InsFollow> innerInsFollowList = ifs.getInsFollowByInsId(ins.getId());
			System.out.println(innerInsFollowList.size());
			if(innerInsFollowList != null) {
				insFollowList.addAll(innerInsFollowList);
			}
		}
		for(InsFollow insFollow: insFollowList) {
			System.out.println(insFollow);
		}
		ipb.setTotalEntries(totalEntries);
		ipb.setInsList(insList);
		ipb.setTotalPages();
		ipb.setCurrentPage(currentPage);
		mav.addObject("pb", ipb);
		mav.addObject("insFollowList", insFollowList);
		mav.setViewName("ins/insContent");
		return mav;
	}
	
	@RequestMapping("/add.do")
	public String add(Ins ins, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ins.setInputDate(new Date());
		ins.setStatus(MsgUtil.Ins_saved_status);
		ins.setUserId(user.getId());
		boolean result = is.addIns(ins);
		if(result) {
			return "redirect:/insController/getInsByPageAndUserId.do?currentPage=1";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/checkEdit.do")
	public ModelAndView checkEdit(int id) {
		ModelAndView mav = new ModelAndView();
		Ins ins = is.getInsById(id);
		mav.addObject("ins", ins);
		mav.setViewName("ins/insEdit");
		return mav;
		
	}
	
	@RequestMapping("/edit.do")
	public String edit(Ins ins) {
		boolean result = is.editIns(ins);
		if(result) {
			return "redirect:/insController/getInsByPageAndUserId.do?currentPage=1";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/checkDelete.do")
	public ModelAndView checkDelete(int id) {
		ModelAndView mav = new ModelAndView();
		Ins ins = is.getInsById(id);
		mav.addObject("ins", ins);
		mav.setViewName("ins/insDelete");
		return mav;
		
	}
	
	@RequestMapping("/delete.do")
	public String delete(int id) {
		boolean result = is.deleteInsById(id);
		if(result) {
			return "redirect:/insController/getInsByPageAndUserId.do?currentPage=1";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping("/submitInsByMember.do")
	public String submitInsByMember(int id) {
		int status = is.getInsStatusById(id);
		boolean result = true;
		if(status != MsgUtil.Ins_accounted_status && status != MsgUtil.Ins_confirmed_status) {
			result = is.submitIns(id, MsgUtil.Ins_submitted_status);
		}
		if(result) {
			return "redirect:/insController/getInsByPageAndUserId.do?currentPage=1";
		}else {
			return "error";
		}
		
	}
	
	
	@RequestMapping("/getInsStats.do")
	public ModelAndView getInsSats() {
		ModelAndView mav = new ModelAndView();
		int saved = is.countByStatus(MsgUtil.Ins_saved_status);
		int submitted = is.countByStatus(MsgUtil.Ins_submitted_status);
		int confirmed = is.countByStatus(MsgUtil.Ins_confirmed_status);
		int accounted = is.countByStatus(MsgUtil.Ins_accounted_status);
		int sum = is.count();
		mav.addObject("saved", saved);
		mav.addObject("submitted", submitted);
		mav.addObject("confirmed", confirmed);
		mav.addObject("accounted", accounted);
		mav.addObject("sum", sum);
		mav.setViewName("stats/insStats");
		return mav;
	}
	

}
