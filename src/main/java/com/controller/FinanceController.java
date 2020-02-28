package com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Ins;
import com.page.InsPageBean;
import com.service.InsService;
import com.util.MsgUtil;

@Controller
@RequestMapping("/financeController")
public class FinanceController {

	@Autowired
	private InsService is;

		
	@RequestMapping("/getInsByPageAndStatus.do")
	public ModelAndView getInsByPageAndStatus(int currentPage) {
		ModelAndView mav = new ModelAndView();
		List<Ins> insList = is.getInsByFinance(currentPage);
		int totalEntries1 = is.countByStatus(MsgUtil.Ins_confirmed_status);
		int totalEntries2 = is.countByStatus(MsgUtil.Ins_accounted_status);
		int totalEntries = totalEntries1 + totalEntries2;
		InsPageBean ipb = new InsPageBean();
		ipb.setTotalEntries(totalEntries);
		ipb.setInsList(insList);
		ipb.setTotalPages();
		ipb.setCurrentPage(currentPage);
		mav.addObject("pb", ipb);
		mav.setViewName("finance/insAccount");
		return mav;
	}
	
	@RequestMapping("/submitInsByFinance.do")
	public String submitInsByFinance(int id) {
		boolean result = is.submitIns(id, MsgUtil.Ins_accounted_status);
		if(result) {
			return "redirect:/financeController/getInsByPageAndStatus.do?currentPage=1";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping("/rejectInsByFinance.do")
	public String rejectInsByFinance(int id) {
		boolean result = is.submitIns(id, MsgUtil.Ins_confirmed_status);
		if(result) {
			return "redirect:/financeController/getInsByPageAndStatus.do?currentPage=1";
		}else {
			return "error";
		}
		
	}
}
