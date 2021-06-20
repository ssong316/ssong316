package com.airbnb.facility.model;

public class FacilityVo {
	private int kitchen;
	private int wifi;
	private int parking;
	private int animal;
	private int tv;
	private int hairdryer;
	private int airconditioner;
	private int amenityNo;
	private int bedroomCount;
	private int bedCount;
	private int bathroomCount;
	public FacilityVo() {
		
	}
	
	public FacilityVo(int kitchen, int wifi, int parking, int animal, int tv, int hairdryer, int airconditioner,
			int amenityNo, int bedroomCount, int bedCount, int bathroomCount) {
		super();
		this.kitchen = kitchen;
		this.wifi = wifi;
		this.parking = parking;
		this.animal = animal;
		this.tv = tv;
		this.hairdryer = hairdryer;
		this.airconditioner = airconditioner;
		this.amenityNo = amenityNo;
		this.bedroomCount = bedroomCount;
		this.bedCount = bedCount;
		this.bathroomCount = bathroomCount;
	}
	@Override
	public String toString() {
		return "FacilityVo [kitchen=" + kitchen + ", wifi=" + wifi + ", parking=" + parking + ", animal=" + animal
				+ ", tv=" + tv + ", hairdryer=" + hairdryer + ", airconditioner=" + airconditioner + ", amenityNo="
				+ amenityNo + ", bedroomCount=" + bedroomCount + ", bedCount=" + bedCount + ", bathroomCount="
				+ bathroomCount + "]";
	}
	public int getBedroomCount() {
		return bedroomCount;
	}
	public void setBedroomCount(int bedroomCount) {
		this.bedroomCount = bedroomCount;
	}
	public int getBedCount() {
		return bedCount;
	}
	public void setBedCount(int bedCount) {
		this.bedCount = bedCount;
	}
	public int getBathroomCount() {
		return bathroomCount;
	}
	public void setBathroomCount(int bathroomCount) {
		this.bathroomCount = bathroomCount;
	}
	public int getKitchen() {
		return kitchen;
	}
	public void setKitchen(int kitchen) {
		this.kitchen = kitchen;
	}
	public int getWifi() {
		return wifi;
	}
	public void setWifi(int wifi) {
		this.wifi = wifi;
	}
	public int getParking() {
		return parking;
	}
	public void setParking(int parking) {
		this.parking = parking;
	}
	public int getAnimal() {
		return animal;
	}
	public void setAnimal(int animal) {
		this.animal = animal;
	}
	public int getTv() {
		return tv;
	}
	public void setTv(int tv) {
		this.tv = tv;
	}
	public int getHairdryer() {
		return hairdryer;
	}
	public void setHairdryer(int hairdryer) {
		this.hairdryer = hairdryer;
	}
	public int getAirconditioner() {
		return airconditioner;
	}
	public void setAirconditioner(int airconditioner) {
		this.airconditioner = airconditioner;
	}
	public int getAmenityNo() {
		return amenityNo;
	}
	public void setAmenityNo(int amenityNo) {
		this.amenityNo = amenityNo;
	}
}
