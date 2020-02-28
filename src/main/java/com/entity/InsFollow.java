package com.entity;

import java.io.Serializable;

import java.util.Date;
//保险跟踪记录表insFollow(主要存放员工跟客户沟通)
public class InsFollow implements Serializable{

	private Integer id; //主键id
	private Date recordDate; //填写记录表的时间
	private String recordText;//所填写的内容
	private Date nextDate; //下次回访时间
	private Integer insId; //外键,参考保险表id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}
	public String getRecordText() {
		return recordText;
	}
	public void setRecordText(String recordText) {
		this.recordText = recordText;
	}
	public Date getNextDate() {
		return nextDate;
	}
	public void setNextDate(Date nextDate) {
		this.nextDate = nextDate;
	}
	public Integer getInsId() {
		return insId;
	}
	public void setInsId(Integer insId) {
		this.insId = insId;
	}
	public InsFollow(Integer id, Date recordDate, String recordText,
			Date nextDate, Integer insId) {
		super();
		this.id = id;
		this.recordDate = recordDate;
		this.recordText = recordText;
		this.nextDate = nextDate;
		this.insId = insId;
	}
	public InsFollow() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "InsFollow [id=" + id + ", recordDate=" + recordDate
				+ ", recordText=" + recordText + ", nextDate=" + nextDate
				+ ", insId=" + insId + "]";
	}
	
	
	
}
