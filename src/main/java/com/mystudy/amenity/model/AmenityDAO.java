package com.mystudy.amenity.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.mystudy.db.ConnectionPoolMgr1;

public class AmenityDAO {
	private ConnectionPoolMgr1 pool;
	
	AmenityDAO(){
		pool=ConnectionPoolMgr1.getInstance();
	}
	
	public List<AmenityVO> searchAmenity(String cindate,String coutdate,int peopleCnt,String location) throws SQLException{
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

	     List<AmenityVO> list = new ArrayList<AmenityVO>();
	     try {
	         //1,2
	         conn=pool.getConnection();

	         //3
	         String sql="select * from amenity where ?>=startdate and ?<=enddate and location like '%' || ? || '%' and ?<=remain";

	         ps=conn.prepareStatement(sql);
	         ps.setString(1, cindate);
	         ps.setString(2, coutdate);
	         ps.setString(3, location);
	         ps.setInt(4, peopleCnt);
	         
	         //4
	         rs=ps.executeQuery();
	         
	         while(rs.next()) {
	        	 AmenityVO vo = new AmenityVO();
	        	 vo.setAmenityNo(rs.getInt(1));
	        	 vo.setPrice(rs.getInt(2));
	        	 vo.setLocation(rs.getString(3));
	        	 vo.setEnddate(rs.getTimestamp(4));
	        	 vo.setRemain(rs.getInt(5));
	        	 vo.setContent(rs.getString(6));
	        	 vo.setStartdate(rs.getTimestamp(7));
	        	 list.add(vo);
	         }
	         
	         return list;
		}finally {
			pool.dbClose(rs, ps,conn);
		}
	}
}
