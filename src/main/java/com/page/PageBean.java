package com.page;

import java.io.Serializable;
import java.util.List;

import com.entity.FreeIns;

public class PageBean implements Serializable{
	private Integer total;
	private List<FreeIns> rows;
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<FreeIns> getRows() {
		return rows;
	}
	public void setRows(List<FreeIns> rows) {
		this.rows = rows;
	}
	public PageBean(Integer total, List<FreeIns> rows) {
		super();
		this.total = total;
		this.rows = rows;
	}
	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "PageBean [total=" + total + ", rows=" + rows + "]";
	}
	
	
	
	
}
