package com.bnb.wishlist.model;

public class wishlistVO {

	private int wno;
	private int amenityno;
	private String name;
	private int accno;
	
	public wishlistVO() {
		super();
	}

	public wishlistVO(int wno, int amenityno, String name, int accno) {
		super();
		this.wno = wno;
		this.amenityno = amenityno;
		this.name = name;
		this.accno = accno;
	}

	public int getWno() {
		return wno;
	}

	public void setWno(int wno) {
		this.wno = wno;
	}

	public int getAmenityno() {
		return amenityno;
	}

	public void setAmenityno(int amenityno) {
		this.amenityno = amenityno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAccno() {
		return accno;
	}

	public void setAccno(int accno) {
		this.accno = accno;
	}

	@Override
	public String toString() {
		return "wishlistVO [wno=" + wno + ", amenityno=" + amenityno + ", name=" + name + ", accno=" + accno + "]";
	}
	
}
