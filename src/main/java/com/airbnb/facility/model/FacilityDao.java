package com.airbnb.facility.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.airbnb.db.ConnectionPoolMgr1;

public class FacilityDao {
	private ConnectionPoolMgr1 pool;
	
	public FacilityDao() {
		pool=ConnectionPoolMgr1.getInstance();
	}
	
	public FacilityVo selectFacilityByAmenityNo(int amenityNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = pool.getConnection();
			String sql = "select * from facility where amenityno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, amenityNo);
			rs = ps.executeQuery();
			FacilityVo vo = new FacilityVo();
			while(rs.next()) {
				vo.setKitchen(rs.getInt(1));
				vo.setWifi(rs.getInt(2));
				vo.setParking(rs.getInt(3));
				vo.setAnimal(rs.getInt(4));
				vo.setTv(rs.getInt(5));
				vo.setHairdryer(rs.getInt(6));
				vo.setAirconditioner(rs.getInt(7));
				vo.setBedroomCount(rs.getInt(8));
				vo.setBedCount(rs.getInt(9));
				vo.setBathroomCount(rs.getInt(10));
				vo.setAmenityNo(rs.getInt(11));
			}
			return vo;
		}finally {
			pool.dbClose(rs, ps, conn);
			
		}
	}
	
}
