package com.entity;

public class PMenu {

	private String pid;
	private String text;
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public PMenu(String pid, String text) {
		super();
		this.pid = pid;
		this.text = text;
	}
	public PMenu() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "PMenu [pid=" + pid + ", text=" + text + "]";
	}
	
	
	
}
