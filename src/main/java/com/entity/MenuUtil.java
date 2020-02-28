package com.entity;

import java.io.Serializable;
//菜单工具表menuUtil(主要存放菜单所有页面)
public class MenuUtil implements Serializable{
	
	private Integer id;
	private String menuNum;  //菜单编号
	private String menuText;  //菜单内容
	private String menuUrl;  //菜单路径
	private String PmenuNum;  //上级菜单编号
	private String PmenuText;  //上级菜单内容
	private String remark;  //备注
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMenuNum() {
		return menuNum;
	}
	public void setMenuNum(String menuNum) {
		this.menuNum = menuNum;
	}
	public String getMenuText() {
		return menuText;
	}
	public void setMenuText(String menuText) {
		this.menuText = menuText;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getPmenuNum() {
		return PmenuNum;
	}
	public void setPmenuNum(String pmenuNum) {
		PmenuNum = pmenuNum;
	}
	public String getPmenuText() {
		return PmenuText;
	}
	public void setPmenuText(String pmenuText) {
		PmenuText = pmenuText;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public MenuUtil(Integer id, String menuNum, String menuText,
			String menuUrl, String pmenuNum, String pmenuText, String remark) {
		super();
		this.id = id;
		this.menuNum = menuNum;
		this.menuText = menuText;
		this.menuUrl = menuUrl;
		PmenuNum = pmenuNum;
		PmenuText = pmenuText;
		this.remark = remark;
	}
	public MenuUtil() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MenuUtil [id=" + id + ", menuNum=" + menuNum + ", menuText="
				+ menuText + ", menuUrl=" + menuUrl + ", PmenuNum=" + PmenuNum
				+ ", PmenuText=" + PmenuText + ", remark=" + remark + "]";
	}
	
 
}
