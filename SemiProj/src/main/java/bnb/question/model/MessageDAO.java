package bnb.question.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import bnb.db.ConnectionPoolMgr1;

public class MessageDAO {
	
	private ConnectionPoolMgr1 pool;
	
	public MessageDAO() {
		pool = ConnectionPoolMgr1.getInstance();
	}//
	
	public int insertMsg(MessageVO vo) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			conn = pool.getConnection();
			
			String sql="insert into message(no, content, name, groupno )"
					+ " values(message_seq.nextval, ?, ?, message_seq.nextval)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getContent());
			ps.setString(2, vo.getName());
			
			int cnt = ps.executeUpdate();
			
			System.out.println("메시지 보내기 결과, cnt = " + cnt + 
					", 매개변수 vo = " + vo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, conn);
		}
	}//
	
	public int reply(MessageVO vo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		
		int cnt=0;
		try {
			conn=pool.getConnection();
			//트랜잭션 시작
			conn.setAutoCommit(false);  
			
			//[1] update
			String sql="update message"
					+ " set sortno=sortno+1"
					+ " where groupno=? and sortno>?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getGroupNo());
			ps.setInt(2, vo.getSortNo());
			
			cnt=ps.executeUpdate();
			
			//[2] insert
			sql="insert into message(no, name, content, "
					+ "groupno, step, sortno)"
					+ "values(message_seq.nextval,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
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
	
	public List<MessageVO> showMsg() throws SQLException  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<MessageVO> list = new ArrayList<MessageVO>();
		try {
			conn = pool.getConnection();
			
			String sql="select * from message order by groupno desc, sortno";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String content=rs.getString("content");
				String name=rs.getString("name");
				Timestamp regdate=rs.getTimestamp("regdate");
				int groupNo=rs.getInt("groupno");
				int step=rs.getInt("step");
				int sortNo=rs.getInt("sortno");
				String delFlag=rs.getString("delflag");
				
				MessageVO vo = new MessageVO(no, content, name, regdate, groupNo,
						step, sortNo, delFlag);
				
				list.add(vo);
			}
			
			System.out.println("조회결과 list.size=" + list.size());
			
			return list;
			
		} finally {
			pool.dbClose(rs, ps, conn);
		}
	}//
	
public MessageVO selectByNo(int no) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		MessageVO vo = new MessageVO();
		try {
			conn = pool.getConnection();
			
			String sql="select * from message where no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setNo(no);
				vo.setName(rs.getString("name"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setGroupNo(rs.getInt("groupno"));
				vo.setStep(rs.getInt("step"));
				vo.setSortNo(rs.getInt("sortno"));
				vo.setDelFlag(rs.getString("delflag"));
			}
			
			System.out.println("조회결과, vo =" + vo +
					"매개변수 no = " + no);
			
			return vo;
			
		} finally {
			pool.dbClose(rs, ps, conn);
		}
	}//
}
