package com.SemiProj.acc.model;

import java.sql.SQLException;

public class AccService {
	private AccDAO accDao;
	
	public static final int USABLE_ID=1;   	//사용가능한 아이디
	public static final int UNUSABLE_ID=2;  //이미 존재하는 아이디- 사용불가
	public static final int LOGIN_OK=1; 	//로그인 성공
	public static final int PWD_DISAGREE=2; 	//비밀번호 불일치
	public static final int ID_NONE=3; 		//아이디 존재하지 않음
	
	public AccService() {
		accDao = new AccDAO();
	}
	
	public int createNewAcc(AccVO vo) throws SQLException{
	      int cnt=accDao.createNewAcc(vo);
	      return cnt;
	}
	
	public int loginProc(String userid, String pwd) throws SQLException {
		return accDao.loginProc(userid, pwd);
	}
	
	public AccVO selectByUserid(String userid, String pwd) throws SQLException {
		return accDao.selectByUserid(userid, pwd);
	}
}
