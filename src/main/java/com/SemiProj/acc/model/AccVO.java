package com.SemiProj.acc.model;

public class AccVO {
	private int accNo;
	private String name;
	private String id;
	private String pwd;
	private int age;
	private String address;
	private String email;
	private String pn;
	private int point;
	
	public AccVO() {
	
	}
	public AccVO(int accNo, String name, String id, String pwd, int age, String address, String email, String pn,
			int point) {
		super();
		this.accNo = accNo;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.age = age;
		this.address = address;
		this.email = email;
		this.pn = pn;
		this.point = point;
	}
	public int getAccNo() {
		return accNo;
	}
	public void setAccNo(int accNo) {
		this.accNo = accNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPn() {
		return pn;
	}
	public void setPn(String pn) {
		this.pn = pn;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "AccVO [accNo=" + accNo + ", name=" + name + ", id=" + id + ", pwd=" + pwd + ", age=" + age
				+ ", address=" + address + ", email=" + email + ", pn=" + pn + ", point=" + point + "]";
	}
	
}
