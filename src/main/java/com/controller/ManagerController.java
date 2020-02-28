package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.FreeIns;
import com.entity.Ins;
import com.entity.User;
import com.page.FreeInsPageBean;
import com.page.InsPageBean;
import com.service.FreeInsService;
import com.service.InsService;
import com.util.MsgUtil;

@Controller
@RequestMapping("/managerController")
public class ManagerController {
	
	@Autowired
	private FreeInsService fis;
	
	@Autowired
	private InsService is;

	@RequestMapping("/getFreeInsByPageAndStatus.do")
	public ModelAndView getFreeInsByPageAndStatus(int currentPage) {
		ModelAndView mav = new ModelAndView();
		FreeInsPageBean fipb = new FreeInsPageBean();
		fipb.setCurrentPage(currentPage);
		int totalEntries = fis.countByStatus(MsgUtil.freeIns_submitted_status);
		fipb.setTotalEntries(totalEntries);
		fipb.setTotalPages();
		List<FreeIns> freeInsList = fis.getFreeInsByPageAndStatus(currentPage, MsgUtil.freeIns_submitted_status);
		fipb.setFreeInsList(freeInsList);
		mav.addObject("pb", fipb);
		mav.setViewName("manager/freeInsConfirm");
		
		return mav;
		
	}
	
	@RequestMapping("/rejectFreeInsByManager.do")
	public String rejectFreeInsByManager(int id) {
		boolean result = fis.submitFreeIns(id, MsgUtil.freeIns_saved_status);
		if(result) {
			return "redirect:/managerController/getFreeInsByPageAndStatus.do?currentPage=1";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping("/submitFreeInsByManager.do")
	public String submitFreeInsByManager(int id) {
		boolean result = fis.submitFreeIns(id, MsgUtil.freeIns_confirmed_status);
		if(result) {
			return "redirect:/managerController/getFreeInsByPageAndStatus.do?currentPage=1";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/getInsByPageAndStatus.do")
	public ModelAndView getInsByPageAndStatus(int currentPage) {
		ModelAndView mav = new ModelAndView();
		List<Ins> insList = is.getInsByPageAndStatus(currentPage, MsgUtil.Ins_submitted_status);
		int totalEntries = is.countByStatus(MsgUtil.Ins_submitted_status);
		InsPageBean ipb = new InsPageBean();
		ipb.setTotalEntries(totalEntries);
		ipb.setInsList(insList);
		ipb.setTotalPages();
		ipb.setCurrentPage(currentPage);
		mav.addObject("pb", ipb);
		mav.setViewName("manager/insConfirm");
		return mav;
	}
	
	@RequestMapping("/submitInsByManager.do")
	public String submitInsByManager(int id) {
		boolean result = is.submitIns(id, MsgUtil.Ins_confirmed_status);
		if(result) {
			return "redirect:/managerController/getInsByPageAndStatus.do?currentPage=1";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping("/rejectInsByManager.do")
	public String rejectInsByManager(int id) {
		boolean result = is.submitIns(id, MsgUtil.Ins_saved_status);
		if(result) {
			return "redirect:/managerController/getInsByPageAndStatus.do?currentPage=1";
		}else {
			return "error";
		}
		
	}
}
