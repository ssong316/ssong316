package com.airbnb.review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.airbnb.db.ConnectionPoolMgr1;

public class ReviewDAO {
	ConnectionPoolMgr1 pool;
		
	public ReviewDAO() {
		pool=ConnectionPoolMgr1.getInstance();
	}
	
	public List<ReviewVO> selectByAmenityNo(int no) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = pool.getConnection();
			String sql = "select b.*,a.name,a.id from acc a join review b on a.accno=b.userno where amenity=? order by regdate desc";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs=ps.executeQuery();
			List<ReviewVO> list = new ArrayList<ReviewVO>();
			while(rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setGrade(rs.getInt(1));
				vo.setContent(rs.getString(2));
				vo.setUserno(rs.getInt(3));
				vo.setCleanGrade(rs.getInt(5));
				vo.setAccuracyGrade(rs.getInt(6));
				vo.setCommunicationGrade(rs.getInt(7));
				vo.setLocationGrade(rs.getInt(8));
				vo.setCheckinGrade(rs.getInt(9));
				vo.setSatisfactionpriceGrade(rs.getInt(10));
				vo.setRegdate(rs.getTimestamp(11));
				vo.setUsername(rs.getString(12));
				vo.setUserid(rs.getString(13));
				list.add(vo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
}
