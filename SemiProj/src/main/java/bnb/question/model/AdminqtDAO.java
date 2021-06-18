package bnb.question.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.pool2.PooledObject;

import bnb.db.ConnectionPoolMgr1;

public class AdminqtDAO {
	
	private ConnectionPoolMgr1 pool;
	
	public AdminqtDAO() {
		pool = ConnectionPoolMgr1.getInstance();
	}
	
	public int insertQuestion(AdminqtVO vo) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			conn = pool.getConnection();
			
			String sql="insert into adminqt(no, name, title, content, "
					+ " groupNo, fileName, fileSize, originalFileName)"
					+ " values(adminqt_SEQ.nextval, ?, ?, ?, "
					+ " adminqt_SEQ.nextval, ?, ?, ?) ";
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
	
	public List<AdminqtVO> selectAll() throws SQLException{
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<AdminqtVO> list = new ArrayList<AdminqtVO>();
		try {
			
			conn = pool.getConnection();
			
			String sql="select * from adminqt order by groupno desc, sortno";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				String delFlag = rs.getString("delFlag");
				int groupNo=rs.getInt("groupno");
				int step=rs.getInt("step");
				int sortNo=rs.getInt("sortno");
				String filename = rs.getString("filename");
				String originFilename=rs.getString("originalFilename");
				long fileSize=rs.getInt("fileSize");
				
				AdminqtVO vo = new AdminqtVO(no, name, title, regdate, content, originFilename, 
						fileSize, filename, groupNo, step, sortNo, delFlag);
				
				list.add(vo);
			}
			
			System.out.println("조회 결과 list.size= " + list.size());
			
			return list;
			
		} finally {
			pool.dbClose(rs, ps, conn);
		}
	}//
	
	public AdminqtVO selectByNo(int no) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		AdminqtVO vo = new AdminqtVO();
		try {
			conn = pool.getConnection();
			
			String sql="select * from adminqt where no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setNo(no);
				vo.setName(rs.getString("name"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setGroupNo(rs.getInt("groupno"));
				vo.setStep(rs.getInt("step"));
				vo.setSortNo(rs.getInt("sortno"));
				vo.setDelFlag(rs.getString("delflag"));
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
	}//
	
	public int reply(AdminqtVO vo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		
		int cnt=0;
		try {
			conn=pool.getConnection();
			//트랜잭션 시작
			conn.setAutoCommit(false);  //자동 커밋되지 않도록 지정
			
			//[1] update
			String sql="update adminqt"
					+ " set sortno=sortno+1"
					+ " where groupno=? and sortno>?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getGroupNo());
			ps.setInt(2, vo.getSortNo());
			
			cnt=ps.executeUpdate();
			
			//[2] insert
			sql="insert into adminqt(no, name, title, content, "
					+ "groupno, step, sortno)"
					+ "values(adminqt_seq.nextval,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getContent());
			ps.setInt(4, vo.getGroupNo());
			ps.setInt(5, vo.getStep()+1);
			ps.setInt(6, vo.getSortNo()+1);
			
			cnt=ps.executeUpdate();
			System.out.println("답변하기 결과, cnt="+cnt+", 매개변수 vo="+vo);
			
			//모두 성공하면 커밋
			conn.commit();
		}catch(SQLException e) {
			//하나라도 실패하면 롤백
			conn.rollback();
			e.printStackTrace();
		}finally {
			//다시 자동 커밋되도록 셋팅
			conn.setAutoCommit(true);
			pool.dbClose(ps, conn);
		}
		return cnt;
	}//
	
	public void deleteQ(AdminqtVO vo) throws SQLException {
		
		Connection conn = null;
		CallableStatement ps = null;
		
		try {
			conn = pool.getConnection();
			
			String sql="call delqt(?,?,?)";
			ps = conn.prepareCall(sql);
			ps.setInt(1, vo.getNo());
			ps.setInt(2, vo.getStep());
			ps.setInt(3, vo.getGroupNo());
			
			boolean bl = ps.execute();
			System.out.println("삭제 결과 boolean값 = " + bl +
					", 매개변수 vo = " + vo);
			
		} finally {
			pool.dbClose(ps, conn);
		}
	}//
}
