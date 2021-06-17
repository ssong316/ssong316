package com.airbnb.amenity.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.airbnb.db.ConnectionPoolMgr1;

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
	        	 vo.setLat(rs.getDouble(8));
	        	 vo.setLng(rs.getDouble(9));
	        	 vo.setImage(rs.getString(10));
	        	 vo.setHostno(rs.getInt(11));
	        	 vo.setTitle(rs.getString(12));
	        	 
	        	 list.add(vo);
	         }
	         
	         return list;
		}finally {
			pool.dbClose(rs, ps,conn);
		}
	}
	public AmenityVO selectByAmentyNo(int amenityNo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		try {
			conn = pool.getConnection();
			String sql = "select * from amenity where amenityno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, amenityNo);
			
			rs = ps.executeQuery();
			AmenityVO vo = new AmenityVO();
			while(rs.next()) {
				 vo.setAmenityNo(rs.getInt(1));
		    	 vo.setPrice(rs.getInt(2));
		    	 vo.setLocation(rs.getString(3));
		    	 vo.setEnddate(rs.getTimestamp(4));
		    	 vo.setRemain(rs.getInt(5));
		    	 vo.setContent(rs.getString(6));
		    	 vo.setStartdate(rs.getTimestamp(7));
		    	 vo.setLat(rs.getDouble(8));
		    	 vo.setLng(rs.getDouble(9));
		    	 vo.setImage(rs.getString(10));
		    	 vo.setHostno(rs.getInt(11));
		    	 vo.setTitle(rs.getString(12));
			}
			return vo;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
}
