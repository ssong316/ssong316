package bnb.question.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import bnb.db.ConnectionPoolMgr1;

public class QusetionDAO {
	
	private ConnectionPoolMgr1 pool;
	
	public QusetionDAO() {
		pool = ConnectionPoolMgr1.getInstance();
	}
	
	public int insertQuestion(QuestionVO vo) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			conn = pool.getConnection();
			
			String sql="insert into question(no, name, title, content, fileName,"
					+ " fileSize, originalFileName)"
					+ " values(QUESTION_SEQ.nextval, ?, ?, ?, ?, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getFileName());
			ps.setLong(5, vo.getFileSize());
			ps.setString(6, vo.getOriginalFileName());
			 
			int cnt = ps.executeUpdate();
			
			System.out.println("문의글쓰기 결과, cnt = " +cnt + ", 매개변수 vo= " + vo);
			
			return cnt;
			
		}finally {
			pool.dbClose(ps, conn);
		}
	}//
	
	public List<QuestionVO> selectAll() throws SQLException{
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<QuestionVO> list = new ArrayList<QuestionVO>();
		try {
			
			conn = pool.getConnection();
			
			String sql="select * from question order by no desc";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				String delFlag = rs.getString("delFlag");
				String filename = rs.getString("filename");
				
				QuestionVO vo = new QuestionVO(no, name, title, regdate, content, delFlag);
				
				list.add(vo);
			}
			
			System.out.println("조회 결과 list.size= " + list.size());
			
			return list;
			
		} finally {
			pool.dbClose(rs, ps, conn);
		}
	}//
	
	public QuestionVO selectByNo(int no) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		QuestionVO vo = new QuestionVO();
		try {
			conn = pool.getConnection();
			
			String sql="select * from question where no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setNo(no);
				vo.setName(rs.getString("name"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setFileName(rs.getString("filename"));
				vo.setOriginalFileName(rs.getString("originalFilename"));
				vo.setFileSize(rs.getInt("filesize"));
			}
			
			System.out.println("내용보기 조회결과, vo =" + vo +
					"매개변수 no = " + no);
			
			return vo;
			
		} finally {
			pool.dbClose(rs, ps, conn);
		}
				
		
	}
}
