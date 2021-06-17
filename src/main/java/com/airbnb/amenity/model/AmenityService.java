package com.airbnb.amenity.model;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;


public class AmenityService {
	private AmenityDAO amenityDao;
	
	public AmenityService(){
		amenityDao = new AmenityDAO();
	}
	public List<AmenityVO> searchAmenity(String cindate,String coutdate,int peopleCnt,String location) throws SQLException{
		return amenityDao.searchAmenity(cindate, coutdate, peopleCnt, location);
	}
	
	public AmenityVO selectByAmenityNo(int amenityNo) throws SQLException {
		return amenityDao.selectByAmentyNo(amenityNo);
	}
}
