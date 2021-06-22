package com.bnb.wishlist.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.airbnb.db.ConnectionPoolMgr1;

public class wishlistDAO {

	private ConnectionPoolMgr1 pool;
	
	public wishlistDAO() {
		pool = ConnectionPoolMgr1.getInstance();
	}//
	
	public int insertWishList(wishlistVO vo) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			conn = pool.getConnection();
			
			String sql="insert into wishlist(wno, amenityno, name, accno)"
					+ " values(WISH_SEQ.nextval, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getAmenityno());
			ps.setString(2, vo.getName());
			ps.setInt(3, vo.getAccno());
			
			int cnt = ps.executeUpdate();
			
			System.out.println("위시리스트 등록 결과, cnt= " + cnt
					+ ", 매개변수 vo= " + vo);
			
			return cnt;
			
		} finally {
			pool.dbClose(ps, conn);
		}
	}//
	
	public List<wishlistVO> showList() throws SQLException{
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<wishlistVO> list = new ArrayList<wishlistVO>();
		
		try {
		
			conn = pool.getConnection();
			
			String sql="select * from wishlist";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int wno = rs.getInt("wno");
				int amenityno = rs.getInt("amenityno");
				String name = rs.getString("name");
				int accno = rs.getInt("accno");
				
				wishlistVO vo = new wishlistVO(wno, amenityno, name, accno);
				
				list.add(vo);
			}
			
			System.out.println("조회결과 list.size() = " + list.size());
			
			return list;
			
		} finally {
			pool.dbClose(rs, ps, conn);
		}
	}//
	
}
