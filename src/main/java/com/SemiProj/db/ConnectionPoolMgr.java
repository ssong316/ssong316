package com.SemiProj.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPoolMgr {
	DataSource ds;

	public ConnectionPoolMgr() {
		Context ctx;

		try {
			ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracledb");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	//Connection객체 대여
	public Connection getConnection() throws SQLException {
		Connection conn = ds.getConnection();
		//=> Connection Pool 에서 Connection을 빌려온다
		System.out.println("db연결 여부, conn="+conn);

		return conn;
	}

	//Connection객체 반납
	public void dbClose(PreparedStatement ps, Connection conn) throws SQLException {
		if(ps!=null) ps.close();
		if(conn!=null) conn.close();		
	}

	public void dbClose(ResultSet rs,PreparedStatement ps, Connection conn) throws SQLException {
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(conn!=null) conn.close();		
	}
}
