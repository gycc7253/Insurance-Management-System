package com.page;

import java.io.Serializable;
import java.util.List;

import com.entity.User;

public class UserPageBean implements Serializable{

	private static final int size = 4;
	private int totalEntries;
	private int totalPages;
	private int currentPage;
	private List<User> userList;
	public int getTotalEntries() {
		return totalEntries;
	}
	public void setTotalEntries(int totalEntries) {
		this.totalEntries = totalEntries;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public static int getSize() {
		return size;
	}
	public UserPageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserPageBean(int totalEntries, int totalPages, int currentPage, List<User> userList) {
		super();
		this.totalEntries = totalEntries;
		this.totalPages = totalPages;
		this.currentPage = currentPage;
		this.userList = userList;
	}
	@Override
	public String toString() {
		return "UserPageBean [totalEntries=" + totalEntries + ", totalPages=" + totalPages + ", currentPage="
				+ currentPage + "]";
	}
	
	
}
