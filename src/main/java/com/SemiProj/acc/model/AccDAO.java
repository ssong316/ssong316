package com.SemiProj.acc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.SemiProj.db.ConnectionPoolMgr;

public class AccDAO {
	private ConnectionPoolMgr pool;

	public AccDAO() {
		pool = new ConnectionPoolMgr();
	}

	public int createNewAcc(AccVO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = pool.getConnection();
			String sql = "insert into acc(accNo, name, id, pwd, age, address, email, pn)"
					+ " values(acc_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getId());
			ps.setString(3, vo.getPwd());
			ps.setInt(4, vo.getAge());
			ps.setString(5, vo.getAddress());
			ps.setString(6, vo.getEmail());
			ps.setString(7, vo.getPn());

			int result = ps.executeUpdate();
			System.out.println("회원가입 결과 result="+result+", 매개변수 vo="+vo);

			return result;
		}finally {
			pool.dbClose(null, ps, conn);
		}
	}

	public int loginProc(String id, String pwd) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = pool.getConnection();
			String sql = "select pwd from acc where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			int result = 0;

			if(rs.next()) {
				String dbPwd = rs.getString(1);
				result = dbPwd.equals(pwd)?AccService.LOGIN_OK:AccService.PWD_DISAGREE;
			}else {
				result = AccService.ID_NONE;
			}

			System.out.println("로그인 조회 결과, result="+result+"매개변수 id="+id+", pwd="+pwd);

			return result;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
	public AccVO selectByUserid(String id, String pwd) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = pool.getConnection();
			String sql =  "select * from acc where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			AccVO vo = new AccVO();
			if(rs.next()) {
				vo.setAccNo(Integer.parseInt(rs.getString("accno")));
				vo.setName(rs.getString("name"));
				vo.setPwd(rs.getString("pwd"));
				vo.setEmail(rs.getString("email"));
				vo.setPn(rs.getString("pn"));
				vo.setAddress(rs.getString("address"));
				vo.setAge(Integer.parseInt(rs.getString("age")));
				vo.setPoint(Integer.parseInt(rs.getString("point")==null?"0":rs.getString("point")));
			}
			return vo;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}

}
