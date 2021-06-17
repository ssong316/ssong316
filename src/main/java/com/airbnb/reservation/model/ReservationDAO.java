package com.airbnb.reservation.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.airbnb.db.ConnectionPoolMgr1;

public class ReservationDAO {
	ConnectionPoolMgr1 pool;
	
	public ReservationDAO() {
		pool=ConnectionPoolMgr1.getInstance();
	}
	
	public List<ReservationVO> selectByAmenityNo(int amenityNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn=pool.getConnection();
			String sql = "select startdate,enddate from reservation where amenityno=?";
			ps= conn.prepareStatement(sql);
			ps.setInt(1, amenityNo);
			rs= ps.executeQuery();
			List<ReservationVO> list = new ArrayList<ReservationVO>();
			while(rs.next()) {
				ReservationVO vo = new ReservationVO();
				vo.setStartdate(rs.getTimestamp(1));
				vo.setEnddate(rs.getTimestamp(2));
				list.add(vo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps,conn);
			
		}
	}
	
	
	
}
