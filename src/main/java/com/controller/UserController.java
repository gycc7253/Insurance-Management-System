package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.entity.MenuUtil;
import com.entity.PMenu;
import com.entity.SMenu;
import com.entity.User;
import com.service.MenuUtilService;
import com.service.NavService;
import com.service.UserService;
import com.util.MsgUtil;

@Controller
@RequestMapping("/userController")
public class UserController {
	
	@Autowired
	private UserService us;
	
	@Autowired
	private NavService ns;
	
	@Autowired
	private MenuUtilService mus;

	@RequestMapping("/login.do")
	public String login(String userName, String pwd, HttpServletRequest request) {
		User user = us.login(userName, pwd);
		HttpSession session = request.getSession();
		if(user!=null) {
			int rid = user.getRid();
			List<PMenu> pMenuList = ns.getPMenuList(rid);
			List<SMenu> sMenuList = ns.getSMenuList(rid);
			List<MenuUtil> menuUtilList = mus.getAllMenuUtil();
			
			session.setAttribute("user", user);
			session.setAttribute("pMenuList", pMenuList);
			session.setAttribute("sMenuList", sMenuList);
			session.setAttribute("menuUtilList", menuUtilList);
			return "redirect:/main.jsp";
		}
		else {
			return "error";
		}
		
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/index.jsp";
		
	}
	
	@RequestMapping("/updatePwd.do")
	public String updatePwd(String newPwd, HttpServletRequest request) {

		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		int id = user.getId();
		boolean result = us.updatePwd(id, newPwd);
		if(result) {
			session.invalidate();
			return "redirect:/index.jsp";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/getAllUsers.do")
	public ModelAndView getAllUsers() {
		ModelAndView mav = new ModelAndView();
		List<User> userList = us.getAllUsers();
		mav.addObject("userList", userList);
		mav.setViewName("user/userContent");
		
		return mav;
	}
	
	@RequestMapping("/addUser.do")
	public ModelAndView addUser(User user) {
		ModelAndView mav = new ModelAndView();
		user.setPwd(MsgUtil.user_init_pwd);
		user.setLevel(1);
		user.setIsdel(MsgUtil.user_work_status);
		boolean result = us.addUser(user);
		if(result) {
			mav.setViewName("redirect:/userController/getAllUsers.do");
		}else {
			mav.setViewName("error");
		}
		return mav;
	}
	
	@RequestMapping("/checkDelete.do")
	public ModelAndView checkDelete(int id) {
		ModelAndView mav = new ModelAndView();
		User user = us.getUserById(id);
		
		mav.setViewName("user/userDelete");
		mav.addObject("tUser", user);
		
		return mav;
	}
	
	@RequestMapping("/checkEdit.do")
	public ModelAndView checkEdit(int id) {
		ModelAndView mav = new ModelAndView();
		User user = us.getUserById(id);
		
		mav.setViewName("user/userEdit");
		mav.addObject("tUser", user);
		return mav;
	}
	
	@RequestMapping("/deleteUser.do")
	public String deleteUser(int id) {
		
		boolean result = us.deleteUserById(id);
		if(result) {
			return "redirect:/userController/getAllUsers.do";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/editUser.do")
	public String editUser(User user) {
		
		boolean result = us.editUser(user);
		if(result) {
			return "redirect:/userController/getAllUsers.do";
		}else {
			return "error";
		}
	}
}
