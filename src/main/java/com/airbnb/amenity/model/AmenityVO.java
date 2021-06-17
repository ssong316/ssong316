package com.airbnb.amenity.model;

import java.sql.Timestamp;

public class AmenityVO {
	private int amenityNo;
	private int price;
	private String location;
	private Timestamp enddate;
	private int remain;
	private String content;
	private Timestamp startdate;
	private double lat;
	private double lng;
	private String image;
	private int hostno;
	private String title;
	
	public AmenityVO(int amenityNo, int price, String location, Timestamp enddate, int remain, String content,
			Timestamp startdate, double lat, double lng, String image, int hostno, String title) {
		super();
		this.amenityNo = amenityNo;
		this.price = price;
		this.location = location;
		this.enddate = enddate;
		this.remain = remain;
		this.content = content;
		this.startdate = startdate;
		this.lat = lat;
		this.lng = lng;
		this.image = image;
		this.hostno = hostno;
		this.title = title;
	}
	@Override
	public String toString() {
		return "AmenityVO [amenityNo=" + amenityNo + ", price=" + price + ", location=" + location + ", enddate="
				+ enddate + ", remain=" + remain + ", content=" + content + ", startdate=" + startdate + ", lat=" + lat
				+ ", lng=" + lng + ", image=" + image + ", hostno=" + hostno + ", title=" + title + "]";
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
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
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public int getHostno() {
		return hostno;
	}
	public void setHostno(int hostno) {
		this.hostno = hostno;
	}
	
	
	
}
