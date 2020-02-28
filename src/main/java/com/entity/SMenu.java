package com.entity;

public class SMenu {

	private String sid;
	private String text;
	private String url;
	private String pid;
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public SMenu(String sid, String text, String url, String pid) {
		super();
		this.sid = sid;
		this.text = text;
		this.url = url;
		this.pid = pid;
	}
	public SMenu() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "SMenu [sid=" + sid + ", text=" + text + ", url=" + url + ", pid=" + pid + "]";
	}
	
	
	
}
