package bnb.answer.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import bnb.db.ConnectionPoolMgr1;

public class AnswerDAO {

	private ConnectionPoolMgr1 pool;
	
	public AnswerDAO() {
		pool = ConnectionPoolMgr1.getInstance();
	} 
	
	public int insertAnswer(AnswerVO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
		
			conn = pool.getConnection();
			
			String sql="insert into answer(no, name, title, content)"
					+ " values(ANSWER_SEQ.nextval, ?, ?, ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getContent());
			
			int cnt = ps.executeUpdate();
			
			System.out.println("답변 등록 결과, cnt=" + cnt + ", 매개변수 vo=" + vo);
			
			return cnt;
			
		}finally {
			pool.dbClose(ps, conn);
		}
	}//
	
	public List<AnswerVO> showAll() throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<AnswerVO> list = new ArrayList<AnswerVO>();
		try {
			conn = pool.getConnection();
			
			String sql="select * from answer order by no desc";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String title = rs.getString("title");
				Timestamp regdate = rs.getTimestamp("regdate");
				String content = rs.getString("content");
				
				AnswerVO vo = new AnswerVO(no, name, title, regdate, content);
				
				list.add(vo);
			}
			
			System.out.println("답변 조회 완료!");
			
			return list;
			
		} finally {
			pool.dbClose(rs, ps, conn);
		}
	}//
	
	public AnswerVO selectByNo(int no) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		AnswerVO vo = new AnswerVO();
		
		try {
			conn = pool.getConnection();
			
			String sql="select * from answer where no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				vo.setNo(no);
				vo.setName(rs.getString("name"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				
			}
			
			System.out.println("조회완료! 매개변수 no = " + no);
			
			return vo;
		
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
}
