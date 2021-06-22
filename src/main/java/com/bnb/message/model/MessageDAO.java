package com.bnb.message.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.SemiProj.db.ConnectionPoolMgr;


public class MessageDAO {

   private ConnectionPoolMgr pool;

   public MessageDAO() {
      pool = new ConnectionPoolMgr();
   }

   

   public int insertMsg(MessageVO vo) throws SQLException {

      Connection conn = null;
      PreparedStatement ps = null;

      try {

         conn = pool.getConnection();

         String sql="insert into message(msgno, content,sender,receiver)"
               + " values(message_seq.nextval, ?, ?, ?)";
         ps = conn.prepareStatement(sql);
         ps.setString(1, vo.getContent());
         ps.setInt(2, vo.getSender());
         ps.setInt(3, vo.getReceiver());
         
         int cnt = ps.executeUpdate();

         System.out.println("메시지 보내기 결과, cnt = " + cnt + 
               ", 매개변수 vo = " + vo);

         return cnt;
      } finally {
         pool.dbClose(ps, conn);
      }
   }//


   public List<MessageVO> showMsg() throws SQLException  {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<MessageVO> list = new ArrayList<MessageVO>();
		try {
			conn = pool.getConnection();
			
			String sql="select * from message";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int msgno = rs.getInt("msgno");
				String content=rs.getString("content");
				int sender = rs.getInt("sender");
				int receiver = rs.getInt("receiver");
				Timestamp regdate=rs.getTimestamp("regdate");
				
				MessageVO vo = new MessageVO(msgno, content, sender, receiver, regdate);
			
				list.add(vo);	
			}
			
			System.out.println("조회결과 list.size=" + list.size());
			
			return list;
			
		} finally {
			pool.dbClose(rs, ps, conn);
		}
	}//

  public List<MessageVO> showMsgByNo(int no) throws SQLException  {
     Connection conn = null;
     PreparedStatement ps = null;
     ResultSet rs = null;

     List<MessageVO> list = new ArrayList<MessageVO>();
     try {
        conn = pool.getConnection();

        String sql="select a.*,b.name,b.id from message a join acc b on (a.sender=b.accno) where a.sender=? or a.receiver=? order by regdate desc";
        
        ps = conn.prepareStatement(sql);
        ps.setInt(1, no);
        ps.setInt(2, no);
        
        rs = ps.executeQuery();
        while(rs.next()) {
           int msgno = rs.getInt("msgno");
           String content=rs.getString("content");
           int sender = rs.getInt("sender");
           int receiver=rs.getInt("receiver");
           Timestamp regdate=rs.getTimestamp("regdate");
           String senderName=rs.getString(6);
           String  senderId=rs.getString(7);

           MessageVO vo = new MessageVO(msgno, content, sender, receiver, regdate,  senderName,  senderId);

           list.add(vo);
        }

        System.out.println("조회결과 list.size=" + list.size());

        return list;

     } finally {
        pool.dbClose(rs, ps, conn);
     }
  }
}