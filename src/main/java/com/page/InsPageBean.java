package com.page;

import java.io.Serializable;
import java.util.List;

import com.entity.Ins;

public class InsPageBean implements Serializable{

	private static final int size = 4;
	private int totalEntries;
	private int totalPages;
	private int currentPage;
	private List<Ins> InsList;
	public int getTotalEntries() {
		return totalEntries;
	}
	public void setTotalEntries(int totalEntries) {
		this.totalEntries = totalEntries;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages() {
		this.totalPages = (totalEntries%size == 0)? (totalEntries/size):(totalEntries/size + 1);
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public List<Ins> getInsList() {
		return InsList;
	}
	public void setInsList(List<Ins> insList) {
		InsList = insList;
	}
	public static int getSize() {
		return size;
	}
	public InsPageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InsPageBean(int totalEntries, int totalPages, int currentPage, List<Ins> insList) {
		super();
		this.totalEntries = totalEntries;
		this.totalPages = totalPages;
		this.currentPage = currentPage;
		InsList = insList;
	}
	@Override
	public String toString() {
		return "InsPageBean [totalEntries=" + totalEntries + ", totalPages=" + totalPages + ", currentPage="
				+ currentPage + ", InsList=" + InsList + "]";
	}

}
