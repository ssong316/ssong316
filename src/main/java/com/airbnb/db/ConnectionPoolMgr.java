package com.airbnb.db;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionPoolMgr {
	public ConnectionPoolMgr() {
		
		
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	}
	
	public Connection getConnection(String url,String uid,String upwd) throws SQLException {
		Connection conn = DriverManager.getConnection(url,uid,upwd);
		System.out.println("db conn="+conn);
		return conn;
	}
	
	public Connection getConnection(String uid,String upwd) throws SQLException {
		String url="jdbc:oracle:thin:@DESKTOP-PJ03E7Q:1521:xe";
		
		Connection conn = getConnection(url,uid,upwd);
		return conn;
	}
	public Connection getConnection() throws SQLException {
		String url="jdbc:oracle:thin:@DESKTOP-PJ03E7Q:1521:xe";
		String uid = "bnb", upwd="bnb123";
		
		Connection conn = getConnection(url,uid,upwd);
		return conn;
	}
	
	public void dbClose(PreparedStatement ps,Connection conn) throws SQLException {
		if(ps!=null) 
			ps.close();
		if(conn!=null) conn.close();
	}
	
	public void dbClose(ResultSet rs,PreparedStatement ps,Connection conn) throws SQLException {
		if(rs!=null) rs.close();
		if(ps!=null) 
			ps.close();
		if(conn!=null) conn.close();
	}
}
