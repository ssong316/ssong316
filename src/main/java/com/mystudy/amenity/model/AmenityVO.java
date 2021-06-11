package com.mystudy.amenity.model;

import java.sql.Timestamp;

public class AmenityVO {
	private int amenityNo;
	private int price;
	private String location;
	private Timestamp enddate;
	private int remain;
	private String content;
	private Timestamp startdate;
	
	public AmenityVO() {
		
	}
	public int getAmenityNo() {
		return amenityNo;
	}
	public void setAmenityNo(int amenityNo) {
		this.amenityNo = amenityNo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Timestamp getEnddate() {
		return enddate;
	}
	public void setEnddate(Timestamp enddate) {
		this.enddate = enddate;
	}
	public int getRemain() {
		return remain;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getStartdate() {
		return startdate;
	}
	public void setStartdate(Timestamp startdate) {
		this.startdate = startdate;
	}
	@Override
	public String toString() {
		return "AmenityVO [amenityNo=" + amenityNo + ", price=" + price + ", location=" + location + ", enddate="
				+ enddate + ", remain=" + remain + ", content=" + content + ", startdate=" + startdate + "]";
	}
	public AmenityVO(int amenityNo, int price, String location, Timestamp enddate, int remain, String content,
			Timestamp startdate) {
		super();
		this.amenityNo = amenityNo;
		this.price = price;
		this.location = location;
		this.enddate = enddate;
		this.remain = remain;
		this.content = content;
		this.startdate = startdate;
	}
	
	
}
