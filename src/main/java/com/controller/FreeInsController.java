package com.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.FreeIns;
import com.entity.User;
import com.page.FreeInsPageBean;
import com.service.FreeInsService;
import com.util.MsgUtil;

@Controller
@RequestMapping("/freeInsController")
public class FreeInsController {

	@Autowired
	private FreeInsService fis;
	
	@RequestMapping("/getFreeInsByPage.do")
	public ModelAndView getFreeInsByPage(int currentPage) {
		ModelAndView mav = new ModelAndView();
		FreeInsPageBean fipb = new FreeInsPageBean();
		List<FreeIns> freeInsList = fis.getFreeInsByPage(currentPage);
		fipb.setTotalEntries(fis.count());
		fipb.setTotalPages();
		fipb.setFreeInsList(freeInsList);
		fipb.setCurrentPage(currentPage);
		mav.setViewName("freeIns/freeInsContent");
		mav.addObject("pb", fipb);
		return mav;
	}
	
	@RequestMapping("/getFreeInsByPageAndUserId.do")
	public ModelAndView getFreeInsByPageAndUserId(int currentPage, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		FreeInsPageBean fipb = new FreeInsPageBean();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		int userId = user.getId();
		List<FreeIns> freeInsList = fis.getFreeInsByPageAndUserId(currentPage, userId);
		fipb.setTotalEntries(fis.countByUid(user.getId()));
		fipb.setTotalPages();
		fipb.setFreeInsList(freeInsList);
		fipb.setCurrentPage(currentPage);
		mav.setViewName("freeIns/freeInsContent");
		mav.addObject("pb", fipb);
		return mav;
	}
	
	@RequestMapping("/checkDelete.do")
	public ModelAndView checkDelete(int id) {
		
		ModelAndView mav = new ModelAndView();
		FreeIns freeIns = fis.getFreeInsById(id);
		
		
		mav.addObject("freeIns", freeIns);
		mav.setViewName("freeIns/freeInsDelete");
		
		return mav;
	}
	
	@RequestMapping("/delete.do")
	public String delete(int id) {
		System.out.println("============== The deleting id is : " + id + " ==============");
		boolean result = fis.deleteFreeInsById(id);
		if(result) {
			return "redirect:/freeInsController/getFreeInsByPageAndUserId.do?currentPage=1";
		}
		else {
			return "error";
		}
	}
	
	@RequestMapping("/checkEdit.do")
	public ModelAndView checkEdit(int id) {
		
		ModelAndView mav = new ModelAndView();
		FreeIns freeIns = fis.getFreeInsById(id);
		
		
		mav.addObject("freeIns", freeIns);
		mav.setViewName("freeIns/freeInsEdit");
		
		return mav;
	}
	
	@RequestMapping("/edit.do")
	public String edit(FreeIns freeIns) {
		boolean result = fis.editFreeIns(freeIns);
		if(result) {
			return "redirect:/freeInsController/getFreeInsByPageAndUserId.do?currentPage=1";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/add.do")
	public String add(FreeIns freeIns, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		int userId = user.getId();
		freeIns.setUserId(userId);
		freeIns.setInputDate(new Date());
		freeIns.setStatus(MsgUtil.freeIns_saved_status);
		boolean result = fis.addFreeIns(freeIns);
		if(result) {
			return "redirect:/freeInsController/getFreeInsByPageAndUserId.do?currentPage=1";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping("/submitFreeInsByMember.do")
	public String submitFreeInsByMember(int id) {
		int status = fis.getFreeInsStatusById(id);
		boolean result = true;
		if(status != MsgUtil.freeIns_confirmed_status) {
			result = fis.submitFreeIns(id, MsgUtil.freeIns_submitted_status);
		}
		if(result) {
			return "redirect:/freeInsController/getFreeInsByPageAndUserId.do?currentPage=1";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/getFreeInsStatsByUser.do")
	public ModelAndView getFreeInsStatsByUser(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		int uid = user.getId();
		int saved = fis.countFreeInsByUserAndStatus(uid, MsgUtil.freeIns_saved_status);
		int submitted = fis.countFreeInsByUserAndStatus(uid, MsgUtil.freeIns_submitted_status);
		int confirmed = fis.countFreeInsByUserAndStatus(uid, MsgUtil.freeIns_confirmed_status);
		mav.addObject("saved", saved);
		mav.addObject("submitted", submitted);
		mav.addObject("confirmed", confirmed);
		mav.setViewName("freeIns/freeInsStats");
		return mav;
	}
	
	@RequestMapping("/getFreeInsStats.do")
	public ModelAndView getFreeInsStats() {
		ModelAndView mav = new ModelAndView();
		int saved = fis.countFreeInsByStatus( MsgUtil.freeIns_saved_status);
		int submitted = fis.countFreeInsByStatus(MsgUtil.freeIns_submitted_status);
		int confirmed = fis.countFreeInsByStatus(MsgUtil.freeIns_confirmed_status);
		int sum = fis.count();
		mav.addObject("saved", saved);
		mav.addObject("submitted", submitted);
		mav.addObject("confirmed", confirmed);
		mav.addObject("sum", sum);
		mav.setViewName("stats/freeInsStats");
		
		return mav;
	}
}
