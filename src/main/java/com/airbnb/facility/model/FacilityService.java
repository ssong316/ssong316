package com.airbnb.facility.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FacilityService {
	private FacilityDao dao;
	
	public FacilityService() {
		dao=new FacilityDao();
	}

	public FacilityVo selectFacilityByAmenityNo(int amenityNo) throws SQLException {
		return dao.selectFacilityByAmenityNo(amenityNo);
	}
}
