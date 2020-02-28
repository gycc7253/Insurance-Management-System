package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MsgUtil {
	
	
	/**
	 * 免险状态信息
	 */
	public  final static Integer freeIns_saved_status=1;//免险保存状态
	
	public  final static Integer freeIns_submitted_status=2;//免险提交经理
	
	public  final static Integer freeIns_confirmed_status=3;//免险确认
	
	/**
	 * 保险状态信息
	 */
	public  final static Integer Ins_saved_status=1;//免险保存状态
	
	public  final static Integer Ins_submitted_status=2;//免险提交经理
	
	public  final static Integer Ins_confirmed_status=3;//免险确认

	public  final static Integer Ins_accounted_status=4;//免险确认
	

	/**
	 * 员工状态
	 */
	public  final static Integer user_work_status=1;//在职

	public  final static Integer user_unwork_status=0;//离职
	
	/**
	 * 初始密码
	 */
	public  final static String user_init_pwd="123456";
	
	/**
	 * 菜单文件长度
	 */
	public  final static Integer menu_file_length=5;
	
	
	
}
