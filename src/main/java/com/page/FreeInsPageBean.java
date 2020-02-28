package com.page;

import java.io.Serializable;
import java.util.List;

import com.entity.FreeIns;

public class FreeInsPageBean implements Serializable{

	private static final int size = 4;
	private int totalEntries;
	private int totalPages;
	private int currentPage;
	private List<FreeIns> freeInsList;
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
	public List<FreeIns> getFreeInsList() {
		return freeInsList;
	}
	public void setFreeInsList(List<FreeIns> freeInsList) {
		this.freeInsList = freeInsList;
	}
	public static int getSize() {
		return size;
	}
	public FreeInsPageBean(int totalEntries, int totalPages, int currentPage, List<FreeIns> freeInsList) {
		super();
		this.totalEntries = totalEntries;
		this.totalPages = totalPages;
		this.currentPage = currentPage;
		this.freeInsList = freeInsList;
	}
	public FreeInsPageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "FreeInsPageBean [totalEntries=" + totalEntries + ", totalPages=" + totalPages + ", currentPage="
				+ currentPage + ", freeInsList=" + freeInsList + "]";
	}
	

}
