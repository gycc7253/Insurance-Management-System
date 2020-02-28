package com.entity;

import java.io.Serializable;
import java.util.Date;

//免险表freeIns(主要存放要到的客户信息)
public class FreeIns implements Serializable {
	private Integer id;
	private String customName;//客户姓名
	private String customSex;//客户性别
	private Integer customAge;//客户年龄
	private String addr;//客户地址
	private String phone;//客户电话
	private Integer status;//状态
	private Integer userId;//参考员工表id
	private Date inputDate;//录入时间
	private String remark;//备注
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCustomName() {
		return customName;
	}
	public void setCustomName(String customName) {
		this.customName = customName;
	}
	public String getCustomSex() {
		return customSex;
	}
	public void setCustomSex(String customSex) {
		this.customSex = customSex;
	}
	public Integer getCustomAge() {
		return customAge;
	}
	public void setCustomAge(Integer customAge) {
		this.customAge = customAge;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Date getInputDate() {
		return inputDate;
	}
	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public FreeIns(Integer id, String customName, String customSex,
			Integer customAge, String addr, String phone, Integer status,
			Integer userId, Date inputDate, String remark) {
		super();
		this.id = id;
		this.customName = customName;
		this.customSex = customSex;
		this.customAge = customAge;
		this.addr = addr;
		this.phone = phone;
		this.status = status;
		this.userId = userId;
		this.inputDate = inputDate;
		this.remark = remark;
	}
	public FreeIns() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "FreeIns [id=" + id + ", customName=" + customName
				+ ", customSex=" + customSex + ", customAge=" + customAge
				+ ", addr=" + addr + ", phone=" + phone + ", status=" + status
				+ ", userId=" + userId + ", inputDate=" + inputDate
				+ ", remark=" + remark + "]";
	}
	
}
