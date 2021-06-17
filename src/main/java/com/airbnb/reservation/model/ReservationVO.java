package com.airbnb.reservation.model;

import java.sql.Timestamp;

public class ReservationVO {
	private int reservationNo;
	private int adultCount;
	private int childCount;
	private int userNo;
	private int amenityNo;
	private int payment;
	private Timestamp startdate;
	private Timestamp enddate;
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public int getAdultCount() {
		return adultCount;
	}
	public void setAdultCount(int adultCount) {
		this.adultCount = adultCount;
	}
	public int getChildCount() {
		return childCount;
	}
	public void setChildCount(int childCount) {
		this.childCount = childCount;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getAmenityNo() {
		return amenityNo;
	}
	public void setAmenityNo(int amenityNo) {
		this.amenityNo = amenityNo;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public Timestamp getStartdate() {
		return startdate;
	}
	public void setStartdate(Timestamp startdate) {
		this.startdate = startdate;
	}
	public Timestamp getEnddate() {
		return enddate;
	}
	public void setEnddate(Timestamp enddate) {
		this.enddate = enddate;
	}
	@Override
	public String toString() {
		return "ReservationVO [reservationNo=" + reservationNo + ", adultCount=" + adultCount + ", childCount="
				+ childCount + ", userNo=" + userNo + ", amenityNo=" + amenityNo + ", payment=" + payment
				+ ", startdate=" + startdate + ", enddate=" + enddate + "]";
	}
	public ReservationVO(int reservationNo, int adultCount, int childCount, int userNo, int amenityNo, int payment,
			Timestamp startdate, Timestamp enddate) {
		super();
		this.reservationNo = reservationNo;
		this.adultCount = adultCount;
		this.childCount = childCount;
		this.userNo = userNo;
		this.amenityNo = amenityNo;
		this.payment = payment;
		this.startdate = startdate;
		this.enddate = enddate;
	}
	public ReservationVO() {
		super();
	}
	
}
